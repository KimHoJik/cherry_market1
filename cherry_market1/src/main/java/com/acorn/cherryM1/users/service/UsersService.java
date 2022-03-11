package com.acorn.cherryM1.users.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.users.dto.UsersDto;

public interface UsersService {

    public void loginProcess(UsersDto dto, HttpSession session);
    public void getInfo(HttpSession session, ModelAndView mView);
	public Map<String, Object> isExistId(String inputId);
	public void addUser(UsersDto dto);
	
	
}


