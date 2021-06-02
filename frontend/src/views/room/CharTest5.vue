<template>
  <div id="char-test-5">
    <h1 id="char-test-title">캐릭터(성향) 테스트</h1>
    <div class="py-5 my-2" style="color:white; visibility: hidden;">
      .<br />.
    </div>
    <div style="color: black;">
      <h1 class="mb-5">Q3. 친구와 여행을 간다 나는 어떤 스타일인가?</h1>
      <button class="char-select-btn" @click="iyes()">
        여행 일주일 전부터 계획표를 쫘악~~
      </button>
      <button class="char-select-btn" @click="ino()">
        무계획이 계획인거다 일단 가고봐~~
      </button>
    </div>
  </div>
  <!-- <div>
    <h1> 캐릭터(성향) 테스트 </h1>
    <div class="py-3 my-2"></div>
    <h1>4/4</h1>
    <br><br>
    <h1>친구와 여행을 간다 나는 어떤 스타일인가?</h1>
    <br>
    <b-button type="button" variant="primary" class="btn btn-lg" v-on:click="iyes()">여행 일주일 전부터 계획표를 쫘악</b-button>
    <b-button type="button" variant="danger" class="btn btn-lg" v-on:click="ino()">무계획이 계획인거다 일단 가고봐~</b-button>
  </div> -->
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    next() {
      // this.$router.push({name: 'CharTest6', params: {roomcode: this.$store.state.roomcode}})
      this.$emit("next");
    },
    iyes: function() {
      this.$store.state.i = 1;
      this.next();
    },
    ino: function() {
      this.$store.state.i = 2;
      this.next();
    },
  },
};
</script>

<style>
#char-test-5 {
  color: black;
}
</style>
