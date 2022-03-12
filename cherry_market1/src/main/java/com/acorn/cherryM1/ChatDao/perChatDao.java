package com.acorn.cherryM1.ChatDao;

import java.util.List;

import com.acorn.cherryM1.ChatDto.perChatDto;
import com.acorn.cherryM1.ChatDto.perChatListDto;

public interface perChatDao {
	public List<perChatListDto> getPerChatList(String id);
	public List<perChatDto> getPerChatLog(perChatDto dto);
	public void uploadPerChatLog(perChatDto dto);
}
