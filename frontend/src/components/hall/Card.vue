<template>
  <div class="hall-card">
    <div class="hall-card-inner">
      <div class="hall-card-front">
        <img src="@/assets/icons/card.png" style="width:100px; height1300px;" />
      </div>
      <div class="hall-card-back">
        <h2 class="hall-card-text">질문카드</h2>
        <button
          v-if="this.$store.state.adminflag == 1"
          class="mainbtn"
          @click="toCardPlay"
        >
          시작
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Card",
  methods: {
    toCardPlay() {
      var socket = this.$store.state.socket;
      socket.emit("procardplay");
      // this.$router.push({name: 'CardPlay', params: {roomcode: this.$store.state.roomcode}})
    },
  },
};
</script>

<style scoped></style>
