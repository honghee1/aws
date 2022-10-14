<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="slider sliderv2">
	<section>
		<h2>회원탈퇴</h2>
		<form action="delete.do" method="post">
			<label for="id">이메일</label>
			<input type="text" name="id">
			<select name="email">
				<option value="@google.com">@google.com</option>
				<option value="@naver.com">@naver.com</option>
				<option value="@nate.com">@nate.com</option>
				<option value="@hanmail.net">@hanmail.net</option>
			</select>
			<label for="userPasswd">비밀번호</label>
			<input type="password" name="userPasswd">
			<button>회원탈퇴</button>
		</form>
	</section>
</div>
</body>
</html>