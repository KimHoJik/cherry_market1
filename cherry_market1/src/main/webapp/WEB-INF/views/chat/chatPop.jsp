<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
<style>
	*{ margin: 0; padding: 0; }
 
	.chat_wrap .header {position:fixed; font-size: 14px; width:100%;padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
	.chat_wrap .chat { padding:50px 5px 110px 5px; overflow-y:auto;}
	.chat_wrap .chat ul { width: 100%; list-style: none; }
	.chat_wrap .chat ul li { width: 100%; }
	.chat_wrap .chat ul li.left { text-align: left; }
	.chat_wrap .chat ul li.right { text-align: right; }
	 
	.chat_wrap .chat ul li > div { font-size: 13px;  }
	.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
	.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
	 
	.input-div {  position: fixed; bottom: 0; width: 99%; background-color: #FFF; text-align: center; border: 1px solid #F18C7E; }
	.input-div > textarea { resize:none; width: 94%; height: 80px; border: none; padding: 10px; outline:none; }
</style>
</head>
<body>
<div class="chat_wrap">
    <div class="header">
        CHAT
    </div>
    <div class="chat">
        <ul id="chatbox">
            <!-- 동적 생성 -->
        </ul>
    </div>
</div>
<div class="input-div">
    <textarea id="text" placeholder="Press Enter for send message."></textarea>
</div>
<script>
	var before;
	let updateBox=function(){
		fetch("updatePerChatBox.do",{
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
				window.scrollTo(0,document.body.scrollHeight);
			}
		})
	}
	let interval=setInterval(updateBox,100);
	document.querySelector("#text").addEventListener("keyup",function(e){
		if (e.key=="Enter"&&this.value!="\n"){
			fetch("uploadPerChatLog.do",{
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