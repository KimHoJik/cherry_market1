package com.acorn.cherryM1.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.cherryM1.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {
   
    @Autowired
    private SqlSession session;
   
    @Override
    public boolean isExist(String inputId) {
    	//아이디가 DB에 존재하는지에 대한 boolean 함수
    	String id=session.selectOne("users.isExist", inputId);
    	if(id==null) { //아이디가 없으면
    		return false;
    	}else { //아이디가 있으면
    		return true;
    	}
    }

    @Override
    public UsersDto getData(String id) {
        return session.selectOne("users.getData", id);
    }

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}

	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.pwdUpdate", dto);
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}

	@Override
	public UsersDto findid(UsersDto dto) {
		UsersDto dto2=session.selectOne("users.findid", dto);
		return dto2;
	}	
}