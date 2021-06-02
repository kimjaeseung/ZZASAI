<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img style="width: 100%;" src="~@/assets/mbti/turtle.png" alt="mbti image" />
      </div>
      <div class="col mr-3 my-5" style="color: black;">
        <h5>
          <br />책상이 정리가 되어 있어야 일에 집중할 수 있고, 매일 짜인
          루틴대로 일을 하는 것이 편한 ISTJ
        </h5>
        <br />
        <h5>
          원칙에 따라 일을 하는 이 유형은 바닷속에서 먹이를 찾아 유유히 헤엄치는
          거북이와 많이 닮은 듯 보인다.
        </h5>
        <br />
        <h5>
          외로움을 느끼지 않는 거북이처럼 스스로 묵묵히 일한 다는 점도 이 둘의
          공통점.
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
  name: "Turtle",
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
