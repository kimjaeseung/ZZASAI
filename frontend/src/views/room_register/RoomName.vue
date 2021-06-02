<template>
  <div>
    <!-- 이 페이지 불필요한 요소 정리완료 - 이송영 -->
    <span class="title">짜사이</span>
    <div class="frame">
      <input class="maininput" v-focus v-model="name" placeholder="방 제목을 입력하세요" @keyup.enter="toCreateHall">
    </div>
    <div class="buttons">
      <button class = "mainbtn" id="createroom" @click="toCreateHall">확인</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'RoomName',
  data () {
    return {
      name: '',
    }
  },
  directives: {
    focus: {
      inserted: function (el) {
        el.focus()
      },
    },
  },
  methods: {
    toCreateHall: function () {
      if (this.name.length < 2) {
        alert("방 이름은 2글자 이상이어야 합니다!")
      } else {
        this.$store.commit('CREATE_ROOMNAME', this.name)
        this.$router.push({ name: 'CreateHall' })
      }
    }
  },
  created () {
    var body = document.body
    body.style.backgroundImage = 'url(' + 'https://wallpapermemory.com/uploads/418/adventure-time-wallpaper-hd-1920x1080-333459.jpg' + ')';
  }
}
</script>

<style scoped>
.title{
  font-size: 65px;
  visibility: hidden;
}

.frame {
  margin-top: 3%;
}
</style>