// server.js

var express = require("express");
const { emit } = require("process");
var app = express();
var http = require("http").Server(app); //1
var io = require("socket.io")(http, { cors: { origin: "*" } }); //1. **allow all cors**

const User = class {
  constructor(id, name, code, isAdmin) {
    this.id = id;
    this.name = name;
    this.code = code;
    this.isAdmin = isAdmin;
  }
  str() {
    console.log(this.id, this.name, this.code, this.isAdmin);
  }
};

const Userlist_boolean = class {
  constructor(roomcode, username, userlist, userlist_boolean) {
    this.roomcode = roomcode;
    this.username = username;
    this.userlist = userlist;
    this.userlist_boolean = userlist_boolean;
  }
  str() {
    console.log(
      this.roomcode,
      this.username,
      this.userlist,
      this.userlist_boolean
    );
  }
};

const Room = class {
  constructor(code, userlist) {
    this.code = code;
    this.userlist = userlist;
  }
  nextAdmin() {
    this.userlist.shift();
    if (Array.isArray(this.userlist) && this.userlist.length === 0) {
      return false; //빈 배열
    } else {
      return true;
    }
  }
};

var rooms = [];

io.on("connection", function (socket) {
  //3. interact with clients
  //3-1. client connected
  console.log("user connected: ", socket.id);

  var user = null;
  user = new User(socket.id, "aaa", "aaawww12", "false");
  socket.on("info", function (name, code, isAdmin) {
    user = new User(socket.id, name, code, isAdmin); //유저 정보 저장
    if (isAdmin) {
      //방장이라면, 방 코드 유일값인지 확인
      for (var room of rooms) {
        if (room.code == code) {
          console.log("duplicated code!!!");
          io.to(socket.id).emit("duplicated code");
          user = null;
          return;
        }
      }
      //유일값일 경우 새 방 생성
      rooms.push(new Room(code, [user]));
    } else {
      for (var room of rooms) {
        if (room.code == code) {
          room.userlist.push(user);
          io.to(user.code).emit("room", room.userlist); //변화된 방 정보 모두에게 알리기
          break;
        }
      }
    }
    socket.join(code);
    console.log(socket.rooms);
    // if (rooms != null) {
    //   console.log(rooms[0].userlist);
    // }
  });

  socket.on("disconnect", function () {
    //3-2. client disconnected
    console.log("user disconnected: ", socket.id);
    if (user == null) return;

    for (var i in rooms) {
      if (rooms[i].code == user.code) {
        console.log("room found");

        if (user.isAdmin) {
          console.log("admin is leaving");
          //방장바꾸기 시도. if문 하나로 합쳐도 됨
          if (!rooms[i].nextAdmin()) {
            console.log("empty room. erase it");
            rooms.splice(i, 1); //실패하면, 마지막 사람므로 방 삭제
          }
        } else {
          //방장이 아닐 경우
          for (var j in rooms[i].userlist) {
            if (rooms[i].userlist[j].id == socket.id) {
              console.log("user found", rooms[i].userlist[j]);
              rooms[i].userlist.splice(j, 1); //삭제
              break;
            } //유저 찾음
          }
        }
        io.to(user.code).emit("disconnected", user); //모두에게 알려주기
        io.to(user.code).emit("room", rooms[i]); //변화된 방 정보 모두에게 알리기
        break;
      }
    }
    // console.log(rooms);
  });

  /* chatting */
  socket.on("chat", function (name, msg) {
    if (user == null) return;
    io.to(user.code).emit("chat", name, msg);
  });

  /* checking answer */
  socket.on("answer", function (answer) {
    //방장이 정답을 back에서 받아와서 서버에 알림
    if (user == null) return;
    //back에서 받아온 정답을 모두에게 알림
    io.to(user.code).emit("answer", answer);
  });
  socket.on("correct answer", function (userinfo) {
    io.to(user.code).emit("correct answer", userinfo);
  });

  /* painting function */
  socket.on("begin path", function (x, y) {
    if (user == null) return;
    io.to(user.code).emit("began path", x, y);
  });
  socket.on("stroke path", function (x, y, color, size) {
    if (user == null) return;
    io.to(user.code).emit("stroked path", x, y, color, size);
  });
  socket.on("clear all", function () {
    if (user == null) return;
    io.to(user.code).emit("cleared all");
  });
  userlist_boolean = new Array();
  socket.on("mbti", function (roomcode, username, userlist, mbtivalue) {
    const index = userlist.indexOf(username);
    if (index !== -1) {
      console.log(userlist);
      console.log(username);
      console.log(mbtivalue);
      if (userlist_boolean.length < userlist.length) {
        for (var i = 0; i < userlist.length; i++) {
          userlist_boolean.push(false);
        }
      }
      userlist_boolean[index] = mbtivalue;
      console.log(userlist_boolean);
    }
    userboolean = new Userlist_boolean(
      roomcode,
      username,
      userlist,
      userlist_boolean
    );
    io.emit("userboolean", userboolean);
  });
  socket.on("mbti2", function (roomcode, username, userlist, mbtivalue) {
    const index = userlist.indexOf(username);
    if (index !== -1) {
      console.log(roomcode);
      console.log(userlist);
      console.log(username);
      console.log(mbtivalue);
      userboolean.userlist_boolean[index] = mbtivalue;
      console.log(userlist_boolean);
    }
    io.emit("userboolean", userboolean);
    if (!userboolean.userlist_boolean.includes(false)) {
      console.log("false없음 !! 모두 mbti 완료 !");
      io.emit("mbtifinish", userboolean);
    }
  });

  // select team
  // name: 유저 이름, team: 팀 이름, currentpeople: 현재 사람 수
  socket.on("select team", function (teams) {
    if (user == null) return;
    io.to(user.code).emit("select team", teams);
  });

  /*card function*/
  socket.on("cardselect",function(cardno){
    io.emit("cardselected",cardno);
  }),

  socket.on("firstinit",function(cardlist,backgroundlist){
    io.emit("setinit",cardlist,backgroundlist);
  });
});

//4
http.listen(3000, function () {
  console.log("server on!");
});
