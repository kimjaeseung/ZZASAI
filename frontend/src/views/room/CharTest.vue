<template>
  <!-- 캐릭터 테스트 -->
  <div id="char-test">
    <CharTest1 v-if="idx == 1" v-on:next="next" />
    <CharTest2 v-if="idx == 2" v-on:next="next" />
    <CharTest3 v-if="idx == 3" v-on:next="next" />
    <CharTest4 v-if="idx == 4" v-on:next="next" />
    <CharTest5 v-if="idx == 5" v-on:next="next" />
    <CharTest6 v-if="idx == 6" v-on:next="next" />
    <CharTest7 v-if="idx == 7" v-on:next="next" />
  </div>
</template>

<script>
import CharTest1 from "@/views/room/CharTest1";
import CharTest2 from "@/views/room/CharTest2";
import CharTest3 from "@/views/room/CharTest3";
import CharTest4 from "@/views/room/CharTest4";
import CharTest5 from "@/views/room/CharTest5";
import CharTest6 from "@/views/room/CharTest6";
import CharTest7 from "@/views/room/CharTest7";

export default {
  name: "CharTest",
  components: {
    CharTest1,
    CharTest2,
    CharTest3,
    CharTest4,
    CharTest5,
    CharTest6,
    CharTest7,
  },
  data() {
    return {
      idx: 1,
    };
  },
  mounted() {
    var socket = this.$store.state.socket;
    socket.on("userboolean", (userboolean) => {
      this.$store.state.userlist_boolean = userboolean.userlist_boolean;
      console.log("changed user list: ", this.$store.state.userlist_boolean);
    });
  },
  methods: {
    next() {
      this.idx++;
    },
  },
  created() {},
};
</script>

<style scoped>
#char-test {
  color: white;
}

.col img {
  position: absolute;
  top: 0;
  left: 0;
  width: 140%;
  height: 130%;
}
</style>
