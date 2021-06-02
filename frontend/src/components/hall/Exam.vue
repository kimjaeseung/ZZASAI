<template>
  <div class="hall-card">
    <div class="hall-card-inner">
      <div class="hall-card-front">
        <img src="@/assets/icons/exam.png" style="width:100px;height:100px;" />
      </div>
      <div class="hall-card-back">
        <h2 class="hall-card-text">성향검사</h2>
        <button
          v-if="this.$store.state.adminflag == 1"
          class="mainbtn"
          @click="toCharTest"
        >
          시작
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Exam",
  methods: {
    toCharTest() {
      var socket = this.$store.state.socket;
      socket.emit("prochartest");
      // this.$router.push({
      //   name: "CharTest",
      //   params: { roomcode: this.$store.state.roomcode },
      // });
    },
  },
};
</script>

<style scoped></style>
