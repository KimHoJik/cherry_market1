package com.acorn.cherryM1.ChatService;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.ChatDto.perChatDto;

public interface perChatService {
	public void getPerChatList(ModelAndView mView, String id);
	public void getPerChatLog(ModelAndView mView,perChatDto dto);
	public void uploadPerChatLog(perChatDto dto);
}
