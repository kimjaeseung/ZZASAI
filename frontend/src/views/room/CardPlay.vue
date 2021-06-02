<template>
  <!-- 질문 카드 게임 -->
  <div id="card-play" class="my-0 py-0">
    <div style="background-image: "></div>
    <!-- <h3> 질문 카드 게임 </h3> -->
    <div v-if="cardImageFront" class="scene scene--card my-0 py-0">
      <div class="card" @click="flipCard">
        <img class="card__face card__face--front" :src="cardImageFront" />
        <img class="card__face card__face--back" :src="cardImageBack" />
      </div>
    </div>
    <div id="rotate-div" class="chand"></div>
    <b-modal v-model="errorModalShow" hide-footer hide-header>
      <div class="my-5" style="font-weight: bold; text-align: center">
        카드 업로드 중 오류가 발생했습니다.
      </div>
      <b-button
        class="mt-3"
        variant="outline-danger"
        block
        onClick="window.location.reload()"
        style="font-weight: bold"
        >다시 시도하기</b-button
      >
      <b-button
        v-if="this.$store.state.adminflag"
        class="mt-2"
        variant="outline-warning"
        block
        @click="toHall"
        style="font-weight: bold"
        >대기방으로 이동</b-button
      >
    </b-modal>
  </div>
</template>

<script>
import CMRotate from "@/assets/js/CMRotate.js";
import axios from "axios";

var backgroundImages = [];
// const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  name: "CardPlay",
  data: function() {
    return {
      cards: {},
      selected_card_no: null,
      selected_card_front: null,
      selected_card_back: null,
      selected_card_id: null,
      socket: this.$store.state.socket,
      checkflag: 0,
      errorModalShow: false,
    };
  },
  computed: {
    cardImageFront() {
      return this.selected_card_front;
    },
    cardImageBack() {
      return this.selected_card_back;
    },
  },
  methods: {
    clickCard(no, target_id) {
      this.socket.emit("cardselect", no, target_id, this.cards[no].cardname);
    },
    flipCard() {
      // var card = document.querySelector(".card");
      // card.classList.toggle("is-flipped");
      this.socket.emit("cardflip");
    },
    async getData() {
      await axios({
        method: "get",
        // url: `${SERVER_URL}/card/list/`,
        url: "https://k4a205.p.ssafy.io:8080/api/card/list/",
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          "Access-Control-Allow-Origin": "*",
        },
      })
        .then((res) => {
          var i;
          for (i = 0; i < res.data.length; i++) {
            backgroundImages.push(res.data[i]["cardurl_front"]);
          }
          this.cards = res.data;
        })
        .catch((err) => {
          console.log(err);
          this.errorModalShow = true;
        });
    },
    toHall() {
      // this.$router.push({
      //   name: "Hall",
      //   params: { roomcode: this.$route.params.roomcode },
      // });
      var pidx = 0;
      this.socket.emit("move page to room", pidx);
    },
    // afterClickCard(no, target_id){
    //   // 선택하면 기존 카드는 background 리스트에서 삭제하기!

    //   if (this.selected_card_no != null && this.selected_card_no != no) {
    //     // var item = document.getElementById('cm-rotate-' + this.selected_card_id)
    //     var item = document.getElementById(this.selected_card_id)
    //     console.log("delete");
    //     item.remove()
    //   }

    //   var card = document.querySelector('.card');
    //   if (card) {
    //     card.classList.remove('is-flipped')
    //   }

    //   this.selected_card_no = no
    //   this.selected_card_front = this.cards[no]["cardurl_front"]
    //   this.selected_card_id = target_id
    //   this.selected_card_back = this.cards[no]["cardurl_back"]

    // },
  },
  created() {
    if (
      this.$store.state.roomcode == undefined ||
      this.$store.state.userinfo.username == undefined
    ) {
      this.$router.push({ name: "Main" });
    }
    var body = document.body;
    body.style.backgroundImage =
      "url(" + "https://wallpapercave.com/wp/wp5642739.jpg" + ")";
  },
  async mounted() {
    await this.getData();
    //방장일경우 처음 한번만 카드 리스트 넘겨줌
    if (this.$store.state.adminflag == 1 && this.checkflag == 0) {
      CMRotate.init(
        "rotate-div",
        200,
        300,
        50,
        30,
        200,
        backgroundImages,
        this.clickCard
      );
      this.checkflag = 1;
      //소켓
      this.socket.emit("firstinit", this.cards, backgroundImages);
    }

    //처음 한번만 다른 사람들이 카드 리스트를 받는다
    this.socket.on("setinit", (cards, backgroundImages) => {
      if (this.$store.state.adminflag == 0) {
        this.cards = cards;
        this.backgroundImages = backgroundImages;
        CMRotate.init(
          "rotate-div",
          200,
          300,
          50,
          30,
          200,
          this.backgroundImages,
          this.clickCard
        );
      }
    });

    //카드 선택 시 소켓통신
    this.socket.on("cardselected", (no) => {
      var card = document.querySelector(".card");
      if (card) {
        card.classList.remove("is-flipped");
      }

      this.selected_card_front = this.cards[no]["cardurl_front"];
      this.selected_card_back = this.cards[no]["cardurl_back"];
    });

    this.socket.on("cardflipstart", () => {
      var card = document.querySelector(".card");
      card.classList.toggle("is-flipped");
    });
    // CMRotate.init('rotate-div', 200, 300, 100, 12, 600, backgroundImages, clickFn);
  },
};
</script>

<style type="text/css" scoped>
html,
body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  overflow: hidden;
  /* position: relative; */
}

/* * {
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
} */

#rotate-div {
  overflow: hidden;
  width: 100%;
  height: 100%;
}

a {
  color: #ff0000;
  text-decoration: none;
}
a:hover {
  color: #000;
}

.chand {
  /* cursor: url(../../assets/cards/sample/hand.cur), move; */
}
.chand:active {
  /* cursor: url(../../assets/cards/sample/hand-h.cur), move; */
}

/* card flip */
.scene {
  position: absolute;
  left: 40%;
  /* 200px 260px */
  width: 20%;
  height: 55%;
  /* border: 1px solid #CCC; */
  margin: 40px 0;
  perspective: 600px;
}

.card {
  background: transparent;
  width: 100%;
  height: 100%;
  transition: transform 1s;
  transform-style: preserve-3d;
  cursor: pointer;
  position: relative;
}

.card.is-flipped {
  transform: rotateY(-180deg);
}

.card__face {
  position: absolute;
  width: 100%;
  height: 100%;
  line-height: 260px;
  /* color: white; */
  text-align: center;
  font-weight: bold;
  font-size: 40px;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.card__face--front {
  /* background: red; */
}

.card__face--back {
  /* background: blue; */
  transform: rotateY(180deg);
}
</style>
