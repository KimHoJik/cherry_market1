package com.acorn.cherryM1.ChatService;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.ChatDto.openChatDto;

public interface openChatService {
	public void getOpenChatLog(ModelAndView view);
	public void uploadOpenChat(openChatDto dto);
}
