<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//여기에 일단 임시 ID 세션 바로 등록했습니다
	session.setAttribute("id","김호직"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CherryMarket</title>

<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	body {
		font-family: 'Varela Round', sans-serif;
	}
	.form-control {
		box-shadow: none;
		border-radius: 4px;
	}
	.form-control:focus {
		border-color: #f08373;
		box-shadow: 0 0 8px rgba(0,0,0,0.1);
	}

	.navbar {
		background: #fff;
		padding-left: 16px;
		padding-right: 16px;
		border-bottom: 1px solid #dfe3e8;
		border-radius: 0;
	}
	.navbar .navbar-brand, .navbar .navbar-brand:hover, .navbar .navbar-brand:focus {
		padding-left: 0;
		font-size: 20px;
		padding-right: 50px;
	}
	.navbar .navbar-brand b {
		font-weight: bold;
		color: #eb5844;		
	}
	.navbar ul.nav li a {
		color: #888;
	}
	.navbar ul.nav li a:hover, .navbar ul.nav li a:focus {
		color: #f08373 !important;
	}
	.navbar ul.nav li.active > a, .navbar ul.nav li.open > a {
		color: #eb5844 !important;
		background: transparent !important;
	}
	.search-box {
		width: 100%;
        position: relative;
    }	
    .search-box input {		
		border-color: #dfe3e8;        
		box-shadow: none
    }
	.search-box input, .search-box .btn {
		min-height: 38px;
		border-radius: 2px;
	}
	.search-box .input-group-btn .btn {
		border-color: #eb5844;
		background: #eb5844;
		outline: none;
	}
	.navbar ul li i {
		font-size: 18px;
		line-height: 16px;
	}
	.navbar .navbar-right .dropdown-toggle::after {
		display: none;
	}
	.navbar .dropdown-menu {
		border-radius: 1px;
		border-color: #e5e5e5;
		box-shadow: 0 2px 8px rgba(0,0,0,.05);
	}
	.navbar .dropdown-menu li a {
		padding: 6px 20px;
	}
	.navbar .navbar-right .dropdown-menu {
		width: 400px;
		padding: 20px;
		left: auto;
		right: 0;
        font-size: 14px;
	}
	.hide {
		display: none !important;
	}
	@media (max-width: 768px){
		.navbar .navbar-right .dropdown-menu {
			width: 100%;
			background: transparent;
			padding: 10px 20px;
		}
		.navbar .input-group {
			width: 100%;
		}
	#textBox{
		width:500px;
		height:450px;
		overflow: auto;
		overflow-y:450px;
	}
}	
</style>
<script>
	$(document).ready(function(){
		var dropdown = $(".navbar-right .dropdown");
		var toogleBtn = $(".navbar-right .dropdown-toggle");
		
		// Toggle search and close icon for search dropdown
		dropdown.on("show.bs.dropdown", function(e){
			toogleBtn.toggleClass("hide");
		});
		dropdown.on("hide.bs.dropdown", function(e){
			toogleBtn.addClass("hide");
			toogleBtn.first().removeClass("hide");
		});
	});
</script>
</head>
<body>

<nav class="navbar navbar-default navbar-expand-lg navbar-light">
	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Cherry<b>Market</b></a>  		
		<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
			<span class="navbar-toggler-icon"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
			</a></li>
			<li><a href="${pageContext.request.contextPath }/">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/cafe/list.do">Market</a></li>			
				<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#">Services <b class="caret"></b></a>
				<ul class="dropdown-menu">					
					<li><a href="#">남성의류</a></li>
					<li><a href="#">여성의류</a></li>
					<li><a href="#">가전/IT</a></li>
					<li><a href="#">삽니다</a></li>
				</ul>
			</li>
		</ul>		
		<ul class="nav navbar-nav navbar-right">			
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="fa fa-search"></i></a>
				<a data-toggle="dropdown" class="nav-link dropdown-toggle hide" href="#"><i class="fa fa-close"></i></a>
				<ul class="dropdown-menu">
					<li>
                        <form>
                            <div class="input-group search-box">								
                                <input type="text" id="search" class="form-control" placeholder="Search here...">
								<span class="input-group-btn">
									<button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
								</span>
                            </div>
                        </form>                        
					</li>
				</ul>
			</li>
		</ul>
	</div>
</nav>

<h1>안녕하세요!!!</h1>
<div id="main">
	<div id="openchat">
		<div id="textBox">
		
		</div>
		<div id="inputBox">
			<input type="text" id="occomment" name="occomment" placeholder="메세지 보내기"/>
		</div>
	</div>
	<a href="private/personalChatList">개인톡리스트</a>
	<br />
	<a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입하러가기</a>

</div>
<script>
	var before;
	var id="${sessionScope.id}";
	//채팅박스 업로드 함수
	let updateBox=function(){
		fetch("updateOpenChatBox")
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			before=document.querySelector("#textBox").innerHTML;
			//js와 html에서 개행기호가 달라서 replaceAll 함수로 개행기호 삭제시켰습니다
			data=data.replaceAll('\r','');
			//업로드했을때 이전에 업로드한것과 변경점이 있을시만 채팅 업데이트
			if(before!=data){
				document.querySelector("#textBox").innerHTML=data;
			//스크롤바 맨아래로 자동으로 내리기
				var objDiv = document.getElementById("textBox");
				objDiv.scrollTop = objDiv.scrollHeight;
			}
		})
	};
	//채팅박스 업로드 함수를 를 0.1초에 한번씩 자동반복실행
	let interval=setInterval(updateBox,100);
	//채팅입력 함수 채팅바에 키가 눌렀다 떼면(keyup) 실행되도록 설정
	document.querySelector("#occomment").addEventListener("keyup",function(e){
		// 만약 엔터키가 눌렸는데 채팅파에 텍스트가 있는 상태면 다음 진행
		if (e.key=="Enter"&&this.value!=''){
			//로그인 되어있는지 확인 아닐시 알림출력
			if (id=="" || id==null){
				alert("로그인 후 이용해주세요")
			//로그인돼있고 입력텍스트가 있을시 id와 텍스트를 전송
			} else {
				fetch("uploadOpenChat",{
					method:"POST",
					headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'},
					body:"id="+id+"&"+
					"occomment="+document.querySelector("#occomment").value
				})
				.then();
			//전송후 수동으로 채팅박스 업데이트
				updateBox();
				document.querySelector("#occomment").value="";
				document.querySelector("#occomment").placeholder="메세지 보내기";
			}
		}
	});
</script>

<div class="container">
<a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
</div>
</body>
</html>