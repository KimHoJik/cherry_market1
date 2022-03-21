<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/findid_form</title>
</head>
<body>
<div class="container">
	<h1>아이디 찾기</h1>
	<form action="${pageContext.request.contextPath }/users/findid.do" method="post" id="findid" >
		<div>
			<label for="id">이름</label>
			<input type="text" name="name" id="name" placeholder="이름을 입력하세요"/>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" placeholder="이메일을 입력하세요"/>
		</div>
		<button type="submit">확인</button>
	</form>
</div>

</body>
</html>