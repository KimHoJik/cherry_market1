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
			<li>
				<!-- 마이페이지 모달 -->
				<div class="text-center">
			   <!-- Button HTML (to Trigger Modal) -->
				   <a href="#myModal1" class="trigger-btn" data-toggle="modal" style="margin-top:15px">
				   MyPage
				   </a>
				</div>
				<div id="myModal1" class="modal fade">
					<div class="modal-dialog contact-modal">
						<div class="modal-content">
							<div class="modal-header">            
								<h4 class="modal-title">MyPage</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">
								<table>
									<tr>
										<th>아이디</th>
										<td>${usersDto.id }</td>
									</tr>
									<tr>
										<th>프로필 이미지</th>
										<td>
										<c:choose>
											<c:when test="${empty usersDto.profile }">
												<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
												  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
												  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
												</svg>
											</c:when>
											<c:otherwise>
												<img id="profileImage" 
													src="${pageContext.request.contextPath}${usersDto.profile}"/>
											</c:otherwise>
										</c:choose>
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><a href="${pageContext.request.contextPath}/users/pwd_updateform.do">수정하기</a></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${usersDto.email }</td>
									</tr>
									<tr>
										<th>가입일</th>
										<td>${usersDto.regdate }</td>
									</tr>
								</table>
								<a href="${pageContext.request.contextPath}/users/updateform.do">개인정보 수정</a>
								<a href="javascript:deleteConfirm()">탈퇴</a>								
							</div>
						</div>
					</div>
				</div>
				<!-- 마이페이지 모달 끝 -->			
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
		</ul>		
		
	</div>
</nav>
<script>
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
	};
	updateChatList();
	function deleteConfirm(){
		const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}
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