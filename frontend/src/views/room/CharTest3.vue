<template>
  <div id="char-test-3">
    <h1 id="char-test-title">캐릭터(성향) 테스트</h1>
    <div class="py-5 my-2" style="color:white; visibility: hidden;">
      .<br />.
    </div>
    <div style="color: black;">
      <h1 class="mb-5">
        Q2. 데스노트를 보고 '만약 나에게 데스노트가 있다면'을 상상해본적이
        있는가?
      </h1>
      <button class="char-select-btn" @click="byes()">그렇다</button>
      <button class="char-select-btn" @click="bno()">아니다</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    next() {
      // this.$router.push({name: 'CharTest4', params: {roomcode: this.$store.state.roomcode}})
      this.$emit("next");
    },
    byes: function() {
      this.$store.state.b = 1;
      this.next();
    },
    bno: function() {
      this.$store.state.b = 2;
      this.next();
    },
  },
};
</script>

<style>
#char-test-3 {
  color: black;
}
</style>
