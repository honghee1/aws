<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Braga - Contact</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<!-- CSS ========================= -->
<!--bootstrap min css-->
<link rel="stylesheet" href="assets/css/bootstrap.min.btn.css">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function(){
		//*, *::after, *::before
		$('.map_wrap').children().css('box-sizing','content-box');
		$('.map_wrap').children().children().css('box-sizing','content-box');
		$('.map_wrap').children().children().children().css('box-sizing','content-box');
		
	});
</script>

</head>
<body>
	<!--header area start-->
	<jsp:include page="template/main/main_header.jsp"></jsp:include>
	<!--header area end-->
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>contact</h3>
						<ul>
							<li><a href="index.html">home</a></li>
							<li>contact us</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	<!--contact map start-->

	<div class="map_wrap">
		<div id="map" style="width: 70%; height: 600px; margin : 100px auto;border-radius:10px;"></div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b76a0ecb195913e883fb1984fe078269"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>
	<!--contact map end-->
	<!--contact area start-->
	<div class="contact_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="contact_message content">
						<h3>contact us</h3>
						<p>Claritas est etiam processus dynamicus,qui sequitur
							mutationem consuetudium lectorum. Mirum est notare quam littera
							gothica,quam nunc putamus parum claram anteposuerit litterarum
							formas human. qui sequitur mutationem consuetudium lectorum.
							Mirum est notare quam</p>
						<ul>
							<li><i class="fa fa-fax"></i>Address:No 40 Baria Sreet 133/2
								NewYork City</li>
							<li><i class="fa fa-phone"></i><a href="#">Infor@roadthemes.com</a></li>
							<li><i class="fa fa-envelope-o"></i><a href="">0(1234)
									567 890</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="contact_message form">
						<h3>Tell us your project</h3>
						<form id="contact-form" method="POST" action="assets/mail.php">
							<p>
								<label>Your Name(required)</label><input name="name"
									placeholder="Name *" type="text">
							</p>
							<p>
								<label>Your Email(required)</label><input name="email"
									placeholder="Email *" type="email">
							</p>
							<p>
								<label>Subject</label><input name="subject"
									placeholder="Subject *" type="text">
							</p>
							<div class="contact_textarea">
								<label>Your Message</label>
								<textarea placeholder="Message *" name="message"
									class="form-control2"></textarea>
							</div>
							<button type="submit">Send</button>
							<p class="form-messege"></p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--contact area end-->
	<!--footer area start-->
	<footer class="footer_widgets footer_padding">
		<div class="container">
			<div class="footer_bottom">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-7">
						<div class="footer_bottom_left">
							<div class="footer_logo">
								<a href="index.html"><img src="assets/img/logo/logo2.png"
									alt=""></a>
							</div>
							<div class="copyright_area">
								<p>
									Copyright Â© 2020 <a href="index.html">Braga</a>. <a
										href="http://www.bootstrapmb.com/" target="_blank">All
										rights reserved.</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="footer_paypal text-right">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--footer area end-->
	<!-- JS ============================================ -->
	<!--map js code here-->
	<script
		src="http://www.google.cn/maps/api/js?sensor=false&libraries=geometry&v=3.22&key=AIzaSyChs2QWiAhnzz0a4OEhzqCXwx_qA9ST_lE"></script>
	<script src="https://www.google.com/jsapi"></script>
	<script src="assets/js/map.js"></script>
	<!--jquery min js-->
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