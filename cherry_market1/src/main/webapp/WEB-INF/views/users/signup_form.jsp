<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
</head>
<body>
<div class="container">
	<h1>체리마켓에 오신 것을 환영합니다~</h1>
	<form v-on:submit="onSubmit" action="signup.jsp" method="post" id="myForm">
		<br />
		<div>
			<label class="control-label" for="id">아이디</label>
			<input v-on:input="onIdInput" 
				   v-model="id"
				   v-bind:class="{'is-valid':isIdValid,'is-invalid':!isIdValid && isIdDirty}" 
				   class="form-control" type="text" name="id" id="id"/>
			<small class="form-text text-muted">아이디는 2~8글자까지 가능합니다. 영문은 4글자부터 가능하며, 특수문자는 사용할 수 없습니다.</small>
			<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
		</div>
		<br />
		<div>
			<label class="control-label" for="name">이름</label>
			<input type="text" id="name" name="name"/>
			<small class="form-text text-muted"></small>
		</div>
		<br />
		<div>
			<label class="control-label" for="pwd">비밀번호</label>
			<input v-model="pwd"
				   v-bind:class="{'is-valid':isPwdValid,'is-invalid':!isPwdValid && isPwdDirty}"
				   v-on:input="checkPwd"
				class="form-control" type="password" name="pwd" id="pwd"/>
			<small class="form-text text-muted">비밀번호는 문자, 숫자, 특수문자를 최소 1회 이상 사용하여 6~20글자까지 사용 가능합니다.</small>
			<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		</div>
		<br />
		<div>
			<label class="control-label" for="pwd2">비밀번호 확인</label>
			<input v-model="pwd2"
			       v-on:input="checkPwd"
				class="form-control" type="password" name="pwd2" id="pwd2"/>
		</div>
		<br />
		<div>
			<label class="control-label" for="email">이메일</label>
			<input v-model="email"
			       v-on:input="onEmailInput"
			       v-bind:class="{'is-valid':isEmailValid,'is-invalid':!isEmailValid && isEmailDirty}"
			   class="form-control" type="text" name="email" id="email"/>
			<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
		</div>
		<br />
		<div>
			<label class="control-label" for="profile">자기소개</label>
			<input type="text" id="profile" name="profile" placeholder="우리 같이 체리마켓에서 거래해요~^^"/>
			<small class="form-text text-muted">욕설 및 비속어, 광고, 선정적인 내용 등 불쾌한 표현은 제제 및 법적 조치를 진행하겠습니다.</small>
		</div>
		<br />
		<div>
			<label class="control-label" for="addr">주소</label>
			<small class="form-text text-muted">거주하시는 동네까지만 적어주세요. 원활한 거래에 도움이 됩니다~^^</small>
		<br />	
			<small class="form-text text-muted">예시) 서울특별시 송파구 가락동, 부산광역시 중구 남포동</small>
		<br />
		<br />
		<button v-bind:disabled="!isFormValid"  class="btn btn-primary" type="submit">가입하기</button>
	</form>
</div>


<!-- vue js 로딩하기 -->


<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	let app=new Vue({
	    el:"#myForm",
	    data:{
	        isIdValid:false,
	        isPwdValid:false,
	        isEmailValid:false,
	        id:"",
	        pwd:"",
	        pwd2:"",
	        email:"",
	        isPwdDirty:false,
	        isEmailDirty:false,
	        isIdDirty:false  
	    },
	    computed:{
	    	isFormValid:function(){
	    		return this.isIdValid && this.isPwdValid && this.isEmailValid;
	    	}
	    },
	    methods:{
	    	onSubmit:function(e){
	    		let isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
	    		if(!isFormValid){
	    			e.preventDefault();
	    		}	
	    	},
	    	
	    	onIdInput:function(){
	      		this.isIdDirty=true;
	    		let inputId=this.id;
	    		const reg_id=/^[가-힣a-zA-Z0-9]{2,8}$/;
	    		if(!reg_id.test(inputId)){
	    			this.isIdValid=false;
	    			return;
	    		}
	    		const me = this;
	    		
	    		ajaxPromise("checkid.jsp", "get", "inputId="+inputId)
	    		.then(function(response){
	    			return response.json();
	    		})
	    		.then(function(data){
	    			console.log(data);
	    			
	    			if(data.isExist){

	    				me.isIdValid=false;			
	    			}else{
	    				me.isIdValid=true;
	    			}
	    		});
	      	},
	    	
	    	checkPwd:function(){
	    		this.isPwdDirty=true;
	    		const pwd=this.pwd;
	    		const pwd2=this.pwd2;
	    		
	    		const reg_pwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&].{6,20}$/;
	    		if(!reg_pwd.test(pwd)){
	    			this.isPwdValid=false;
	    			return; 
	    		}
	    		
	    		if(pwd != pwd2){

	    			this.isPwdValid=false;
	    		}else{
	    			this.isPwdValid=true;
	    		}
	    	},
	    	
	    	onEmailInput:function(e){
	    		this.isEmailDirty=true;
	    		const inputEmail=this.email;
	    		const reg_email=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    		if(reg_email.test(inputEmail)){
	    			this.isEmailValid=true;
	    		}else{
	    			this.isEmailValid=false;
	    		}
	    	}
	    }
	});

</script>
</body>
</html>