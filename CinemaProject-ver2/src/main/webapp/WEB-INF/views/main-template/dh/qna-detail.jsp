<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	.qnaDetail-container {
		width: 1200px;
		margin: 0 auto;
	}
	.qnaDetail-container table {
		width: 700px;
		margin: 0 auto;
	}
	.qnaDetail-container table th {
		width: 150px;
	}
	.qnaDetail-container table td {
		padding-left: 10px;
	}
	.content {
		height: 100px;
		border: none;
		background-color: rgb(0 13 39);
		color: white;
		resize: none;
	}
</style>
</head>
<body>
	<div class="slider sliderv2">
		<div class="qnaDetail-container">
			<table>
				<tr>
					<th><p>문의글 제목 : </p></th>
					<td><p>${requestScope.qdto.qnaTitle }</p></td>
				</tr>
				<tr>
					<th><p>문의 유형 : </p></th>
					<td><p>${requestScope.qdto.qnaQuiry }</p></td>
				</tr>
				<tr>
					<th><p>문의 내용 : </p></th>
					<td><textarea class="content">${requestScope.qdto.qnaContent }</textarea> </td>
				</tr>
				<tr>
					<th><p>답변 내용 : </p></th>
					<td><textarea class="content">${requestScope.qdto.response }</textarea></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>