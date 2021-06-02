<template>
  <div>
    {{ countDown }}
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "Timer",
  data() {
    return {
      countDown: this.$store.state.timer,
    };
  },
  computed: {
    ...mapState(["teams"]),
  },
  methods: {
    countDownTimer() {
      if (this.countDown > 0) {
        setTimeout(() => {
          this.countDown -= 1;
          this.countDownTimer();
        }, 1000);
      } else {
        this.playEndAlarm();
      }
    },
    playEndAlarm() {
      var sound =
        "https://soundbible.com/mp3/School Bell-SoundBible.com-449398625.mp3";
      var audio = new Audio(sound);
      let timerId = setTimeout(() => audio.play());
      setTimeout(() => {
        clearInterval(timerId);
        audio.pause();
      }, 1500);
    },
  },
  created() {
    this.countDownTimer();
  },
};
</script>
