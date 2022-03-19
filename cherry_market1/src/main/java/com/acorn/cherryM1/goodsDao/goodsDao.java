package com.acorn.cherryM1.goodsDao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import com.acorn.cherryM1.goodsDto.goodsDto;

public interface goodsDao{
	public void uploadGoods(goodsDto dto,HttpServletRequest request);
	public List<goodsDto> getGoodsList(HttpServletRequest request);
}
