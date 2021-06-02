<template>
  <div>
    <!-- 이 페이지 불필요한 요소 정리완료 - 이송영 -->
    <span class="title">짜사이</span>
    <div class="frame">
      <input
        class="maininput"
        id="focusHost"
        v-model="name"
        v-focus
        placeholder="이름을 입력하세요"
        @keyup.enter="toRoomName"
      />
    </div>
    <div class="buttons">
      <button class="mainbtn" id="createroom" @click="toRoomName">확인</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "HostName",
  data() {
    return {
      name: "",
    };
  },
  directives: {
    focus: {
      inserted: function () {
        var input = document.getElementById("focusHost")
        input.focus()
      },
    },
  },
  methods: {
    toRoomName: function() {
      if (this.name.length < 2) {
        alert("이름은 2글자 이상이어야 합니다!");
      } else {
        this.$store.commit("CREATE_USERNAME", this.name);
        this.$store.commit("SET_ADMINFLAG");
        this.$router.push({ name: "RoomName" });
      }
    },
  },
  created () {
    var body = document.body
    body.style.backgroundImage = 'url(' + 'https://wallpapermemory.com/uploads/418/adventure-time-wallpaper-hd-1920x1080-333459.jpg' + ')';
  }
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


</style>
