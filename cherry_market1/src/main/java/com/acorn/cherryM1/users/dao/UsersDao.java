package com.acorn.cherryM1.users.dao;

import com.acorn.cherryM1.users.dto.UsersDto;

public interface UsersDao {
    public boolean isExist(String inputId);
    public UsersDto getData(String id);
	public void insert(UsersDto dto);
    
	//public void updatePwd(UsersDto dto);
	//public void update(UsersDto dto);
	//public void delete(String id);

}