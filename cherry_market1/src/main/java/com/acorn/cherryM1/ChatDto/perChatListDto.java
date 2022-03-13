package com.acorn.cherryM1.ChatDto;

public class perChatListDto {
	private int num;
	private String saller;
	private String buyer;
	private String lastcomment;
	private long lastregdate;
	
	public perChatListDto () {}
	
	
	public perChatListDto(int num, String saller, String buyer, String lastcomment, long lastregdate) {
		super();
		this.num = num;
		this.saller = saller;
		this.buyer = buyer;
		this.lastcomment = lastcomment;
		this.lastregdate = lastregdate;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSaller() {
		return saller;
	}

	public void setSaller(String saller) {
		this.saller = saller;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getLastcomment() {
		return lastcomment;
	}

	public void setLastcomment(String lastcomment) {
		this.lastcomment = lastcomment;
	}

	public long getLastregdate() {
		return lastregdate;
	}

	public void setLastregdate(long lastregdate) {
		this.lastregdate = lastregdate;
	}
	
	
	
}
