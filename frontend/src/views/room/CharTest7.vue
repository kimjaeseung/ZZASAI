<template>
<div>
    <h3 style="color: white;">모든 유저의 성격분류가 완료되었습니다.</h3>
    <div class="py-2"></div>
      <div class="row">
       <div class="scene scene--card col-3" v-for="(userlist_boolean,index) in this.$store.state.userlist_boolean" :key="userlist_boolean">
            <div :id="index" class="card" @click="flipCard(index)" v-if="userlist_boolean==2121">
              <img class="cover" src="~@/assets/mbti2/octopus.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue; display: inline;"><br>INTJ 문어 {{$store.state.userlist[index]}}</h4>
                <h4>#합리적 #독립성<br>#합리적 #독립성<br><br><div style="color: pink;">환상의짝꿍<br>#돌고래 #여우</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==2122">
              <img class="cover" src="~@/assets/mbti2/Lizard.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>INTP 도마뱀 {{$store.state.userlist[index]}}</h4>
                <h4>#분석적 #독창적<br>#개방적 #호기심<br><br><div style="color: pink;">환상의짝꿍<br>#치타</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==1121">
              <img class="cover" src="~@/assets/mbti2/cheetah.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ENTJ 치타 {{$store.state.userlist[index]}}</h4>
                <h4>#자신감 #카리스마<br>#자신감 #카리스마<br><br><div style="color: pink;">환상의짝꿍<br>#코끼리 #도마뱀</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==1122">
              <img class="cover" src="~@/assets/mbti2/fox.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ENTP 여우 {{$store.state.userlist[index]}}</h4>
                <h4>#지적 #독창적<br>#카리스마 #열정적<br><br><div style="color: pink;">환상의짝꿍<br>#해마 #코끼리</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==2111">
              <img class="cover" src="~@/assets/mbti2/hippocampus.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>INFJ 해마 {{$store.state.userlist[index]}}</h4>
                <h4>#창의적 #통찰력<br>#열정적 #이타적<br><br><div style="color: pink;">환상의짝꿍<br>#돌고래 #여우</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==2112">
              <img class="cover" src="~@/assets/mbti2/elephant.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>INFP 코끼리 {{$store.state.userlist[index]}}</h4>
                <h4>#공감력 #관대함<br>#개방적 #낭만적<br><br><div style="color: pink;">환상의짝꿍<br>#문어 #치타</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==1111">
              <img class="cover" src="~@/assets/mbti2/dog.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ENFJ 강아지 {{$store.state.userlist[index]}}</h4>
                <h4>#관용성 #신뢰성<br>#이타적 #리더십<br><br><div style="color: pink;">환상의짝꿍<br>#코끼리</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==1112">
              <img class="cover" src="~@/assets/mbti2/dolphin.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ENFP 돌고래 {{$store.state.userlist[index]}}</h4>
                <h4>#인기쟁이 #친근함<br>#사교적 #활기참<br><br><div style="color: pink;">환상의짝꿍<br>#해마 #코끼리</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==2221">
              <img class="cover" src="~@/assets/mbti2/turtle.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ISTJ 거북이 {{$store.state.userlist[index]}}</h4>
                <h4>#정직함 #성실함<br>#책임감 #차분함<br><br><div style="color: pink;">환상의짝꿍<br>#앵무새 #하이에나</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==2211">
              <img class="cover" src="~@/assets/mbti2/penguin.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ISFJ 펭귄 {{$store.state.userlist[index]}}</h4>
                <h4>#이타적 #인내심<br>#상상력 #성실함<br><br><div style="color: pink;">환상의짝꿍<br>#앵무새 #하이에나</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==1221">
              <img class="cover" src="~@/assets/mbti2/wolf.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ESTJ 늑대 {{$store.state.userlist[index]}}</h4>
                <h4>#헌신적 #정직한<br>#계획적 #신뢰성<br><br><div style="color: pink;">환상의짝꿍<br>#고양이 #까마귀</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==1211">
              <img class="cover" src="~@/assets/mbti2/horse.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ESFJ 말 {{$store.state.userlist[index]}}</h4>
                <h4>#책임감 #따뜻함<br>#사교적 #실용적<br><br><div style="color: pink;">환상의짝꿍<br>#고양이 #까마귀</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==2222">
              <img class="cover" src="~@/assets/mbti2/crow.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ISTP 까마귀 {{$store.state.userlist[index]}}</h4>
                <h4>#낙관적 #활기참<br>#합리적 #실용적<br><br><div style="color: pink;">환상의짝꿍<br>#말 #늑대</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==2212">
              <img class="cover" src="~@/assets/mbti2/cat.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ISFP 고양이 {{$store.state.userlist[index]}}</h4>
                <h4>#인기쟁이 #열정적<br>#상상력 #예술적<br><br><div style="color: pink;">환상의짝꿍<br>#문어 #늑대</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==1222">
              <img class="cover" src="~@/assets/mbti2/hyena.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ESTP 하이에나 {{$store.state.userlist[index]}}</h4>
                <h4>#합리적 #독창적<br>#사교성 #에너지<br><br><div style="color: pink;">환상의짝꿍<br>#펭귄 #거북이</div></h4>
              </div>
            </div>
            <div :id="index" class="card" @click="flipCard(index)" v-else-if="userlist_boolean==1212">
              <img class="cover" src="~@/assets/mbti2/parrot.png" />
              <div class="card__face card__face--back">
                <h4 style="color: skyblue;"><br>ESFP 앵무새 {{$store.state.userlist[index]}}</h4>
                <h4>#대담함 #쇼맨십<br>#독창적 #사교적<br><br><div style="color: pink;">환상의짝꿍<br>#펭귄 #거북이</div></h4>
              </div>
            </div>
         <h4>{{$store.state.userlist[index]}}</h4>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  data() {
      return {
      }
  },
  methods: {
/*
   flipCard: function () {
     var card = document.querySelector('.card');
     card.classList.toggle('is-flipped');
   },
*/
   flipCard: function (index) {
     var card = document.getElementById(index);
     card.classList.toggle('is-flipped');
   },
  },
  components: {
    
  },
}
</script>

<style scoped>
.col-3{
  height: 350px;
  padding: 35px;
  border-radius: 10px 10px 10px 10px;
  margin-left: 20px;
  margin-right: 20px;
  }
.col-3 img{
  width: 100%;
  height: 100%;
}
.cover{
  object-fit: cover;
}
body { font-family: sans-serif; }

.scene {
  width: 315px;
  height: 285px;
  perspective: 600px;
}

.card {
  width: 100%;
  height: 100%;
  transition: transform 1s;
  transform-style: preserve-3d;
  cursor: pointer;
  position: relative;
  object-fit: cover;
}

.card.is-flipped {
  transform: rotateY(180deg);
}

.card__face {
  position: absolute;
  width: 100%;
  height: 100%;
  line-height: 260px;
  color: white;
  text-align: center;
  font-weight: bold;
  font-size: 40px;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.card__face--front {
  background: red;
}

.card__face--back {
  background: #343D40;
  transform: rotateY(180deg);
  margin-left:auto;
  margin-right:auto;
}

</style>