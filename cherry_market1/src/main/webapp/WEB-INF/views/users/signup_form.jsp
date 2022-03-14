<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>체리마켓에 오신 것을 환영합니다~</h1>
<form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm">
		<br />
		<div>
			<label class="control-label" for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id"/>
			<small class="form-text text-muted">아이디는 2~8글자까지 가능합니다. 영문은 4글자부터 가능하며, 특수문자는 사용할 수 없습니다.</small>
			<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
		</div>
		<br />
		<div>
			<label class="control-label" for="name">이름</label>
			<input class="form-control" type="text" id="name" name="name"/>
			<small class="form-text text-muted"></small>
		</div>
		<br />
		<div>
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd"/>
			<small class="form-text text-muted">비밀번호는 문자, 숫자, 특수문자를 최소 1회 이상 사용하여 6~20글자까지 사용 가능합니다.</small>
			<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		</div>
		<br />
		<div>
			<label class="control-label" for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" name="pwd2" id="pwd2"/>
		</div>
		<br />
		<div>
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="text" name="email" id="email"/>
			<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
		</div>
		<br />
		<div>
			<label class="control-label" for="profile">자기소개</label>
			<input class="form-control" type="text" id="profile" name="profile" placeholder="우리 같이 체리마켓에서 거래해요~^^"/>
			<small class="form-text text-muted">욕설 및 비속어, 광고, 선정적인 내용 등 불쾌한 표현은 제제 및 법적 조치를 진행하겠습니다.</small>
		</div>
		<br />
		<div>
			<label class="control-label" for="addr">주소</label>
			<input class="form-control" type="text" id="addr" name="addr"/>
			<small class="form-text text-muted">거주하시는 동네까지만 적어주세요. 원활한 거래에 도움이 됩니다~^^</small>
		<br />	
			<small class="form-text text-muted">예시) 서울특별시 송파구 가락동, 부산광역시 중구 남포동</small>
		</div>
		<br />
		<br />
		<button class="btn btn-primary" type="submit">가입</button>
	</form>
</div>
<script>
	
	let isIdValid=false;
	let isPwdValid=false;
	let isEmailValid=false;
	
	document.querySelector("#id").addEventListener("input", function(){
		
		document.querySelector("#id").classList.remove("is-valid");
		document.querySelector("#id").classList.remove("is-invalid");
		
		let inputId=this.value;
		//입력한 아이디를 검증할 정규 표현식
		const reg_id=/^[가-힣a-zA-Z0-9]{2,8}$/;
		if(!reg_id.test(inputId)){
			isIdValid=false; 
			document.querySelector("#id").classList.add("is-invalid");
			return;
		}
		
		ajaxPromise("${pageContext.request.contextPath}/users/checkid.do", "get", "inputId="+inputId)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			if(data.isExist){
				isIdValid=false;
				document.querySelector("#id").classList.add("is-invalid");
			}else{
				isIdValid=true;
				document.querySelector("#id").classList.add("is-valid");
			}
		});
	});
	
	//비밀 번호를 확인 하는 함수 
	function checkPwd(){
		document.querySelector("#pwd").classList.remove("is-valid");
		document.querySelector("#pwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#pwd").value;
		const pwd2=document.querySelector("#pwd2").value;
		
		// 비밀번호를 검증할 정규표현식
		const reg_pwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/;
		if(!reg_pwd.test(pwd)){
			isPwdValid=false;
			document.querySelector("#pwd").classList.add("is-invalid");
			return; 
		}
		
		if(pwd != pwd2){
			isPwdValid=false;
			document.querySelector("#pwd").classList.add("is-invalid");
		}else{
			isPwdValid=true;
			document.querySelector("#pwd").classList.add("is-valid");
		}
	}
	
	
	document.querySelector("#pwd").addEventListener("input", checkPwd);
	document.querySelector("#pwd2").addEventListener("input", checkPwd);
	

	document.querySelector("#email").addEventListener("input", function(){
		document.querySelector("#email").classList.remove("is-valid");
		document.querySelector("#email").classList.remove("is-invalid");
		
		//1. 입력한 이메일을 읽어와서
		const inputEmail=this.value;
		//2. 이메일을 검증할 정규 표현식 객체를 만들어서
		const reg_email=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//3. 정규표현식 매칭 여부에 따라 분기하기
		if(reg_email.test(inputEmail)){//만일 매칭된다면
			isEmailValid=true;
			document.querySelector("#email").classList.add("is-valid");
		}else{
			isEmailValid=false;
			document.querySelector("#email").classList.add("is-invalid");
		}
	});
	
	
	//폼에 submit 이벤트가 발생했을때 실행할 함수 등록
	document.querySelector("#myForm").addEventListener("submit", function(e){
		//console.log(e);
		/*
			입력한 아이디, 비밀번호, 이메일의 유효성 여부를 확인해서 하나라도 유효 하지 않으면
			e.preventDefault(); 
			가 수행 되도록 해서 폼의 제출을 막아야 한다. 
		*/
		//폼 전체의 유효성 여부 알아내기 
		let isFormValid = isIdValid && isPwdValid && isEmailValid;
		if(!isFormValid){//폼이 유효하지 않으면
			//폼 전송 막기 
			e.preventDefault();
		}	
	});
</script>
</body>
</html>