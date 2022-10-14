<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.result-div{
	display: flex;
	flex-flow: row nowrap;
}
.result-title{
	font-family: "Dosis", sans-serif;
    font-size: 18px;
    color: white;
    font-weight: bold;
    text-transform: uppercase;
    margin-bottom: 30px;
    padding-bottom: 15px;
    border-bottom: 1px solid #405266;
    padding-left: 10px;
}
.result-left{
	width: 500px;
	min-width: 500px;
	border: 1px solid white;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 20px;
}
.division{
	width: 100px;
	color: #4280bf;
}
.tiket-table{
	border-collapse: collapse;
	color: #abb7c4;
}
.data-copy{
	background-color: #dd003f;
	border-radius: 10px;
	color: white;
	padding: 5px 20px;
	margin-left: 141px;
}
.data-copy:focus{
	background-color: #dd003f;
	border-radius: 10px;
	color: white;
	padding: 5px 20px;
	margin-left: 141px;
}
.result-right{
	width: 100%;
	padding: 20px 50px;
}
.result-text{
	color: white;
	font-size: 35px;
	font-family: 'Jua', sans-serif;
	text-align: center;
}
.text-success{
	color: #4280bf;
}
.text-result{
	color: #dd003f;
}
.text-thank{
	font-size: 24px;
}
.check-icon{
	width: 23px;
}
.btn-move{
	font-family: 'Jua', sans-serif;
	width: 180px;
	background-color: #dd003f;
	border-radius: 10px;
	color: white;
	padding: 5px 20px;
	display: inline-block;
	text-align: center;
	margin-left: calc((100% - 360px) / 3);
}
.btn-move:hover{
	color: white;
}
.btn-reserve{
	font-family: 'Jua', sans-serif;
	width: 180px;
	background-color: #fb5607;
	border-radius: 10px;
	color: white;
	padding: 5px 20px;
	display: inline-block;
	text-align: center;
	margin-left: calc((100% - 360px) / 3);
}
.btn-reserve:hover{
	color: white;
}
.result-btn{
	margin-top: 258px;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="buster-light">
		<div class="hero common-hero">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="hero-ct">
							<h1>Reserve Fail</h1>
							<ul class="breadcumb">
								<li class="active"><a href="#">Home</a></li>
								<li><span class="ion-ios-arrow-right"></span>Reserve Fail</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-single">
		<div class="container">
			<div class="row">
					<div class="result-div">
						<div class="result-right">
							<div class="result-text">
							<div>결제가 <span class="text-result">실패</span>하였거나 <span class="text-result">취소</span>되었습니다..</div>
							<div class="text-thank">예매를 다시 진행해주세요</div>
							</div>
							<div class="result-btn">
								<a href="main.do" class="btn-move">HOME</a><a href="reserveView.do" class="btn-reserve">다시 예매 하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<script>

	$(".total-price").html(String(${requestScope.resultlist[0].totalPrice }).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
	
	var info = "";
		info += "예매 코드=" + ${requestScope.resultlist[0].bookingCode } + "&";
		info += "이메일=" + "${requestScope.resultlist[0].email }" + "&";
		info += "영화=" + "${requestScope.resultlist[0].title }" + "&";
		info += "극장=" + "Hello-Movie" + "${requestScope.resultlist[0].cinemaName }" + "점 / " + "${requestScope.resultlist[0].screenName }" + "&"; 
		info += "일시=" + "${requestScope.resultlist[0].movieDate } " + "${requestScope.resultlist[0].startTime } ~ ${requestScope.resultlist[0].endTime }" + "&";
		info += "좌석=" + $(".total-seat").html().replace(/\s/gi, "").replaceAll("&nbsp;","") + "&";
		info += "결재 금액=" + $(".total-price").html();
		
	$(".tiket-info").val(info);
	
	// 복사 버튼 함수
	$('.data-copy').click(function() {

	    $('.tiket-info').attr('type', 'text');
	    $('.tiket-info').select();
	    
	    var copy = document.execCommand('copy');
	    
	    $('.tiket-info').attr('type', 'hidden');
	    
	    if(copy) {
	    	alert("티켓 내용이 클립보드에 복사되었습니다.");
	    }
	});
</script>
</body>
</html>