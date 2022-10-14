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
	<jsp:include page="hh/mainslider.jsp" flush="false"/> 
	<jsp:include page="hh/subslider.jsp" flush="false"/> 
	<jsp:include page="hh/userroom.jsp" flush="false"/> 

	<div class="trailers full-width">
		<div class="row ipad-width">
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="title-hd">
					<h2>in theater</h2>
					<a href="#" class="viewall">View all <i
						class="ion-ios-arrow-right"></i></a>
				</div>
				<div class="videos">
					<div class="slider-for-2 video-ft">
				<c:forEach var="Movielist" items="${requestScope.NowShowingMovielist }"
					varStatus="status">
						<div>
							<iframe class="item-video" src="" 
								data-src="https://www.youtube.com/embed/${Movielist.trailer }"></iframe>
						</div>
				</c:forEach>
					</div>
					<div class="slider-nav-2 thumb-ft">
					<c:forEach var="Movielist" items="${requestScope.NowShowingMovielist }"
					varStatus="status">
						<div class="item">
							<div class="trailer-img">
								<img src="https://img.youtube.com/vi/${Movielist.trailer }/0.jpg"
									alt="preview_img" width="4096" height="2737">
							</div>
							<div class="trailer-infor">
								<h4 class="desc">${Movielist.title }</h4>
								<p>예고편</p>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			
			</div>
			
		</div>
	</div>
	<!-- latest new v2 section-->
</body>
</html>