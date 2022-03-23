package com.acorn.cherryM1.goodsService;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	public String changeWon(int price) {
		String priceWon="원";
		int c=0;
		while (price!=0) {
			priceWon+=price%10;
			price/=10; c+=1;
			if(c==3) {c=0;priceWon+=",";}
		}
		if(priceWon.charAt(priceWon.length()-1)==',') {
			priceWon=priceWon.substring(0,priceWon.length()-1);
		}
		priceWon=new StringBuffer(priceWon).reverse().toString();
		return priceWon;
	}
	@Override
	public void goodsUpload(HttpServletRequest request, goodsDto dto) {
		List<MultipartFile> images=dto.getImages();
		List<String> imagePaths=new ArrayList<String>();
		for(MultipartFile image :images) {
			String orgFileName=image.getOriginalFilename();
			if (orgFileName.equals("")) {
				imagePaths.add("None");
			}else {
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
		}
		String imagePath=new Gson().toJson(imagePaths);
		dto.setImagePath(imagePath);
		dao.uploadGoods(dto);
	}

	@Override
	public void getGoodsList(HttpServletRequest request,HttpSession session) {
		goodsDto dto=new goodsDto();
		if (request.getParameter("category")==null) {
			dto.setCategory("전체");
		}
		int pageNum=1;
		try {
			pageNum=Integer.parseInt((String) request.getParameter("pageNum"));
		}catch (Exception e) {
			
		}finally {
			dto.setStartRowNum((pageNum-1)*8+1);
			dto.setEndRowNum(pageNum*8);
			if (request.getParameter("category")!=null) {
				dto.setCategory((String)request.getParameter("category"));
			}
			if(request.getParameter("search")!=null) {
				dto.setSearch((String)request.getParameter("search"));
			}
			List<goodsDto> list=dao.getGoodsList(dto);
			for(goodsDto dto1:list) {
				String jsonImages=dto1.getImagePath();
				List<String> ImageList=new Gson().fromJson(jsonImages, List.class);
				dto1.setImagePath(ImageList.get(0));
				dto1.setImagePaths(ImageList);
				int price=dto1.getPrice();
				String priceWon=changeWon(price);
				dto1.setPriceWon(priceWon);
				if(session.getAttribute("id")==null) {
					dto1.setWish(0);
				}else {
					String id =(String) session.getAttribute("id");
					int num=dto1.getNum();
					dto1.setWish(dao.isWish(num, id));
				}
			}
			int totalRow=dao.getCount(dto);
			int startPageNum=((pageNum-1)/5)*5+1;
			int totalPageCount=((totalRow-1)/8)+1;
			int endPageNum=Math.min(startPageNum+4,totalPageCount);
			request.setAttribute("list", list);
			request.setAttribute("startPageNum", startPageNum);	
			request.setAttribute("endPageNum", endPageNum);	
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("totalPageCount",totalPageCount);
		}
	}

	@Override
	public void deleteGoods(int num) {
		dao.deleteGoods(num);
	}

	@Override
	public void goodsSaled(int num) {
		dao.goodsSaled(num);
		
	}

	@Override
	public void plusWish(int num, HttpSession session) {
		goodsDto dto=new goodsDto();
		dto.setId((String) session.getAttribute("id"));
		dto.setNum(num);
		dao.plusWish(dto);
	}

	@Override
	public void getMyList(HttpSession session, HttpServletRequest request) {
		String id=(String) session.getAttribute("id");
		List<Integer> wishNums=dao.getWishList(id);
		List<goodsDto> wishList=new ArrayList<goodsDto>();
		for(int i:wishNums) {
			goodsDto dto=dao.getGoodsDetail(i);
			String jsonImages=dto.getImagePath();
			List<String> ImageList=new Gson().fromJson(jsonImages, List.class);
			dto.setImagePath(ImageList.get(0));
			int price=dto.getPrice();
			String priceWon=changeWon(price);
			dto.setPriceWon(priceWon);
			wishList.add(dto);
		}
		request.setAttribute("wishList", wishList);
		List<goodsDto> myGoods=dao.getMyGoods(id);
		for(goodsDto dto1:myGoods) {
			String jsonImages=dto1.getImagePath();
			List<String> ImageList=new Gson().fromJson(jsonImages, List.class);
			dto1.setImagePath(ImageList.get(0));
			dto1.setImagePaths(ImageList);
			int price=dto1.getPrice();
			String priceWon=changeWon(price);
			dto1.setPriceWon(priceWon);
		}
		request.setAttribute("myGoods", myGoods);
	}
	@Override
	public void minusWish(int num, HttpSession session) {
		goodsDto dto=new goodsDto();
		dto.setId((String) session.getAttribute("id"));
		dto.setNum(num);
		dao.minusWish(dto);
		
	}
	
	
}
