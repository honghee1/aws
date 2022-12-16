<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="profile" href="#">
<!--Google Font-->
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">
<!-- CSS files -->
<link rel="stylesheet" href="../css/plugins.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/template_dh/qna.css">
<link rel="stylesheet" href="../css/template_dh/sign_up.css">

</head>
<body>
	<!-- begin header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- section -->
	<jsp:include page="${page }"></jsp:include>
	<!--end of latest new v2 section-->
	<!-- footer v2 section-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- end of footer v2 section-->
	<script src="../js/jquery.js"></script>
	<script src="../js/plugins.js"></script>
	<script src="../js/plugins2.js"></script>
	<script src="../js/custom.js"></script>
</body>
</html>