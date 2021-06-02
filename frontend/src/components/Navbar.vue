<template>
  <div class="navbar">
    <!-- <div id="logo"></div> -->
    <img id="logo_img" src="@/assets/logo3.png" alt="짜사이" @click="toHome" />
    <!-- <div id="nav">
      <router-link to="/">메인</router-link> |
      <router-link to="/create-hall">홀 세팅</router-link> |
      <router-link to="/hall">홀</router-link> |
      <router-link to="/card-play">카드 게임</router-link> |
      <router-link to="/game-play">게임</router-link> |
      <router-link to="/char-test">MBTI</router-link> |
      <router-link to="/select-team">팀 선택</router-link> |
      <router-link to="/final">마지막 페이지</router-link>
    </div> -->
    <div
      v-if="this.$store.state.roomcode && this.$store.state.userinfo.username"
    >
      <button
        v-if="this.$store.state.adminflag"
        class="mainbtn"
        v-b-modal.to-hall-modal
      >
        대기실
      </button>
      <button class="mainbtn" v-b-modal.to-main-modal>방 나가기</button>
    </div>
    <b-modal id="to-hall-modal" title="대기실로 이동하시겠습니까?" hide-footer>
      <div style="font-weight: bold; text-align: center;"></div>
      <b-button
        class="mt-3"
        variant="outline-danger"
        block
        @click="toHall"
        style="font-weight: bold;"
        >확인</b-button
      >
      <b-button
        class="mt-3"
        variant="outline-primary"
        block
        @click="$bvModal.hide('to-hall-modal')"
        >취소</b-button
      >
    </b-modal>
    <b-modal id="to-main-modal" title="방을 나가시겠습니까?" hide-footer>
      <div style="font-weight: bold; text-align: center;"></div>
      <b-button
        class="mt-3"
        variant="outline-danger"
        block
        @click="toMain"
        style="font-weight: bold;"
        >확인</b-button
      >
      <b-button
        class="mt-3"
        variant="outline-primary"
        block
        @click="$bvModal.hide('to-main-modal')"
        >취소</b-button
      >
    </b-modal>
  </div>
</template>

<script>
export default {
  name: "Navbar",
  components: {},
  data() {
    return {
      socket: this.$store.state.socket,
      pidx: 0,
    };
  },
  methods: {
    toHall() {
      this.$bvModal.hide("to-hall-modal");
      // this.$router.push({
      //   name: "Room",
      //   params: { roomcode: this.$store.state.roomcode },
      // });
      if (this.socket === null) {
        this.socket = this.$store.state.socket;
      }

      console.log(this.socket);
      this.socket.emit("move page to room");
    },
    toHome() {
      location.href = "/";
    },
    toMain() {
      this.$bvModal.hide("to-main-modal");
      location.href = "/";
    },
  },
};
</script>

<style scoped>
#nav {
  color: white;
}

.row {
  padding-right: 15px;
}

#logo_img {
  text-align: left;
  width: 5%;
  cursor: pointer;
}
</style>
