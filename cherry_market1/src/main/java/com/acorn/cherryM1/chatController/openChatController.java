package com.acorn.cherryM1.chatController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.ChatDto.openChatDto;
import com.acorn.cherryM1.ChatService.openChatService;

@Controller
public class openChatController {
	
	@Autowired
	private openChatService Service;
	
	@RequestMapping("/updateOpenChatBox")
	public ModelAndView updateOpenChatBox(ModelAndView mView) {
		Service.getOpenChatLog(mView);
		mView.setViewName("chat/openChatBoxAjax");
		return mView;
	}
	@RequestMapping("/uploadOpenChat")
	public String uploadOpenChat(String id,String occomment) {
		openChatDto dto=new openChatDto();
		dto.setId(id);
		dto.setOccomment(occomment);
		Service.uploadOpenChat(dto);
		return "chat/null";
	}
}
