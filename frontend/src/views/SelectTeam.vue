<template>
  <div>
    <div class="mb-5">
      <center>
        <h4 class="mb-5">현재 {{ teams.length }} 개의 팀이 개설되었습니다.</h4>
        <h3>
          <tbody>
            <tr v-for="(text, index) in teams" :key="index">
              <th scope="row">{{ index + 1 }}팀</th>

              <td class="pl-3">
                {{ teams[index].currentpeople }} /
                {{ teams[index].totalpeople }}명
              </td>
            </tr>
          </tbody>
        </h3>
      </center>
    </div>
    <div v-if="this.btnStatus">
      <b-form-radio-group
        id="team-btn"
        v-model="selected"
        :options="teams"
        size="lg"
        name="team"
        value-field="text"
        disabled-field="disabled"
        buttons
        button-variant="outline-info"
      >
      </b-form-radio-group>
    </div>
    <div v-show="selected" class="mt-3">
      선택한 팀: <strong>{{ selected }}</strong>
    </div>

    <button class="mainbtn" @click="selectTeam" v-if="this.btnStatus">
      확인
    </button>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "SelectTeam",
  components: {},
  data() {
    return {
      // userlist 배열 길이로 값 변경
      totalPeople: 0,
      btnStatus: true,
      selected: "",
      socket: this.$store.state.socket,
      // teams: this.$store.state.teams,
    };
  },
  created() {
    if (
      this.$store.state.roomcode == undefined ||
      this.$store.state.userinfo.username == undefined
    ) {
      this.$router.push({ name: "Main" });
    }
    var body = document.body;
    body.style.backgroundImage =
      "url(" + "https://wallpapercave.com/wp/wp5042415.jpg" + ")";
  },
  mounted() {
    this.socket.on("userboolean", (userboolean) => {
      this.$store.state.userlist_boolean = userboolean.userlist_boolean;
      // console.log("changed user list: ", this.$store.state.userlist_boolean);
    });
    this.totalPeople = this.$store.state.userlist_boolean.length;

    // socket on 함수 mounted에 배치
    this.socket.on("select team", (teams) => {
      this.$store.state.teams = teams;
      console.log(teams);
      // this.selectTeam(teams);
    });

    // console.log(this.$store.state.teams);
  },
  methods: {
    selectTeam() {
      // 유저 팀 정보 vuex 저장
      var index = this.selected.substr(0, 1);
      index = Number(index);
      this.$store.state.userinfo.team = index;
      console.log(this.$store.state.userinfo);
      // currentpeople 인원 수 증가
      index = index - 1;
      this.$store.state.teams[index].currentpeople += 1;
      // 해당 팀의 참여자 정보 저장
      var cnt = this.$store.state.teams[index].currentpeople;
      this.$store.state.teams[index].joinlist[
        "member" + cnt
      ] = this.$store.state.userinfo.username;
      this.btnStatus = false;
      // console.log(this.$store.state.teams);
      this.checkBtnStatus();

      this.socket.emit("select team", this.$store.state.teams);

      // 이어그리기로 컴포넌트 전환
      this.checkSelecedPeople();
    },
    checkBtnStatus() {
      for (var i = 0; i < this.$store.state.teamnumber; i++) {
        var currentpeople = this.$store.state.teams[i].currentpeople;
        var totalpeople = this.$store.state.teams[i].totalpeople;
        if (currentpeople === totalpeople) {
          this.$store.state.teams[i].disabled = true;

          this.socket.emit("select team", this.$store.state.teams);
        }
      }
    },
    checkSelecedPeople() {
      var currentpeople = 0;
      for (var i = 0; i < this.$store.state.teamnumber; i++) {
        currentpeople =
          currentpeople + this.$store.state.teams[i].currentpeople;
        if (currentpeople === this.totalPeople) {
          this.socket.emit("procatchmind");
        }
      }
    },
  },
  computed: {
    ...mapState(["teams", "userlist"]),
  },
};
</script>

<style lang="scss" scoped></style>
