package com.acorn.cherryM1.goodsDao;

import java.util.List;



import com.acorn.cherryM1.goodsDto.goodsDto;

public interface goodsDao{
	public void uploadGoods(goodsDto dto);
	public List<goodsDto> getGoodsList(goodsDto dto);
	public int getCount(goodsDto dto);
	public goodsDto	getGoodsDetail(int num);
	public void deleteGoods(int num);
	public void goodsSaled(int num);
	public void plusWish(goodsDto dto);
	public List<Integer> getWishList(String id);
	public List<goodsDto> getMyGoods(String id);
}
