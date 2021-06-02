<template>
  <div class="catchmind">
    <!--1st row-->
    <div class="canvas-wrapper">
      <div class="answer" v-if="this.currentTeam == this.userinfo.team - 1">
        {{ $store.state.answer }}
      </div>
      <div class="answer" v-else>
        <span v-for="i in $store.state.answer.length" :key="i">_</span>
      </div>
      <canvas
        @mousedown="startPainting"
        @mouseup="stopPainting"
        @mousemove="onMouseMove"
        @mouseleave="stopPainting"
        id="canvas"
      ></canvas>
    </div>

    <!--2nd row-->
    <div class="game-support" v-if="turnToDraw">
      <div class="colorPicker">
        <div
          v-for="color in colors"
          :key="color"
          :class="color"
          @click="strokeColorHandler(color)"
        ></div>
      </div>
      <div class="size-picker">
        <!--size handler 3type-->
        <div @click="strokeSizeHandler(1)">
          <div style="width: 3px; height: 3px"></div>
        </div>
        <div @click="strokeSizeHandler(8)">
          <div style="width: 9px; height: 9px"></div>
        </div>
        <div @click="strokeSizeHandler(15)">
          <div style="width: 15px; height: 15px"></div>
        </div>
      </div>
      <!--모두 지우기-->
      <div class="eraser">
        <div class="clearAll" @click="clearAll" style="float: right">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-arrow-clockwise"
            viewBox="0 0 16 16"
          >
            <path
              fill-rule="evenodd"
              d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"
            />
            <path
              d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"
            />
          </svg>
        </div>
        <!--지우개 버튼-->
        <div @click="strokeColorHandler('white')" style="float: right">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-eraser-fill"
            viewBox="0 0 16 16"
          >
            <path
              d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"
            />
          </svg>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
// const SERVER_URL = process.env.VUE_APP_SERVER_URL;

// import Timer from "@/components/Timer";

export default {
  name: "CatchMind",
  // components: { Timer },
  data() {
    return {
      painting: false,
      canvas: null,
      ctx: null,
      canvasHeight: window.innerHeight * 0.5,
      canvasWidth: window.innerWidth * 0.4,
      colors: [
        "black",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "darkviolet",
      ],

      //user, 그림 그리는 순서
      userinfo: this.$store.state.userinfo, //to identify user
      isAdmin: this.$store.state.adminflag != 0 ? true : false,
      users: [], //all user list
      teamnumber: this.$store.state.teamnumber,
      teams: this.$store.state.teams,
      turnToDraw: false, // able/unable to draw
      currentUser: 0, //user index of current turn
      currentTeam: 0, //team index of current turn
      useridx: 0,
      // 1) 서버와 연결
      // socket: io("localhost:3000"), //url:port
      socket: this.$store.state.socket,

      text: "",
      messages: [],
      answer: "정답",
    };
  },
  mounted() {
    //set initial condition of canvas
    this.canvas = document.getElementById("canvas");
    this.ctx = this.canvas.getContext("2d");
    this.ctx.strokeStyle = "#2c2c2c";
    // Resize canvas
    window.addEventListener("resize", this.resizeHandler);
    this.canvas.height = this.canvasHeight;
    this.canvas.width = this.canvasWidth;
    this.ctx.lineWidth = 2.5;
    // fill canvas with white color
    this.ctx.fillStyle = "white";
    this.ctx.fillRect(0, 0, this.canvasWidth, this.canvasHeight);

    console.log(this.socket);

    //문제 받아오기
    if (this.isAdmin) {
      this.getAnswer();
    }
    //타이머 시작

    // 3-1) ctx 관련 정보 수신
    this.socket.on("duplicated code", () => {
      console.log("duplicated code");
    });

    // 3-1) on 함수들
    /* room and user */
    this.socket.on("disconnected", (user) => {
      //방을 떠난 유저가 있을 때
      console.log("disconnected: ", user);
    });
    this.socket.on("room", (users) => {
      //유저 정보 변화가 있을 때
      this.users = users;
      console.log("changed user list: ", this.users);
    });

    var jl = this.teams[this.userinfo.team - 1].joinlist;
    for (var i in jl) {
      if (jl[i].username == this.userinfo.username) {
        this.useridx = i;
      }
    }
    /* game syncing */
    this.socket.on("new game", () => {
      if (this.currentTeam == this.userinfo.team - 1) {
        //자기 팀이 그림 그릴 차례
        if (this.currentUser == this.useridx) {
          this.turnToDraw = true;
        }
      } else {
        this.turnToDraw = false;
      }
    });
    this.socket.on("start game", (totalTime) => {
      console.log(totalTime); //total time limit of team
      //timer starts
    });
    this.socket.on("timer", (user, time) => {
      console.log(user, time); //time limit of each player
      this.currentUser++;
      //timer starts with time
    });
    this.socket.on("end game", () => {
      console.log("end game"); //game end. nobody got the answer
      //animation
    });

    /* answer setting */
    this.socket.on("answer", (answer) => {
      this.$store.state.answer = answer; //answer 받아오기
    });
    this.socket.on("correct answer", (userinfo) => {
      // console.log(userinfo);
      this.answerMessage(userinfo);
    });

    /* painting */
    this.socket.on("began path", (x, y) => {
      this.beginPath(x, y);
    });
    this.socket.on("stroked path", (x, y, color, size) => {
      this.strokePath(x, y, color, size);
    });
    this.socket.on("cleared all", () => {
      this.ctx.fillRect(0, 0, this.canvasWidth, this.canvasHeight);
    });
  },
  methods: {
    /* to game play */
    getAnswer() {
      axios({
        method: "get",
        url: `https://k4a205.p.ssafy.io:8080/api/catchmind/answer`,
        // url: `http://localhost:8080/api/catchmind/answer`,
        // url: `${SERVER_URL}/api/catchmind/answer`,
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      })
        .then((res) => {
          // this.answer = res.data.answer;  //서버에서 emit해서 받을 거라 굳이 필요 없음
          this.socket.emit("answer", res.data.answer);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    answerMessage(user) {
      //1.정답 애니메이션
      var teamidx = user.team - 1; //team index of user
      console.log(this.teams);
      //2.점수 추가
      this.teams[teamidx].score += 1;

      //3.다음 턴으로 넘기기
      this.currentTeam++;
      this.currentUser = 0;
      this.clearAll();
      //3-1.정해진 문제 수만큼 풀이가 끝났으면 종료
      if (this.currentTeam >= this.teamnumber) {
        // 현재) 모든 팀이 1번씩 그리면 끝남
        this.$store.state.userinfo = this.userinfo;
        this.$store.state.teams = this.teams;
        console.log("catchmind finished");
        //페이지 이동
        alert("게임이 끝났습니다!\n 대기실로 이동해주세요");
        return;
      }

      //4.새 문제 받아오기
      if (this.isAdmin) {
        console.log("isAdmin");
        this.socket.emit(
          "chat",
          { username: "System" },
          "새로운 문제를 시작합니다."
        );
        this.getAnswer();
      }

      //5.새 타이머 시작
    },
    /* for painting */
    resizeHandler() {
      //resize 될 때마다 canvas size 조정
      this.canvasWidth = window.innerWidth * 0.4; //innerWidth, innerHeight 비율에 맞춰서 조정 필요
      this.canvasHeight = window.innerHeight * 0.5;

      this.canvas.height = this.canvasHeight;
      this.canvas.width = this.canvasWidth;
    },
    beginPath(x, y) {
      this.ctx.beginPath();
      this.ctx.moveTo(x, y);
    },
    strokePath(x, y, color, size) {
      var currentColor = this.ctx.strokeStyle; //원래 색 저장
      var currentSize = this.ctx.lineWidth;
      if (color != null) {
        this.ctx.strokeStyle = color;
      }
      if (size != null) {
        this.ctx.lineWidth = size;
      }
      this.ctx.lineTo(x, y);
      this.ctx.stroke();
      //원래 색으로 되돌리기
      this.ctx.strokeStyle = currentColor;
      this.ctx.lineWidth = currentSize;
    },
    onMouseMove(event) {
      if (!this.turnToDraw) return;
      const x = event.offsetX;
      const y = event.offsetY;
      if (!this.painting) {
        this.beginPath(x, y);
        this.socket.emit("begin path", x, y);
      } else {
        this.strokePath(x, y, null, null);
        this.socket.emit(
          "stroke path",
          x,
          y,
          this.ctx.strokeStyle,
          this.ctx.lineWidth
        );
      }
    },
    startPainting() {
      this.painting = true;
    },
    stopPainting() {
      this.painting = false;
    },
    strokeSizeHandler(size) {
      this.ctx.lineWidth = size;
    },
    strokeColorHandler(color) {
      this.ctx.strokeStyle = color;
    },
    clearAll() {
      // this.ctx.fillStyle = "white";
      this.ctx.fillRect(0, 0, this.canvasWidth, this.canvasHeight);
      this.socket.emit("clear all");
    },
  },
};
</script>

<style scoped>
.canvas-wrapper {
}
.answer {
  position: absolute;
  z-index: 1;
  padding: 0.5em;
}
#canvas {
  border: 3px solid black;
  height: 100%;
  width: 100%;
}
.game-support > div {
  margin: 1px;
}
.size-picker > div {
  float: left;
  background-color: white;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  /* 자식 항목들을 정가운데로 정렬하기 위한 설정 */
  display: flex;
  justify-content: center;
  align-items: center;
}
.size-picker > div > div {
  background: black;
  border-radius: 50%;
}
.colorPicker > div {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  float: left;
}
.eraser > div > svg {
  color: white;
  height: auto;
  width: 30px;
  margin-right: 8px;
}
.black {
  background-color: black;
}
.red {
  background-color: red;
}
.orange {
  background-color: orange;
}
.yellow {
  background-color: yellow;
}
.green {
  background-color: green;
}
.blue {
  background-color: blue;
}
.darkviolet {
  background-color: darkviolet;
}
</style>
