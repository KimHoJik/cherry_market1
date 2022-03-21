package com.acorn.cherryM1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.goodsService.goodsService;
import com.acorn.cherryM1.users.service.UsersService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private goodsService Service1;
	@Autowired
	private UsersService Service2;
	
	@RequestMapping("/home.do")
	public ModelAndView home(ModelAndView mView,HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("id")!=null) {
			Service2.getInfo(session, mView);
		}
		Service1.getGoodsList(request);
		mView.setViewName("home");
		return mView;
	}
}