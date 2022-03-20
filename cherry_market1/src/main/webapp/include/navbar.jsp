<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="loginbar" style="text-align:right;">
	<c:choose>
		<c:when test="${sessionScope.id eq null }">
			<a href="${pageContext.request.contextPath}/users/signup_form.do">멤버 가입</a>
			<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
		</c:when>
		<c:otherwise>
			<p>
				<a href="${pageContext.request.contextPath}/users/mypage.do">${sessionScope.id }</a> 로그인중...
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
<nav class="navbar navbar-default navbar-expand-lg navbar-light animate__animated animate__backInDown">
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
			<li><a href="${pageContext.request.contextPath}/users/loginform">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
			</a></li>
			<li><a href="${pageContext.request.contextPath }/home.do">Home</a></li>
			<li><a href="${pageContext.request.contextPath }/gallery/list.do">Photo</a></li>
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
			<li><a href="${pageContext.request.contextPath }/private/personalChatList.do">Chat</a></li>
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