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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />
</head>
<body>
<div class="login-form">
    <form action="login.do" method="post" id="myForm2">
    <c:choose>
			<c:when test="${ empty param.url }">
				<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="url" value="${param.url }"/>
			</c:otherwise>
	</c:choose>
		<div class="avatar animate__animated animate__fadeIn">
			<img src="${pageContext.request.contextPath }/resources/images/cherry.png">
		</div>
        <h2 class="text-center">CherryMarket</h2>   
        <div class="login animate__animated animate__fadeIn">
        	<input type="text" class="form-control" name="id" id="id" placeholder="ID를 입력하세요..">
        </div>
		<div class="login animate__animated animate__fadeIn">
            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요..">
        </div>        
        <div class="login">
            <button id="submitBtn2" type="submit" class="btn btn-primary btn-lg btn-block animate__animated animate__backInLeft">Sign in</button>
        </div>
		
    </form>
    <p class="text-center small">CherryMarket 회원이 아니신가요? <a href="signup_form.do">회원가입하러 가기</a></p>
	
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
		// 전송 CSS
		document.querySelector("#submitBtn2").addEventListener("click", function(e){
			//폼 전송이 되지 않도록 기본 동작을 막아준다.
			e.preventDefault();
			
			const id = document.querySelector("#id").value;
			const pwd = document.querySelector("#pwd").value;
		
			
			let data = {
					id : id,
					pwd : pwd
				};
			fetch("${pageContext.request.contextPath}/users/login.do", {
				method : "POST",
				headers: {
					"Content-Type" : "application/json"
				},
				body : JSON.stringify(data)
			}).then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				
				if (data == true) {
					document.querySelector("#submitBtn2").classList.add("animate__backOutRight");
					document.querySelector("#submitBtn2").addEventListener("animationend", function(){
						location.href = "${pageContext.request.contextPath}/home.do";
					});
				} else {
					document.querySelector("#submitBtn2").classList.add("animate__fadeOut");
					document.querySelector("#submitBtn2").addEventListener("animationend", function(){
						document.querySelector("#submitBtn2").classList.remove("animate__fadeOut");
					});
				}
			});	
			

		});
		
</script>
</body>
</html>