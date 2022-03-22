package com.acorn.cherryM1.goodsController;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.goodsDto.goodsDto;
import com.acorn.cherryM1.goodsService.goodsService;

@Controller
public class goodsController {
	
	@Autowired
	private goodsService Service;
	
	@RequestMapping("/private/goodsUploadForm")
	public String uploadGoods() {
		return "goods/goodsUploadForm";
	}
	
	@RequestMapping("/goodsUpload")
	public String goodsUpload(HttpServletRequest request,goodsDto dto,HttpSession session) {
		dto.setId((String) session.getAttribute("id"));
		Service.goodsUpload(request, dto);
		return "redirect:home.do";
	}
	@RequestMapping("/goodsDetail")
	public ModelAndView goodsDetail(ModelAndView mView,@RequestParam int num) {
		Service.getGoodsDetail(mView,num);
		mView.setViewName("goods/goodsDetail");
		return mView;
	}
	@RequestMapping("/delete")
	public String deleteGoods(@RequestParam int num) {
		Service.deleteGoods(num);
		return "redirect:home.do";
	}
	
	@RequestMapping("/sell")
	public String sellGoods(@RequestParam int num) {
		Service.goodsSaled(num);
		return "redirect:home.do";
	}
	@RequestMapping("/pluswish")
	public String plusWish(HttpSession session,@RequestParam int num) {
		Service.plusWish(num, session);
		return "chat/null";
	}
}	
