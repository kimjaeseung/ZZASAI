<template>
  <div class="row justify-content-center">
    <div class="pr-3" style="display: flex; align-items: center;">
      <h5 id="code_block"
        v-clipboard:copy="roomcode"
        v-clipboard:success="onCopy"
        class="primary"
      >
        방 코드: <span style="font-weight: bold">{{ roomcode }}</span>
      </h5>
      <!-- <b-button
        variant="warning"
        v-clipboard:copy="roomcode"
        v-clipboard:success="onCopy"
        size="sm"
      >
      코드 복사
      </b-button> -->
    </div>
    <div style="display: flex; align-items: center;">
      <img
        class="kakao_btn"
        src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
        @click="codeShareKakao"
        style="width: 60%; height: 90%; cursor: pointer;"
        />
    </div>
  </div>
</template>

<script type="text/Javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>


export default {
  name: 'RoomCode',
  props: {
      roomcode: String,
  },
  methods: {
    codeShareKakao() {
        Kakao.Link.sendCustom({
            templateId: 52239,
              templateArgs: {
                'roomCode':`${this.roomcode}`
            },
        });
      },
    onCopy() {
      alert('코드 복사를 완료하였습니다. 새 친구에게 코드를 공유해주세요!')
    },
  },

}
</script>

<style scoped>
#code_block {
  cursor: pointer;
  /* color: #f0ad4e; */
}

#code_block:hover {
  border : 4px solid pink;
  background-color:pink;
}
</style>