<template>
  <!-- 캐릭터 테스트 -->
  <div>
    <h2 id="char-test-title">성격분류가 완료되었습니다.</h2>
    <div class="row pt-3">
      <div class="col">
        <img src="~@/assets/mbti/dog.png" alt="mbti image" style="width: 100%;"/>
      </div>
      <div class="col my-5 mr-3" style="color: black;">
        <h5>
          <br />ENFJ는 자신의 의견을 내세우기 보다 다른 사람들의 생각과 의견을
          더 중요하게 생각하는 유형이다.
        </h5>
        <br />
        <h5>
          눈치가 빠르고 여러 사람과 협업이 가능하다는 점에서 ENFJ는 동물 중
          강아지와 많이 닮아있다고 할 수 있다.
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
  name: "Dog",
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
  components: {
  }
}

</script>

<style scoped>
.col-4 img {
  position: absolute;
  top: 0;
  left: 0;
  width: 70%;
  height: 150%;
}
</style>
