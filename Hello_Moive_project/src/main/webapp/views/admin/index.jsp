<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
<title>${title }</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
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
		<jsp:include page="header.jsp" flush="false"/> 
		<!-- Left side column. contains the sidebar  사이드 바-->
		  <div class="container-fluid">
                 <jsp:include page="sidebar_menu.jsp" flush="false"/> 
          </div>
		<!-- =============================================== -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
					<div class="box-body"><jsp:include page="admin-template/${page }"></jsp:include> </div>
					
		</div>
		<!-- /.content-wrapper -->
                 <jsp:include page="footer.jsp" flush="false"/> 
			<%-- <jsp:include page="admin-template/hh/select_cinema_branch.jsp" flush="false"/> --%>
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
	<script type="text/javascript">
		var title = '${title }';
	
		$("ul[class='active']").removeClass("active");
		$("li[class='active']").removeClass("active");
		
		if(title == "메인 페이지 :: Hello Movie Cinema"){
			$("a[href^='/']").parent().addClass("active");
		}
		
		else if(title == "지점 관리 :: Hello Movie Cinema"){
			$("a[href^='#cinemaManage']").parent().addClass("active");
			$("a[href^='#cinemaManage']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "극장 상영작 관리 :: Hello Movie Cinema"){
			$("a[href^='#cinemaManage']").parent().addClass("active");
			$("a[href^='#cinemaManage']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "지점 극장 등록 :: Hello Movie Cinema"){
			$("a[href^='#cinemaManage']").parent().addClass("active");
			$("a[href^='#cinemaManage']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "지점 추가 하기 :: Hello Movie Cinema"){
			$("a[href^='cinemaInsertView.do']").parent().addClass("active");
			$("a[href^='cinemaInsertView.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "좌석 타입 관리 :: Hello Movie Cinema"){
			$("a[href^='seatTypeCreateView.do']").parent().addClass("active");
			$("a[href^='seatTypeCreateView.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "영화 검색 :: Hello Movie Cinema"){
			$("a[href^='select_movie_openAPI.do']").parent().addClass("active");
			$("a[href^='select_movie_openAPI.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "영화 등록 :: Hello Movie Cinema"){
			$("a[href^='insert_movie.do']").parent().addClass("active");
			$("a[href^='insert_movie.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "영화 목록 :: Hello Movie Cinema"){
			$("a[href^='select_all_movielist.do']").parent().addClass("active");
			$("a[href^='select_all_movielist.do']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "전체 회원 관리 :: Hello Movie Cinema"){
			$("a[href^='allMemberView']").parent().addClass("active");
			$("a[href^='allMemberView']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "회원 정보 관리 :: Hello Movie Cinema"){
			$("a[href^='allMemberView']").parent().addClass("active");
			$("a[href^='allMemberView']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "전체 문의 내역 :: Hello Movie Cinema"){
			$("a[href^='allQnaView']").parent().addClass("active");
			$("a[href^='allQnaView']").parent().parent().parent().addClass("active");
		}
		
		else if(title == "관리자 페이지 :: Hello Movie Cinema"){
			$("a[href^='adminView.do']").parent().addClass("active");
			$("a[href^='adminView.do']").parent().parent().parent().addClass("active");
		}
	
	</script>
</body>
</html>