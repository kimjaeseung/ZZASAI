<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img style="width: 100%;" src="~@/assets/mbti/hippocampus.png" alt="mbti image" />
      </div>
      <div class="col mr-3 my-5" style="color: black;">
        <h5>
          <br />성격은 얌전하지만 수온 수질 변화에 민감한 반응을 보이는 해마는
          다루기 쉽지 않은 해양 동물중 하나다.
        </h5>
        <br />
        <h5>
          다른 종류의 물고기와 한 수조 안에 있으면 스트레스를 받아 이상행동을
          보인다고 하는데 좋아하는 사람이 다가오면 속으론 좋아해도 겉으론 차갑게
          반응하는 INFJ와 겹쳐 보인다.
        </h5>
        <br />
        <h5>
          INFJ는 연애를 하면 한 명만 바라보는 스타일인데 해마 역시 그렇다. 아내
          대신 아기를 낳는 진정한 ‘아내 바라기’이니 말이다.
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
  name: "Hippocampus",
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
  height: 95%;
}
</style>
