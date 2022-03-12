package com.acorn.cherryM1.chatController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.ChatDto.perChatDto;
import com.acorn.cherryM1.ChatService.perChatService;

@Controller
public class perChatController {
	
	@Autowired
	private perChatService Service;
	
	@RequestMapping("/private/personalChatList")
	public String personalChatList() {
		return "chat/personalChatList";
	}
	
	@RequestMapping("/private/updatePerChatList")
	public ModelAndView updatePerChatList(ModelAndView mView,HttpSession session) {
		String id = (String) session.getAttribute("id");
		Service.getPerChatList(mView, id);
		mView.setViewName("chat/perChatListAjax");
		return mView;
	}

	@RequestMapping("/private/chatPop")
	public String popup() {
		return "chat/chatPop";
	}
	
	@RequestMapping("/private/updatePerChatBox")
	public ModelAndView updatePerChatBox(ModelAndView mView,perChatDto dto) {
		Service.getPerChatLog(mView, dto);
		mView.setViewName("chat/perChatBoxAjax");
		return mView;
	}
	
	@RequestMapping("/private/uploadPerChatLog")
	public String updatePerChatLog(perChatDto dto,HttpSession session) {
		String talker=(String) session.getAttribute("id");
		dto.setTalker(talker);
		Service.uploadPerChatLog(dto);
		return "chat/null";
	}
	
		
}
