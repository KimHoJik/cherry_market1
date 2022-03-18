<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsUploadForm</title>
</head>
<body>
	<form id="main" action="${pageContext.request.contextPath }/goodsUpload.do" method="post" enctype="multipart/form-data">
		<label for="title">제목</label>
		<input type="text" id="title" name="title"/>
		<br />
		<label for="price">가격</label>
		<input type="number" id="price" name="price"/>
		<br />
		<label for="category">카테고리</label>
		<select name="category" id="category">
			<option value="선택">선택</option>
			<option value="디지털지지">디지털기기</option>
			<option value="생활가전">생활가진</option>
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
		<br />
		<label for="filenames">사진</label>
		<input multiple="multiple" type="file" name="images" id="images" multiple
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		<br />
		<textarea id="explain" name="explain"></textarea>
		<button id="btn">등록</button>
	</form>
<script>
	
	document.querySelector("#btn").addEventListener("click",function(e){
		e.preventDefault();
		if(document.querySelector("#title").value==""){
			alert("제목을 입력하세요");
		}else if(document.querySelector("#price").value==""){
			alert("가격을 입력하세요");
		}else if(document.querySelector("#category").value=="선택"){
			alert("카테고리를 설정하세요");
		}else if(document.querySelector("#explain").value==""){
			alert("제품설명을 입력하세요");
		}else{
			document.querySelector("#main").submit();
		}
		
	});
</script>
</body>
</html>