<template>
  <div>
    <textarea name="chatLog" id="chatLog" readonly></textarea>
    <div>
      <input type="text" v-model="text" @keyup.enter="typeMessage" />
    </div>
  </div>
</template>

<script>
export default {
  name: "Chat",
  components: {},
  data() {
    return {
      socket: this.$store.state.socket,
      userinfo: this.$store.state.userinfo,
      text: "",
    };
  },
  mounted() {
    console.log("Chat: ", this.socket);

    /* chatting */
    this.socket.on("chat", (user, msg) => {
      // console.log(name, msg);
      var chatLog = document.getElementById("chatLog");
      chatLog.append(user.username + ": " + msg + "\n");
      chatLog.scrollTop = chatLog.scrollHeight;
    });
  },
  methods: {
    /* to game play - chatting */
    typeMessage() {
      //text input for chatting - on keyup callback func\
      this.socket.emit("chat", this.userinfo, this.text);
      this.text = "";
    },
  },
};
</script>

<style scoped>
#chatLog {
  width: 50%;
  height: 200px;
}
</style>
