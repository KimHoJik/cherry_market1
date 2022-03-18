package com.acorn.cherryM1.goodsController;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("goodsUpload")
	public String goodsUpload(HttpServletRequest request,goodsDto dto) {
		Service.goodsUpload(request, dto);
		return "home";
	}
}	
