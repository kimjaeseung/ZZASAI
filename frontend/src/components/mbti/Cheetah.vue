<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-5">
      <div class="col">
        <img style="width: 100%;" src="~@/assets/mbti/cheetah.png" alt="mbti image" />
      </div>
      <div class="col my-5 mr-3" style="color:black;">
        <h5>
          <br />추진력이 뛰어난 ENTJ는 목표가 생기면 시속 112km로 달려가는
          치타와 많이 닮았다.
        </h5>
        <br />
        <h5>
          먹잇감이 눈치채기 전까지 조금씩 다가간 다음에 순간적으로 달려간다는
          부분은 일을 순차적으로 빠르게 처리하는 ENTJ의 업무 성향과 비슷하다.
        </h5>
        <br />
        <h5>
          혼자 사냥을 나가는 치타처럼 ENTJ 역시 일을 여럿이 하기 보다 혼자 하는
          게 더 편한 개인주의 스타일이다.
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
  name: "Cheetah",
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
  height: 110%;
}
</style>
