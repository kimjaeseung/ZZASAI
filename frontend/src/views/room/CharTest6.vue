<template>
  <!-- 캐릭터 테스트 -->
  <div id="char-test6">
    <div
      v-if="
        this.$store.state.m == 1 &&
          this.$store.state.b == 1 &&
          this.$store.state.t == 1 &&
          this.$store.state.i == 1
      "
    >
      <Dog />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 1 &&
          this.$store.state.b == 1 &&
          this.$store.state.t == 1 &&
          this.$store.state.i == 2
      "
    >
      <Dolphin />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 1 &&
          this.$store.state.b == 1 &&
          this.$store.state.t == 2 &&
          this.$store.state.i == 1
      "
    >
      <Cheetah />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 1 &&
          this.$store.state.b == 1 &&
          this.$store.state.t == 2 &&
          this.$store.state.i == 2
      "
    >
      <Fox />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 1 &&
          this.$store.state.b == 2 &&
          this.$store.state.t == 1 &&
          this.$store.state.i == 1
      "
    >
      <Horse />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 1 &&
          this.$store.state.b == 2 &&
          this.$store.state.t == 1 &&
          this.$store.state.i == 2
      "
    >
      <Parrot />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 1 &&
          this.$store.state.b == 2 &&
          this.$store.state.t == 2 &&
          this.$store.state.i == 1
      "
    >
      <Wolf />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 1 &&
          this.$store.state.b == 2 &&
          this.$store.state.t == 2 &&
          this.$store.state.i == 2
      "
    >
      <Hyena />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 2 &&
          this.$store.state.b == 1 &&
          this.$store.state.t == 1 &&
          this.$store.state.i == 1
      "
    >
      <Hippocampus />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 2 &&
          this.$store.state.b == 1 &&
          this.$store.state.t == 1 &&
          this.$store.state.i == 2
      "
    >
      <Elephant />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 2 &&
          this.$store.state.b == 1 &&
          this.$store.state.t == 2 &&
          this.$store.state.i == 1
      "
    >
      <Octopus />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 2 &&
          this.$store.state.b == 1 &&
          this.$store.state.t == 2 &&
          this.$store.state.i == 2
      "
    >
      <Lizard />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 2 &&
          this.$store.state.b == 2 &&
          this.$store.state.t == 1 &&
          this.$store.state.i == 1
      "
    >
      <Penguin />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 2 &&
          this.$store.state.b == 2 &&
          this.$store.state.t == 1 &&
          this.$store.state.i == 2
      "
    >
      <Cat />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 2 &&
          this.$store.state.b == 2 &&
          this.$store.state.t == 2 &&
          this.$store.state.i == 1
      "
    >
      <Turtle />
    </div>
    <div
      v-else-if="
        this.$store.state.m == 2 &&
          this.$store.state.b == 2 &&
          this.$store.state.t == 2 &&
          this.$store.state.i == 2
      "
    >
      <Crow />
    </div>
  </div>
</template>

<script>
import Cat from "@/components/mbti/Cat.vue";
import Cheetah from "@/components/mbti/Cheetah.vue";
import Crow from "@/components/mbti/Crow.vue";
import Dog from "@/components/mbti/Dog.vue";
import Dolphin from "@/components/mbti/Dolphin.vue";
import Elephant from "@/components/mbti/Elephant.vue";
import Fox from "@/components/mbti/Fox.vue";
import Hippocampus from "@/components/mbti/Hippocampus.vue";
import Horse from "@/components/mbti/Horse.vue";
import Hyena from "@/components/mbti/Hyena.vue";
import Lizard from "@/components/mbti/Lizard.vue";
import Octopus from "@/components/mbti/Octopus.vue";
import Parrot from "@/components/mbti/Parrot.vue";
import Penguin from "@/components/mbti/Penguin.vue";
import Turtle from "@/components/mbti/Turtle.vue";
import Wolf from "@/components/mbti/Wolf.vue";

export default {
  data() {
    return {};
  },
  methods: {
    next() {
      // this.$router.push({name: 'CharTest7', params: {roomcode: this.$store.state.roomcode}})
      this.$emit("next");
    },
    mounted() {
      this.socket.on("userboolean", (userboolean) => {
        this.$store.state.userlist_boolean = userboolean.userlist_boolean;
      });
    },
    sendInfo() {
      //   console.log("소켓");
      //   console.log(this.$store.state.socket);
      //   console.log(this.$store.state.roomcode);
      //   console.log(this.$store.state.userinfo.username);
      //   console.log(this.$store.state.userlist);
      //   console.log(this.$store.state.userlist_boolean);
      //   console.log(this.$store.state.m*1000+this.$store.state.b*100+this.$store.state.t*10+this.$store.state.i);

      this.$store.state.socket.emit(
        "mbti",
        this.$store.state.roomcode,
        this.$store.state.userinfo.username,
        this.$store.state.userlist,
        this.$store.state.userlist_boolean,
        this.$store.state.m * 1000 +
          this.$store.state.b * 100 +
          this.$store.state.t * 10 +
          this.$store.state.i
      );
      //   this.$router.push({name: 'Loading', params: {roomcode: this.$store.state.roomcode}})
      this.next();
    },
  },
  components: {
    Cat,
    Cheetah,
    Crow,
    Dog,
    Dolphin,
    Elephant,
    Fox,
    Hippocampus,
    Horse,
    Hyena,
    Lizard,
    Octopus,
    Parrot,
    Penguin,
    Turtle,
    Wolf,
  },
};
</script>

<style></style>
