<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img style="width: 100%;" src="~@/assets/mbti/crow.png" alt="mbti image" />
      </div>
      <div class="col my-5 mr-3" style="color: black;">
        <h5><br />지략이 뛰어나고 독립적이며 똑똑한 까마귀.</h5>
        <br />
        <h5>
          그들의 도구 사용 능력은 상상을 초월한다. 빨대를 만들어서 야자수를
          마시기도 하고 나무 열매를 깨기 위해 차 밑에 갖다 놓기도 하는 것. 문제
          해결 능력이 뛰어나고 도구를 잘 다룬다는 점에서 까마귀는 ISTP와 비슷한
          점이 많다.
        </h5>
        <br />
        <h5>
          호기심이 많은 성격과 뛰어난 관찰력으로 누가 가르쳐 주지 않아도 혼자서
          일을 척척 잘한다는 부분 또한 닮아 있다.
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
  name: "Crow",
  data() {
    return {
      socket: this.$store.state.socket,
    };
  },
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
  height: 100%;
}
</style>
