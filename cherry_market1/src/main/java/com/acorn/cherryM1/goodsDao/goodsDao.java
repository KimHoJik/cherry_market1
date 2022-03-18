package com.acorn.cherryM1.goodsDao;

import javax.servlet.http.HttpServletRequest;


import com.acorn.cherryM1.goodsDto.goodsDto;

public interface goodsDao{
	public void uploadGoods(goodsDto dto,HttpServletRequest request);
}
