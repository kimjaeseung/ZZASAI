<template>
  <!-- 메인 홀 & 게임 세팅 -->
  <div class="create-hall" @keypress.enter="btn_create">
    <h5 class="my-5" id="code_block">
      방 코드: <span style="font-weight: bold">{{ roomcode }}</span>
    </h5>
    <div class="mb-4" style="color: pink;">
      시작할 컨텐츠를 왼쪽에서 오른쪽으로 순서대로 드래그하세요!
    </div>
    <!-- Vue.Draggable -->
    <div class="row" style="height: 15rem;">
      <div id="box_left" class="col-3 offset-3">
        <h3 style="color: white;">컨텐츠</h3>
        <draggable
          class="list-group"
          :list="list1"
          group="people"
          @change="log"
        >
          <div
            class="list-group-item"
            v-for="element in list1"
            :key="element.name"
          >
            {{ element.name }}
            <!-- {{ element.name }} {{ index }} -->
          </div>
        </draggable>
      </div>
      <div
        style="display: flex; align-items: center; font-weight: bold; color: white;"
      >
        >
      </div>
      <div id="box_right" class="col-3">
        <h3 style="color: white;">진행순서</h3>
        <draggable
          class="list-group"
          :list="list2"
          group="people"
          @change="log"
        >
          <div
            class="list-group-item"
            v-for="element in list2"
            :key="element.name"
          >
            {{ element.name }}
          </div>
        </draggable>
      </div>

      <!-- <rawDisplayer class="col-3" :value="list1" title="List 1" /> -->

      <!-- <rawDisplayer class="col-3" :value="list2" title="List 2" /> -->
    </div>
    <button class="mainbtn" id="" v-on:click="btn_create">시작하기</button>
    <!-- HelpIcon -->
    <HelpIcon />
  </div>
</template>

<script>
import draggable from "vuedraggable";
import HelpIcon from "@/components/HelpIcon";

import axios from "axios";
// const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  name: "CreateHall",
  components: {
    draggable,
    HelpIcon,
  },
  data() {
    return {
      list1: [
        { name: "성향검사", id: 1 },
        { name: "이어그리기", id: 2 },
        { name: "카드", id: 3 },
      ],
      list2: [],
      roomcode: "",
    };
  },
  methods: {
    add: function() {
      this.list.push({ name: "Juan" });
    },
    replace: function() {
      this.list = [{ name: "Edgard" }];
    },
    clone: function(el) {
      return {
        name: el.name + " cloned",
      };
    },
    log: function() {
      // window.console.log(evt);
    },
    btn_create: function() {
      if (this.list2.length < 1) {
        alert("컨텐츠를 선택해주세요!");
      } else {
        // for (let i = 0; i < this.list2.length; i++) {
        //   this.$store.commit('CREATE_PROGRAMME', this.list2[i])
        // }
        var context = {
          game1: this.list2[0].id,
          game2: "",
          game3: "",
          roomAdmin: this.$store.state.userinfo.username,
          roomCode: this.$store.state.roomcode,
          roomName: this.$store.state.roomname,
        };
        if (this.list2.length > 1) {
          context.game2 = this.list2[1].id;
        }
        if (this.list2.length > 2) {
          context.game3 = this.list2[2].id;
        }
        axios({
          method: "post",
          url: `https://k4a205.p.ssafy.io:8080/api/room/create/`,
          // url: `http://localhost:8080/api/room/create/`,
          // url: `${SERVER_URL}/room/create/`,
          //url: `http://localhost:8080/api/room/create/`,
          // url: `${SERVER_URL}/api/room/create/`,

          data: JSON.stringify(context),
          headers: {
            "Content-Type": "application/json;charset=UTF-8",
            "Access-Control-Allow-Origin": "*",
          },
        })
          .then(() => {
            alert("방 생성이 완료되었습니다!");
            this.$router.push({
              name: "Room",
              params: { roomcode: this.$store.state.roomcode },
            });
          })
          .catch((err) => {
            alert(
              "오류가 발생하였습니다. 다시 시도해주세요." +
                "<br /> 에러코드" +
                `${err}`
            );
          });
      }
    },
    getRoomInfo() {
      var chars =
        "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
      var stringLength = 8;
      for (var i = 0; i < stringLength; i++) {
        var rnum = Math.floor(Math.random() * chars.length);
        this.roomcode += chars.substring(rnum, rnum + 1);
      }
      // roomcode 저장하기
      this.$store.commit("CREATE_ROOMCODE", this.roomcode);
      return this.roomcode;
    },
  },
  beforeMount() {
    var body = document.body;
    body.style.backgroundImage =
      "url(" +
      "https://wallpapermemory.com/uploads/418/adventure-time-wallpaper-hd-1920x1080-333459.jpg" +
      ")";

    // 새로고침 감지
    // window.onbeforeunload
    this.getRoomInfo();
  },
};
</script>

<style lang="scss">
html {
  height: 100%;
}

body {
  // background-image: url("~@/assets/bgs/create_hall.png");
  background-repeat: no-repeat;
  background-size: 100% 100%;
  /* opacity: 0.5; */
  margin: 0;
  height: 100%;
  /* overflow: hidden; */
}

#code_block {
  cursor: default;
  // border: 4px solid white;
  background-color: rgba(0, 0, 0, 0);
  // background-color: pink;
  color: black;
  text-decoration: underline;
  // outline-color: white;
}

.create-hall {
  margin: 0;
  height: 100%;
}

.startbutton {
  border: 4px solid white;
  background-color: rgba(0, 0, 0, 0);
  padding: 5px;
  padding-left: 10px;
  padding-right: 10px;
  font-size: 20px;
  //
  margin-top: 3%;
}

.room_name_input {
  border: 3px solid pink;
  padding: 9px;
  padding-right: 50px;
  padding-left: 50px;
  text-align: center;
  font-size: 20px;
}

.room_name_input:focus {
  border: 3px solid blue;
}

// Vue.Draggable
.flip-list-move {
  transition: transform 0.5s;
}
.no-move {
  transition: transform 0s;
}
.ghost {
  opacity: 0.5;
  background: #c8ebfb;
}
.list-group {
  min-height: 20px;
}
.list-group-item {
  cursor: move;
  // border: 4px solid pink;
  background-color: pink;
  background: transparent;
  // opacity를 쓰면 글자까지 투명해진다!
}
.list-group-item i {
  cursor: pointer;
}
</style>
