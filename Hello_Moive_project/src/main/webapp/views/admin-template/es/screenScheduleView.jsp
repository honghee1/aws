<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.btn-update:hover{
		cursor: pointer;
	}
	.time-td{
		max-width: 100px;
	}
	.timepicker{
		text-align: center;
	}
	.endpicker{
		text-align: center;
	}
	.toptimepicker{
		text-align: center;
	}
	.topendpicker{
		text-align: center;
	}
	.sm-th{
		max-width: 80px;
		text-align: center;
	}
	.title-th{
		text-align: center;
	}
	.btn-screenScheduleUpdate{
		background-color: #444444;
		border: 1px solid #444444;
	}
	.btn-screenScheduleUpdate:hover{
		background-color: #555555;
		border: 1px solid #555555;
		cursor: pointer;
	}
	.btn-screenSchedulePlus:hover{
		cursor: pointer;
	}
	.btn-td{
		max-width: 60px;
		text-align: center;
	}
	.align-date{
		padding-top: 33px !important;
	}
	.align-btn{
		padding-top: 28px !important;
	}
	input, select{
		display: inline-block;
	}
	td, th{
		text-align: center;
	}
	.input-align{
		padding-top: 28px !important;
	}
</style>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

</head>
<body>
			<section class="content-header">
				<h1>극장 상영작 관리</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#"><i
							class="fa fa-dashboard"></i>Main</a></li>
					<li class="breadcrumb-item"><a href="#">영화관 관리</a></li>
					<li class="breadcrumb-item"><a href="#">${name } 지점 관리</a></li>
					<li class="breadcrumb-item active">극장 상영작 관리</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
					<div class="box">
							<div class="box-body">
								<div class="table-responsive">
											<form action="screenSchedulePlus.do" method="post">
									<table id="project-table"
										class="table table-bordered table-striped display nowrap margin-top-10">
										<thead>
											<tr>
												<th class="title-th" colspan="3"><i
													class="fa fa-search text-muted hidden-md hidden-sm hidden-xs"></i> Screen Movie List</th>
												<th class="sm-th"><i
													class="fa fa-fw fa-calendar text-muted hidden-md hidden-sm hidden-xs"></i> 상영일</th>
												<th class="sm-th"><i
													class="fa fa-clock-o text-muted hidden-md hidden-sm hidden-xs"></i> Start Time</th>
												<th class="sm-th"><i
													class="fa fa-clock-o text-muted hidden-md hidden-sm hidden-xs"></i> End Time</th>
												<th class="sm-th"></th>
											</tr>
											<tr>
												<td colspan="3">
													<input type="hidden" name="screenCode" value="${requestScope.screenCode}">
													<select class="mcode-select form-control select2 w-p100" name="mcode">
														<c:forEach var="t" items="${requestScope.screenlist }">
															<option value="${t.mcode },${t.runTime }">${t.title }(${t.mcode })</option>
														</c:forEach>
													</select>
												</td>
												<td class="time-td align-date"><input type="date" name="movieDate"></td>
												<td class="sm-th align-date"><input class="toptimepicker" id="startTime" type="text" name="startTime" placeholder="00:00"></td>
												<td class="sm-th align-date"><input class="topendpicker" type="text" name="endTime" readonly="readonly" placeholder="00:00"></td>
												<td class="sm-th align-btn"><button  class="btn-screenSchedulePlus btn-warning btn-sm text-white">추가하기</button></td>
											</tr>
										</thead>
									</table>
									</form>
								</div>
							</div>
						</div>
						<div class="box">
							<div class="box-body">
								<div class="table-responsive">
									<table id="project-table"
										class="table table-bordered table-striped display nowrap margin-top-10">
										<thead>
											<tr>
												<th><i
													class="fa fa-check-circle text-muted hidden-md hidden-sm hidden-xs"></i> Time Code</th>
												<th><i
													class="fa fa-fw fa-youtube-play text-muted hidden-md hidden-sm hidden-xs"></i> Movie Title</th>
												<th class="time-td"><i
													class="fa fa-fw fa-calendar text-muted hidden-md hidden-sm hidden-xs"></i> 상영일</th>
												<th class="time-td"><i
													class="fa fa-clock-o  text-muted hidden-md hidden-sm hidden-xs"></i> Start Time</th>
												<th class="time-td"><i
													class="fa fa-clock-o  text-muted hidden-md hidden-sm hidden-xs"></i> End Time</th>
												<th></th>
											</tr>
											<c:forEach var="s" items="${requestScope.timelist }">
											<tr>
											<form  action="" id="form" method="post">
												<td class="input-align">${s.timeCode }<input type="hidden" name="timeCode" value="${s.timeCode }"><input type="hidden" name="screenCode" value="${s.screenCode }"></td>
												<td>${s.title }<br><small class="text-muted">Movie Code - ${s.mcode }</small> </td>
												<td class="time-td input-align"><input type="date" id="movieDate" name="movieDate" value="${s.movieDate }"></td>
												<td class="time-td input-align"><input class="timepicker" type="text" id="startTime" name="startTime" value="${s.startTime }"><input type="hidden" name="runTime" value="${s.runTime }" placeholder="00:00"></td>
												<td class="time-td input-align"><input class="endpicker" type="text" name="endTime" value="${s.endTime }" readonly="readonly" placeholder="00:00"></td>
												<td class="btn-td"><button type="submit" id="updateScreenSchedule" class="btn-update btn-warning btn-sm text-white">수정하기</button></td>
												<td class="btn-td"><button type="submit" id="deleteScreenSchedule" class="btn-update btn-warning btn-sm text-white">삭제하기</button></td>
											</form>
											</tr>
											</c:forEach>
										</thead>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 시간 jquery -->
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript">
	
	$('.timepicker').timepicker({
		timeFormat: 'H:mm',
	    interval: 10,
	    minTime: '0',
	    maxTime: '23:30',
	    startTime: '6:00',
	    dynamic: false,
	    dropdown: false,
	    scrollbar: false
	});
	$('.toptimepicker').timepicker({
		timeFormat: 'H:mm',
	    interval: 10,
	    minTime: '0',
	    maxTime: '23:30',
	    startTime: '6:00',
	    dynamic: false,
	    dropdown: false,
	    scrollbar: false
	});
	$('.timepicker').change(function () {
		
		var startTime = $(this).val().split(":");
		var runTime = parseInt(startTime[0] * 60) + parseInt(startTime[1]) + parseInt($(this).parent().children("input[name='runTime']").val());
		var endHour = parseInt(runTime / 60);
		var endMinute = runTime % 60;
		console.log(startTime[0] * 60);
		console.log(startTime[1]);
		console.log($(this).parent().children("input[name='runTime']").val());
		console.log(endHour);
		console.log(endMinute);
		if(String(startTime[0]).length < 2){
			startTime[0] = "0" + startTime[0];
		}
		if(String(startTime[1]).length < 2){
			startTime[1] = "0" + startTime[1];
		}
		if(String(endHour).length < 2){
			endHour = "0" + endHour;
		}
		if(String(endMinute).length < 2){
			endMinute = "0" + endMinute;
		}
		var resultTime = startTime[0] + ":" + startTime[1];
		var endTime = endHour + ":" + endMinute;
		console.log(endTime);
		$(this).val(resultTime);
		$(this).parent().next().find("input[name='endTime']").val(endTime);
	})
	$('.toptimepicker').change(function () {
		var t = $('.mcode-select option:selected').val().split(",");
		console.log(t[0]);
		console.log(t[1]);
		
		var startTime = $(this).val().split(":");
		var runTime = parseInt(startTime[0] * 60) + parseInt(startTime[1]) + parseInt($('.mcode-select option:selected').val().split(",")[1]);
		var endHour = parseInt(runTime / 60);
		var endMinute = runTime % 60;
		console.log(startTime[0] * 60);
		console.log(startTime[1]);
		console.log(endHour);
		console.log(endMinute);
		if(String(startTime[0]).length < 2){
			startTime[0] = "0" + startTime[0];
		}
		if(String(startTime[1]).length < 2){
			startTime[1] = "0" + startTime[1];
		}
		if(String(endHour).length < 2){
			endHour = "0" + endHour;
		}
		if(String(endMinute).length < 2){
			endMinute = "0" + endMinute;
		}
		var resultTime = startTime[0] + ":" + startTime[1];
		var endTime = endHour + ":" + endMinute;
		console.log(endTime);
		$(this).val(resultTime);
		$(this).parent().next().find("input[name='endTime']").val(endTime);
	})
	
		$('#updateScreenSchedule').click(function(){
			if($("#movieDate").val()!=""){
			 $("#form").attr('action','updateSchedule.do');
			 $("#form").submit();
			}else if($("#movieDate").val()==""){
				alert("상영일을 입력해주세요")
			}else if($(this).closest('tr').children().eq(3).children().val() == '0:undefined'){
				alert("시작시간을 입력해주세요")
			}
		});
		$('#deleteScreenSchedule').click(function(){
			 $("#form").attr('action','deleteSchedule.do');
			 $("#form").submit();   
		});
		
</script>
		
</body>
</html>