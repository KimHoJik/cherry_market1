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
				<select class="form-select" name="category" id="category">
	                     <option value="">선택</option>
	                     <option value="디지털지지">디지털기기</option>
	                     <option value="생활가전">생활가진</option>
	                     <option value="가구/인테리어">가구/인테리어</option>
	                     <option value="스포츠/레저">스포츠/레저</option>
	                     <option value="여성패션">여성패션</option>
	                     <option value="남성패션">남성패션</option>
	                     <option value="게임/취미">게임/취미</option>
	                     <option value="뷰티/미용">뷰티/미용</option>
	                     <option value="반려동물">반려동물</option>   
	                     <option value="도서/티켓/음반">도서/티켓/음반</option>
	                     <option value="기타">기타</option>
	                     <option value="삽니다">삽니다</option>
	                  </select>						
			</li>
			<li>
				<!-- 검색바 -->
				<form action="home.do">
                    <div class="input-group search-box" style="margin-top:6px; margin-right:100px;width:600px;">		
                        <input type="text" id="search" name="search" class="form-control" placeholder="Search here...">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
						</span>
                    </div>
                </form>
			</li>
			<li><a href="${pageContext.request.contextPath }/users/mypage.do">MyPage</a></li>		
			<li><a href="${pageContext.request.contextPath }/private/personalChatList.do">Chat</a></li>
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