<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../css/plugins.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div class="overlay openform">
		<div class="login-content">
			<a href="#" class="close">x</a>
			<h3>Login</h3>
			<form method="post" action="/admin/login">
				<div class="row">
					<label for="이메일">아이디 :<input type="text"
						name="userEmail" id="userEmail" placeholder="아이디을 입력하세요" required="required" /></label>
				</div>
				<div class="row">
					<label for="password"> 비밀번호 :<input type="password"
						name="password" id="password" placeholder="******" required="required" /></label>
				</div>
				<div class="row">
					<button type="submit">Login</button>
				</div>
			</form>
		</div>
	
	</div>
<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/plugins2.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>