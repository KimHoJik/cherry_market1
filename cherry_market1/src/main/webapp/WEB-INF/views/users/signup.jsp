<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/signup.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
</head>
<body> 
<div class="container mypage-form animate__animated animate__fadeIn">
   <h1><strong>${param.id}</strong>회원님 체리마켓에 오신 것을 환영합니다.</h1>
   
   <div class="btn-list animate__animated animate__fadeIn">
      <a href="${pageContext.request.contextPath}/users/loginform.do">로그인 하러가기</a>
   </div>
</div>
</body>
</html>

