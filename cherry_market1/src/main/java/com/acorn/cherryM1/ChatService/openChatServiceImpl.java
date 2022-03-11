package com.acorn.cherryM1.ChatService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.ChatDao.openChatDao;
import com.acorn.cherryM1.ChatDto.openChatDto;

@Repository
public class openChatServiceImpl implements openChatService{
	@Autowired
	private openChatDao dao;

	@Override
	public void getOpenChatLog(ModelAndView mView) {
		List<openChatDto> list=dao.getOpenChatLog();
		mView.addObject("list", list);
	}

	@Override
	public void uploadOpenChat(openChatDto dto) {
		dao.uploadOpenChat(dto);		
	}
	
}
