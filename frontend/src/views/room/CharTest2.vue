<template>
  <div id="char-test-2">
    <h1 id="char-test-title">캐릭터(성향) 테스트</h1>
    <div class="py-5 my-2" style="color:white">
      총 검사 시간은 1분 내외입니다 <br />
      혹 질문이 마음에 들지 않더라도 정직하게 답변하십시오
    </div>
    <div style="color: black;">
      <h1 class="mb-5">Q1. 데이트가 없는 주말에 나는</h1>
      <button class="char-select-btn" @click="myes()">
        단톡에 연락해서 친구들과 약속을 잡는다
      </button>
      <button class="char-select-btn" @click="mno()">
        침대랑 하루 종일 물아일체가 된다
      </button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      socket: this.$store.state.socket,
    };
  },
  mounted() {
    this.socket.on("userboolean", (userboolean) => {
      this.$store.state.userlist_boolean = userboolean.userlist_boolean;
    });
  },
  methods: {
    next() {
      // this.$router.push({name: 'CharTest3', params: {roomcode: this.$store.state.roomcode}})
      this.$emit("next");
    },
    myes: function() {
      this.$store.state.m = 1;
      this.next();
    },
    mno: function() {
      this.$store.state.m = 2;
      this.next();
    },
  },
};
</script>

<style>
#char-test-2 {
  color: black;
}
</style>
