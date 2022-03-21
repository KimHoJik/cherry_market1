package com.acorn.cherryM1.goodsService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.goodsDto.goodsDto;

public interface goodsService {
	public void goodsUpload(HttpServletRequest request,goodsDto dto);
	public void getGoodsList(HttpServletRequest request);
	public void getGoodsDetail(ModelAndView mView,int num);
	public void deleteGoods(int num);
	public void goodsSaled(int num);
}
