package com.acorn.cherryM1.users.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.users.dao.UsersDao;
import com.acorn.cherryM1.users.dto.UsersDto;


@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersDao dao;
   
    @Override
    public boolean loginProcess(UsersDto dto, HttpSession session) {
        boolean isValid=false;

        UsersDto result=dao.getData(dto.getId());
        if(result != null) {
           String encodedPwd=result.getPwd();  
            String inputPwd=dto.getPwd(); 
            isValid=BCrypt.checkpw(inputPwd, encodedPwd);
        }

        if(isValid) {
           session.setAttribute("id", dto.getId());
           return true;
        }
        return false;
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

	@Override
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView) {
		String id=(String)session.getAttribute("id");
		UsersDto resultDto=dao.getData(id);
		String encodedPwd=resultDto.getPwd();
		String inputPwd=dto.getPwd();
		boolean isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		if(isValid) {
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodedNewPwd=encoder.encode(dto.getNewPwd());
			dto.setNewPwd(encodedNewPwd);
			dto.setId(id);
			dao.updatePwd(dto);
			session.removeAttribute("id");
		}
		mView.addObject("isSuccess", isValid);
		mView.addObject("id", id);		
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.	
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//upload 폴더에 저장할 파일명을 직접구성한다.
		// 1234123424343xxx.jpg
		String saveFileName=System.currentTimeMillis()+orgFileName;
		// webapp/upload 폴더까지의 실제 경로 얻어내기 
		String realPath=request.getServletContext().getRealPath("/upload");
		// upload 폴더가 존재하지 않을경우 만들기 위한 File 객체 생성
		File upload=new File(realPath);
		if(!upload.exists()) {//만일 존재 하지 않으면
			upload.mkdir(); //만들어준다.
		}
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			mFile.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", "/upload/"+saveFileName);
		
		return map;
		
	}

	@Override
	public void updateUser(UsersDto dto, HttpSession session) {
		//수정할 회원의 아이디
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		dao.update(dto);		
	}

	@Override
	public void deleteUser(HttpSession session, ModelAndView mView) {
		//로그인된 아이디를 얻어와서 
		String id=(String)session.getAttribute("id");
		dao.delete(id);
		session.removeAttribute("id");
		//ModelAndView 객체에 탈퇴한 회원의 아이디를 담아준다.
		mView.addObject("id", id);
	}
}


