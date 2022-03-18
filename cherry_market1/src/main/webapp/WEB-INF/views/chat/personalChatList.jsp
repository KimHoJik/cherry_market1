<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/chat/personalChatList.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbarcss.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<jsp:include page="/include/navbar.jsp"/>
<body>
	<div>
		<h3>개인톡리스트</h3>
		<div id="perChatList">
			
		</div>
	</div>
<script>
	let scripton=function(){
		let list=document.querySelectorAll(".frm");
		for(let i=0;i<list.length;i++){
			list[i].addEventListener("click",function(){
				let pop_title="chat";
				window.open("",pop_title,"width = 500, height = 700, top = 100, left = 200, location = no");
				this.action="chatPop.do";
				this.target=pop_title;
				this.submit();
			})
		}
	}
	function updateChatList(){
		fetch("updatePerChatList.do")
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			document.querySelector("#perChatList").innerHTML=data;
			scripton();
		})
	};
	updateChatList();
	//let interval=setInterval(updateChatList); 
	
	
		
	
</script>
</body>
</html>