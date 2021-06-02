package com.ssafy.icebreaking.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.icebreaking.model.RoomDto;
import com.ssafy.icebreaking.model.mapper.RoomMapper;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	// DB에 ROOM정보 저장하기
	public void insertRoominfo(RoomDto roomdto) {
		sqlSession.getMapper(RoomMapper.class).insertRoominfo(roomdto);

	}

	@Override
	public RoomDto returnRoominfo(String roomcode) {
		RoomDto roomdto = new RoomDto();

		roomdto = sqlSession.getMapper(RoomMapper.class).returnRoominfo(roomcode);
		return roomdto;
	}

	// roomcode 유효성 검사
	@Override
	public boolean roomcodeCheck(String roomcode) {
		int count = 0;

		count = sqlSession.getMapper(RoomMapper.class).roomcodeCheck(roomcode);

		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

}
