<template>
  <div>
    <b-form-textarea
      class="chatlog my-3"
      id="chatLog"
      name="chatLog"
      plaintext
    ></b-form-textarea>
    <!-- <textarea name="chatLog" id="chatLog" readonly></textarea> -->
    <div style="text-align: left;">
      <input
        class="maininput chatinput"
        type="text"
        v-model="text"
        @keyup.enter="typeMessage"
      />
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

      if (this.text == this.$store.state.answer) {
        this.socket.emit("correct answer", this.userinfo);
        var msg = this.userinfo.username + "님이 정답을 맞혔습니다!";
        this.socket.emit("chat", { username: "System" }, msg);
      }
      this.text = "";
    },
  },
};
</script>

<style scoped>
.chatlog {
  width: 50%;
  height: 400px;
  background-color: white;
  border: 3px solid pink;
  padding: 9px;
}

.chatinput {
  width: 50%;
  height: 15%;
  text-align: left;
  padding-left: 15px;
}
</style>
