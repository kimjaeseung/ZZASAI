<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row py-5">
      <div class="col-4 offset-md-2">
        <img style="width: 80%;" src="~@/assets/mbti/cat.png" alt="mbti image" />
      </div>
      <div class="col-5 my-5">
        <h3>
          <br />
          혼자 있는 것을 즐기고, 감정 표현을 잘 하지 않는 고양이는 ISFP와 많이
          닮아있다.
        </h3>
        <br />
        <h3>
          잡으려 하면 도망가고, 어느새 사람에게 다가와 살갑게 구는 고양이는
          집사의 기분을 맞추는데 선수.
        </h3>
        <br />
        <h3>
          ISFP 역시 감정 표현은 잘 하지 않지만 갈등 생기는 것이 싫어 눈치껏
          사람들이 하자는 대로 맞춰준다는 점에서 이 둘의 공통점을 찾아볼 수
          있다.
        </h3>
        <br>
        <button type="button" class="char-select-btn" v-on:click="sendInfo">Next</button>
        
        </div>
      </div>
    </div>
</template>

<script>
export default {
  name: "Cat",
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
