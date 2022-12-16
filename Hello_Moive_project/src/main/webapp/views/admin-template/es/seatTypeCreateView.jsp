<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.tab-pane table {
	font-size: 18px;
	}

	.tab-pane .table2 tr td {
		padding-bottom: 10px;
	}
	
	.tab-pane .table2 tr td input {
		border: 1px solid gray;
		border-top: none;
		border-left: none;
		border-right: none;
	}
	
	.button {
		margin-top: 20px;
		border: none;
		width: 150px;
		height: 50px;
	}
	
	.nav-tabs-custom>.nav-tabs>li a.active{
		border-top-color: #fbae1c;
	}
	
	
	
	.seat{
		display: inline-block;
		width: 30px;
		height: 30px;
		text-decoration: none;
		font-weight: bold;
		color: white;
		text-align: center;
		background-color: #ffffff;
		background-size: 30px;
		background-image: url("images/seaticon.png");
		background-repeat: no-repeat;
		background-position: -2px 0px;
		box-sizing: border-box;
		border: 2px solid rgb(2,13,24);
		transition: background-color 0.5s, border 0.5s;
		border-radius: 10px;
		margin: 3px;
	}
	
	.empty{
		width: 30px;
		height: 30px;
		display: inline-block;
		box-sizing: border-box;
		background-color: #ffffff;
		border: 2px solid rgb(2,13,24);
		margin: 3px;
	}
	
	.seat-btn{
		display: inline-block;
		width: 30px;
		height: 30px;
		text-decoration: none;
		font-weight: bold;
		color: white;
		text-align: center;
		background-color: #ffffff;
		background-size: 26px;
		background-image: url("images/add.png");
		background-repeat: no-repeat;
		box-sizing: border-box;
		border: none;
		margin: 3px;
	}
	
	.empty-btn{
		display: inline-block;
		width: 30px;
		height: 30px;
		text-decoration: none;
		font-weight: bold;
		color: white;
		text-align: center;
		background-color: #ffffff;
		background-size: 26px;
		background-image: url("images/add.png");
		background-repeat: no-repeat;
		box-sizing: border-box;
		border: none;
		margin: 3px;
	}
	
	.enter-btn{
		display: inline-block;
		width: 30px;
		height: 30px;
		text-decoration: none;
		font-weight: bold;
		color: white;
		text-align: center;
		background-color: #ffffff;
		background-size: 26px;
		background-image: url("images/add.png");
		background-repeat: no-repeat;
		box-sizing: border-box;
		border: none;
		margin: 3px;
	}
	
	.remove-btn{
		display: inline-block;
		width: 30px;
		height: 30px;
		text-decoration: none;
		font-weight: bold;
		color: white;
		text-align: center;
		background-color: #ffffff;
		background-size: 26px;
		background-image: url("images/remove.png");
		background-repeat: no-repeat;
		box-sizing: border-box;
		border: none;
		margin: 3px;
	}
	
	.enter-btn:hover, .empty-btn:hover, .seat-btn:hover{
		cursor: pointer;
	}
	
	.table-div{
		max-width: 800px;
		padding: 5px;
		margin: 0 auto;
	}
	
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    	border-top: 1px solid #f4f4f4;
    	padding: 0.5rem;
	}
	
	.title-th{
		max-width: 100px;
		padding: 5px;
	}
	
	.sm-th{
		text-align: center;
		max-width: 70px;
		padding: 5px;
		padding-top: 15px !important;
	}
	
	.btn-typeDelete{
		cursor: pointer;
	}
	
	.tag-div{
		width: 100%;
		padding: 10px;
		text-align: center;
		border : 1px solid #eeeeee;
		border-radius: 20px;
	}
	
	.create-div{
		width: 100%;
		padding: 10px;
		text-align: center;
		border : 1px solid #eeeeee;
		border-radius: 20px;
	}
	
	.col-lg-9 {
	    -webkit-box-flex: 0;
	    -ms-flex: 0 0 75%;
	    flex: 0 0 100%;
	    max-width: 100%;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>좌석 타입 관리</h1>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#"><i
					class="fa fa-dashboard"></i>Main</a></li>
			<li class="breadcrumb-item"><a href="#">영화관 관리</a></li>
			<li class="breadcrumb-item active">좌석 타입 관리</li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- /.col -->
			<div class="col-lg-9 col-12">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs tabstyle">
						<li><a class="active" href="#activity" data-toggle="tab">기존 타입 관리</a></li>
						<li><a href="#settings" data-toggle="tab">신규 타입 추가</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane" id="timeline">
							<i class="fa fa-clock-o bg-gray"></i>
						</div>
						<!-- /.tab-pane -->
						<div class="active tab-pane" id="activity">
						<div class="table-div">
						<form action="deleteSeatType.do" method="post">
						<table id="project-table"
										class="table table-bordered table-striped display nowrap margin-top-10">
										<thead>
											<tr>
												<th class="title-th" colspan="3"><i
													class="fa fa-search text-muted hidden-md hidden-sm hidden-xs"></i>&nbsp; Seat Type List</th>
												<th class="sm-th"></th>
											</tr>
											<tr>
												<td colspan="3">
													<select class="seat-select form-control select2 w-p100" name="seatType">
														<c:forEach var="s" items="${requestScope.seatlist }">
															<option value="${s.seatType },${s.seatTag }">${s.seatType }</option>
														</c:forEach>
													</select>
												</td>
												<td class="sm-th"><button type="submit" class="btn-typeDelete btn-danger btn-sm text-white">타입 삭제하기</button></td>
											</tr>
										</thead>
									</table>
									</form>
									</div>
						<div class="topbar-filter fw">
						<div class="tag-div">
								${requestScope.seatlist[0].seatTag }
						</div>
						</div>
							<!-- /.post -->
						</div>
						<!-- /.tab-pane -->
						<div class="tab-pane" id="settings">
						<div class="table-div">
						<form id="insert-frm" action="insertSeatType.do" method="post">
								<table
										class="insert-table table table-bordered table-striped display nowrap margin-top-10">
										<thead>
											<tr>
												<th class="title-th" colspan="3"><i
													class="fa fa-search text-muted hidden-md hidden-sm hidden-xs"></i>&nbsp; Seat Type</th>
												<th>추가할 개수</th>
												<th>Seat</th>
												<th>Blank</th>
												<th>줄바꿈</th>
												<th>제거</th>
											</tr>
											<tr>
												<td colspan="3">
													<input class="form-control" type="text" name="seatType" placeholder="좌석 타입명">
												</td>
												<td><input class="form-control" type="number" min="1" value="1" name="count"></td>
												<td><input type='button' class='seat-btn'></td>
												<td><div class='empty-btn'></div></td>
												<td><div class='enter-btn'></div></td>
												<td><div class='remove-btn'></div></td>
											</tr>
											
										</thead>
									</table>
									<div class="create-div">
									</div>
										<input class="tag" type="hidden" name="seatTag">
									<button type="submit" class="btn-typeDelete btn-danger btn-sm text-white">타입 등록하기</button>
								</form>
		              	</div>
		              	</div>
							
										
											
										
							
						</div>
						<!-- /.tab-pane -->
					</div>
					<!-- /.tab-content -->
				</div>
				<!-- /.nav-tabs-custom -->
			</div>
			<!-- /.col -->
		<!-- /.row -->
		</section>
	<!-- /.content -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$('.seat-select').change(function () {
	
	var tag = $(this).val().split(",");
	console.log(tag[0]);
	$(".tag-div").html(tag[1]);
	
});

var createTag = "";
var st = [];

$('.seat-btn').click(function () {
	console.log("seat-btn click");
	var count = parseInt($("input[name='count']").val());
	for(var i=0;i<count;i++){
		createTag += "<input type='button' class='seat'>";
	}
	st.push("1");
	console.log(st);
	console.log($(".tag").val());
	$(".create-div").html(createTag);
	$(".tag").val(createTag);
});

$('.empty-btn').click(function () {
	console.log("empty-btn click");
	var count = parseInt($("input[name='count']").val());
	for(var i=0;i<count;i++){
		createTag += "<div class='empty'></div>";
	}
	st.push("2");
	console.log(st);
	$(".create-div").html(createTag);
	$(".tag").val(createTag);
});

$('.enter-btn').click(function () {
	console.log("enter-btn click");
	createTag += "<br>";
	st.push("3");
	console.log(st);
	$(".create-div").html(createTag);
	$(".tag").val(createTag);
});

$('.remove-btn').click(function () {
	console.log("enter-btn click");
	console.log(st);
	var last = st.length -1;
	console.log(last);
	console.log(st[last]);
	if(st[last] == 1){
		createTag = createTag.slice(0, (createTag.length - 34));
	}else if(st[last] == 2){
		createTag = createTag.slice(0, (createTag.length - 25));
	}else if(st[last] == 3){
		createTag = createTag.slice(0, (createTag.length - 4));
	}
	st.splice((st.length - 1), 1)
	console.log(st);
	$(".create-div").html(createTag);
	$(".tag").val(createTag);
});

$('#insert-frm').submit(function (e) {
	if($("input[name='seatType']").val().length < 1){
		e.preventDefault();
		alert('좌석 타입명을 설정하세요');
	}
});
</script>
</body>
</html>