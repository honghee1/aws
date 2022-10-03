<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#confirm").click(function() {
			modalClose();
		});
		$("#modal-open").click(function() {
			$("#popup").css('display', 'flex').hide().fadeIn();
		});
		$("#close").click(function() {
			modalClose();
		});
		function modalClose() {
			$("#popup").fadeOut();
		}
	});
</script>
<style type="text/css">
.popup-wrap {
	background-color: rgba(0, 0, 0, .3);
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: none;
	padding: 15px;
}

.popup {
	width: 100%;
	max-width: 400px;
	border-radius: 10px;
	overflow: hidden;
	background-color: #264db5;
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
}

.popup-head {
	width: 100%;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.popup-body {
	width: 100%;
	background-color: #ffffff;
}

.body-content {
	width: 100%;
	padding: 30px;
}

.body-titlebox {
	text-align: center;
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
}

.body-contentbox {
	word-break: break-word;
	overflow-y: auto;
	min-height: 100px;
	max-height: 200px;
}

.popup-foot {
	width: 100%;
	height: 50px;
}

.pop-btn {
	display: inline-flex;
	width: 199px;
	height: 100%;
	justify-content: center;
	align-items: center;
	float: left;
	color: #ffffff;
	cursor: pointer;
}

.pop-btn.confirm {
	border-right: 1px solid #3b5fbf;
}

.pop-btn.close {
	border-right: 1px solid #3b5fbf;
}
</style>
</head>
<body>
	<div class="container">
		<div class="popup-wrap" id="popup">
			<div class="popup">
				<div class="popup-head">
					<span class="head-title">지점 목록</span>
				</div>
				<div class="popup-body">
					<div class="body-content">
						<div class="body-contentbox">
							<c:forEach var="dto" items="${requestScope.Cinemalist }">
								<a href="cinema-management.do?cinemacode=${dto.cinemacode }&name=${dto.cinemaname }">
									${dto.cinemaname }</a>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="popup-foot">
					<span class="pop-btn confirm" id="confirm">확인</span> <span
						class="pop-btn close" id="close">창 닫기</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>