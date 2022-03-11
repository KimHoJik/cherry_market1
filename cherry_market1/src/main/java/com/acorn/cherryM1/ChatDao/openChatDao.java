package com.acorn.cherryM1.ChatDao;

import java.util.List;

import com.acorn.cherryM1.ChatDto.openChatDto;

public interface openChatDao {
	public List<openChatDto> getOpenChatLog();
	public void uploadOpenChat(openChatDto dto);
}
