<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img style="width: 100%;" src="~@/assets/mbti/octops.png" alt="mbti image" />
      </div>
      <div class="col mr-3 my-5" style="color: black;">
        <h5><br />문어는 지능이 높기로 유명하다.</h5>
        <br />
        <h5>
          통발에 갇히더라도 탈출에 성공하고, 간단한 수학 문제를 풀기도 한다.
          심지어 월드컵 시즌엔 ‘점쟁이 문어’로 불리며 게임의 승패도 맞추기도
          했다.
        </h5>
        <br />
        <h5>
          문어는 타깃이 생기면 그 누구보다 전략적으로 빨리 접근하기 때문에 사냥
          성공률도 상당히 높은데 목표가 생기면 그 누구보다 빨리 달려간다는
          점에서 INTJ와 비슷하다고 볼 수 있다.
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
  name: "Octopus",
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
  height: 110%;
}
</style>
