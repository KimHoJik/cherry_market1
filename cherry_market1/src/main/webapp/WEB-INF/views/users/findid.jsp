<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/findid</title>
</head>
<body>
	<div class="container">
	<h1>알림</h1>
	<p> 
		${requestScope.dto.name }님의 아이디는 <strong>${requestScope.dto.id }</strong>입니다.
		<a href="${pageContext.request.contextPath}/users/loginform.do">로그인 하러 가기</a>
		
</div>


</body>
</html>