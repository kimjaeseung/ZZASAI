import Vue from "vue";
import VueRouter from "vue-router";
import Main from "../views/Main.vue";
import CreateHall from "../views/CreateHall.vue";
import Hall from "../views/Hall.vue";
import CardPlay from "../views/room/CardPlay.vue";
import GamePlay from "../views/room/GamePlay.vue";
import CharTest from "../views/room/CharTest.vue";
import HostName from "../views/room_register/HostName.vue";
import RoomName from "../views/room_register/RoomName.vue";
import UserName from "../views/room_register/UserName.vue";
import CharTest2 from "../views/room/CharTest2.vue";
import CharTest3 from "../views/room/CharTest3.vue";
import CharTest4 from "../views/room/CharTest4.vue";
import CharTest5 from "../views/room/CharTest5.vue";
import CharTest6 from "../views/room/CharTest6.vue";
import CharTest7 from "../views/room/CharTest7.vue";
import SelectTeam from "../views/SelectTeam.vue";
import Test from "../views/Test";
import Loading from "../views/Loading.vue";
import Final from "../views/Final.vue";
import Room from "../views/Room.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Main",
    component: Main,
  },
  {
    path: "/create-hall",
    name: "CreateHall",
    component: CreateHall,
  },
  {
    path: "/hall/:roomcode",
    name: "Hall",
    component: Hall,
  },
  {
    path: "/card-play",
    name: "CardPlay",
    component: CardPlay,
  },
  {
    path: "/game-play",
    name: "GamePlay",
    component: GamePlay,
  },
  {
    path: "/char-test",
    name: "CharTest",
    component: CharTest,
  },
  {
    path: "/create/name",
    name: "HostName",
    component: HostName,
  },
  {
    path: "/create/room",
    name: "RoomName",
    component: RoomName,
  },
  {
    path: "/username",
    name: "UserName",
    component: UserName,
  },
  {
    path: "/char-test2",
    name: "CharTest2",
    component: CharTest2,
  },
  {
    path: "/char-test3",
    name: "CharTest3",
    component: CharTest3,
  },
  {
    path: "/char-test4",
    name: "CharTest4",
    component: CharTest4,
  },
  {
    path: "/char-test5",
    name: "CharTest5",
    component: CharTest5,
  },
  {
    path: "/char-test6",
    name: "CharTest6",
    component: CharTest6,
  },
  {
    path: "/char-test7",
    name: "CharTest7",
    component: CharTest7,
  },
  {
    path: "/hall/:roomcode/test",
    name: "Test",
    component: Test,
    props: true,
  },
  {
    path: "/:roomcode/select-team",
    name: "SelectTeam",
    component: SelectTeam,
    props: true,
  },
  {
    path: "/loading",
    name: "Loading",
    component: Loading,
  },
  {
    path: "/final",
    name: "Final",
    component: Final,
  },
  {
    path: "/:roomcode",
    name: "Room",
    component: Room,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
