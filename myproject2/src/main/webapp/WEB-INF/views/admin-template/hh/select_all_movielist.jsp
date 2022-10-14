<%@page import="org.springframework.web.context.annotation.RequestScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width: 10%;
	padding: 5px 10px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".delete").click(function() {
			var rowData = new Array();
			var tdArr = new Array();
			var checkbox = $("input[name=user_CheckBox]:checked");
			checkbox.each(function(i) {
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				rowData.push(tr.text());
				var no = td.eq(1).text();
				tdArr.push(no);
			});
			console.log("tdArr");

			var new_form = $('<form></form>');
			new_form.attr("name", "test_form");
			new_form.attr("method", "post");
			new_form.attr("action", "deletemovie.do");

			new_form.append($('<input/>', {
				type : 'hidden',
				name : 'mcode',
				value : tdArr
			}));

			new_form.appendTo('body');
			console.log(tdArr);
			new_form.submit();
		});
	});
</script>
</head>
<body>
	<h2>현재 저장된 영화 목록 페이지</h2>
	<!-- DataTales Example -->
	
		
			<br> <a href="insert_movie.do"
				class="btn btn-success btn-icon-split"> <span
				class="icon text-white-50"> <i>+</i>
			</span> <span class="text">추가</span>
			</a> <a href="#" class="btn btn-danger btn-icon-split"> <span
				class="icon text-white-50"><i class="fas fa-trash"></i> </span> <span
				class="text delete">삭제</span>
			</a>
		<div class="box-body">
			<div class="table-responsive">
				<table id="example"
					class="table table-bordered table-hover display nowrap margin-top-10 w-p100">
					<thead>
						<tr>
							<th>선택</th>
							<th>index</th>
							<th>영화 한글 제목</th>
							<th>상영 시작일</th>
							<th>상영 종료일</th>
							<th>영화 영어 제목</th>
							<th>개봉일</th>
							<th>영화 상세 정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Movielist" items="${requestScope.movieList }" varStatus="status">
							<tr>
								<td>
								<input  class="filled-in chk-col-yellow" type="checkbox" id="horns" name="user_CheckBox">
								</td>
								<td>${Movielist.mcode }</td>
								<td><a href="movieView.do?mcode=${Movielist.mcode }&update=y">
										${Movielist.title }</a></td>
								<td> ${Movielist.startdate}</td>
								<td> ${Movielist.enddate}</td>
								<td>${Movielist.titleEng }</td>
								<td>${Movielist.repRlsDate }</td>
								<td>${Movielist.kmdbUrl }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>