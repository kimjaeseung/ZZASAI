<template>
  <!-- 메인 홈 -->
  <div id="main">
    <span class="mainfont" @click="movemain">
        <div class="align-center mt-60">
          <div class="mainfontA">
            짜
          </div>
          <div class="mainfontB" style="">
            식, 이제 우리 친구
          </div>
          <div
            class="mainfontA">
            사이
          </div>
          <div class="mainfontB" style="">다</div>
        </div>
    </span>
    <div class="mainframe">
      <input class="maininput" v-model="roomcode" placeholder="입장코드를 입력하세요" @keyup.enter="toUserName" v-focus>      
    </div>
    <div class="mainbuttons">
      <button class = "mainbtn" @click="toHostName">방만들기</button>
      <button v-if="roomcode_input" class = "mainbtn"  v-show="enter_room" @click="toUserName">입장하기</button>      
    </div>
  </div>
</template>

<script>
export default {
  name: 'Main',
  data(){
    return{
      roomcode:'',
      name:'',
      entername:'',
      code_show : true,
      create_show : false,
      enter_room : true,
      create_room : true,
      enter_show : false,
      userName: ''
    }
  },
  directives: {
    focus: {
      inserted: function (el) {
        el.focus()
      },
    },
  },
  computed: {
    roomcode_input: function () {
      return this.roomcode.length >= 8
    }
  },
  methods:{
    movemain:function(){
      location.href="/"
    },
    toHostName:function(){
      this.$router.push({ name: 'HostName' })
    },
    toUserName:function(){
      if (this.roomcode!='' && this.roomcode.length>=8) {        
        this.$store.commit('CREATE_ROOMCODE', this.roomcode)
        this.$store.commit('RESTORE_ADMINFLAG')
        this.$router.push({ name: 'UserName' })
      } else {
        alert("정확한 입장코드를 입력해주세요!")
      }
    },
  },
  created () {
    var body = document.body
    // body.background = 'url(' + '../assets/bgs/bg-pattern.png' + ')';
    // body.background = 'linear-gradient(to left,#7b4397,#dc2430)'
    body.style.backgroundImage = 'url(' + 'https://wallpapermemory.com/uploads/418/adventure-time-wallpaper-hd-1920x1080-333459.jpg' + ')';
  },
}
</script>

<style scoped>

.mainfont {
  
  cursor: pointer;
  color: white;
}

.mainfontA {
  display: inline-block;
  color: black;
  font-size: 65px;
}

.mainfontB {
  display: inline-block;
  font-family: 'Nanum Brush Script', cursive;
  font-size: 35px;

}

.mainframe {
  margin-top: 3%;
}


</style>