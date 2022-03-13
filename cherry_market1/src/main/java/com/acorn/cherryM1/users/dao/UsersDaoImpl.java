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
      
        return false;
      
//       	if(id==null) {  헷갈려서 일단 주석처리했어요 -이준형-
//      		return false;
//      	}else {
//      		return true;
//	}
    }

   
    @Override
    public UsersDto getData(String id) {
      
        return session.selectOne("users.getData", id);
    }


	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
		
	}

   
}