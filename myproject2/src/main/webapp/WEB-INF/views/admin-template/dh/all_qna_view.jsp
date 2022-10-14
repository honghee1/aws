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
</style>
</head>
<body>
		<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>${title }</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i
						class="fa fa-dashboard"></i>MEMBER</a></li>
				<li class="breadcrumb-item"><a href="#">회원 관리</a></li>
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
											<td class="text-yellow table-head">작성자 이메일</td>
											<td class="text-yellow table-head">문의 제목</td>
											<td class="text-yellow table-head">작성일</td>
											<td class="text-yellow table-head">문의 유형</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="qlist" items="${requestScope.qlist }">
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i
													class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60"><a
													class="avatar avatar-lg status-success" href="#"><img
														src="images/avatar/1.jpg" alt="..." /></a>
												</td>
												<td class="w-300">
													<p class="mb-0">
														<a href="memberProfile.do?userEmail=${qlist.userEmail }"><strong>${qlist.userEmail}</strong></a>
													</p>
												</td>
												<td>
													<p class="mb-0">${qlist.qnaTitle }</p>
												</td>
												<td>
													<p class="mb-0">${qlist.qnaDate }</p>
												</td>
												<td>
													<p class="mb-0">${qlist.qnaQuiry }</p>
												</td>
												<td>
													<nav class="nav mt-1 btn-array">
														<a href="memberProfile.do?userEmail=${qlist.userEmail }" class="member-detail btn btn-warning btn-sm text-white">문의 상세 보기</a>
														<!-- <a class="btn_delete btn btn-warning btn-sm text-white">문의 내역 삭제</a> -->
													</nav>
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