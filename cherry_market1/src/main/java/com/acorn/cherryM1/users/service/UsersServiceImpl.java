package com.acorn.cherryM1.users.service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.users.dao.UsersDao;
import com.acorn.cherryM1.users.dto.UsersDto;


@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersDao dao;
   
    @Override
    public void loginProcess(UsersDto dto, HttpSession session) {
        boolean isValid=false;

        UsersDto result=dao.getData(dto.getId());
        if(result != null) {
           String encodedPwd=result.getPwd();  
            String inputPwd=dto.getPwd(); 
            isValid=BCrypt.checkpw(inputPwd, encodedPwd);
        }

        if(isValid) {
           session.setAttribute("id", dto.getId());
        }
      
    }

    @Override
    public void getInfo(HttpSession session, ModelAndView mView) {
        String id=(String)session.getAttribute("id");
        UsersDto dto=dao.getData(id);
        mView.addObject("dto", dto);
      
    }
    
	@Override  // 회원가입시 DB에 중복되는 아이디가 존재하는지 여부
	public Map<String, Object> isExistId(String inputId) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isExist", dao.isExist(inputId));
		return map;
	}
	
	@Override // BCryptPasswordEncoder를 통한 DB 암호화 (비밀번호)
	public void addUser(UsersDto dto) {
		String pwd=dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		dto.setPwd(encodedPwd);

		dao.insert(dto);
	}
	
}


