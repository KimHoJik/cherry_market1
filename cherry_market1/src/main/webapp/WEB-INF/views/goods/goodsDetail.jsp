<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsDetail</title>
</head>
<body>
	<p>${dto.num}</p>
	<p>${dto.id }</p>
	<p>${dto.priceWon }</p>
	<p>${dto.title }</p>
	<p>${dto.isSaled }</p>
	<p>${dto.category }</p>
	<p>${dto.viewCount }</p>
	<p>${dto.explain }</p>
	<p>${dto.regdate }</p>
	<c:forEach var="tmp" items="${imageList }">
		<p>${tmp }</p>
	</c:forEach>
	
	<c:choose>
		<c:when test="${dto.id eq sessionScope.id }">
			<button type="button" onClick="location.href='sell.do?num=${dto.num}">판매완료</button>
			<button type="button" onClick="location.href='delete.do?num=${dto.num}'">상품 내리기</button>
		</c:when>
		<c:otherwise>
			<button id="putWishList">관심상품 등록</button>
			<form name="perChat" id="perChat" method="post" >
				<input type="hidden" name="num" value="${dto.num }"/>
				<input type="hidden" name="buyer" value="${sessionScope.id}"/>
				<input type="hidden" name="saller" value="${dto.id }"/>
				<button id="chatPop">판매자와 대화하기</button>
			</form>
			
		</c:otherwise>
	</c:choose>
<script>
	document.querySelector("#chatPop").addEventListener("click",function(){
		let form=document.perChat
		let pop_title="chat";
		window.open("",pop_title,"width = 500, height = 700, top = 100, left = 200, location = no");
		form.action="${pageContext.request.contextPath }/private/chatPop.do";
		form.target=pop_title;
		form.submit();
	})
</script>
</body>
</html>