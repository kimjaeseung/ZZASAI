package com.ssafy.icebreaking.model.service;

import com.ssafy.icebreaking.model.RoomDto;

public interface RoomService {
	public void insertRoominfo(RoomDto roomdto);

	public RoomDto returnRoominfo(String roomcode);

	public boolean roomcodeCheck(String roomcode);
}
