<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1><span class="text-warning">${name }</span> ${title }</h1>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#"><i
					class="fa fa-dashboard"></i>Main</a></li>
			<li class="breadcrumb-item"><a href="#">영화관 관리</a></li>
			<li class="breadcrumb-item active">${name } 지점 관리</li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- /.col -->
			<div class="col-lg-9 col-12">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs tabstyle">
						<li><a class="active" href="#activity" data-toggle="tab">지점 극장 조회</a></li>
						<li><a href="#settings" data-toggle="tab">지점 정보 수정</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane" id="timeline">
							<i class="fa fa-clock-o bg-gray"></i>
						</div>
						<!-- /.tab-pane -->
						<div class="active tab-pane" id="activity">
						<div class="table-responsive">
							<table id="example5" class="table table-hover">
								<tbody>
										<c:forEach var="s" items="${requestScope.list }">
											<tr>
												<td class="w-60"><a
													class="avatar avatar-lg status-success" href="#"><img
														src="images/screen-icon.jpg" alt="..." /></a>
												</td>
												<td class="w-300">
													<p class="mb-0 manage-text-sm">
														<a href="#"><i
													class="fa fa-check-circle text-muted hidden-md hidden-sm hidden-xs"></i>&nbsp; ${s.screenName }</a>
														<small class="sidetitle" name="sidetitle">ScreenCode - ${s.screenCode }</small>
													</p>
													<p class="mb-0 manage-text-sm">총 좌석수 - ${s.allseat }</p>
												</td>
												<td>
													<nav class="nav mt-1 btn-array">
														<a href="screenScheduleView.do?screenCode=${s.screenCode }" class="btn-warning btn-sm text-white">극장 상영작 관리</a>
														&nbsp;
														<a href="screenDelete.do?screencode=${s.screenCode }&cinemacode=${requestScope.dto.cinemaCode }" class="btn-delete btn-sm text-white">극장 정보 삭제</a>
													</nav>
												</td>
											</tr>
										</c:forEach>
										<tr>
											<td class="screen-insert" colspan="3"><a href="screenInsertView.do?cinemacode=${requestScope.dto.cinemaCode }" class="btn-insert btn-lg text-white">극장 등록 하기</a></td>
										</tr>
										
										<tr>
											<td class="screen-page" colspan="3">
												<c:if test="${pagging.previousPageGroup }">
													<a class="text-warning page-text" href="cinemaManagementView.do?pageNo=${pagging.startPageOfPageGroup - 1 }&cinemacode=${requestScope.dto.cinemaCode }">◀</a>
												</c:if>
												<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
													end="${pagging.endPageOfPageGroup}">
													<c:choose>
													<c:when test="${pageNo eq i}">
														<a class="page-text text-warning" href="cinemaManagementView.do?pageNo=${i }&cinemacode=${requestScope.dto.cinemaCode }">${ i}</a>
													</c:when>
													<c:otherwise>
														<a class="page-text" href="cinemaManagementView.do?pageNo=${i }&cinemacode=${requestScope.dto.cinemaCode }">${ i}</a>
													</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${pagging.nextPageGroup }">
													<a class="text-warning page-text" href="cinemaManagementView.do?pageNo=${pagging.endPageOfPageGroup + 1 }&cinemacode=${requestScope.dto.cinemaCode }">▶</a>
												</c:if>
											</td>
										</tr>
										
									</tbody>
							</table>
							</div>
							<!-- /.post -->
						</div>
						<!-- /.tab-pane -->
						<div class="tab-pane" id="settings">
						<form action="cinemaUpdate.do" method="post">
							<div class="box-body"></div>
				                <div class="row">
				                  <div class="col-12">
				                    <div class="form-group row"><label class="col-sm-2 col-form-label"><i
													class="fa fa-check-circle text-muted hidden-md hidden-sm hidden-xs"></i>&nbsp; Cinema Code</label>
				                      <div class="col-sm-5"><input class="form-control" readonly="readonly" type="text" value="${requestScope.dto.cinemaCode }" name="cinemaCode" placeholder="지점 코드"></div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label"><i
													class="fa fa-check-circle text-muted hidden-md hidden-sm hidden-xs"></i>&nbsp; Cinema Name</label>
				                      <div class="col-sm-5"><input class="form-control" type="text" value="${requestScope.dto.cinemaName }" name="cinemaName" placeholder="지점명"></div>
				                    </div>
				                    <div class="form-group row"><label class="col-sm-2 col-form-label"></label>
				                      <div class="col-sm-10"><button type="submit" class="btn btn-warning btn-sm">수정하기</button></div>
				                    </div>
				                  </div><!-- /.col -->
				                </div><!-- /.row -->
							</form>
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
<style>
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

.manage-text-sm{
	font-size: 15px;
}

.btn-delete{
	background-color: #ef5350;
}

.btn-insert{
	background-color: #444444;
}
.screen-insert{
	text-align: center;
}

.screen-page{
	text-align: center;
	font-size: 16px;
}


</style>
<script>
	console.log(${pageNo});
	
</script>