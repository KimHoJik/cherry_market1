<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	session.setAttribute("mid","정동욱"); 
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
	var id="${sessionScope.mid}";
	let updateBox=function(){
		fetch("updateOpenChatBox")
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			before=document.querySelector("#textBox").innerHTML;
			data=data.replaceAll('\r','');
			if(before!=data){
				console.log("updated");
				document.querySelector("#textBox").innerHTML=data;
				var objDiv = document.getElementById("textBox");
				objDiv.scrollTop = objDiv.scrollHeight;
			}
		})
	};
	let interval=setInterval(updateBox,50);
	
	document.querySelector("#occomment").addEventListener("keyup",function(e){
		if (e.key=="Enter"&&this.value!=''){
			if (id=="" || id==null){
				alert("로그인 후 이용해주세요")
			} else {
				fetch("uploadOpenChat",{
					method:"POST",
					headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'},
					body:"id="+id+"&"+
					"occomment="+document.querySelector("#occomment").value
				})
				.then();
				updateBox();
				document.querySelector("#occomment").value="";
				document.querySelector("#occomment").placeholder="메세지 보내기";
			}
		}
	});
</script>
</body>
</html>