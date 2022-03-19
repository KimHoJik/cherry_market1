package com.acorn.cherryM1.goodsService;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.goodsDao.goodsDao;
import com.acorn.cherryM1.goodsDto.goodsDto;
import com.google.gson.Gson;


@Repository
public class goodsServiceImpl implements goodsService{
	@Autowired
	private goodsDao dao;

	@Override
	public void goodsUpload(HttpServletRequest request, goodsDto dto) {
		List<MultipartFile> images=dto.getImages();
		List<String> imagePaths=new ArrayList<String>();
		
		for(MultipartFile image :images) {
			String orgFileName=image.getOriginalFilename();
			String realPath=request.getServletContext().getRealPath("/upload");
			String filePath=realPath+File.separator;
			File upload=new File(filePath);
			if(!upload.exists()) {
				upload.mkdir();
			}
			String saveFileName= System.currentTimeMillis()+orgFileName;
			try {
				image.transferTo(new File(filePath+saveFileName));
			}catch (Exception e) {
				e.printStackTrace();
			}
			String path="/upload/"+saveFileName;
			imagePaths.add(path);
		}
		String imagePath=new Gson().toJson(imagePaths);
		dto.setImagePath(imagePath);
		System.out.println(imagePath);
		dao.uploadGoods(dto);
	}

	@Override
	public void getGoodsList(HttpServletRequest request) {
		goodsDto dto=new goodsDto();
		int pageNum;
		if (request.getAttribute("pageNum")==null) {
			pageNum=1;
		}else {
			pageNum=Integer.parseInt((String) request.getAttribute("pageNum"));
		}
		dto.setStartRowNum((pageNum-1)*8+1);
		dto.setEndRowNum(pageNum*8);
		if (request.getAttribute("category")!=null) {
			dto.setCategory((String)request.getAttribute("category"));
		}
		if(request.getAttribute("search")==null) {
			dto.setSearch((String)request.getAttribute("search"));
		}
		List<goodsDto> list=dao.getGoodsList(dto);
		for(goodsDto dto1:list) {
			String jsonImages=dto1.getImagePath();
			List<String> ImageList=new Gson().fromJson(jsonImages, List.class);
			dto1.setImagePath(ImageList.get(0));
		}
		int totalRow=dao.getCount(dto);
		int startPageNum=((pageNum-1)/5)*5+1;
		int totalPageCount=((totalRow-1)/8)*8+1;
		int endPageNum=Math.min(startPageNum+4,totalPageCount);
		
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);	
		request.setAttribute("endPageNum", endPageNum);	
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount",totalPageCount);
		
	}

	@Override
	public void getGoodsDetail(ModelAndView mView,int num) {
		goodsDto dto=dao.getGoodsDetail(num);
		String jsonImages=dto.getImagePath();
		List<String> ImageList=new Gson().fromJson(jsonImages, List.class);
		mView.addObject("dto", dto);
		mView.addObject("imageList", ImageList);
	}

	@Override
	public void deleteGoods(int num) {
		dao.deleteGoods(num);
		
	}
	
	
}
