<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img style="width: 100%;" src="~@/assets/mbti/lizard.png" alt="mbti image" />
      </div>
      <div class="col mr-3 my-5" style="color: black;">
        <h5>
          <br />
          똑똑하고 환경에 적응을 잘하고, 호기심이 많다는 점에서 도마뱀과 INTP은
          공통점이 많다.
        </h5>
        <br />
        <h5>
          동물학자들은 도마뱀이 자신만의 방법으로 사냥을 하는데 그 수법이 매우
          창의적이라고 말한다. 곤충을 잡기 어려운 환경에서 살다 보니 다양한
          아이디어를 개발하게 되었다는 게 그들의 말이다.
        </h5>
        <br />
        <h5>
          기발하고 혁신적이며 엉뚱한 아이디어를 많이 내는 INTP와 비교되는 이유도
          이 때문이다.
        </h5>
      </div>
    </div>
        <button type="button" class="char-select-btn" v-on:click="sendInfo">
          Next
        </button>

    <!--<button type="button" class="btn btn-dark btn-lg" v-on:click="next">Next</button>-->
  </div>
</template>

<script>
export default {
  name: "Lizard",
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
  height: 120%;
}
</style>
