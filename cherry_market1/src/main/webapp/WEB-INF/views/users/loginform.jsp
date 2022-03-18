<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/loginform.jsp</title>
<link rel="stylesheet" href="/users/login.css" />
</head>
<body>
	<div class="container">
	<h1>로그인 폼 입니다.</h1>
	<form action="login.do" method="post">
		<c:choose>
			<c:when test="${ empty param.url }">
				<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="url" value="${param.url }"/>
			</c:otherwise>
		</c:choose>
		<div class="login">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" placeholder="아이디"/>
		</div>
		<div class="login">
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호"/>
		</div>
		<button class="btn" type="submit" >로그인</button>
	</form>
	<button id="join">회원가입</button>
	<script>
		document.querySelector("#join").addEventListener("click",function(){
			location.href="signup_form.do";
		})
	</script>
	<p>
	<a href="${pageContext.request.contextPath}/users/findid_form.do">아이디</a> 가 생각나지 않으시나요?</p>
</div>	
</body>
</html>