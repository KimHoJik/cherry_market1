package com.acorn.cherryM1.goodsDto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class goodsDto {
	private int num;
	private	int price;
	private String pp;
	private String title;
	private int isSaled;
	private String category;
	private int viewCount;
	private String imagePath;
	private List<MultipartFile> images;
	private String explain;
	private String regdate;
	
	public goodsDto() {}
	
	
	public goodsDto(int num, int price, String pp, String title, int isSaled, String category, int viewCount,
			String imagePath, List<MultipartFile> images, String explain, String regdate) {
		super();
		this.num = num;
		this.price = price;
		this.pp = pp;
		this.title = title;
		this.isSaled = isSaled;
		this.category = category;
		this.viewCount = viewCount;
		this.imagePath = imagePath;
		this.images = images;
		this.explain = explain;
		this.regdate = regdate;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPp() {
		return pp;
	}

	public void setPp(String pp) {
		this.pp = pp;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getIsSaled() {
		return isSaled;
	}

	public void setIsSaled(int isSaled) {
		this.isSaled = isSaled;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public List<MultipartFile> getImages() {
		return images;
	}

	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
