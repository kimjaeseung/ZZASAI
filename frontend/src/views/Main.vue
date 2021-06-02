<template>
  <!-- 메인 홈 -->
  <div id="main">
    <span class="mainfont" @click="movemain">
      <div class="align-center mt-60">
        <div class="mainfontA">짜</div>
        <div class="mainfontB" style="">식, 이제 우리 친구</div>
        <div class="mainfontA">사이</div>
        <div class="mainfontB" style="">다</div>
      </div>
    </span>
    <div class="mainframe">
      <input
        id="focusMain"
        class="maininput"
        v-model="roomcode"
        placeholder="입장코드를 입력하세요"
        @keyup.enter="toUserName"
        v-focus
      />
    </div>
    <div class="mainbuttons">
      <button class="mainbtn" @click="toHostName">방만들기</button>
      <button
        v-if="roomcode_input"
        class="mainbtn"
        v-show="enter_room"
        @click="toUserName"
      >
        입장하기
      </button>
    </div>
    <!-- Modal -->
    <b-modal v-model="wrongModalShow" hide-footer hide-header>
      <div class="my-5" style="font-weight: bold; text-align: center">
        올바른 입장코드를 입력해주세요!
      </div>
      <b-button
        class="mt-3"
        variant="outline-warning"
        block
        style="font-weight: bold"
        @click="hideModal"
        >확인</b-button
      >
    </b-modal>
    <b-modal v-model="errorModalShow" hide-footer hide-header>
      <div class="my-5" style="font-weight: bold; text-align: center">
        서버에서 오류가 발생하였습니다. 다시 시도해주세요.
      </div>
      <b-button
        class="mt-3"
        variant="outline-warning"
        block
        style="font-weight: bold"
        @click="hideModal"
        >확인</b-button
      >
    </b-modal>
  </div>
</template>

<script>
// import axios from "axios";

// const SERVER_URL = process.env.VUE_APP_SERVER_URL

export default {
  name: "Main",
  data() {
    return {
      roomcode: "",
      name: "",
      entername: "",
      code_show: true,
      create_show: false,
      enter_room: true,
      create_room: true,
      userName: "",
      // modal
      errorModalShow: false,
      wrongModalShow: false,
    };
  },
  directives: {
    focus: {
      inserted: function() {
        var input = document.getElementById("focusMain");
        input.focus();
      },
    },
  },
  computed: {
    roomcode_input: function() {
      return this.roomcode.length >= 8;
    },
  },
  methods: {
    hideModal() {
      this.errorModalShow = false;
      this.wrongModalShow = false;
    },
    movemain: function() {
      location.href = "/";
    },
    toHostName: function() {
      this.$router.push({ name: "HostName" });
    },
    toUserName: function() {
      // checkRoomcode()
      // axios({
      //   method: "get",
      //   url: `https://k4a205.p.ssafy.io:8080/api/room/codecheck/?roomcode=${this.roomcode}`,
      //   // url: `http://localhost:8080/api/room/codecheck/?roomcode=${this.roomcode}`,
      //   headers: {
      //     "Access-Control-Allow-Origin": "*",
      //   },
      // })
      //   .then((res) => {
      //     if (res.data == true) {
      //       this.$store.commit("CREATE_ROOMCODE", this.roomcode);
      //       this.$store.commit("RESTORE_ADMINFLAG");
      //       this.$router.push({
      //         name: "UserName",
      //         params: { roomcode: this.roomcode },
      //       });
      //     } else {
      //       this.wrongModalShow = true;
      //     }
      //   })
      //   .catch((err) => {
      //     console.log(err);
      //     this.errorModalShow = true;
      //   });
      if (this.roomcode.length == 8) {
        this.$store.commit("CREATE_ROOMCODE", this.roomcode);
        this.$store.commit("RESTORE_ADMINFLAG");
        this.$router.push({
          name: "UserName",
          params: { roomcode: this.roomcode },
        });
      } else {
        this.errorModalShow = true;
      }
    },
  },
  created() {
    // 메인페이지로 재접속시 vuex-persistedstate로 저장중인 roomcode 정보 삭제
    this.$store.commit("CREATE_ROOMCODE", "");
    var body = document.body;
    // body.background = 'url(' + '../assets/bgs/bg-pattern.png' + ')';
    // body.background = 'linear-gradient(to left,#7b4397,#dc2430)'
    body.style.backgroundImage =
      "url(" +
      "https://wallpapermemory.com/uploads/418/adventure-time-wallpaper-hd-1920x1080-333459.jpg" +
      ")";
  },
};
</script>

<style scoped>
.mainfont {
  cursor: pointer;
  color: white;
}

.mainfontA {
  display: inline-block;
  color: black;
  font-size: 65px;
}

.mainfontB {
  display: inline-block;
  font-family: "Nanum Brush Script", cursive;
  font-size: 35px;
}

.mainframe {
  margin-top: 3%;
}
</style>
