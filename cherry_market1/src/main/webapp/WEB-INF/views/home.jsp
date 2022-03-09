<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//여기에 일단 임시 ID 세션 바로 등록했습니다
	session.setAttribute("id","정동욱"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
<style>
	#textBox{
		width:500px;
		height:450px;
		overflow: auto;
		overflow-y:450px;
	}
</style>
</head>
<body>
<div id="main">
	<div id="openchat">
		<div id="textBox">
		
		</div>
		<div id="inputBox">
			<input type="text" id="occomment" name="occomment" placeholder="메세지 보내기"/>
		</div>
	</div>
	<a href="">개인톡리스트</a>
</div>
<script>
	var before;
	var id="${sessionScope.id}";
	<!--채팅박스 업로드 함수-->
	let updateBox=function(){
		fetch("updateOpenChatBox")
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			before=document.querySelector("#textBox").innerHTML;
			<!-- js와 html에서 개행기호가 달라서 replaceAll 함수로 개행기호 삭제시켰습니다-->
			data=data.replaceAll('\r','');
			<!-- 업로드했을때 이전에 업로드한것과 변경점이 있을시만 채팅 업데이트-->
			if(before!=data){
				document.querySelector("#textBox").innerHTML=data;
			<!-- 스크롤바 맨아래로 자동으로 내리기-->	
				var objDiv = document.getElementById("textBox");
				objDiv.scrollTop = objDiv.scrollHeight;
			}
		})
	};
	<!--채팅박스 업로드 함수를 를 0.1초에 한번씩 자동반복실행-->
	let interval=setInterval(updateBox,100);
	<!--채팅입력 함수 채팅바에 키가 눌렀다 떼면(keyup) 실행되도록 설정-->
	document.querySelector("#occomment").addEventListener("keyup",function(e){
		<!-- 만약 엔터키가 눌렸는데 채팅파에 텍스트가 있는 상태면 다음 진행-->
		if (e.key=="Enter"&&this.value!=''){
			<!--로그인 되어있는지 확인 아닐시 알림출력-->
			if (id=="" || id==null){
				alert("로그인 후 이용해주세요")
			<!--로그인돼있고 입력텍스트가 있을시 id와 텍스트를 전송-->
			} else {
				fetch("uploadOpenChat",{
					method:"POST",
					headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'},
					body:"id="+id+"&"+
					"occomment="+document.querySelector("#occomment").value
				})
				.then();
			<!-- 전송후 수동으로 채팅박스 업데이트-->
				updateBox();
				document.querySelector("#occomment").value="";
				document.querySelector("#occomment").placeholder="메세지 보내기";
			}
		}
	});
</script>
</body>
</html>