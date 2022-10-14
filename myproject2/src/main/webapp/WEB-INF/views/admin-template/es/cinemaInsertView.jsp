<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>

</head>
<body>
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>지점 등록</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do"><i
							class="fa fa-dashboard"></i>Main</a></li>
					<li class="breadcrumb-item"><a href="#">영화관 관리</a></li>
					<li class="breadcrumb-item active"><a href="insertHotelView.do">지점 등록</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
			<form action="screenInsert.do" method="post">
				<div class="row">
					<!-- /.col -->
					<div class="col-xl-8 col-lg-7">
						<div class="box box-solid bg-black">
							<div class="box-header with-border">
								<h3 class="box-title"></h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="row">
									<div class="col-12">
										<div class="form-group row"><label class="col-sm-2 col-form-label"><i
													class="fa fa-check-circle text-muted hidden-md hidden-sm hidden-xs"></i>&nbsp; Cinema Code</label>
				                      <div class="col-sm-5"><input class="form-control" type="text"name="cinemaCode" placeholder="ex) 20221OOO"></div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label"><i
													class="fa fa-check-circle text-muted hidden-md hidden-sm hidden-xs"></i>&nbsp; Cinema Name</label>
				                      <div class="col-sm-5"><input class="form-control" type="text" name="cinemaName" placeholder="ex) OO지점"></div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label"></label>
				                      <div class="col-sm-10"><button type="submit" class="btn btn-warning btn-md">등록하기</button></div>
				                    </div>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				</form>
			</section>
			<!-- /.content -->
		<!-- /.content-wrapper -->
		

<script type="text/javascript">
		
	</script>
		
</body>
</html>