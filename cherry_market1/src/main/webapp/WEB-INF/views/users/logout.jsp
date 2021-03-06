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
<title>users/loginout.jsp</title>
<!-- css 라인 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
	<div>
	 	<script>
			Swal.fire({
			  title: 'LOGOUT!',
			  text: "로그아웃되었습니다",
			  icon: 'warning',
			  showCancelButton: false,
			  confirmButtonColor: '#4476EB',
			  confirmButtonText: '홈으로 돌아가기'
			}).then((result) => {
			  if (result.isConfirmed) {
			    location = "${pageContext.request.contextPath}/home.do"
			  }
			})     
		</script>
	</div>
</body>
</html>