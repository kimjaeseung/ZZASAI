<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row py-5">
      <div class="col-4 offset-md-2">
        <img src="~@/assets/mbti/hyena.png" alt="mbti image" style="width: 80%;" />
      </div>
      <div class="col-5 my-5">
        <h3><br />주변 일에 관심이 많은 ESTP는 하이에나와 닮아 있다.</h3>
        <br />
        <h3>
          들판을 어슬렁거리는 하이에나는 사람들에게 좋지 않은 인식을 받고 있지만
          사실은 그렇지 않다. 사자보다 더 뛰어난 사냥 실력과 오래 달려도 지치지
          않는 강한 체력을 갖추고 있는 것. 또 타협을 모색하고 문제를 해결하는
          능력이 뛰어나서 혼자 사냥할 때보다 함께 사냥을 할 때 성공 확률이 더
          높은 동물이기도 하다.
        </h3>
        <br />
        <h3>
          갈등이 생기면 피하지 않고 중재하려 나서는 ESTP와 일맥상통한 부분.
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
  name: "Hyena",
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
