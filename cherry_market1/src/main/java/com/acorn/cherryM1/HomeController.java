package com.acorn.cherryM1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.goodsService.goodsService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private goodsService Service;
	
	@RequestMapping("/home.do")
	public ModelAndView home(ModelAndView mView,HttpServletRequest request) {
		Service.getGoodsList(request);
		mView.setViewName("home");
		return mView;
	}
}