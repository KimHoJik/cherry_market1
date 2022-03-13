package com.acorn.cherryM1.users.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.users.dto.UsersDto;
import com.acorn.cherryM1.users.service.UsersService;


@Controller
public class UsersController {
    @Autowired
    private UsersService service;
   
    @RequestMapping("/users/loginform")
    public String loginform() {
      
        return "users/loginform";
    }
   
    @RequestMapping("/users/login")
    public ModelAndView login(ModelAndView mView, UsersDto dto,
    		@RequestParam String url, HttpSession session) {
        service.loginProcess(dto, session);
      
        String encodedUrl=URLEncoder.encode(url);
        mView.addObject("url", url);
        mView.addObject("encodedUrl", encodedUrl);
        mView.setViewName("users/login");
        return mView;
    }
   
    @RequestMapping("/users/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("id");
        return "users/logout";
    }
    
    @RequestMapping(value = "/users/signup_form", method = RequestMethod.GET)
	public String signupForm() {

		return "users/signup_form";
	}

	//아이디 중복 확인을 해서 json 문자열을 리턴해주는 메소드 
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		return service.isExistId(inputId);
	}
	
	//회원 가입 요청 처리
	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	public ModelAndView signup(ModelAndView mView, UsersDto dto) {

		service.addUser(dto);

		mView.setViewName("users/signup");
		return mView;
	}
}