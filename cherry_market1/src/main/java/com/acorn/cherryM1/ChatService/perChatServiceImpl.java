package com.acorn.cherryM1.ChatService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.ChatDao.perChatDao;
import com.acorn.cherryM1.ChatDto.perChatDto;
import com.acorn.cherryM1.ChatDto.perChatListDto;

@Repository
public class perChatServiceImpl implements perChatService{
	
	@Autowired
	private perChatDao dao;
	
	@Override
	public void getPerChatList(ModelAndView mView,String id) {
		List<perChatListDto> list=dao.getPerChatList(id);
		mView.addObject("list",list);
	}

	@Override
	public void getPerChatLog(ModelAndView mView, perChatDto dto) {
		List<perChatDto> list=dao.getPerChatLog(dto);
		mView.addObject("list",list);
	}

	@Override
	public void uploadPerChatLog(perChatDto dto) {
		dao.uploadPerChatLog(dto);		
	}
	
}
