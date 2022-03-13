<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
<style>
	#inputBox{
		position:fixed;
		top:450px;
	}
	#chatbox{
		width:500px;
		height:450px;
		overflow: auto;
		overflow-y:450px;
	}
</style>
</head>
<body>
<div class="container" id="app">
	<div id="chatbox">
		
	</div>
	<div id="inputBox">
		<input type="text" id="text" name="text" placeholder="메세지 보내기"/>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	var before;
	let updateBox=function(){
		fetch("updatePerChatBox",{
			method:"POST",
			headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
			body:"num=${param.num}&saller=${param.saller}&buyer=${param.buyer}"
		})
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			before=document.querySelector("#chatbox").innerHTML;
			data=data.replaceAll('\r','');
			if(before!=data){
				document.querySelector("#chatbox").innerHTML=data;
				var objDiv = document.getElementById("chatbox");
				objDiv.scrollTop = objDiv.scrollHeight;
				console.log("scrolldown");
			}
		})
	}
	let interval=setInterval(updateBox,100);
	document.querySelector("#text").addEventListener("keyup",function(e){
		if (e.key=="Enter"){
			fetch("uploadPerChatLog",{
				method:"POST",
				headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
				body:"pccomment="+document.querySelector("#text").value+"&num=${param.num}&saller=${param.saller}&buyer=${param.buyer}"
			})
			.then();
			updateBox();
			document.querySelector("#text").value="";
			document.querySelector("#text").placeholder="메세지 보내기";
		}
	});
</script>
</body>
</html>