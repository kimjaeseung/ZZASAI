package com.ssafy.icebreaking.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.icebreaking.model.RoomDto;

@Mapper
public interface RoomMapper {

	public void insertRoominfo(RoomDto roomdto);

	public RoomDto returnRoominfo(String roomcode);

	public int roomcodeCheck(String roomcode);
}
