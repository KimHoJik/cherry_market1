package com.acorn.cherryM1.goodsService;


import java.io.File;
import java.time.LocalDate;
import java.time.LocalTime;
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
	public String changeRegdate(String regdate) {
		String[] base=regdate.split(" ");
		LocalDate now = LocalDate.now();
		String date=base[0];
		String[] date_split=date.split("-");
		int reg_year=Integer.parseInt(date_split[0]);
		int now_year=now.getYear();
		if(reg_year<now_year) {
			return Integer.toString(now_year-reg_year)+"년전";
		}
		int reg_month=Integer.parseInt(date_split[1]);
		int now_month=now.getMonthValue();
		if(reg_month<now_month) {
			return Integer.toString(now_month-reg_month)+"달전";
		}
		int reg_day=Integer.parseInt(date_split[2]);
		int now_day=now.getDayOfMonth();
		if(reg_day<now_day) {
			return Integer.toString(now_day-reg_day)+"일전";
		}
		
		LocalTime now2=LocalTime.now();
		String time=base[1];
		String[] time_split=time.split(":");
		int reg_hour=Integer.parseInt(time_split[0]);
		int now_hour=now2.getHour();
		if(reg_hour<now_hour) {
			return Integer.toString(now_hour-reg_hour)+"시간전";
		}
		int reg_min=Integer.parseInt(time_split[1]);
		int now_min=now2.getMinute();
		if(reg_min<now_min) {
			return Integer.toString(now_min-reg_min)+"분전";
		}
		int reg_sec=Integer.parseInt(time_split[2]);
		int now_sec=now2.getSecond();
		return Integer.toString(now_sec-reg_sec)+"초전";
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
				String regdate=dto1.getRegdate();
				dto1.setRegdate(changeRegdate(regdate));
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
