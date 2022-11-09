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
	#kakaoLogin {
		width: 180px;
		height: 40px;
		background-color: rgb(254, 229, 0);
		border-radius: 5px;
	}
	#naver_id_login {
		width: 180px;
		height: 40px;
		background-color: rgb(3, 199, 90);
		border-radius: 5px;
	}
	
</style>
</head>

<body>
<!--preloading-->
	<div id="preloader">
		<img class="logo" src="images/logo1.png" alt="" width="119"
			height="58">
		<div id="status">
			<span></span><span></span>
		</div>
	</div>
	<!--end of preloading-->
	<!--login form popup-->
	<div class="login-wrapper" id="login-content">
		<div class="login-content">
			<a href="#" class="close">x</a>
			<h3>Login</h3>
			<form method="post" action="memberlogin.do">
				<div class="row">
					<label for="이메일">이메일 :<input type="text"
						name="userEmail" id="username" placeholder="이메일을 입력하세요" required="required" /></label>
				</div>
				<div class="row">
					<label for="password"> 비밀번호 :<input type="password"
						name="userPasswd" id="password" placeholder="******" required="required" /></label>
				</div>
				<div class="row">
					<div class="remember">
						<div>
							<input type="checkbox" name="remember" value="Remember me"><span>Remember
								me</span>
						</div>
						<div>
							<a href="findIdView.do">아이디 찾기</a> / <a href="findPasswdView.do">비밀번호 찾기</a>
						</div>
					</div>
				</div>
				<div class="row">
					
					<button type="submit">Login</button>

				</div>
			</form>
			<div class="row">
				<p>Or via social</p>
				<div class="social-btn-2">
					<a class="fb" href="https://kauth.kakao.com/oauth/authorize?client_id=eaee1a53496951d5c0e620e3d23f5014&redirect_uri=http://15.165.77.144:8080/login&response_type=code&scope=account_email" id="kakaoLogin">
					<i class="kakaoLogo"><img src="images/ico-kakao.png" style="width: 30px; height: 30px;"></i>kakao</a>
					<a class="tw" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=jgPU1Ccmjpw1Cg57ZBip&redirect_uri=http://15.165.77.144:8080/naverLogin.do" id="naver_id_login">
					<i class="naverlogor"><img src="images/naver_icon1.png" style="width: 30px; height: 30px;"></i>naver</a>
				</div>
			</div>
		</div>
	</div>
	<!--end of login form popup-->
	<!--signup form popup-->
	<div class="login-wrapper" id="signup-content">
		<div class="login-content">
			<a href="#" class="close">x</a>
			<h3>sign up</h3>
			<form method="post" action="signup.php">
				<div class="row">
					<label for="username-2">Username:<input type="text"
						name="username" id="username-2" placeholder="Hugh Jackman"
						pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{8,20}$" required="required" /></label>
				</div>
				<div class="row">
					<label for="email-2"> your email:<input type="password"
						name="email" id="email-2" placeholder=""
						pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
						required="required" /></label>
				</div>
				<div class="row">
					<label for="password-2"> Password:<input type="password"
						name="password" id="password-2" placeholder=""
						pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
						required="required" /></label>
				</div>
				<div class="row">
					<label for="repassword-2"> re-type Password:<input
						type="password" name="password" id="repassword-2" placeholder=""
						pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
						required="required" /></label>
				</div>
				<div class="row">
					<button type="submit">sign up</button>
				</div>
			</form>
		</div>
	</div>
	<!--end of signup form popup-->
	<!-- BEGIN | Header -->
	<header class="ht-header full-width-hd">
		<div class="row">
			<nav id="mainNav" class="navbar navbar-default navbar-custom">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header logo">
					<div class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<div id="nav-icon1">
							<span></span><span></span><span></span>
						</div>
					</div>
					<a href="main.do"><img class="logo" src="images/logo1.png"
						alt="" width="119" height="58"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse flex-parent"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav flex-child-menu menu-left">
						<li class="hidden"><a href="#page-top"></a></li>
						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1"
							data-toggle="dropdown" data-hover="dropdown">movies <i
								class="fa fa-angle-down" aria-hidden="true"></i></a>
						<ul class="dropdown-menu level1">
								<li><a href="/NowShowingMovieList.do">현재 상영작</a></li>
								<li><a href="homev2.html">상영 예정작</a></li>
								<li><a href="homev3.html">무비차트</a></li>
							</ul></li>
						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1"
							data-toggle="dropdown" data-hover="dropdown"> 극장<i
								class="fa fa-angle-down" aria-hidden="true"></i></a>
						<ul class="dropdown-menu level1">
								<!-- <li class="dropdown"><a href="#">about us <i class="fa fa-caret-right" aria-hidden="true"></i></a><ul class="dropdown-menu level2"><li><a href="aboutv1.html">About Us 01</a></li><li><a href="aboutv2.html">About Us 02</a></li></ul></li>-->
								<li><a href="moviegrid.html">극장 소개</a></li>
								<li><a href="moviegridfw.html">지점 찾기</a></li>
							</ul></li>
						<li class="dropdown first"><a href="reserveView.do"	class="btn btn-default dropdown-toggle lv1"
							> 예매</a>
						</li>
						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1"
							data-toggle="dropdown" data-hover="dropdown"> 고객센터 <i
								class="fa fa-angle-down" aria-hidden="true"></i></a>
						<ul class="dropdown-menu level1">
								<li><a href="qnaWriteView.do">1:1문의</a></li>
								<li><a href="faqView.do">자주 묻는 질문</a></li>
							</ul></li>
						
					</ul>
					<ul class="nav navbar-nav flex-child-menu menu-right">
						
						<%
						boolean flag = false;
						if(session.getAttribute("login") != null) {
							flag = (boolean)session.getAttribute("login");							
						} 
						if(flag){
						%>
						<li><a href="memberMypage.do"><span>${sessionScope.dto.userName }</span>님의 마이페이지</a></li>
						<c:if test="${sessionScope.userEmail == 'test' }">
							<li><a href="memberlogout.do">로그아웃</a></li>
							<li><a href="allMemberView">전체회원관리</a></li>
						</c:if>
						<c:if test="${sessionScope.userEmail != 'test' }">
							<li><a href="memberlogout.do">로그아웃</a></li>
							<li><a href="updateView.do">회원정보수정</a></li>
						</c:if>
						<%
						} else {
						%>
							<li class="loginLink"><a href="loginView.do">LOG In</a></li>
							<li class="btn"><a href="registerView.do">sign up</a></li>
						<%
						}
						%>
						<%-- else if(kflag) {
						%>	
							<li><a><span>${sessionScope.userId }님이 로그인 하셨습니다.</span></a></li>
							<li><a href="logout">로그아웃</a></li>
						<% 
						} else if(nflag) {
						%>	
							<li><a><span>${sessionScope.name }님이 로그인 하셨습니다.</span></a></li>
							<li><a href="logout">로그아웃</a></li>
						<% 
						} --%>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
			<!-- search form -->
		</div>
	</header>
</body>
</html>