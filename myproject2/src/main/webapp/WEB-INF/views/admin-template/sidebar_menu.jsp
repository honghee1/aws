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
							<span><b>Hello </b>Moive</span>
						</a>
					</div>
					<div class="image">
						<img src="images/hello.png"
							class="rounded-circle" alt="User Image">
					</div>
					<div class="info">
						<p>${adminId } 님 <br><br> 관리 등급 : ${grade }</p>
						
					</div>
				</div>
				<!-- sidebar menu -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class=""><a href="/"><i
							class="icon-home"></i><span>Main</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a></li>
					<li class="header nav-small-cap"><i
													class="fa fa-check-circle text-muted hidden-md hidden-sm hidden-xs"></i>&nbsp; Menu</li>
					<c:if test="${sessionScope.grade == 0 }">
					<li class="treeview"><a href="#"><i class="fa fa-address-card"></i><span>관리자 정보</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu ">
							<li class="api"><a href="adminView.do">관리자 페이지</a></li>
						</ul></li>
					</c:if>
					<li class="treeview"><a href="#"><i class="fa fa-address-card-o"></i><span>회원 관리</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu">
							<li><a href="allMemberView">전체 회원 관리</a></li>
							<li><a href="allQnaView">전체 문의 내역</a></li>
						</ul></li>
					<li class="treeview"><a href="#"><i class="glyphicon glyphicon-film"></i><span>영화 관리</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu ">
							<li class="api"><a href="select_movie_openAPI.do">오픈 API 검색</a></li>
							<li class="movielist"><a href="insert_movie.do">영화 등록</a></li>
							<li><a href="select_all_movielist.do">등록된 영화 목록</a></li>
						</ul></li>
					<li class="treeview"><a href="#"><i class="fa fa-fw fa-hospital-o"></i><span>영화관 관리</span><span
							class="pull-right-container"><i
								class="fa fa-angle-right pull-right"></i></span></a>
					<ul class="treeview-menu">
							<li><a id="modal-open" href="#cinemaManage">지점 관리</a></li>
							<li><a href="cinemaInsertView.do">지점 등록</a></li>
							<li><a href="seatTypeCreateView.do">좌석 타입 관리</a></li>
					</ul>
					</li>
					</ul>
			</section>
		</aside>
	
</body>
</html>