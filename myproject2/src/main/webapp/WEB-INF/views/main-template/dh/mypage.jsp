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
	.mypage-container {
		width: 1200px;
		margin: 100px auto;
		display: flex;
		flex-direction: row;
		/* border-left: 1px solid white;
		border-right: 1px solid white; */
	}
	.title {
		color: white;
		margin: 30px;
	}
	.my-profile {
		width: 400px;
		margin: 50px auto;
		padding: 30px 0px;
		border-top: 1px solid white;
		border-bottom: 1px solid white;
	}
	.my-profile p {
		padding: 20px 0px;
	}
	.member-content {
		width: 700px;
		margin: 50px auto;
		padding-top: 50px;
		border-top: 1px solid white;
		border-bottom: 1px solid white;
	}
	.my-box {
		height: 40px;
		padding: 10px 0px;
		display: flex;
		justify-content: space-around;
		border: 1px solid white;
	}
</style>
</head>
<body>
<div class="slider sliderv2">
	<div class="mypage-container">
		<div class="my-profile">
			<div class="title">
				<h2>${requestScope.mdto.userName }님의 마이페이지</h2>
			</div>
			<div>
				<p>${requestScope.mdto.userName }님 기본정보</p>
				<a href="updateView.do">회원정보수정</a> || <a href="deleteView.do">회원탈퇴</a>
			</div>
			<div>
				<p><strong>이메일 :</strong> ${requestScope.mdto.userEmail }</p>
				<p><strong>사용가능 포인트 :</strong> ${requestScope.mdto.point }</p>
				<p><strong>전화번호 :</strong> ${requestScope.mdto.userTel }</p>
			</div>
		</div>
		<div class="member-content">
			<div class="my-box">
				<p>나의 문의내역</p>
			</div>
				<table>
					<tr>
						<td><p>제목</p></td>
						<td><p>문의일</p></td>
					</tr>
					<c:forEach var="qna" items="${requestScope.qdto }">
						<tr>
							<td><a href="qnaDetailView.do?qno=${qna.qno }">${qna.qnaTitle }</a></td>
							<td><p>${qna.qnaDate }</p></td>
						</tr>
					</c:forEach>
				</table>
			<div class="my-box">
				<p>나의 예매내역</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>