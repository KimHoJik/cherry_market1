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
	<p>상품번호:${dto.num}</p>
	<p>판매자:${dto.id }</p>
	<p>가격:${dto.priceWon }</p>
	<p>제목:${dto.title }</p>
	<p>판매여부:${dto.isSaled }</p>
	<p>카테고리:${dto.category }</p>
	<p>조회수:${dto.viewCount }</p>
	<p>상품설명:${dto.explain }</p>
	<p>업로드 시간:${dto.regdate }</p>
	<p>사진들</p>
	<c:forEach var="tmp" items="${imageList }">
		<p>사진:${tmp }</p>
	</c:forEach>
	
	<c:choose>
		<c:when test="${dto.id eq sessionScope.id }">
			<button type="button" onClick="location.href='sell.do?num=${dto.num}">판매완료</button>
			<button type="button" onClick="location.href='delete.do?num=${dto.num}'">상품 내리기</button>
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