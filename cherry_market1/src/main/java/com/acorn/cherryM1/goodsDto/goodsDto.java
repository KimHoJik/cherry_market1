package com.acorn.cherryM1.goodsDto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class goodsDto {
	private int num;
	private String id;
	private	int price;
	private String title;
	private int isSaled;
	private String category;
	private int viewCount;
	private String imagePath;
	private List<String> imagePaths;
	private List<MultipartFile> images;
	private String explain;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private String search;
	private String priceWon;
	private int isWish;
	public goodsDto() {}
	public goodsDto(int num, String id, int price, String title, int isSaled, String category, int viewCount,
			String imagePath, List<String> imagePaths, List<MultipartFile> images, String explain, String regdate,
			int startRowNum, int endRowNum, String search, String priceWon, int isWish) {
		super();
		this.num = num;
		this.id = id;
		this.price = price;
		this.title = title;
		this.isSaled = isSaled;
		this.category = category;
		this.viewCount = viewCount;
		this.imagePath = imagePath;
		this.imagePaths = imagePaths;
		this.images = images;
		this.explain = explain;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.search = search;
		this.priceWon = priceWon;
		this.isWish = isWish;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public List<String> getImagePaths() {
		return imagePaths;
	}
	public void setImagePaths(List<String> imagePaths) {
		this.imagePaths = imagePaths;
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
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getPriceWon() {
		return priceWon;
	}
	public void setPriceWon(String priceWon) {
		this.priceWon = priceWon;
	}
	public int getIsWish() {
		return isWish;
	}
	public void setWish(int isWish) {
		this.isWish = isWish;
	}
	
	
	
	
	
	
	
}
