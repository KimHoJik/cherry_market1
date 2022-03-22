<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbarcss.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/home2.css" />

</head>
<body>
<div id="full" style="display:flex; justify-content:center;">
	<div id="main" style="width:1240px; height:100%;">
		<jsp:include page="/include/navbar.jsp"/>
		<div id="goods" style="width:1000px;height:798px;float:left;margin:10px;">
			
			<div class="row">
				<c:forEach var="tmp" items="${list }">
					<div  class="col-6 col-md-4 col-lg-3">
						<a href="#detail${tmp.num }" class="trigger-btn" data-toggle="modal" style="margin-top:15px">
							<div>
				         		<div class="card mb-3">
				               		<div class="img-wrapper">
				               			<c:choose>
				               				<c:when test="${tmp.imagePath eq 'None'}">
				               					<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/cherrythumbnail.jpg" />
				               				</c:when>
				               				<c:otherwise>
				               					<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
				               				</c:otherwise>
				               			</c:choose>
				                  		
				               		</div>
				            		<div class="card-body">
				               			<p class="card-text">${tmp.title}</p>
				               			<p class="card-text"><strong>${tmp.priceWon}</strong></p>
				               			<p><small>${tmp.id}</small></p>
				            		</div>
				         		</div>
				      		</div>
						</a>
					</div>
					<div id="detail${tmp.num }" class="modal fade">
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
												<img src="${pageContext.request.contextPath }${i}"/>
											</div>
											<br />
										</c:forEach>
									</div>
									<br />
									<p><strong>가격:${tmp.priceWon }</strong> <small>판매자:${tmp.id }</small></p>
									<p>상품설명:${tmp.explain }</p>
									<p>업로드 시간:${tmp.regdate }</p>	
									<c:choose>
										<c:when test="${tmp.id eq sessionScope.id }">
											
											<button type="button" onClick="location.href='sell.do?num=${tmp.num}'">판매완료</button>
											<button type="button" onClick="location.href='delete.do?num=${tmp.num}'">상품 내리기</button>
										</c:when>
										<c:otherwise>
											<form action="">
												<input type="hidden" name="num"/>
												<input type="hidden" name="id"/>
												<input type="hidden" name=""/>
												<input type="hidden" name=""/>
												<input type="hidden" name=""/>
											</form>
											
											<form name="perChat${tmp.num}" id="perChat${tmp.num}" method="post" >
												<input type="hidden" name="num" value="${tmp.num }"/>
												<input type="hidden" name="buyer" value="${sessionScope.id}"/>
												<input type="hidden" name="saller" value="${tmp.id }"/>
											</form>
											<button id="putWishList">관심상품 등록</button>
											<button id="chatPop${tmp.num}">판매자와 대화하기</button>
											<script>
												document.querySelector("#chatPop${tmp.num}").addEventListener("click",function(){
													let form=document.perChat${tmp.num}
													let pop_title="chat";
													window.open("",pop_title,"width = 500, height = 700, top = 100, left = 200, location = no");
													form.action="${pageContext.request.contextPath }/private/chatPop.do";
													form.target=pop_title;
													form.submit();
												})
											</script>
										</c:otherwise>
									</c:choose>
																										
								</div>
							</div>
						</div>
					</div>					
				</c:forEach>
		   	</div>
		   	<div id="navbarDiv" style="text-align:center;">
			   	<nav>
					<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${startPageNum ne 1 }">
							<li class="page-item">
			               		<a class="page-link" href="${pageContext.request.contextPath}/home.do?pageNum=${startPageNum - 1}">Prev</a>
			            	</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
			               		<a class="page-link" href="javascript:">Prev</a>
			            	</li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<c:choose>
							<c:when test="${i eq pageNum }">
								<li class="page-item active">
			                  		<a class="page-link" href="${pageContext.request.contextPath}/home.do?pageNum=${i}">${i }</a>
			               		</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
			                  		<a class="page-link" href="${pageContext.request.contextPath}/home.do?pageNum=${i}">${i}</a>
			               		</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${endPageNum lt totalPageCount }">
							<li class="page-item">
			               		<a class="page-link" href="${pageContext.request.contextPath}/home.do?pageNum=${endPageNum + 1}">Next</a>
			            	</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
			               		<a class="page-link" href="javascript:">Next</a>
			            	</li>
						</c:otherwise>
					</c:choose>
			      </ul>
			   </nav>
		   </div>  		
		</div> 	
	
		<div id="openchat" style="width:200px;height:798px;display:inline-block;margin:10px;">
			<div id="textBoxDiv"style="height:750px; overflow-y:auto;">
				<ul id="textBox" style="padding:0">
				
				</ul>
			</div>
			<div id="inputBox">
				<textarea id="occomment" name="occomment" placeholder="메세지 보내기" style="resize:none;"></textarea>
			</div>
		</div>
	</div>
</div>
<script>
	
	var before;
	var id="${sessionScope.id}";
	//채팅박스 업로드 함수
	let updateBox=function(){
		fetch("updateOpenChatBox.do")
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
				var objDiv = document.getElementById("textBoxDiv");
				objDiv.scrollTop = objDiv.scrollHeight;
			}
		})
	};
	//채팅박스 업로드 함수를 를 0.1초에 한번씩 자동반복실행
	let interval=setInterval(updateBox,100);
	//채팅입력 함수 채팅바에 키가 눌렀다 떼면(keyup) 실행되도록 설정
	document.querySelector("#occomment").addEventListener("keyup",function(e){
		// 만약 엔터키가 눌렸는데 채팅파에 텍스트가 있는 상태면 다음 진행
		if (e.key=="Enter"&&this.value!='\n'){
			//로그인 되어있는지 확인 아닐시 알림출력
			if (id=="" || id==null){
				alert("로그인 후 이용해주세요")
			//로그인돼있고 입력텍스트가 있을시 id와 텍스트를 전송
			} else {
				fetch("uploadOpenChat.do",{
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
</body>
</html>