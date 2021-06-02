<template>
  <div>
    <div>
      <center>
        현재 {{ teams.length }} 개의 팀이 개설되었습니다.
        <tbody>
          <tr v-for="(text, index) in teams" :key="index">
            <th scope="row">{{ index + 1 }}팀</th>

            <td>
              {{ teams[index].currentpeople }} /
              {{ teams[index].totalpeople }}명
            </td>
          </tr>
        </tbody>
      </center>
    </div>
    <b-form-radio-group
      id="team-btn"
      v-model="selected"
      :options="teams"
      button-variant="outline-primary"
      size="lg"
      name="team"
      value-field="text"
      disabled-field="disabled"
      buttons
    >
    </b-form-radio-group>
    <div class="mt-3">
      선택한 팀: <strong>{{ selected }}</strong>
    </div>

    <button @click="selectTeam" v-if="this.btnStatus">
      팀 선택 완료
    </button>
  </div>
</template>

<script>
// import { mapState } from "vuex";

export default {
  name: "SelectTeam",
  components: {},
  data() {
    return {
      totalPerson: 30,
      btnStatus: true,
      selected: "",
      socket: this.$store.state.socket,
      teams: this.$store.state.teams,
    };
  },
  created() {
    var body = document.body;
    body.style.backgroundImage =
      "url(" + "https://wallpapercave.com/wp/wp5042415.jpg" + ")";
  },
  mounted() {
    // console.log("총 인원 수 :" + this.totalPerson);

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
      for (var i = 0; i < this.$store.state.teamnumber; i++) {
        this.$store.state.teams[i].disabled = true;
      }

      // 유저 팀 정보 vuex 저장
      this.$store.state.userinfo.team = this.selected;
      // currentpeople 인원 수 증가
      var index = this.selected.substr(0, 1);
      index = index - 1;
      this.$store.state.teams[index].currentpeople += 1;
      // 해당 팀의 참여자 정보 저장
      var cnt = this.$store.state.teams[index].currentpeople;
      this.$store.state.teams[index].joinlist[
        "member" + cnt
      ] = this.$store.state.userinfo.username;
      this.btnStatus = false;
      // console.log(this.$store.state.teams);

      this.socket.emit("select team", this.$store.state.teams);

      // 이어그리기로 이동
      // this.$router.push({
      //     name: "SelectTeam",
      //     params: { roomcode: this.$store.state.roomcode },
      //   });
    },
    checkBtnStatus() {
      for (var i = 0; i < this.$store.state.teamnumber; i++) {
        var currentpeople = this.$store.state.teams[i].currentpeople;
        var totalpeople = this.$store.state.teams[i].totalpeople;
        if (currentpeople === totalpeople) {
          this.$store.state.teams[i].disabled = true;
        }
      }
    },
  },
  // computed: {
  //   ...mapState(["teams", "userlist"]),
  // },
};
</script>

<style lang="scss" scoped></style>
