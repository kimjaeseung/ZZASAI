<template>
  <div id="help-icon">
    <!-- 도움말 아이콘 -->
    <b-icon
      id="help-icon-btn" 
      icon="question-circle-fill" 
      variant="warning" 
      v-b-modal="'help-modal'"
      v-b-popover.hover.top="'도움말을 확인하세요!'"
    ></b-icon>
    <!-- 도움말 modal -->
    <b-modal id="help-modal" size="xl">
      <div id="help-modal-text">
        <h3>&#11088; 소개</h3>
        <p>👉 <span class="font-weight-bold">성향검사</span>: 간단한 성향검사를 할 수 있습니다.</p>
        <p>👉 <span class="font-weight-bold">캐치마인드</span>: 그림을 그려서 제시어를 맞추는 게임입니다.</p>
        <p>👉 <span class="font-weight-bold">질문카드</span>: 서로 간의 이야기를 할 수 있습니다.</p>
        <br>
        <h3>&#11088; 방법</h3>
        <p>왼쪽의 리스트에서 진행할 순서를 정해서 오른쪽 리스트로 <span class="font-weight-bold">드래그앤드롭</span> 하세요!</p>
        <br>
        <h3>&#11088; 추천코스</h3>
        <p>☑️ <span class="font-weight-bold">추천코스1</span>: 성향 테스트 - 캐치마인드 - 질문카드</p>
        <p>☑️ <span class="font-weight-bold">추천코스2</span>: 질문카드 - 성향 테스트 - 캐치마인드</p>
      </div>
    </b-modal>
  </div>
</template>

<script>
export default {
  name: "HelpIcon",
}
</script>

<style scoped>
#help-icon {
  /* display: flex; */
  position: absolute;
  left: 3%;
  bottom: 3%;
  text-align: left;
}
#help-icon-btn {
  width: 15%;
  height: 15%;
  cursor: pointer;
}

#help-modal {
  background-color: transparent;
  opacity: 0.2;
}

#help-modal-text {
  margin-left: 10%;
}

b-modal>div>h3 {
  color: red;
  margin-bottom: 20rem;
}
</style>