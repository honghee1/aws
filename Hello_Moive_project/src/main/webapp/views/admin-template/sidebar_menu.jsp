<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#confirm").click(function() {
			modalClose();
		});
		$("#modal-open").click(function() {
			$("#popup").css('display', 'flex').hide().fadeIn();
		});
		$("#close").click(function() {
			modalClose();
		});
		function modalClose() {
			$("#popup").fadeOut();
		}
		
		 $.ajax({
			url : 'select_cinema_list.do',
			type : 'get',
			success:function(r){
				var cinemalist = JSON.parse(r);
				var tag = "";
				for(var i = 0; i < cinemalist.totalCinemaCount; i++){
				 	tag += " <div class='box-body costom-box'>";
					tag +=  "<h6><span class='text-uppercase'>"
					tag +=  "<a class='cinemaView text-warning' href=cinemaManagementView.do?cinemacode="+cinemalist.items[i].cinemacode+">"+cinemalist.items[i].cinemaname+"</a></span><span class='float-right'>"
					tag +=  "<a class='btn btn-xs btn-warning delete-btn' href=cinemaDelete.do?cinemacode="+cinemalist.items[i].cinemacode+">삭제</a></span></h6><br>"
					tag +=  "<div class='option-box'>"
					tag +=  "<a href=cinemaManagementView.do?cinemacode="+cinemalist.items[i].cinemacode+"><img class='option-img' alt=옵션 이미지 src=images/hellocinema_icon.png></a>"
					tag +=  "</div>"
					tag += "</div>"
				}
				$(".option-div").html(tag);
			}
		}); 
	});
</script>
<style type="text/css">
.popup-wrap {
	background-color: rgba(0, 0, 0, .3);
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: none;
	padding: 15px;
}

.popup {
	width: 100%;
	max-width: 800px;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
}

.popup-head {
	width: 100%;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-weight: bold;
	font-size: 20px;
	background-color: #fbae1c;
}

.popup-body {
	width: 800px;
	background-color: #ffffff;
}

.body-content {
	width: 100%;
	padding: 30px;
	margin: 0px;
}

.body-titlebox {
	text-align: center;
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
}

.body-contentbox {
	word-break: break-word;
	overflow-y: auto;
	min-height: 400px;
	max-height: 800px;
}

.popup-foot {
	width: 100%;
	height: 50px;
	background-color: white;
}

.pop-btn {
	display: inline-flex;
	width: 150px;
	height: 30px;
	justify-content: center;
	align-items: center;
	float: left;
	color: #ffffff;
	cursor: pointer;
	font-size: 16px;
	border-radius: 10px;
	background-color: #fbae1c;
	margin-left: 330px;
}

.pop-btn.confirm {
	border: 1px solid #ffffff;
	
}
.pop-btn.confirm:hover {
	font-weight: bold;
}

.cinemaView{
	font-size: 14px;
	margin: 5px;
}
.option-img{
	width: 60px;
}
.option-div{
	width: 740px;
	display: flex;
	flex-flow: row wrap;
}
.option-box{
	width: 100px;
}
.box box-body{
	display: inline-block;
}
.costom-box{
	background: #fff;
    border-radius: 5px;
    box-shadow: 0px 0px 5px 0px rgb(142 139 133 / 32%);
    transition: .5s;
    display: flex;
    flex-direction: column;
    width: 150px;
    height: 150px;
    max-width: 150px;
    min-width: 150px;
    margin: 10px;
}
.delete-btn{
	margin-top: -4px;
}
</style>
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
	
	
	<div class="container">
		<div class="popup-wrap" id="popup">
			<div class="popup">
				<div class="popup-head">
					<span class="head-title">지점 목록</span>
				</div>
				<div class="popup-body">
					<div class="body-content">
						<div class="body-contentbox">
							<div class="option-div">
								
							</div>
						</div>
					</div>
				</div>
				<div class="popup-foot">
					<span class="pop-btn confirm" id="confirm">창닫기</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>