<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../../../assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Bootstrap extend-->
<link rel="stylesheet" href="../../css/bootstrap-extend.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../css/master_style.css">
<!-- Crypto_Admin skins -->
<link rel="stylesheet" href="../../css/skins/_all-skins.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
<%
request.setCharacterEncoding("utf-8");
String tag = request.getParameter("tag");
%>
$(function(){
	var str = "<%=tag %>";
	$("tbody").html(str);
	var str2 ="";
});

$(document).on('click', '#data1', function() {
	console.log($(this).closest('tr').children().eq(1).text())
	opener.document.getElementById("mtitle").value = $(this).closest('tr').children().eq(1).text();
	opener.document.getElementById("prodYear").value = $(this).closest('tr').children().eq(2).text();
	opener.document.getElementById("userRating").value = $(this).closest('tr').children().eq(3).text();
	 self.close();

});
  $(document).on('click', '#Naver_Link', function() {
	console.log($(this).closest('tr').children().eq(4).text());
 	 window.open($(this).closest('tr').children().eq(4).text(),'POP2','width=1200, height=1000, resizable=yes, scrollbars=yes, status=no');
 });
  $(document).on('click', '#data1', function() {
	  console.log($(this).closest('tr').children().eq(1).text());
  });
  
</script>

<style type="text/css">
h2 {
	text-align: center;
}

.container {
	text-align: center;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
}

thead>tr {
	border-top: 1px solid black;
	border-bottom: 1px double black;
}

tbody>tr {
	border-bottom: 1px solid black;
}

td, th {
	padding: 5px 10px;
	overflow: hidden;
}
</style>

</head>
<body>
<br>    
	<h2>영화 검색 결과 페이지</h2>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" style="width:100%;cellspacing:0;"
						>
						<thead>
							<tr>
								<th>선택</th>
								<th>영화 제목</th>
								<th>제작년도</th>
								<th>네이버 평점</th>
								<th>네이버 상제 정보</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<form id=insert_movie action=insert_movie.do?close=close method=post>
	</form>
</body>
</html>