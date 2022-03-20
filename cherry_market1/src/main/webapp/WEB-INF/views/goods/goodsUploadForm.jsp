<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsUploadForm</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goodsuploadform.css" />

</head>
<body>
<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
	<a href="#myModal" class="trigger-btn" data-toggle="modal">
	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
  		<path d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
  		<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
	</svg>
	상품 등록 하기
	</a>
</div>
<!-- test -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog contact-modal">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">상품 등록하기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
                <form id="main" action="${pageContext.request.contextPath }/goodsUpload.do" method="post" enctype="multipart/form-data">
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
					</div>	
                    <div class="form-group">
                        <label for="inputMessage">Message</label>
                        <textarea class="form-control" id="explain" name="explain" rows="4"></textarea>
                    	<label for="filenames">상품 사진 등록</label>
						<input multiple="multiple" type="file" name="images" id="images" multiple
						accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
                    </div>
                    
                    <button id="btn" class="btn btn-success">등록</button>
                    <button class="btn btn-danger"  data-dismiss="modal" value="Cancel">취소</button>
                	
                </form>
			</div>
		</div>
	</div>
</div>
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