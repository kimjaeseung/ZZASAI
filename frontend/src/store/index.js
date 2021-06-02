import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // list
    programme: "",
    //현재 진행중인 컨텐츠. programme[]를 가리키는 인덱스
    pidx: 0,
    userlist: [],
    userinfo: {
      username: "",
      team: 0,
      score: 0,
    },
    userlist_boolean: [],
    adminflag: 0,
    roomname: "",
    roomcode: "",
    // 방장이 선택한 나누려는 팀 수
    teamnumber: 0,
    timer: 0,
    //teams: 팀 정보
    // text: n팀 , currentpeople: 현재 해당 팀 선택한 사람, teampeople: 해당 팀에 분배된 사람 수, disabled: 버튼 비활성화, score: 점수
    teams: [
      {
        text: "",
        currentpeople: 0,
        totalpeople: 0,
        joinlist: {},
        disabled: Boolean,
        score: 0,
      },
    ],
    m: 0,
    b: 0,
    t: 0,
    i: 0,
    socket: null,
    answer: "",
  },
  mutations: {
    CREATE_PROGRAMME: function(state, item) {
      state.programme = item;
    },
    CREATE_USERNAME: function(state, name) {
      // state.username = name;
      state.userinfo.username = name;
    },
    CREATE_ROOMNAME: function(state, name) {
      state.roomname = name;
    },
    CREATE_ROOMCODE: function(state, code) {
      state.roomcode = code;
    },
    CREATE_USERTEAM: function(state, team) {
      state.userinfo.team = team;
    },
    BTN_STATUS_BLOCK(state, index, value) {
      state.teams[index].disabled = value;
    },
    SET_ADMINFLAG: function(state) {
      state.adminflag = 1;
    },
    RESTORE_ADMINFLAG: function(state) {
      state.adminflag = 0;
    },
    myes: function(state) {
      state.m = 1;
    },
    mno: function(state) {
      state.m = 2;
    },
    byes: function(state) {
      state.b = 1;
    },
    bno: function(state) {
      state.b = 2;
    },
    tyes: function(state) {
      state.t = 1;
    },
    tno: function(state) {
      state.t = 2;
    },
    iyes: function(state) {
      state.i = 1;
    },
    ino: function(state) {
      state.i = 2;
    },
    PUSH_USERLIST: function(state, name) {
      state.userlist.push(name);
    },
    PUSH_USERLIST_BOOLEAN: function(state, bool) {
      state.userlist_boolean.push(bool);
    },
    SET_PIDX: function(state, pidx) {
      state.pidx = pidx;
    },
    CREATE_TEAM: function(state, payload) {
      state.teams = payload;
    },
  },
  actions: {},
  modules: {},
  plugins: [createPersistedState()],
});
