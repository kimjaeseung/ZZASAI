<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row py-5">
      <div class="col-4 offset-md-2">
        <img style="width: 80%;" src="~@/assets/mbti/parrot.png" alt="mbti image" />
      </div>
      <div class="col-5 my-5">
        <h3><br />밝고, 사랑스럽고 장난기 많은 앵무새.</h3>
        <br />
        <h3>
          듣기만 해도 ESFP 성격이 떠오르지 않는가? 무엇이든 빨리배우고 익힌다는
          점, 어디서든 적응을 잘하고 사교적이라는 점,
        </h3>
        <br />
        <h3>
          사람들에게 둘러싸이는 것을 좋아하는 ‘관종’이라는 점에서 이 둘의
          공통점을 발견할 수 있다.
        </h3>
        <br />
        <button type="button" class="char-select-btn" v-on:click="sendInfo">
          Next
        </button>
      </div>
    </div>

    <!--<button type="button" class="btn btn-dark btn-lg" v-on:click="next">Next</button>-->
  </div>
</template>

<script>
export default {
  name: "Parrot",
  data() {
    return {
      socket: this.$store.state.socket,
    };  },
  mounted() {
    this.socket.on("userboolean", (userboolean) => {
      this.$store.state.userlist_boolean = userboolean.userlist_boolean;
      console.log("changed user list: ", this.$store.state.userlist_boolean);
    });
  },
  methods: {
    next() {
      this.updateArray(this.$store.state.userlist, this.$store.state.userinfo.username)
      console.log(this.$store.state.userlist_boolean);
      this.$router.push({name: 'Loading', params: {roomcode: this.$store.state.roomcode}})
    },
    updateArray(myArray, oldValue){
        const index = myArray.indexOf(oldValue);
        if (index !== -1) {
         this.$store.state.userlist_boolean[index] = this.$store.state.m*1000+this.$store.state.b*100+this.$store.state.t*10+this.$store.state.i;
        }
    },
    sendInfo() {
      this.$store.state.socket.emit("mbti2", this.$store.state.roomcode, this.$store.state.userinfo.username, 
      this.$store.state.userlist,
      this.$store.state.m*1000+this.$store.state.b*100+this.$store.state.t*10+this.$store.state.i);
      this.$router.push({name: 'Loading', params: {roomcode: this.$store.state.roomcode}})
    },
  },
};
</script>

<style scoped>
.col-4 img {
  position: absolute;
  top: 0;
  left: 0;
  width: 70%;
  height: 130%;
}
</style>
