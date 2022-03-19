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
<style>
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
</style>
</head>
<body>
<div style="display:flex; justify-content:center;">
	<div id="main" style="width:1200px; height:900px;">
		<jsp:include page="/include/navbar.jsp"/>
		<div id="goods" style="width:1000px;height:800px;float:left;">
			<a href="${pageContext.request.contextPath }/private/goodsUploadForm.do">상품등록</a>
			<div class="row">
				<c:forEach var="tmp" items="${list }">
					<div >
		         		<div class="card">
		            		<a href="${pageContext.request.contextPath}/gallery/detail.do?num=${tmp.num}">
			               		<div class="img-wrapper">
			                  		<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath[0]}" />
			               		</div>
		            		</a>
		            		<div class="card-body">
		               			<p class="card-text">${tmp.caption}</p>
		               			<p class="card-text">by <strong>${tmp.writer}</strong></p>
		               			<p><small>${tmp.regdate}</small></p>
		            		</div>
		         		</div>
		      		</div>
				</c:forEach>
		   	</div>
		   	
		
		<div id="openchat" style="width:200px;height:800px;display:inline-block;">
			<div>
				<ul id="textBox">
				
				</ul>
			</div>
			<div id="inputBox">
				<input type="text" id="occomment" name="occomment" placeholder="메세지 보내기"/>
			</div>
		</div>
	</div>
</div>
<script>
	function updategoodsbox(){
		
	}
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