package com.acorn.cherryM1.goodsService;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.acorn.cherryM1.goodsDao.goodsDao;
import com.acorn.cherryM1.goodsDto.goodsDto;

@Repository
public class goodsServiceImpl implements goodsService{
	@Autowired
	private goodsDao dao;

	@Override
	public void goodsUpload(HttpServletRequest request, goodsDto dto) {
		dao.uploadGoods(dto, request);
	}
	
	
}
