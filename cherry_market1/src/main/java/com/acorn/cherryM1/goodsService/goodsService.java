package com.acorn.cherryM1.goodsService;

import javax.servlet.http.HttpServletRequest;

import com.acorn.cherryM1.goodsDto.goodsDto;

public interface goodsService {
	public void goodsUpload(HttpServletRequest request,goodsDto dto);
}
