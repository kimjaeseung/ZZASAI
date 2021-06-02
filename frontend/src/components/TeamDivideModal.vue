<template>
  <div>
    <b-button v-b-modal.modal-input-number>시작</b-button>
    <b-modal
      id="modal-input-number"
      ref="modal"
      title="팀 나누기"
      @show="resetModal"
      @hidden="resetModal"
      @ok="handleOk"
      ok-only
    >
      <form ref="form" @submit.stop.prevent="submitTeamSetting">
        <b-form-group
          label="나누려는 팀 수를 입력해주세요"
          invalid-feedback="팀 수를 입력해주세요"
          :state="numberState"
        >
          <b-form-input
            v-model="teamNumber"
            :state="numberState"
            placeholder="ex) 4"
            required
          ></b-form-input>
        </b-form-group>
        <div>
          <b-form-group
            label="한 사람에게 주어지는 시간을 선택하세요"
            v-slot="{ ariaDescribedby }"
          >
            <b-form-radio
              v-model="timer"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="2"
              >2초</b-form-radio
            >
            <b-form-radio
              v-model="timer"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="3"
              >3초</b-form-radio
            >
            <b-form-radio
              v-model="timer"
              :aria-describedby="ariaDescribedby"
              name="some-radios"
              value="5"
              >5초</b-form-radio
            >
          </b-form-group>
        </div>
      </form>
    </b-modal>
  </div>
</template>

<script>
export default {
  name: "Teamdividemodal",
  components: {},
  data() {
    return {
      teamNumber: "",
      timer: 3,
      numberState: null,
      totalPeople: "30",
      socket: this.$store.state.socket,
      teams: this.$store.state.teams,
    };
  },
  mounted() {},
  watch: {
    teamNumber() {
      return (this.teamNumber = this.teamNumber.replace(/[^0-9]/g, ""));
    },
  },
  methods: {
    checkFormValidity() {
      //   const valid = this.$refs.form.checkValidity();
      //   this.numberState = valid;
      if (this.teamNumber >= 1 && this.teamNumber <= 10) {
        // return valid;

        // 방장이 선택한 팀 개수 저장
        this.$store.state.teamnumber = this.teamNumber;

        // 방장이 선택한 1인당 시간 저장
        this.$store.state.timer = this.timer;

        var teamPeople = [];
        var addPeople = this.totalPeople % this.teamNumber;
        var meanPeople = parseInt(this.totalPeople / this.teamNumber);

        for (var idx = 0; idx < this.teamNumber; idx++) {
          teamPeople[idx] = meanPeople;
        }

        if (addPeople != 0) {
          for (var index = 0; index < addPeople; index++) {
            teamPeople[index] += 1;
          }
        }

        // 빈 배열(index 0) 삭제
        this.$store.state.teams.splice(0);

        for (var i = 0; i < this.teamNumber; i++) {
          this.$store.state.teams.push({
            text: i + 1 + "팀",
            currentpeople: 0,
            totalpeople: teamPeople[i],
            joinlist: {},
            disabled: false,
            score: 0,
          });
        }

        // console.log(this.$store.state.teams);
        // console.log(this.$store.state.timer);

        this.socket.emit("move page to select team", this.teams);
        this.$router.push({
          name: "SelectTeam",
          params: { roomcode: this.$store.state.roomcode },
        });
      } else {
        alert("다시 입력하세요");
      }
    },
    resetModal() {
      this.teamNumber = "";
      this.numberState = null;
    },
    handleOk(bvModalEvt) {
      // Prevent modal from closing
      bvModalEvt.preventDefault();
      // Trigger submit handler
      this.submitTeamSetting();
    },
    submitTeamSetting() {
      // Exit when the form isn't valid
      if (!this.checkFormValidity()) {
        return;
      }
      // Hide the modal manually
      this.$nextTick(() => {
        this.$bvModal.hide("modal-input-number");
      });
    },
  },
};
</script>

<style lang="scss" scoped></style>
