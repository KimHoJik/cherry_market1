<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/mypage.jsp</title>
<style>
   *{
   margin:0;
   padding:0;
}

.container{
   height:100vh;
   display:flex;
   flex-direction:column;
   align-items:center;
   justify-content:center;
   padding-top:50px;
   background:#fc9091;
   color:#fff;
   
}
.mypage-form{
   height:100vh;
   display:flex;
   flex-direction:column;
   align-items:center;
   justify-content:center;
   padding-top:50px;
   background:#fc9091;
   color:#fff;
   
}
.mypage-form h1{
   color:#fff;
   margin-bottom:80px;
}

.mypage-cont{
   width:500px;
   font-size: 13px;
    background: #ececec;
    box-shadow: 0px 2px 2px rgb(0 0 0 / 30%);
    color: #7a7a7a;
    border-radius: 2px;
    margin-bottom: 15px;
    padding:30px;
    padding-top:80px;
    box-sizing:border-box;
    position:relative;
}

.mypage-cont .avatar {
    position: absolute;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: -50px;
    width: 70px;
    height: 70px;
    border-radius: 50%;
    z-index: 9;
    background: antiquewhite;
    padding: 15px;
    box-shadow: 0px 2px 2px rgb(0 0 0 / 10%);
	overflow:hidden;
}

.mypage-cont .avatar img{
   width:100%;
   height:100%;
   border-radius:50%;
}

.animate__fadeIn {
    -webkit-animation-name: fadeIn;
    animation-name: fadeIn;
}

.animate__animated {
    -webkit-animation-duration: 1s;
    animation-duration: 1s;
    -webkit-animation-duration: var(--animate-duration);
    animation-duration: var(--animate-duration);
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
}

.input-cont{
   margin-bottom:20px;
   display:flex;
   justufy-content:center;
}

.input-cont label{
   width:80px;
   marign-right:10px;
   vertical-align:middle;
   padding-top:8px;
   font-size:14px;
}

.input-cont input{
   flex:1;
   height:40px;
   border:1px solid #ddd;
   border-radius:2px;
   padding:5px;
   box-sizing:border-box;
   
}
.input-cont div.txt{
   flex:1;
   height:40px;
   padding:5px;
   box-sizing:border-box;
   
}

.btn-list{
    text-align:center;
    margin:20px 0;
    
}
.btn-list a{
   display:inline-block;
   padding:10px 8px;
   min-width:150px;
   height:40px;
   box-sizing:border-box;
   border-radius:25px;
   text-align:center;
   background:#666;
   color:#fff;
   text-decoration:none;
   
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css"/>
</head>
<body>
<div class="mypage-form">
   <h1>My Page</h1>
   
   <div class="mypage-cont">
      <div class="avatar">
         <c:choose>
            <c:when test="${empty usersDto.profile }">
               <img src="${pageContext.request.contextPath }/resources/images/cherry.png">
            </c:when>
            <c:otherwise>
               <img src="${pageContext.request.contextPath }${usersDto.profile}" alt="" />
            </c:otherwise>
         </c:choose>
         
      </div>
      
      <div class="input-cont">
          <label for="id">아이디</label>
          <div class="txt">${usersDto.id }</div>
      </div>
      <div class="input-cont">
          <label for="email">이메일</label>
          <div>
             <input type="text" value="${usersDto.email }"/>
          </div>
      </div>
      
   <form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="myForm">
      <div class="input-cont">
         <label for="pwd">기존 비밀 번호</label>
         <input type="password" name="pwd" id="pwd" style="width:50px;"/>
      </div>
      <div class="input-cont">
         <label for="newPwd">새 비밀번호</label>
         <input type="password" name="newPwd" id="newPwd" style="width:50px;"/>
      </div>
      <div class="input-cont">
         <label for="newPwd2">새 비밀번호 확인</label>
         <input type="password" id="newPwd2" style="width:50px;"/>
      </div>
      <button type="submit">수정하기</button>
      <button type="reset">리셋</button>
   </form>
      
      
   </div>
   
   <div class="btn-list">
      <a href="${pageContext.request.contextPath}/users/updateform.do">개인정보 수정</a>
      <a href="javascript:deleteConfirm()">탈퇴</a>
   </div>
   
</div>
<!-- <div class="mypage-form">
   <h1>마이페이지입니다.</h1>
   <table>
      <tr>
         <th>아이디</th>
         <td>${id}</td>
      </tr>
      <tr>
         <th>프로필 이미지</th>
         <td>
         <c:choose>
            <c:when test="${empty dto.profile }">
               <svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                 <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                 <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
               </svg>
            </c:when>
            <c:otherwise>
               <img id="profileImage" 
                  src="${pageContext.request.contextPath}${dto.profile}"/>
            </c:otherwise>
         </c:choose>
         </td>
      </tr>
      <tr>
         <th>비밀번호</th>
         <td><a href="${pageContext.request.contextPath}/users/pwd_updateform.do">수정하기</a></td>
      </tr>
      <tr>
         <th>이메일</th>
         <td>${dto.email}</td>
      </tr>
      <tr>
         <th>가입일</th>
         <td>${dto.regdate}</td>
      </tr>
   </table>
   <a href="${pageContext.request.contextPath}/users/updateform.do">개인정보 수정</a>
   <a href="javascript:deleteConfirm()">탈퇴</a>
</div> -->
<script>
   function deleteConfirm(){
      const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
      if(isDelete){
         location.href="${pageContext.request.contextPath}/users/delete.do";
      }
   }
   
   //폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
   document.querySelector("#myForm").addEventListener("submit", function(e){
      let pwd1=document.querySelector("#newPwd").value;
      let pwd2=document.querySelector("#newPwd2").value;
      //새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
      if(pwd1 != pwd2){
         alert("비밀번호를 확인 하세요!");
         e.preventDefault();//폼 전송 막기 
      }
   });

</script>
</body>
</html>
