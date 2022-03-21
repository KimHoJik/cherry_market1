package com.acorn.cherryM1.users.dto;

public class LoginRequestDto {

   private String id;
   
   private String pwd;

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public LoginRequestDto() {
   }
   
   public LoginRequestDto(String id, String pwd) {
      super();
      this.id = id;
      this.pwd = pwd;
   }

   @Override
   public String toString() {
      return "LoginRequestDto [id=" + id + ", pwd=" + pwd + "]";
   }
   
}
