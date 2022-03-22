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

<style>
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
        width: 480px;
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
	
   /* card 이미지 부모요소의 높이 지정 */
   .img-wrapper{
      height: 250px;
      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
      transition: transform 0.3s ease-out;
   }
   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
   .img-wrapper:hover{
      /* 원본 크기의 1.1 배로 확대 시키기*/
      transform: scale(1.05);
   }
   
   .card .card-text{
      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
      display:block;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
   	.img-wrapper img{
	   	width: 100%;
	   	height: 100%;
	   	/* fill | contain | cover | scale-down | none(default) */
	   	/*	
	   		cover - 부모의 크기에 맞게 키운 후, 자른다. 비율은 일정하게 증가한다. 
	   		contain - 안잘린다. 대신 빈 공간이 남을 수 있다.
	   		fill - 부모의 크기에 딱 맞게, 비율 관계 없이 맞춘다.(이미지가 일그러질 수 있다.)
	   		scale-down - 가로, 세로 중에 큰 것을 부모의 크기에 맞춘 상태까지만 커지거나 작아지고, 비율은 일정하다.
	   	*/
		object-fit: contain;	
   	}
   	#textBoxDiv::-webkit-scrollbar{
   		width:5px;
   	}
   	#textBoxDiv::-webkit-scrollbar-thumb {
        background-color: #DE3F3F; 
    }

    #textBoxDiv::-webkit-scrollbar-track {
        background-color: gray; 
    }
    #textBoxDiv ul{width:100%;list-style:none;}
    #textBoxDiv ul li{width:100%;}
    #textBoxDiv ul li > div {font-size:12px;}
    #textBoxDiv ul li > div.sender{margin: 10px 20px 0 20px; font-weight:bold;}
    #textBoxDiv ul li > div.message{ display: inline-block; word-break:break-all; margin: 3px; max-width: 100%; border: 1px solid #888; padding: 5px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
	#textBoxDiv ul li.left { text-align: left; }
	#textBoxDiv ul li.right { text-align: right; }
	#inputBox{
		 text-align: center;
	}
	#inputBox > textarea {
		width:100%;
		height:50px;
		border:1px solid red;
		outline:none;
		
	}
</style>
</head>
<body>
<div id="full" style="display:flex; justify-content:center;">
	<div id="main" style="width:1240px; height:100%;">
		<jsp:include page="/include/navbar.jsp"/>
		<div id="goods" style="width:1000px;height:798px;float:left;margin:10px;">
			<!-- 상품등록하기  modal -->
			<div class="text-center" >
			   <!-- Button HTML (to Trigger Modal) -->
			   <a href="#myModal" class="trigger-btn" data-toggle="modal">
			   상품 등록 하기
			   </a>
			</div>
			<div id="myModal" class="modal fade">
			   <div class="modal-dialog contact-modal">
			      <div class="modal-content">
			         <div class="modal-header">            
			            <h4 class="modal-title">상품 등록하기</h4>
			            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			         </div>
			         <div class="modal-body">
			                <form id="uploadGoodsMain" action="${pageContext.request.contextPath }/goodsUpload.do" method="post" enctype="multipart/form-data">
			                    <div class="form-group">
			                        <label for="title">제목</label>
			                        <input type="text" class="form-control" id="title" name="title">
			                    </div>
			                    <div class="form-group">
			                        <label for="price">가격</label>
			                        <input type="number" class="form-control" id="price" name="price">
			                    </div>
			                    <div class="form-group">
			                    <label for="category">카테고리</label>
			                  <select name="category" id="category">
			                     <option value="선택">선택</option>
			                     <option value="디지털기기">디지털기기</option>
			                     <option value="생활가전">생활가전</option>
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
			               </div>   
			                    <div class="form-group">
			                        <label for="inputMessage">Message</label>
			                        <textarea class="form-control" id="explain" name="explain" rows="4"></textarea>
			                       <label for="filenames">상품 사진 등록</label>
			                  <input multiple="multiple" type="file" name="images" id="images" multiple
			                  accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
			                    </div>
			                    
			                    <button type="submit" id="btn" class="btn btn-success">등록</button>
			                    <button class="btn btn-danger"  data-dismiss="modal" value="Cancel">취소</button>
			                   
			                </form>
			         </div>
			      </div>
			   </div>
			</div>
			<!-- 상풍등록  modal 끝 -->
			<div class="row">
				<c:forEach var="tmp" items="${list }">
					<div  class="col-6 col-md-4 col-lg-3" >
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
									<h4 class="modal-title">진행중인 거래</h4>
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<p>상품번호:${tmp.num}</p>
									<p>판매자:${tmp.id }</p>
									<p>가격:${tmp.priceWon }</p>
									<p>제목:${tmp.title }</p>
									<p>판매여부:${tmp.isSaled }</p>
									<p>카테고리:${tmp.category }</p>
									<p>조회수:${tmp.viewCount }</p>
									<p>상품설명:${tmp.explain }</p>
									<p>업로드 시간:${tmp.regdate }</p>
									<p>사진들</p>
									<c:forEach var="i" items="${tmp.imagePaths }">
										<p>사진:${i }</p>
									</c:forEach>
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
												<button id="putWishList">관심상품 등록</button>
											</form>
											
											<form name="perChat${tmp.num}" id="perChat${tmp.num}" method="post" >
												<input type="hidden" name="num" value="${tmp.num }"/>
												<input type="hidden" name="buyer" value="${sessionScope.id}"/>
												<input type="hidden" name="saller" value="${tmp.id }"/>
												<button id="chatPop${tmp.num}">판매자와 대화하기</button>
											</form>
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