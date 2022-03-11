package com.acorn.cherryM1.ChatDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.cherryM1.ChatDto.openChatDto;

@Repository
public class openChatDaoImpl implements openChatDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<openChatDto> getOpenChatLog() {
		List<openChatDto> list=session.selectList("chatBatis.getOpenChatLog");
		return list;
	}

	@Override
	public void uploadOpenChat(openChatDto dto) {
		session.update("chatBatis.uploadOpenChat", dto);
	}

}
