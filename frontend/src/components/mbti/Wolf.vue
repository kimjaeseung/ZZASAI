<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row py-5">
      <div class="col-4 offset-md-2">
        <img style="width: 80%;" src="~@/assets/mbti/wolf.png" alt="mbti image" />
      </div>
      <div class="col-5 my-5">
        <h3>
          <br />책임감 강하고 사람들을 인솔하는데 탁월한 능력을 보이는 ESTJ는
          <br />우두머리 늑대와 닮아있다.
        </h3>
        <br />
        <h3>
          리더로써 효율적으로 사냥하는 방법을 궁리하고, 특성 상 무리지어 다니는
          늑대들을 이끈다는 점에서 그렇다.
        </h3>
        <br />
        <h3>
          또 자신이 책임을 맡고 있는 그룹에 헌신적이라는 점 또한 비슷하다고 볼
          수 있다.
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
  name: "Wolf",
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
}
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
