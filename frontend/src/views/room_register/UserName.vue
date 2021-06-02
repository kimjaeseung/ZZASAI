<template>
  <div>
    <!-- 이 페이지 불필요한 요소 정리완료 - 이송영 -->
    <span class="title">짜사이</span>
    <div class="frame">
      <input
        class="maininput"
        id="focusUser"
        v-model="name"
        placeholder="이름을 입력하세요"
        @keyup.enter="toRoomName"
        v-focus
      />
    </div>
    <div class="buttons">
      <button class="mainbtn" id="createroom" @click="toRoomName">확인</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserName",
  data() {
    return {
      name: "",
    };
  },
  directives: {
    focus: {
      inserted: function() {
        var input = document.getElementById("focusUser");
        input.focus();
      },
    },
  },
  methods: {
    toRoomName: function() {
      if (this.name.length < 2) {
        alert("이름은 2글자 이상이어야 합니다!");
      } else {
        // this.$store.commit("CREATE_USERNAME", this.name);
        this.$store.state.userinfo.username = this.name;
        this.$router.push({
          name: "Room",
          params: { roomcode: this.$store.state.roomcode },
        });
      }
    },
  },
  created() {
    this.$store.state.roomcode = this.$route.params.roomcode;
    var body = document.body;
    body.style.backgroundImage =
      "url(" +
      "https://wallpapermemory.com/uploads/418/adventure-time-wallpaper-hd-1920x1080-333459.jpg" +
      ")";
  },
};
</script>

<style scoped>
.title {
  font-size: 65px;
  visibility: hidden;
}

.frame {
  margin-top: 3%;
}

.buttons {
  margin-top: 25px;
}
</style>
