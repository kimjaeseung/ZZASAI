<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격검사가 완료되었습니다.</h2>
    <div class="row py-5">
      <div class="col-3 offset-md-2">
        <img src="~@/assets/mbti/horse.png" alt="mbti image" style="width: 80%;"/>
      </div>
      <div class="col-5 my-5">
        <h3>
          충성심이 강한 말은 사람과 떼어 놓을 수 없는 동물이다.
          <br><br>
          말은 말을 타고 있는 사람과 교감이 가능한데
          <br><br>
          <small>
            이처럼 상대방의 기분을 두루 살필 줄 안다는 점
            <br>
            자기 일이 아닌데 자기 일처럼 성심성의껏 도와주는 점
            <br>
            잘했을 땐 당근을 달라며 칭찬을 갈구한다는 점에서
          </small>
          <br><br>
          ESFJ의 모습을 엿볼 수 있다.
        </h3>
        <button class="char-select-btn" v-on:click="sendInfo">
          Next
        </button>
      </div>
    </div>

    <!--<button type="button" class="btn btn-dark btn-lg" v-on:click="next">Next</button>-->
  </div>
</template>

<script>
export default {
  name: "Horse",
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
