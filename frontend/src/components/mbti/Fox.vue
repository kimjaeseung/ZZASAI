<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img style="width: 100%;" src="~@/assets/mbti/fox.png" alt="mbti image" />
      </div>
      <div class="col my-5 mr-3" style="color: black;">
        <h5>
          <br />여우는 우리에게 잘 알려진 대로 다재다능하고 호기심이 많다.
        </h5>
        <br />
        <h5>
          관심사가 다양하고 일을 잘 벌린다는 점에서 ENTP와 여우는 많이 닮아있다.
        </h5>
        <br />
        <h5>
          의심이 많아서 사람들 말에 ‘정말일까’라며 의문을 갖는다는 점 또한
          그렇다.
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
  name: "Fox",
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
