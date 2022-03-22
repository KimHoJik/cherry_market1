<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/mypage.jsp</title>
<style>
   *{
   margin:0;
   padding:0;
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
    width: 70px;
    height: 70px;
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
	margin-right:149px;
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
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
      
      
   </div>
   
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	document.querySelector("#delete").addEventListener("click",function(){
		deleteConfirm();
	})
	document.querySelector("#emailChange").addEventListener("click",function(){
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
      const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
      if(isDelete){
         location.href="${pageContext.request.contextPath}/users/delete.do";
      }
   }
   
   //폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
   document.querySelector("#pwdBtn").addEventListener("click", function(e){
	  let pwd1=document.querySelector("#newPwd").value;
      let pwd2=document.querySelector("#newPwd2").value;
      //새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
     
      if(pwd1 != pwd2){
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
