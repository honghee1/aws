<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.control-sidebar, .control-sidebar-bg {
    top: 0;
    right: -600px;
    width: 600px;
    -webkit-transition: right .3s ease-in-out;
    -o-transition: right .3s ease-in-out;
    transition: right .3s ease-in-out;
}
</style>
</head>
<body>
<footer class="main-footer">
			<div class="pull-right d-none d-sm-inline-block">
				<ul
					class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">FAQ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Purchase
							Now</a></li>
				</ul>
			</div>
			&copy; 2018 <a href="https://www.multipurposethemes.com/">Multi-Purpose
				Themes</a>. All Rights Reserved.
		</footer>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="nav-item"><a href="#control-sidebar-settings-tab"
					data-toggle="tab"><i class="fa fa-cog fa-spin"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
			<jsp:include page="adminroom.jsp" flush="false"/> 
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
</body>
</html>