<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css 관련 추가 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>users/loginform.jsp</title>
<!-- css 라인 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />
</head>
<body>
<div class="login-form">
    <form action="login.do" method="post">
    <c:choose>
			<c:when test="${ empty param.url }">
				<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="url" value="${param.url }"/>
			</c:otherwise>
	</c:choose>
		<div class="avatar">
			<img src="${pageContext.request.contextPath }/resources/images/cherry.png">
		</div>
        <h2 class="text-center">CherryMarket</h2>   
        <div class="login">
        	<input type="text" class="form-control" name="id" id="id" placeholder="id를 입력하세요..">
        </div>
		<div class="login">
            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요..">
        </div>        
        <div class="login">
            <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
        </div>
		
    </form>
    <p class="text-center small">CherryMarket 회원이 아니신가요? <a href="signup_form.do">회원가입하러 가기</a></p>
	
</div>
</body>
</html>