<template>
  <div class="loading">
    <p>
      <span>다</span>
      <span>른</span>
      <span>사</span>
      <span>용</span>
      <span>자</span>
      <span>를</span>
      <span>기</span>
      <span>다</span>
      <span>리</span>
      <span>고</span>
      <span>있</span>
      <span>습</span>
      <span>니</span>
      <span>다</span>
      <span>.</span>
      <span>.</span>
      <span>.</span>
    </p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      socket: this.$store.state.socket,
    };
  },
  created() {
    if (
      this.$store.state.roomcode == undefined ||
      this.$store.state.userinfo.username == undefined
    ) {
      this.$router.push({ name: "Main" });
    }
  },
  mounted() {
    this.socket.on(
      "userboolean",
      (userboolean) => {
        this.$store.state.userlist_boolean = userboolean.userlist_boolean;
        console.log("changed user list: ", this.$store.state.userlist_boolean);
      },
      this.socket.on("mbtifinish", (userboolean) => {
        this.$store.state.userlist_boolean = userboolean.userlist_boolean;
        this.$router.push({
          name: "CharTest7",
          params: { roomcode: this.$store.state.roomcode },
        });
      })
    );
  },
};
</script>

<style scoped>
div p {
  background-color: white;
  opacity: 0.5;
  margin-right: 10%;
  margin-left: 10%;
  padding: 16% 0;
  text-align: center;
}
.loading span {
  display: inline-block;
  margin: 0 -0.075em;
  animation: loading 1.4s infinite alternate;
  font-size: 50px;
  padding-right: 0.7%;
}
.loading span:nth-child(2) {
  animation-delay: 0.1s;
  margin-right: 1.3%;
}
.loading span:nth-child(3) {
  animation-delay: 0.2s;
}
.loading span:nth-child(4) {
  animation-delay: 0.3s;
}
.loading span:nth-child(5) {
  animation-delay: 0.4s;
}
.loading span:nth-child(6) {
  animation-delay: 0.5s;
  margin-right: 1.3%;
}
.loading span:nth-child(7) {
  animation-delay: 0.6s;
}
.loading span:nth-child(8) {
  animation-delay: 0.7s;
}
.loading span:nth-child(9) {
  animation-delay: 0.8s;
}
.loading span:nth-child(10) {
  animation-delay: 0.9s;
  margin-right: 1.3%;
}
.loading span:nth-child(11) {
  animation-delay: 1s;
}
.loading span:nth-child(12) {
  animation-delay: 1.1s;
}
.loading span:nth-child(13) {
  animation-delay: 1.2s;
}
.loading span:nth-child(14) {
  animation-delay: 1.3s;
}
.loading span:nth-child(15) {
  animation-delay: 1.4s;
  margin-right: 0.1%;
}
.loading span:nth-child(16) {
  animation-delay: 1.5s;
  margin-right: 0.1%;
}
.loading span:nth-child(17) {
  animation-delay: 1.6s;
}
@keyframes loading {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(0.8);
  }
}
</style>
