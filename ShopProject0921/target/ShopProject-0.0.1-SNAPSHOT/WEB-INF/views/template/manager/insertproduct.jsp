<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function() {
		var count = 3;
		$("#plus").click(function() {
			if (count == 5)
				return;
			count++;
			$("#file_form1").append("<p><input type='file' name='file'></p>");
		});
		$("#minus").click(function() {
			if (count == 1)
				return;
			$(this).parent().children("p").last().remove();
			count--;
		});
	});
</script>
</head>
<body>
	<form id="file_form" action="insertproduct.do" method="post"
		enctype="multipart/form-data">
		<p>
			제품 명<input type="text" name="productname" value="" placeholder="재품명">
		</p>
		<label>카테고리</label><select class="select_option color" id="color2"
			name="categoryno"><option selected value="0">category
				in option</option>
			<c:forEach items="${requestScope.categorylist}" var="categorylist">
				<option value="${categorylist.categoryno}">${categorylist.categoryname}</option>
			</c:forEach>
		</select>
		<br>
		<label>사이즈</label><select class="select_option" id="sizes"
			name="sizeno"><option selected value="0
								">size
				in option</option>
			<c:forEach items="${requestScope.sizelist}" var="sizeslist">
				<option value="${sizeslist.sizeno}">${sizeslist.sizekind}</option>
			</c:forEach>
		</select>
		<br>
		 <label>컬러</label><select class="select_option color" id="color2"
			name="colorno"><option selected value="0">color
				in option</option>
			<c:forEach items="${requestScope.colorlist}" var="colorlist">
				<option value="${colorlist.colorno}">${colorlist.colorname}</option>
			</c:forEach>
		</select>
		<p>
			제품 단가<input type="text" name="cost" value="" placeholder="단가()">
		</p>
		<p>
			제품 가격<input type="text" name="price" value="" placeholder="가격()">
		</p>
		<p>
			제품 수량<input type="text" name="productstock" value=""
				placeholder="수량()">
		</p>
		<p>
			입고일<input type="text" name="receivngdate" value="" placeholder="입고일">
		</p>
		<p>
			입고량<input type="text" name="inquantity" value="" placeholder="입고량">
		</p>
		<button>업로드</button>
		<div id="file_form1">
			<button type="button" id="plus">+</button>
			<button type="button" id="minus">-</button>
			<p>
				<input type="file" name="file">
			</p>
			<p>
				<input type="file" name="file">
			</p>
			<p>
				<input type="file" name="file">
			</p>
		</div>
	</form>
</body>
</html>