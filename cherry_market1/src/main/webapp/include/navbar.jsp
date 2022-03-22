<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="loginbar" style="text-align:right;">
</div>
<nav class="navbar navbar-default navbar-expand-lg navbar-light" style="margin:20px">
	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">Cherry<b>Market</b></a>  		
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
			<li>
				<!-- 검색바 -->
				<form action="home.do">
					 <div class="input-group" style="margin-top:9px;margin-left:150px; margin-right:80px">
					     <div class="input-group-btn">
					     	
					         <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:120px">
					             <span id="srch-category">전체</span>
					         </button>
					         <ul class="dropdown-menu" id="categorySelect">
					         	<li><a href="" class="cm">전체</a></li>
				      			<li><a href="" class="cm">디지털기기</a></li>
				      			<li><a href="" class="cm">생활가전</a></li>
				      			<li><a href="" class="cm">가구/인테리어</a></li>
				      			<li><a href="" class="cm">스포츠/레저</a></li>
				      			<li><a href="" class="cm">여성패션</a></li>
				      			<li><a href="" class="cm">남성패션</a></li>
				      			<li><a href="" class="cm">게임/취미</a></li>
				      			<li><a href="" class="cm">뷰티/미용</a></li>
				      			<li><a href="" class="cm">반려동물</a></li>
				      			<li><a href="" class="cm">도서/티켓/음반</a></li>	
					         	<li><a href="" class="cm">기타</a></li>
					         	<li><a href="" class="cm">삽니다</a></li>
					         </ul>
					     </div>
					     <input type="hidden" id="category" name="category" value="전체">
					     <input type="text" id="search" name="search" class="form-control" placeholder="Search for..." style="width:350px">
					     <span class="input-group-btn">
					         <button id="btn-search" type="submit" class="btn btn-default" style="background-color:#fc9091;">	
					             <span class="glyphicon glyphicon-search" style="color:white;"></span>
					         </button>
					     </span>
					 </div>
                </form>
			</li>
			<c:choose>
				<c:when test="${sessionScope.id eq null }">
					<li><a href="${pageContext.request.contextPath}/users/signup_form.do">SignUp</a></li>
					<li><a href="${pageContext.request.contextPath}/users/loginform.do">Login</a></li>
				</c:when>
				<c:otherwise>
					<!-- 개인용 -->
					<li>
						<a href="${pageContext.request.contextPath }/users/mypage.do">MyPage</a>		
					</li>		
					<li>
						<!--  chatpage modal start-->
						<div class="text-center">
							<a href="#myModal2" class="trigger-btn" data-toggle="modal" style="margin-top:15px">
								Chat
							</a>
						</div>
						<div id="myModal2" class="modal fade">
							<div class="modal-dialog contact-modal">
								<div class="modal-content">
									<div class="modal-header">            
										<h4 class="modal-title">진행중인 거래</h4>
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body">
										<div id="perChatList">
										</div>
									</div>
								</div>
							</div>
						</div>				
						<!-- chatpage modal end -->
					</li>
					<li><a href="${pageContext.request.contextPath}/users/logout.do">LogOut</a></li>
					<!-- 개인용 -->
				</c:otherwise>
			</c:choose>
			
		</ul>		
		
	</div>
</nav>
<script>
	//검색바
	let cate=document.querySelectorAll(".cm");
	for(let i=0;i<cate.length;i++){
		cate[i].addEventListener("click",function(e){
			e.preventDefault();
			document.querySelector("#srch-category").innerText=this.text;
			document.querySelector("#category").value=this.text;
		})
	}
	//개인쳇
	let scripton=function(){
		let list=document.querySelectorAll(".frm");
		for(let i=0;i<list.length;i++){
			list[i].addEventListener("click",function(){
				let pop_title="chat";
				window.open("",pop_title,"width = 500, height = 700, top = 100, left = 200, location = no");
				this.action="${pageContext.request.contextPath}/private/chatPop.do";
				this.target=pop_title;
				this.submit();
			})
		}
	}
	function updateChatList(){
		fetch("${pageContext.request.contextPath}/private/updatePerChatList.do")
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			document.querySelector("#perChatList").innerHTML=data;
			scripton();
		})
	}
	
	let interval2=setInterval(updateChatList,1000);
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