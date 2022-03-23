<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/mypage.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
   *{
   margin:0;
   padding:0;
}
.goods{
	margin-top:10px;
}
.goods p{
	font-size:14px;
}
img{
	height:80px;
	width:80px;
	object-fit:contain;
	background-color:#fceee4;
	margin-right: 48px;
	
}
.container{
   height:100vh;
   display:flex;
   flex-direction:column;
   align-items:center;
   justify-content:center;
   padding-top:50px;
   background:#fc9091;
   color:#fff;
   
}
.mypage-form{
   height:100vh;
   display:flex;
   flex-direction:column;
   align-items:center;
   justify-content:center;
   padding-top:50px;
   background:#fc9091;
   color:#fff;
   
}
.mypage-form h1{
   color:#fff;
   margin-bottom:80px;
}

.mypage-cont{
   width:500px;
   font-size: 13px;
    background: #ececec;
    box-shadow: 0px 2px 2px rgb(0 0 0 / 30%);
    color: #7a7a7a;
    border-radius: 2px;
    margin-bottom: 15px;
    padding:30px;
    padding-top:80px;
    box-sizing:border-box;
    position:relative;
}

.mypage-cont .avatar {
    position: absolute;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: -50px;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    z-index: 9;
    background: antiquewhite;
    padding: 15px;
    box-shadow: 0px 2px 2px rgb(0 0 0 / 10%);
	overflow:hidden;
}

.mypage-cont .avatar img{
   width:100%;
   height:100%;
   border-radius:50%;
   object-fit:cover;
}

.animate__fadeIn {
    -webkit-animation-name: fadeIn;
    animation-name: fadeIn;
}

.animate__animated {
    -webkit-animation-duration: 1s;
    animation-duration: 1s;
    -webkit-animation-duration: var(--animate-duration);
    animation-duration: var(--animate-duration);
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
}

.input-cont{
   margin-bottom:15px;
   display:flex;
   justufy-content:center;
   height:30px;
}
.goods-div{
	margin-top:10px;
	display:flex;
	height:80px;
	color:black;
}
.input-cont label{
   width:110px;
   margin-right:15px;
   vertical-align:middle;
   padding-top:8px;
   font-size:14px;

}

.input-cont input{
   flex:1;
   height:30px;
   border:1px solid #ddd;
   border-radius:2px;
   padding:5px;
   box-sizing:border-box;
   margin-right:15px;   
}
.input-cont p{
	margin-top:6px;
	font-size:14px;
	width:195px;
}
.input-cont button{
	border:solid 1px #fc9091;
	color:#c54e4f;
	width:50px;
}
.input-cont button:hover{
	color:white;
	background-color:#fc9091;
}
.input-cont div.txt{
   flex:1;
   height:40px;
   padding:5px;
   box-sizing:border-box;
   
}

.btn-list{
    text-align:center;
    margin:20px 0;
    
}
.btn-list a{
   display:inline-block;
   padding:10px 8px;
   min-width:150px;
   height:40px;
   box-sizing:border-box;
   border-radius:25px;
   text-align:center;
   background:#666;
   color:#fff;
   text-decoration:none;
   
}
#imageForm{
	display: none;
}
.form-control:focus {
     border-color: #8464ca;
     box-shadow: 0 0 8px #beace3;
 }
 .contact-modal {
     width: 600px;
     padding: 50px;
     margin: 30px auto;
 }
 .contact-modal h4 {
     font-size: 26px;
     display: inline-block;
 }
 .contact-modal .form-control, .contact-modal .btn  {
     min-height: 38px;
     border-radius: 1px;
     outline: none;
 }
 .contact-modal .btn-primary {
     min-width: 100px;
     background: #8464ca;
     border: none;
 }
 .contact-modal .btn-primary:hover {
     background: #6d45c0;
 }
 .contact-modal .btn-primary:focus {
     box-shadow: 0 0 8px rgba(132, 100, 202, 0.6);
 }
 .contact-modal .btn-link {
     color: #6d45c0;
 }
 .contact-modal label {
     opacity: 0.9;
     font-weight: normal;
     font-size: 95%;
 }
 .contact-modal textarea {
     resize: vertical;
 }
 .contact-modal.modal-dialog {
     width: 600px;
 }
 .contact-modal .modal-header {
     padding: 20px 35px 14px;
 }
 .contact-modal .modal-content {
     border-radius: 1px;
 }
 .contact-modal .close {
     position: absolute;
     right: 35px;
     top: 25px;
 }
 .contact-modal .modal-body {
     padding: 20px 35px 35px;
 }
 .hint-text {
     opacity: 0.8;
 }
 .trigger-btn {
   display: inline-block;
}
.modal-body img{
	width:350px;
	height:350px;
	margin-right:0px;
}
</style>

</head>
<body>
<div class="mypage-form">
   <h1>My Page</h1>
   
   <div class="mypage-cont">
      <div class="avatar" id="profileImg">
         <c:choose>
            <c:when test="${empty usersDto.profile }">
               <img src="${pageContext.request.contextPath }/resources/images/cherry.png">
            </c:when>
            <c:otherwise>
               <img src="${pageContext.request.contextPath }${usersDto.profile}"/>
            </c:otherwise>
         </c:choose>
         <form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" 
				id="imageForm" enctype="multipart/form-data">
			<input type="file" name="image" id="imageInput" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
		</form>
      </div>
      
      <div class="input-cont">
          <label for="id">아이디</label>
          <p>${usersDto.id }</p>
          <button id="delete">탈퇴</button>
      </div>
      <div class="input-cont">
          <label for="email">이메일</label>
          <div>
          <form id="emailAjax" action="${pageContext.request.contextPath }/users/emailUpdate.do" method="post">
             <input type="text" id="email" name="email" value="${usersDto.email }"/>
          </form>
          </div>
          <button id="emailChange">변경</button>
      </div>
      
	   <form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="myForm">
	      <div class="input-cont">
	         <label for="pwd">기존 비밀 번호</label>
	         <div>
	         <input type="password" name="pwd" id="pwd" />		
			</div>
	      </div>
	      <div class="input-cont">
	         <label for="newPwd">새 비밀번호</label>
	         <div>
	         <input type="password" name="newPwd" id="newPwd"/>
	         </div>
	      </div>
	      <div class="input-cont">
	         <label for="newPwd2">비밀번호 확인</label>
	         <div>
	         <input type="password" id="newPwd2" >
	         </div>
	         <button id="pwdBtn">변경</button>
	      </div>
	   </form>
	   <div class="goods">
	   		<p>내 상품</p>
	   		<c:forEach var="tmp" items="${myGoods }">
	   			<div class="goods-div">
					
	   			 	<a href="#goods${tmp.num }" class="trigger-btn" data-toggle="modal">
	   			 		<img src="${pageContext.request.contextPath }${tmp.imagePath}"/>
	   			 		
	   			 	</a>
	   			 	<div>
		   				<p>${tmp.title }</p>
		   				<h3>${tmp.priceWon }</h3>
   					</div>
   					<div>
   						<c:if test="${tmp.isSaled==1 }">
   							<p>판매 완료</p>
   						</c:if>
   					</div>
		   			<div id="goods${tmp.num }" class="modal fade">
						<div class="modal-dialog contact-modal">
							<div class="modal-content">
								<div class="modal-header">            
									<h4 class="modal-title">${tmp.title }</h4>
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div style="height:100%; text-align:center">									  									   
										<c:forEach var="i" items="${tmp.imagePaths }">
											<div style="margin-bottom:5px">
											<c:choose>
												<c:when test="${i eq 'None' }">
													<img src="${pageContext.request.contextPath }/resources/images/cherrythumbnail.jpg" alt="" />
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath }${i}"/>
												</c:otherwise>
											</c:choose>
											</div>
											<br />
										</c:forEach>
									</div>
									<br />
									<div style="margin:0px 40px 0px 50px;">
										<p style="font-size:30px;">${tmp.priceWon }</p>
										<p>${tmp.id } <small>${tmp.regdate }</small></p>
										<p>${tmp.explain }</p>
										<c:if test="${tmp.isSaled==0 }">
											<button type="button" onClick="location.href='${pageContext.request.contextPath }/sellFromMy.do?num=${tmp.num}'">판매완료</button>
										</c:if>
										<button type="button" onClick="location.href='${pageContext.request.contextPath }/deleteFromMy.do?num=${tmp.num}'">상품 내리기</button>
									</div>																
								</div>
							</div>
						</div>
					</div>
	   			</div>
	   		</c:forEach>
	   </div>
	   <div class="goods">
	   		<p>관심 목록</p>
	   		<c:forEach var="tmp" items="${wishList }">
				<div class="goods-div">
					
	   			 	<a href="#goods${tmp.num }" class="trigger-btn" data-toggle="modal">
	   			 		<img src="${pageContext.request.contextPath }${tmp.imagePath}"/>
	   			 		
	   			 	</a>
	   			 	<div>
		   				<p>${tmp.title }</p>
		   				<h3>${tmp.priceWon }</h3>
   					</div>
		   			<div id="goods${tmp.num }" class="modal fade">
						<div class="modal-dialog contact-modal">
							<div class="modal-content">
								<div class="modal-header">            
									<h4 class="modal-title">${tmp.title }</h4>
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div style="height:100%; text-align:center">									  									   
										<c:forEach var="i" items="${tmp.imagePaths }">
											<div style="margin-bottom:5px">
											<c:choose>
												<c:when test="${i eq 'None' }">
													<img src="${pageContext.request.contextPath }/resources/images/cherrythumbnail.jpg" alt="" />
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath }${i}"/>
												</c:otherwise>
											</c:choose>
											</div>
											<br />
										</c:forEach>
									</div>
									<br />
									<div style="margin:0px 40px 0px 50px;">
										<form name="perChat${tmp.num}" id="perChat${tmp.num}" method="post" >
											<input type="hidden" name="num" value="${tmp.num }"/>
											<input type="hidden" name="buyer" value="${sessionScope.id}"/>
											<input type="hidden" name="saller" value="${tmp.id }"/>
										</form>
										<p style="font-size:30px;">${tmp.priceWon }</p>
										<p>${tmp.id } <small>${tmp.regdate }</small></p>
										<p>${tmp.explain }</p>
										<c:choose>
											<c:when test="${tmp.isWish==0}">
												<button id="wish${tmp.num }">관심상품등록</button>
											</c:when>
											<c:otherwise>
												<button id="wish${tmp.num }">관심상품해제</button>
											</c:otherwise>
										</c:choose>
										<button id="chatPop${tmp.num}">판매자와 대화하기</button>
										<script>
											document.querySelector("#chatPop${tmp.num}").addEventListener("click",function(){
												if("${sessionScope.id}"==""){
													swal({
											    		  title: "로그인 후 이용해주세요",
											    		  icon: "error"
											    	})
												}else{
													let form=document.perChat${tmp.num}
													let pop_title="chat";
													window.open("",pop_title,"width = 350, height = 500, top = 100, left = 200, location = no");
													form.action="${pageContext.request.contextPath }/private/chatPop.do";
													form.target=pop_title;
													form.submit();
												}
												
											})
							
											document.querySelector("#wish${tmp.num}").addEventListener("click",function(){
												if("${sessionScope.id}"==""){
													swal({
											    		  title: "로그인 후 이용해주세요",
											    		  icon: "error"
											    	})
												}else{
													if (document.querySelector("#wish${tmp.num}").innerText=="관심상품등록"){
														fetch("${pageContext.request.contextPath }/pluswish.do",{
															method:"POST",
															headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'},
															body:"num=${tmp.num}"
														})
														.then(function(){
															document.querySelector("#wish${tmp.num}").innerText="관심상품해제";
														});
														return
													}
													fetch("${pageContext.request.contextPath }/minuswish.do",{
														method:"POST",
														headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'},
														body:"num=${tmp.num}"
													})
													.then(function(){
														document.querySelector("#wish${tmp.num}").innerText="관심상품등록";
													})
												}
												
											});
										</script>
									</div>																
								</div>
							</div>
						</div>
					</div>
	   			</div>
	   		</c:forEach>
	   </div>
      
      
   </div>
   
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	document.querySelector("#delete").addEventListener("click",function(){
		deleteConfirm();
	})
	document.querySelector("#emailChange").addEventListener("click",function(){
		const reg_email=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!reg_email.test(document.querySelector("#email").value)){
			swal({
    		  title: "이메일 형식을 확인하세요",
    		  icon: "warning"
    		});
			return
		}
		let form=document.querySelector("#emailAjax");
		fetch("${pageContext.request.contextPath }/users/emailUpdate.do",{
			method:"POST",
			headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'},
			body:"email="+document.querySelector("#email").value
		})
		.then(function(){
			swal({
	    		  title: "이메일이 변경됐습니다",
	    		  icon: "success"
	    		});
		});
	})
	document.querySelector("#profileImg").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#imageInput").click();
	});
	document.querySelector("#imageInput").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img id="profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#profileImg").innerHTML=img;
			swal({
	    		  title: "프로필이 변경됐습니다",
	    		  icon: "success"
	    		});
		});
	});	
   function deleteConfirm(){
      const isDelete=swal({
      	title:"정말 탈퇴하시겠습니까?",
      	buttons:true,
      	dangerMode: true,
      })
      .then((willDelete) => {
	  if (willDelete) {
		  location.href="${pageContext.request.contextPath}/users/delete.do";
	  } 
	});

   }
   
   //폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
   document.querySelector("#pwdBtn").addEventListener("click", function(e){
	  let pwd1=document.querySelector("#newPwd").value;
      let pwd2=document.querySelector("#newPwd2").value;
      //새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
     	
      if(pwd1 != pwd2||pwd1==""){
    	  swal({
    		  title: "비밀번호를 확인하세요",
    		  icon: "warning",
    		});
         e.preventDefault();//폼 전송 막기 
      }
   });

</script>
</body>
</html>
