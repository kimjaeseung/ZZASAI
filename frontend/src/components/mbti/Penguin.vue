<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img style="width: 100%; height: 100%;" src="~@/assets/mbti/penguin.png" alt="mbti image" />
      </div>
      <div class="col my-5 mr-3" style="color: black;">
        <h5><br />ISFJ는 동물로 치면 펭귄이라 할 수 있다.</h5>
        <br />
        <h5>
          추위를 이겨 내기 위해 서로 감싸 안는 펭귄처럼 사람을 잘 배려하고,
          기억력이 좋아서 매년 마다 같은 자리로 다시 돌아오는 펭귄같이 기념일
          하나 놓치지 않고 잘 기억한다는 점에서 그렇다.
        </h5>
        <br />
        <h5>
          또 일부일처제로 한 사람에게 헌신적이라는 부분에서 ‘빼박’ ISFJ다.
        </h5>
       
      </div>
    </div>
     <button type="button" class="char-select-btn" v-on:click="sendInfo">
          Next
        </button>
  </div>
</template>

<script>
export default {
  name: "Penguin",
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
