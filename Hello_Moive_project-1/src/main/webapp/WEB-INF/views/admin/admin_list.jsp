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
	.table-head {
		font-size: 16px;
		font-weight: bold;
	}
	.btn-color {
		background-color: #ef5350;
	}
</style>
<script type="text/javascript">
	function add_event_update(){   
		$("#btn_insert").click(function(){
			var arr = $(this).parent().parent().find("input");
			var d = "";
			$.each(arr,function(i,obj){
				d += $(obj).attr("name") + "=" + $(obj).val() + "&";
			});
			d += "grade=" + $("#grade").val();
			$.ajax({
				url:"adminInsert.do",
				data : d,
				type: "post",
				success:function(r){
					console.log(d)
					if(r == 1)
						alert("관리자 추가 완료");
					else 
						alert("관리자 추가 실패");
					location.reload();
				}
			});
		});
	}
	function add_event_delete(){
		$(".delete_btn").click(function(){
			var d = "adminId="+ $(this).parent().parent().find("input[name=adminId]").val();
			$.ajax({
				url:"adminDelete.do",
				data : d,
				type: "post",
				success:function(r){
					if(r == 1)
						alert("관리자 삭제 완료");
					else 
						alert("관리자 삭제 실패");
					location.reload();
				}
			});
		});
	}
	
	$(function(){
		add_event_update();
		add_event_delete();
	});
</script>
</head>
<body>
		<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>관리자 정보</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i
						class="fa fa-dashboard"></i>관리자</a></li>
				<li class="breadcrumb-item"><a href="#">관리자정보</a></li>
				<li class="breadcrumb-item active">전체 문의내역</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="box">
						<div class="box-body">
							<div class="table-responsive">
								<table id="example5" class="table table-hover">
									<thead>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td class="text-yellow table-head">아이디</td>
											<td class="text-yellow table-head">비밀번호</td>
											<td class="text-yellow table-head">이름</td>
											<td class="text-yellow table-head">등급</td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td><input type="text" name="adminId"></td>
											<td><input type="password" name="adminPasswd"></td>
											<td><input type="text" name="adminName"></td>
											<td>
												<select name="grade" id="grade">
													<option value="0">총괄 관리자</option>
													<option value="1">관리자</option>
												</select>
											</td>
											<td><a href="#" id="btn_insert" class="member-detail btn btn-warning btn-sm text-white">관리자 추가</a></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="admin" items="${requestScope.alist }">
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i
													class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60"><a
													class="avatar avatar-lg status-success" href="#"><img
														src="../images/avatar/1.jpg" alt="..." /></a>
												</td>
												<td class="w-300">
													<input type="text" name="adminId" value="${admin.userEmail }">
												</td>
												<td>
													<input type="password" name="adminPasswd" value="${admin.userPasswd }">
												</td>
												<td>
													<input type="text" name="adminName" value="${admin.userName }">
												</td>
												<td>
													<input type="text" name="adminName" value="${admin.userrole }">
												</td>
												<td>
													<a href="#" class="delete_btn member-detail btn btn-color btn-sm text-white">관리자 삭제</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
</body>
</html>