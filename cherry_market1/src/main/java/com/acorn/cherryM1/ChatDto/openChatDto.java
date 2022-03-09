package com.acorn.cherryM1.ChatDto;

public class openChatDto {
	private String id;
	private long ocregdate;
	private String occomment;
	
	public openChatDto(){}
	
	public openChatDto(String id, long ocregdate, String occomment) {
		super();
		this.id = id;
		this.ocregdate = ocregdate;
		this.occomment = occomment;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getOcregdate() {
		return ocregdate;
	}
	public void setOcregdate(long ocregdate) {
		this.ocregdate = ocregdate;
	}
	public String getOccomment() {
		return occomment;
	}
	public void setOccomment(String occomment) {
		this.occomment = occomment;
	}
	
	
}
