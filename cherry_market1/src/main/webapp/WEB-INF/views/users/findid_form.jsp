<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>/views/users/findid_form.jsp</title>
<!-- css 라인 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />
<style>
	.findid-form {
		width: 350px;
		margin: 0 auto;
		padding: 100px 0 300px;		
	}
	.findid-form form {
		color: #7a7a7a;
		border-radius: 2px;
    	margin-bottom: 15px;
        font-size: 13px;
        background: #ececec;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;	
        position: relative;	
    }
	.findid-form h2 {
		font-size: 22px;
        margin: 35px 0 25px;
        color: inherit;
        text-align: center;
        font-weight: bold;
    }
    .findid-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #70c5c0;
		border: none;
		margin-bottom: 20px;
	}    
	.findid{
		font-size: 15px;
        font-weight: bold;
		margin-bottom: 5px;
	}
</style>
</head>
<body>
<div class="findid-form">
	<h2>아이디 찾기</h2>
	<form action="${pageContext.request.contextPath }/users/findid.do" method="post" id="findid" >
		<div class="findid">
        	<label for="name">이름</label>
			<input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요"/>
		</div>
		<div class="findid">
            <label for="email">이메일</label>
			<input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요"/>
		</div>
		<button type="submit" class="btn btn-primary btn-lg btn-block"> 확인 </button>
	</form>
</div>

</body>
</html>