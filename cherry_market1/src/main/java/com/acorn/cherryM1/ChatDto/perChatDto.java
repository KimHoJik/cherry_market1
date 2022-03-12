package com.acorn.cherryM1.ChatDto;

public class perChatDto {
	private int num;
	private String saller;
	private String buyer;
	private String talker;
	private String pccomment;
	private long regdate;
	
	public perChatDto() {}

	public perChatDto(int num, String saller, String buyer, String talker, String pccomment, long regdate) {
		super();
		this.num = num;
		this.saller = saller;
		this.buyer = buyer;
		this.talker = talker;
		this.pccomment = pccomment;
		this.regdate = regdate;
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

	public String getTalker() {
		return talker;
	}

	public void setTalker(String talker) {
		this.talker = talker;
	}

	public String getpccomment() {
		return pccomment;
	}

	public void setpccomment(String pccomment) {
		this.pccomment = pccomment;
	}

	public long getRegdate() {
		return regdate;
	}

	public void setRegdate(long regdate) {
		this.regdate = regdate;
	}
	
	
}
