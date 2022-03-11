package com.acorn.cherryM1.users.dto;

public class UsersDto {
    private Number num;
    private String id;
    private String name;
    private String pwd;
    private String email;
    private String profile;
    private String addr;
    private String regdate;
 
    public UsersDto(){} 
 
    public UsersDto(Number num, String id, String name, String pwd, String email, String profile, String addr,
    		String regdate) {
        super();
        this.num = num;
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.email = email;
        this.profile = profile;
        this.addr = addr;
        this.regdate = regdate;
    }

    public Number getNum() {
        return num;
    }

    public void setNum(Number num) {
        this.num = num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
   
}   



