<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img style="width: 100%;" src="~@/assets/mbti/dolphin.png" alt="mbti image" />
      </div>
      <div class="col my-5 mr-3" style="color: black;">
        <h5><br />돌고래는 창의적인 방법으로 물고기를 잡는다.</h5>
        <br />
        <h5>
          먹잇감이 눈치 채지 못하도록 위장하기 위해 해초로 코를 가리기도 하는
          것.
        </h5>
        <br />
        <h5>
          바다 위로 텀블링을 하며 사람들의 관심을 유발하고 돌고래 소리를 내며
          장난을 치는 돌고래야말로 항상 업 되어 있는 ENFP에게 잘 매치되는 동물이
          아닐는지?
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
  name: "Dolphin",
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
  height: 120%;
}
</style>
