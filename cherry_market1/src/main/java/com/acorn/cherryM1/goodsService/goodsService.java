package com.acorn.cherryM1.goodsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.goodsDto.goodsDto;

public interface goodsService {
	public void goodsUpload(HttpServletRequest request,goodsDto dto);
	public void getGoodsList(HttpServletRequest request,HttpSession session);
	public void deleteGoods(int num);
	public void goodsSaled(int num);
	public void plusWish(int num,HttpSession session);
	public void getMyList(HttpSession session,HttpServletRequest request);
	public void minusWish(int num,HttpSession session);
}
