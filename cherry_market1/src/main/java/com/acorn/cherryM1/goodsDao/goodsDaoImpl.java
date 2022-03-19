package com.acorn.cherryM1.goodsDao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.cherryM1.goodsDto.goodsDto;
import com.google.gson.Gson;

@Repository
public class goodsDaoImpl implements goodsDao {
	
	@Autowired
	private SqlSession Session;
	@Override
	public void uploadGoods(goodsDto dto,HttpServletRequest request) {
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
			String path="/upload"+saveFileName;
			imagePaths.add(path);
		}
		String imagePath=new Gson().toJson(imagePaths);
		dto.setImagePath(imagePath);
		Session.insert("goodsBatis.uploadGoods",dto);
	}
	@Override
	public List<goodsDto> getGoodsList(HttpServletRequest request) {
		goodsDto dto=new goodsDto();
		int pageNum;
		if (request.getAttribute("pageNum")==null) {
			pageNum=1;
		}else {
			pageNum=Integer.parseInt((String) request.getAttribute("pageNum"));
		}
		dto.setStartRowNum((pageNum-1)*6+1);
		dto.setEndRowNum(pageNum*6);
		if (request.getAttribute("category")!=null) {
			dto.setCategory((String)request.getAttribute("category"));
		}
		if(request.getAttribute("search")==null) {
			dto.setSearch((String)request.getAttribute("search"));
		}
		List<goodsDto> list=Session.selectList("goodsBatis.getGoodsList", dto);
		return list;
	}

	
	
	
}
