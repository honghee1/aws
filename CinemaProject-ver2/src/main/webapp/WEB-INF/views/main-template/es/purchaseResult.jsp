<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
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
							<h1>Reserve Success</h1>
							<ul class="breadcumb">
								<li class="active"><a href="#">Home</a></li>
								<li><span class="ion-ios-arrow-right"></span>Reserve Success</li>
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
				<div class="col-md-12 col-sm-12 col-xs-12">
					</div>
					<div class="topbar-filter fw">
						<div class="reserve-container">
							<div>${requestScope.resultlist[0].bookingCode }</div>
							<div>${requestScope.resultlist[0].email }</div>
							<div>${requestScope.resultlist[0].cinemaName }</div>
							<div>${requestScope.resultlist[0].screenName }</div>
							<div>${requestScope.resultlist[0].startTime }</div>
							<div>${requestScope.resultlist[0].endTime }</div>
							<div>${requestScope.resultlist[0].title }</div>
							<c:forEach var="r" items="${requestScope.resultlist }">
									<p>${r.seatNo }번석</p>
							</c:forEach>
						</div>
					</div>
					<div class="booking-container">
						<button type="button" class="booking-btn redbtn">예매하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>

	</script>
</body>
</html>