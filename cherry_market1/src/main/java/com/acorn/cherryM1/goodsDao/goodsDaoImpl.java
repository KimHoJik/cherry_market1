package com.acorn.cherryM1.goodsDao;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.cherryM1.goodsDto.goodsDto;

@Repository
public class goodsDaoImpl implements goodsDao {
	
	@Autowired
	private SqlSession Session;
	@Override
	public void uploadGoods(goodsDto dto) {
		Session.insert("goodsBatis.uploadGoods",dto);
	}
	@Override
	public List<goodsDto> getGoodsList(goodsDto dto) {
		return Session.selectList("goodsBatis.getGoodsList", dto);
	}
	@Override
	public int getCount(goodsDto dto) {
		return Session.selectOne("goodsBatis.getCount", dto);
	}
	@Override
	public goodsDto getGoodsDetail(int num) {
		return Session.selectOne("goodsBatis.getGoodsDetail",num);
	}
	@Override
	public void deleteGoods(int num) {
		Session.delete("goodsBatis.deleteGoods",num);
		Session.delete("chatBatis.deletePerChatLog",num);
		Session.delete("chatBatis.deletePerChatList",num);
		Session.delete("goodsBatis.deleteWish",num);
			
	}
	@Override
	public void goodsSaled(int num) {
		Session.update("goodsBatis.goodsSaled",num);
		Session.delete("chatBatis.deletePerChatLog",num);
		Session.delete("chatBatis.deletePerChatList",num);
		Session.delete("goodsBatis.deleteWish",num);
	}
	@Override
	public void plusWish(goodsDto dto) {
		Session.update("goodsBatis.plusWish",dto);
	}
	@Override
	public List<Integer> getWishList(String id) {
		return Session.selectList("goodsBatis.getWishList", id);
	}
	@Override
	public List<goodsDto> getMyGoods(String id) {
		return Session.selectList("goodsBatis.getMyGoods",id);
	}
	
	
}
