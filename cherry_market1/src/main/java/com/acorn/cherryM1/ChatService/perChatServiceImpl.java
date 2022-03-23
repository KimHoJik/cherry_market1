package com.acorn.cherryM1.ChatService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.cherryM1.ChatDao.perChatDao;
import com.acorn.cherryM1.ChatDto.perChatDto;
import com.acorn.cherryM1.ChatDto.perChatListDto;
import com.acorn.cherryM1.goodsDao.goodsDao;
import com.acorn.cherryM1.goodsDto.goodsDto;

@Repository
public class perChatServiceImpl implements perChatService{
	
	@Autowired
	private perChatDao dao;
	
	@Autowired
	private goodsDao goodsDao;
	
	@Override
	public void getPerChatList(ModelAndView mView,String id) {
		List<perChatListDto> list=dao.getPerChatList(id);
		for (perChatListDto dto:list) {
			int num=dto.getNum();
			goodsDto gDto=goodsDao.getGoodsDetail(num);
			String title=gDto.getTitle();
			if (title.length()>9) {
				title=title.substring(0,8)+"...";
			}
			dto.setTitle(title);
			int price=gDto.getPrice();
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
			dto.setPriceWon(priceWon);
		}
		mView.addObject("list",list);
	}

	@Override
	public void getPerChatLog(ModelAndView mView, perChatDto dto) {
		List<perChatDto> list=dao.getPerChatLog(dto);
		for(perChatDto temp:list) {
			long regdate=temp.getRegdate();
			int hour=(int) ((regdate%1000000000)/10000000)%12;
			if (hour==0) {
				hour=12;
			}
			int min=(int) (regdate%10000000)/100000;
			String mm=Integer.toString(min);
			if(min<10) {
				mm="0"+mm;
			}
			String stregdate=Integer.toString(hour)+":"+mm;
			temp.setStregdate(stregdate);
		}
		mView.addObject("list",list);
	}

	@Override
	public void uploadPerChatLog(perChatDto dto) {
		dao.uploadPerChatLog(dto);		
	}
	
}
