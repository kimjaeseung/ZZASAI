<template>
  <div id="char-test-4">
    <h1 id="char-test-title">캐릭터(성향) 테스트</h1>
    <div class="py-5 my-2" style="color:white; visibility: hidden;">
      .<br />.
    </div>
    <div style="color: black;">
      <h1 class="mb-5">
        Q3. 가벼운 차사고가 났다 친구에게 카톡을 하는데 어떤 느낌에 가까운가?
      </h1>
      <button class="char-select-btn" @click="tyes()">
        나 차 사고 났어 ㅠㅠ(위로해줘)
      </button>
      <button class="char-select-btn" @click="tno()">
        나 차 사고 났어ㅋㅋ (알아두라고)
      </button>
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
      // this.$router.push({name: 'CharTest5', params: {roomcode: this.$store.state.roomcode}})
      this.$emit("next");
    },
    tyes: function() {
      this.$store.state.t = 1;
      this.next();
    },
    tno: function() {
      this.$store.state.t = 2;
      this.next();
    },
  },
};
</script>

<style>
#char-test-4 {
  color: black;
}
</style>
