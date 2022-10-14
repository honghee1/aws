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
/* function test(){
	console.log($(this).closest('tr').children().eq(0).text());
	console.log($("#data1").closest('tr').children().eq(1).text());
	console.log($("#data1").closest('tr').children().eq(2).text());
	console.log($("#data1").closest('tr').children().eq(3).text());
	console.log($("#data1").closest('tr').children().eq(4).text());
	console.log($("#data1").closest('tr').children().eq(5).text());
	console.log($("#data1").closest('tr').children().eq(6).text());
	console.log($("#data1").closest('tr').children().eq(7).text());
	console.log($("#data1").closest('tr').children().eq(8).text());
	console.log($("#data1").closest('tr').children().eq(9).text());
	console.log($("#data1").closest('tr').children().eq(10).val());
	console.log($("#data1").closest('tr').children().eq(11).val());
	console.log($("#data1").closest('tr').children().eq(12).val());
	console.log($("#data1").closest('tr').children().eq(13).val());
	/*  $("#test").submit(); 
	
} */
$(document).on('click', '#data1', function() {
	var str2 ="";
	  /* $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(0).text() + '" name=title>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(1).text() + '" name=titleEng>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(2).text() + '" name=directorNm>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(3).text() + '" name=directorEnNm>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(4).text() + '" name=actorNm>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(5).text() + '" name=actorEnNm>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(6).text() + '" name=company>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(7).text() + '" name=nation>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(8).text() + '" name=rating>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(9).text() + '" name=runtime>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(10).text() + '" name=repRlsDate>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(11).text() + '" name=plotText>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(13).text() + '" name=keywords>')); 
	  $("#insert_movie").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(14).text() + '" name=genre>')); 
	$("#insert_movie").submit();  */
	
	str2+="title="+$(this).closest('tr').children().eq(1).text()+"&";
	str2+="titleEng="+$(this).closest('tr').children().eq(2).text()+"&";
	str2+="directorNm="+$(this).closest('tr').children().eq(3).text()+"&";
	str2+="directorEnNm="+$(this).closest('tr').children().eq(4).text()+"&";
	str2+="actorNm="+$(this).closest('tr').children().eq(5).text()+"&";
	str2+="actorEnNm="+$(this).closest('tr').children().eq(6).text()+"&";
	str2+="company="+$(this).closest('tr').children().eq(7).text()+"&";
	str2+="nation="+$(this).closest('tr').children().eq(8).text()+"&";
	str2+="rating="+$(this).closest('tr').children().eq(9).text()+"&";
	str2+="runtime="+$(this).closest('tr').children().eq(10).text()+"&";
	str2+="repRlsDate="+$(this).closest('tr').children().eq(11).text()+"&";
	str2+="plotText="+$(this).closest('tr').children().eq(12).text()+"&";
	str2+="keywords="+$(this).closest('tr').children().eq(13).text()+"&";
	str2+="genre="+$(this).closest('tr').children().eq(14).text()+"&";
	window.opener.location.href="insert_movie.do?"+str2;
	self.close(); 

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
								<th>영화 한글 제목</th>
								<th>영화 영어 제목</th>
								<th>영화 감독(한)</th>
								<th>영화 감독(영)</th>
								<th>영화 배우(한)</th>
								<th>영화 배우(영)</th>
								<th>제작사</th>
								<th>국가</th>
								<th>영화 등급</th>
								<th>상여 시간</th>
								<th>개봉일</th>
								
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