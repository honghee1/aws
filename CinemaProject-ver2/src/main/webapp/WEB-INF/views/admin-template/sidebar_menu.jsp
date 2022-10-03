<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
<aside class="main-sidebar">
			<!-- sidebar -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="ulogo">
						<a href="index.html">
							<!-- logo for regular state and mobile devices -->
							<span><b>Crypto </b>Admin</span>
						</a>
					</div>
					<div class="image">
						<img src="../../../images/user2-160x160.jpg"
							class="rounded-circle" alt="User Image">
					</div>
					<div class="info">
						<p>Admin Template</p>
						
					</div>
				</div>
				<!-- sidebar menu -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header nav-small-cap">000시네마 관리 메뉴</li>
					<c:if test="${sessionScope.grade == 0 }">
					<li class="treeview"><a href="#"><i class="icon-people"></i><span>관리자 정보</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu ">
							<li class="api"><a href="adminView.do">관리자 페이지</a></li>
						</ul></li>
					</c:if>
					<li class="treeview"><a href="#"><i class="icon-people"></i><span>영화 관리</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu ">
							<li class="api"><a href="select_movie_openAPI.do">오픈 API 검색</a></li>
							<li class="movielist"><a href="insert_movie.do">영화 등록</a></li>
							<li><a href="select_all_movielist.do">등록된 영화 목록</a></li>
						</ul></li>
					<li class="treeview"><a href="#"><i class="icon-people"></i><span>회원관리</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu">
							<li><a href="allMemberView">전체 회원관리</a></li>
							<li><a href="allQnaView">전체 문의내역</a></li>
						</ul></li>
					<li class="treeview"><a href="#"><i class="icon-people"></i><span>샘플 메뉴</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu">
						<c:if test="${sessionScope.cinemacode == null }">
							<li><a id="modal-open" href="#">지점 관리</a></li>
							<li><a href="blank.do">빈 샘플 메뉴</a></li>
							<li><a href="blank.do">빈 샘플 메뉴</a></li>
						</c:if>
						<c:if test="${sessionScope.cinemacode != null }">
							<li><a id="modal-open" href="#">지점 관리</a></li>
							<a id="modal-open" class="collapse-item" href="#">상영관 관리</a>
							<li><a href="blank.do">빈 샘플 메뉴</a></li>
						</c:if>
						</ul>
						</li>
					</ul>
			</section>
		</aside>
	
</body>
</html>