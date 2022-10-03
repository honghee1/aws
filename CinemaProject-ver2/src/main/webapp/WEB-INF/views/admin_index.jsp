<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../images/favicon.ico">
<title>Crypto Admin - Dashboard Blank Page</title>
<!-- Bootstrap 4.0-->
<link rel="stylesheet"
	href="../../../assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Bootstrap extend-->
<link rel="stylesheet" href="../../css/bootstrap-extend.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../css/master_style.css">
<!-- Crypto_Admin skins -->
<link rel="stylesheet" href="../../css/skins/_all-skins.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]><script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script><script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body class="hold-transition skin-yellow sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">
		<jsp:include page="admin-template/header.jsp" flush="false"/> 
		<!-- Left side column. contains the sidebar  사이드 바-->
		  <div class="container-fluid">
                 <jsp:include page="admin-template/sidebar_menu.jsp" flush="false"/> 
          </div>
		<!-- =============================================== -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>${pagetitle }</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#"><i
							class="fa fa-dashboard"></i>Home</a></li>
					<li class="breadcrumb-item"><a href="#">Examples</a></li>
					<li class="breadcrumb-item active">Blank page</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<!-- <div class="box-header with-border">
						<h3 class="box-title">Title</h3>
						<div class="box-tools pull-right">
						</div>
					</div> -->
					<div class="box-body"><jsp:include page="admin-template/${page }"></jsp:include> </div>
					<!-- /.box-body -->
					<div class="box-footer">Footer</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
                 <jsp:include page="admin-template/footer.jsp" flush="false"/> 
			<jsp:include page="admin-template/hh/select_cinema_branch.jsp" flush="false"/>
	</div>
	<!--지점 선택 팝업  -->
	<!-- ./wrapper -->
	<!-- jQuery 3 -->
	<script
		src="../../../assets/vendor_components/jquery/dist/jquery.min.js"></script>
	<!-- popper -->
	<script
		src="../../../assets/vendor_components/popper/dist/popper.min.js"></script>
	<!-- Bootstrap 4.0-->
	<script
		src="../../../assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="../../../assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="../../../assets/vendor_components/fastclick/lib/fastclick.js"></script>
	<!-- Crypto_Admin App -->
	<script src="../../js/template.js"></script>
	<!-- Crypto_Admin for demo purposes -->
	<script src="../../js/demo.js"></script>
</body>
</html>