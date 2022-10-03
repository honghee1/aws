<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btn_find").click(function(){
			console.log("dd");
			var d = "userName=" + $("#userName").val() + "&userTel=" + $("#userTel").val();
			console.log(d);
			$.ajax({
				url: "findId.do",
				data: d,
				dataType: "json",
				success: function(r){
					console.log(r);
					var tag = "";
					tag += '<input type="text" name="userEmail" placeholder="'+ r[0].userEmail +'">';
					$(".find_result").html(tag);
				}
			})
		})
	});
</script>

</head>
<body>
	<div class="slider sliderv2">
		<div class="qna-container">
			<div class="find-container">
				<h2>아이디 찾기</h2>
				<div class="input_wrap">
					<div class="semi_title">가입정보를 입력하시면 아이디를 확인하실 수 있습니다.</div>
					<div class="login_area">
						<div class="input_area">
							<div><input type="text" name="userName" id="userName" placeholder="이름" /></div>
							<div><input type="text" name="userTel" id="userTel" placeholder="휴대폰번호는 -를 제외하고 입력해주세요" /></div>
							<div class="find_result"></div>
						</div>
						<div class="btn_area">
							<button id="btn_find">아이디 찾기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>