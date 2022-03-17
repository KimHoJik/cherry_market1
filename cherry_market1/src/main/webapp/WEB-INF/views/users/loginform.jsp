<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/loginform.jsp</title>
<!-- <link rel="stylesheet" href="/users/login.css" /> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
		<header>
			<div class="sel-lang-wrap">
			</div>
			<div class="logo-wrap animate__animated animate__rubberBand">
				<img src="${pageContext.request.contextPath}/resources/image/CherryMain.png">
			</div>
		</header>
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="아이디" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="비밀번호" type="password"></input>
			</div>
			<div class="login-button-wrap">
				<button>로그인</button>
			</div>
			<div class="login-button-wrap">
				<button id="join">회원가입</button>
			</div>
		<script>
			document.querySelector("#join").addEventListener("click",function(){
				location.href="signup_form";
			})
		</script>
		</section>
		<footer>
			<div class="copyright-wrap animate__animated animate__rubberBand">
			<span>	<img src="${pageContext.request.contextPath}/resources/image/CherryMain.png"> 와썹 ~ 체리마켓! </span>
			</div>
		</footer>
		</div>
	</div>
</body>
</html>