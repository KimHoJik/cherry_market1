package com.acorn.cherryM1.ChatDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.cherryM1.ChatDto.perChatDto;
import com.acorn.cherryM1.ChatDto.perChatListDto;

@Repository
public class perChatDaoImpl implements perChatDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<perChatListDto> getPerChatList(String id) {
		List<perChatListDto> list=session.selectList("chatBatis.getPerChatList", id);
		return list;
	}

	@Override
	public List<perChatDto> getPerChatLog(perChatDto dto) {
		List<perChatDto> list=session.selectList("chatBatis.getPerChatLog", dto);
		return list;
	}

	@Override
	public void uploadPerChatLog(perChatDto dto) {
		perChatListDto listDto=new perChatListDto();
		long time=System.currentTimeMillis();
		listDto.setBuyer(dto.getBuyer());
		listDto.setSaller(dto.getSaller());
		listDto.setLastcomment(dto.getPccomment());
		listDto.setNum(dto.getNum());
		listDto.setLastregdate(time);
		session.update("chatBatis.uploadPerChatLog",dto);
		int num=session.selectOne("chatBatis.CheckPerChatList", listDto);
		if (num==0) {
			session.insert("chatBatis.uploadPerChatList", listDto);
		}else {
			session.update("chatBatis.updatePerChatList", listDto);
		}
	}
}
