<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Braga - my account</title>
<style type="text/css">
textarea{
	width : 100%;
	height : 300px;
}
td input[name="title"]{
	width : 100%;
}
.table-responsive table tbody tr td{
	text-align : left !important;
}
</style>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<!-- CSS ========================= -->
<!--bootstrap min css-->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!--owl carousel min css-->
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<!--slick min css-->
<link rel="stylesheet" href="assets/css/slick.css">
<!--magnific popup min css-->
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<!--font awesome css-->
<link rel="stylesheet" href="assets/css/font.awesome.css">
<!--ionicons css-->
<link rel="stylesheet" href="assets/css/ionicons.min.css">
<!--7 stroke icons css-->
<link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
<!--animate css-->
<link rel="stylesheet" href="assets/css/animate.css">
<!--jquery ui min css-->
<link rel="stylesheet" href="assets/css/jquery-ui.min.css">
<!--plugins css-->
<link rel="stylesheet" href="assets/css/plugins.css">
<!-- Main Style CSS -->
<link rel="stylesheet" href="assets/css/style.css">
<!--modernizr min js here-->

<script src="assets/js/vendor/modernizr-3.7.1.min.js"></script>
</head>

<body>
	<!--header area start-->
	<jsp:include page="template/main/main_header.jsp"></jsp:include>
	<!--header area end-->
	<!--header area end-->
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>My account</h3>
						<ul>
							<li><a href="/">home</a></li>
							<li>My account</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	<!-- my account start -->
	<section class="main_content_area">
		<div class="container">
			<div class="account_dashboard">
				<div class="row">
					<!-- Nav tabs start -->
					<div class="col-sm-12 col-md-3 col-lg-3">
						<div class="dashboard_tab_button">
							<ul role="tablist" class="nav flex-column dashboard-list">
								<li><a href="my-account.do" class="nav-link">회원정보수정</a></li>
								<li><a href="Allqnalist.do" class="nav-link active">QNA</a></li>
								<li><a href="#event" class="nav-link">쿠폰함</a></li>
								<li><a href="#chatting" class="nav-link">1:1 채팅</a></li>
								<li><a href="logout.do" class="nav-link">Log out</a></li>
							</ul>
						</div>
					</div>
					<!-- Nav tabs end -->
					<div class="col-sm-12 col-md-9 col-lg-9">
						<!-- Tab panes start -->
						<div class="tab-content dashboard_content">
							<div class="container-fluid">
								<div class="card shadow mb-4">
									<div class="card-body">
										<div class="table-responsive member-table">
											<h3>QnA</h3>
											<h2>글쓰기 페이지</h2>
											<form action="boardWrite.do" enctype="multipart/form-data"
												method="post">
												<table class="table table-bordered">
													<tr>
														<th>제목</th>
														<td><input type="text" name="title"></td>
													</tr>
													<tr>
														<th>작성자</th>
														<td><input type="hidden" name="memberid"
															value="${sessionScope.id}"> ${sessionScope.id }</td>
													</tr>
													<tr>
														<th style="vertical-align: top;">내용</th>
														<td><textarea name="qnacontent" id="content"></textarea></td>
													</tr>
													<tr>
														<td colspan="2" id="file_form">
															<p>
																<input type="file" name="file">
																<button type="button" id="plus">+</button>
																<button type="button" id="minus">-</button>
															</p>
															<p>
																<input type="file" name="file">
															</p>
															<p>
																<input type="file" name="file">
															</p>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<button type="button"
																onclick="location.href='Allqnalist.do'">목록보기</button>
															<button type="button"
																onclick="history.back();">뒤로가기</button>
															<button class="btn">글쓰기</button>
														</td>
													</tr>
												</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Tab panes end -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- my account end -->
	<!--footer area start-->
	<footer class="footer_widgets footer_padding">
		<div class="container">
			<div class="footer_bottom">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-7">
						<div class="footer_bottom_left">
							<div class="footer_logo">
								<a href="/"><img src="assets/img/logo/logo2.png" alt=""></a>
							</div>
							<div class="copyright_area">
								<p>
									Copyright © 2020 <a href="/">Braga</a>. <a
										href="http://www.bootstrapmb.com/" target="_blank">All
										rights reserved.</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="footer_paypal text-right"></div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--footer area end-->
	<!-- JS ============================================ -->
	<!--jquery min js-->
	<script src="assets/js/vendor/jquery-3.5.0.min.js"></script>
	<!--popper min js-->
	<script src="assets/js/popper.js"></script>
	<!--bootstrap min js-->
	<script src="assets/js/bootstrap.min.js"></script>
	<!--owl carousel min js-->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!--slick min js-->
	<script src="assets/js/slick.min.js"></script>
	<!--magnific popup min js-->
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<!--jquery countdown min js-->
	<script src="assets/js/jquery.countdown.js"></script>
	<!--jquery ui min js-->
	<script src="assets/js/jquery.ui.js"></script>
	<!--jquery elevatezoom min js-->
	<script src="assets/js/jquery.elevatezoom.js"></script>
	<!--isotope packaged min js-->
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<!-- Plugins JS -->
	<script src="assets/js/plugins.js"></script>
	<!-- Main JS -->
	<script src="assets/js/main.js"></script>
</body>

</html>