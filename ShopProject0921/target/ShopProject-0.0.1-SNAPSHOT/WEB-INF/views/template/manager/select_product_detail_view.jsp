<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script type="text/javascript">
</script>
</head>
<body>
<h2>영화 상세 설정 페이지</h2>
		<form action="uploadproduct.do" method="post" enctype="multipart/form-data">
		<p>상품번호<input type="text" name="productno" value="${requestScope.product.productno }"placeholder="상품번호"></p>
		<p>상품명<input type="text" name="productname" value="${requestScope.product.productname }"placeholder="상품명"></p>
		<p>입고일<input type="text" name="receivingdate" value="${requestScope.product.receivngdate }"placeholder="입고일"></p>
		<p>입고량<input type="text" name="inquantity" value="${requestScope.product.inquantity }"placeholder="입고량"></p>
		<p>재고<input type="text" name="productstock" value="${requestScope.product.productstock }"placeholder="재고"></p>
		<p>카테고리<input type="text" name="category" value="${requestScope.product.categoryno }"placeholder="카테고리"></p>
		<p>사이즈<input type="text" name="sizaname" value="${requestScope.product.sizeno }"placeholder="사이즈"></p>
		<p>컬러<input type="text" name="color" value="${requestScope.product.colorno }"placeholder="컬러"></p>
		<p>단가<input type="text" name="cost" value="${requestScope.product.cost }"placeholder="단가"></p>
		<p>가격<input type="text" name="price" value="${requestScope.product.price }"placeholder="가격"></p>
		<c:forEach var="f" items="${requestScope.Filepath }">
							 <a href="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno}">
							${f.fileName}</a><br>
							<c:if test="${f.type =='image' }">
								<img src="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno}">
							</c:if> 
					</c:forEach> 
		<p><input type="file" name="file1">
		   <button type="button" id="plus">+</button>
		   <button type="button" id="minus">-</button>
	    </p>
		<p><input type="file" name="file2"></p>
		<p><input type="file" name="file3"></p>
		<p><input type="hidden" name="update" value=${requestScope.product.productno }></p>
		<p><button>이미지 업로드</button></p>
		<p><button>저장</button></p><p><button>뒤로가기</button></p>
	</form>
</body>
</html>