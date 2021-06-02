<template>
  <!-- 메인 홀 -->
  <div id="hall">
    <RoomCode :roomcode="roomcode" />
    <div class="py-3 my-5"></div>
    <!-- 여기에 flip-card 넣기 -->
    <div class="row justify-content-center">
      <div v-for="i in 3" :key="i" class="col-4 row hall-card">
        <Exam v-if="order_mark[i - 1] == '1'" />
        <Drawing v-if="order_mark[i - 1] == '2'" />
        <Card v-if="order_mark[i - 1] == '3'" />
      </div>
    </div>
  </div>
</template>

<script>
import Card from "@/components/hall/Card";
import Drawing from "@/components/hall/Drawing";
import Exam from "@/components/hall/Exam";
import RoomCode from "@/components/RoomCode";
import axios from "axios";

// const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  name: "Hall",
  components: {
    Card,
    Drawing,
    Exam,
    RoomCode,
  },
  data() {
    return {
      socket: this.$store.state.socket,
      order_mark: "",
      roomcode: this.$route.params.roomcode,
      room_data: {},
    };
  },
  created() {
    var body = document.body;
    body.style.backgroundImage =
      "url(" + "https://wallpapercave.com/wp/wp6365486.png" + ")";
  },
  mounted() {
    // if (this.$store.state.adminFlag) {
    //   this.socket.emit(
    //     this.$store.state.userinfo.username,
    //     this.roomcode,
    //     this.adminFlag != 0 ? true : false
    //   );
    // }
    // this.$store.state.socket = this.socket;
    // this.socket.on("connect", () => {
    //   console.log(this.socket.id);
    //   this.socket.emit(
    //     "info",  // 처음 연결되었을 때 서버에게 알려주기 위함
    //     this.$store.state.userinfo.username,
    //     this.roomcode,
    //     this.adminFlag != 0 ? true : false
    //   );
    // });
  },
  methods: {
    getRoomData: function() {
      // console.log(`${SERVER_URL}/room/info/?roomcode=${this.roomcode}`);
      axios({
        method: "get",
        url: `https://k4a205.p.ssafy.io:8080/api/room/info/?roomcode=${this.roomcode}`,
        // url: `http://localhost:8080/api/room/info/?roomcode=${this.roomcode}`,
        // url: `https://k4a205.p.ssafy.io:8080/api/room/info/?roomcode=${this.$store.state.roomcode}`,
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      })
        .then((res) => {
          this.room_data = res.data;
          this.order_mark =
            String(this.room_data.game1) +
            String(this.room_data.game2) +
            String(this.room_data.game3);
          // this.$store.commit('CREATE_PROGRAMME', 'this.order_mark')
        })
        .catch((err) => {
          alert(
            "오류가 발생하였습니다. 다시 시도해주세요.\n" +
              "에러코드: " +
              `${err}`
          );
        });
    },
  },
  beforeMount: function() {
    // 진행순서 데이터 받아오기
    this.$store.state.roomcode = this.$route.params.roomcode;
    if (this.$store.state.roomcode == undefined) {
      this.$router.push({ name: "Main" });
    } else if (this.$store.state.userinfo.username == "") {
      this.$router.push({ name: "UserName" });
    } else {
      this.getRoomData();
    }
  },
};
</script>

<style>
/* Google Font - Single Day */
@import url("https://fonts.googleapis.com/css2?family=Single+Day&display=swap");

body {
  /* background-image: url("~@/assets/bgs/hall.jpg"); */
  background-repeat: no-repeat;
  background-size: 100% 100%;
  background-size: cover;
  /* opacity: 0.5; */
}

.hall-card {
  background-color: transparent;
  width: 300px;
  height: 300px;
  perspective: 1000px;
}

.hall-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.6s;
  transform-style: preserve-3d;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);

  border: 4px solid white;
  margin: 0 auto;
  max-width: 500px;

  /* background: white; */
  /* opacity: 0.5; */
}

.hall-card:hover .hall-card-inner {
  transform: rotateY(180deg);
}

.hall-card-front,
.hall-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  vertical-align: middle;
  margin-top: 100px;
}

.hall-card-front {
  /* background-color: #bbb; */
  color: black;
}

.hall-card-back {
  /* background-color: #2980b9; */
  color: white;
  transform: rotateY(180deg);
}

.hall-card-text {
  color: black;
  margin-top: 0;
  text-align: center;
  text-transform: uppercase;
  /* font-weight: bold; */
  font-family: "Single Day", cursive;
}
</style>
