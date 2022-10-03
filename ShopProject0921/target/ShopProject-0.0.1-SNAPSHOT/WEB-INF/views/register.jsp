<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Braga - login</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>register</h3>
						<ul>
							<li><a href="index.html">home</a></li>
							<li>Login</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	<!-- customer login start -->
	<div class="customer_login">
		<div class="container">
			<div class="row">
				<!--register area start-->
				<div class="col-lg-6 col-md-6">
					<div class="account_form register">
						<script>
						 var id_chk_flag = false ;
						$(function(){
							$('.registerfrom').submit(function(r){
				                if(!id_chk_flag){
				                    r.preventDefault();
				                    }else if($('.id_null').val().length==0){
				                    	r.preventDefault();
				                    	alert("아이디 입력하세요");
				                    }else if($('.pw_null').val().length==0){
				                    	r.preventDefault();
				                    	alert("비밀번호를 입력하세요");
				                    }else if($('.name_null').val().length==0){
				                    	r.preventDefault();
				                    	alert("이름를 입력하세요");
				                    }else if($('.address_null').val().length==0){
				                    	r.preventDefault();
				                    	alert("주소를 입력하세요");
				                    }else if($('.birthDate_null').val().length==0){
				                    	r.preventDefault();
				                    	alert("생일를 체크하세요");
				                    }else if($('.tel_null').val().length==0){
				                    	r.preventDefault();
				                    	alert("전화번호를 입력하세요");
				                    }else if($('.gender_null').val().length==0){
				                    	r.preventDefault();
				                    }
				              
				                  
				            });
							$('.register_id_chk_btn').click(function(){
				                var d = 'memberId='+$('.id_chk').val();
				                $.ajax({
				                    url : 'idCheck.do',
				                    data : d,
				                    success : function(r){
				                        if(r==1){
				                            id_chk_flag = true;
				                            var id_p = $('.id_ckp');
				                            id_p.css('color','blue');
				                            id_p.html('아이디가 사용 가능 합니다.');
				                        } else {
				                            id_chk_flag = false;
				                            var id_p = $('.id_ckp');
				                            id_p.css('color','red');
				                            id_p.html('아이디가 중복됩니다.');
				                            
				                        }
				                        console.log(r);
				                    }
				                });
				            });
						});
						
						</script>

						<h2>Register</h2>
						<form action="register.do" class="registerfrom">
							<p>
								<label>Email address <span>*</span></label><input type="text"
									name="memberId" class="id_chk id_null">
								<button class="register_id_chk_btn" type="button">아이디
									중복확인</button>
							</p>

							<p class="id_ckp"></p>
							<p>
								<label>Passwords <span>*</span></label><input type="password"
									name="pw" class="pw_null">
							</p>
							<p>
								<label>name <span>*</span></label><input type="text"
									name="memberName" class="name_null">
							</p>
							<p>
								<label>address <span>*</span></label><input type="text"
									name="address" class="address_null">
							</p>
							<p>
								<label>birthdate <span>*</span></label><input type="date"
									name="birthDate" class="birthDate_null">
							</p>
							<p>
								<label>MEMBERTELNO <span>*</span></label><input type="tel"
									name="memberTelNo" class="tel_null">
							</p>

							<p>
								<label>gender <span>*</span></label><select name="gender"
									class="gender_null">
									<option value="M">남</option>
									<option value="F">여</option>
								</select>
							</p>
							<div class="login_submit">
								<button type="submit">Register</button>
							</div>
						</form>
					</div>
				</div>
				<!--register area end-->
			</div>
		</div>
	</div>
	<!-- customer login end -->
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
									Copyright ?2020 <a href="index.html">Braga</a>. <a
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
