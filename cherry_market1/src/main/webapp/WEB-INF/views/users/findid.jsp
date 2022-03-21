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
<title>/users/findid</title>
<!-- css 라인 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
<div class="container">
	<script>
			Swal.fire({
				icon: 'question', 
				title: '${requestScope.dto.name }님의 아이디는 </br> <strong>${requestScope.dto.id }</strong>입니다',
				showCancelButton: false,
				confirmButtonColor: '#fc9091',
				confirmButtonText: '로그인하러 가기'
				}).then((result) => {
				  if (result.isConfirmed) {
				    location = "${pageContext.request.contextPath}/users/loginform.do"
				  }
				})
	
	</script>	
</div>

</body>
</html>
