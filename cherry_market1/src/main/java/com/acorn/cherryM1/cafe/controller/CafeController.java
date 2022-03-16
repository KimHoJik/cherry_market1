package com.acorn.cherryM1.cafe.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.acorn.cherryM1.cafe.dto.CafeDto;
import com.acorn.cherryM1.cafe.service.CafeService;



@Controller
public class CafeController {
		@Autowired
		private CafeService service;
	
		@RequestMapping("/cafe/list")
		public String getList(HttpServletRequest request) {
	
			service.getList(request);
	
			return "cafe/list";
		}
		
		@RequestMapping("/cafe/insertform")
		public ModelAndView authInsertForm(HttpServletRequest request) {
	
			return new ModelAndView("cafe/insertform");
		}
		
		//새글 저장 요청 처리 
		@RequestMapping("/cafe/insert")
		public ModelAndView authInsert(CafeDto dto, HttpSession session, HttpServletRequest request) {
				//글 작성자는 세션에서 얻어낸다. 
				String id=(String)session.getAttribute("id");
				//CafeDto 객체에 글 작성자도 담기
				dto.setWriter(id);
				service.saveContent(dto);
	
				return new ModelAndView("cafe/insert");
		}
	
		//글 자세히 보기 요청 처리
		@RequestMapping("/cafe/detail")
		public String detail(HttpServletRequest request) {
			service.getDetail(request);
			return "cafe/detail";
		}
		
		//카페글 삭제 요청 처리 
		@RequestMapping("/cafe/delete")
		public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {

			service.deleteContent(num, request);

			return new ModelAndView("redirect:/cafe/list.do");
		}
		@RequestMapping("/cafe/private/updateform")
		public String updateForm(HttpServletRequest request) {

			service.getData(request);

			return "cafe/updateform";
		}
		//카페글 수정 요청 처리 
		@RequestMapping(value = "/cafe/update", method = RequestMethod.POST)
		public ModelAndView authUpdate(CafeDto dto, HttpServletRequest request) {
			service.updateContent(dto);
			return new ModelAndView("cafe/update");
		}
}