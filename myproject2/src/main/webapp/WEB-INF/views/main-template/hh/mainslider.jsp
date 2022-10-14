<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="slider sliderv2">
	<div class="container" style="width: 1200px">
		<div class="row">
			<div class="slider-single-item">
				<c:forEach var="Movielist" items="${requestScope.NowShowingMovielist }"
					varStatus="status">
					<div class="movie-item">
						<div class="row" >
							<div class="col-md-8 col-sm-12 col-xs-12">
								<div class="title-in">
									<div class="cate">
										<span class="blue"><a >&nbsp;&nbsp;&nbsp;${Movielist.rating }</a>
										</span><span class="yell"><a >&nbsp;${Movielist.genre }&nbsp;</a></span><span
											class="orange"><a >&nbsp;${Movielist.keywords }&nbsp;</a></span>
									</div>
									<h1>
										<a href="#">${Movielist.title }<br>
											${Movielist.titleEng } <span>${Movielist.repRlsDate}</span></a>
									</h1>
									<div class="social-btn">
										<a href="${Movielist.trailer }" class="parent-btn fancybox-media hvr-grow"><i class="ion-play"></i>Watch
											Trailer</a><a href="#" class="parent-btn"><i
											class="ion-heart"></i>Add to Favorite</a>
										<div class="hover-bnt">
											<a href="#" class="parent-btn"><i
												class="ion-android-share-alt"></i>share</a>
											<div class="hvr-item">
												<a href="#" class="hvr-grow"><i
													class="ion-social-facebook"></i></a><a href="#"
													class="hvr-grow"><i class="ion-social-twitter"></i></a><a
													href="#" class="hvr-grow"><i
													class="ion-social-googleplus"></i></a><a href="#"
													class="hvr-grow"><i class="ion-social-youtube"></i></a>
											</div>
										</div>
									</div>
									<div class="mv-details">
										<p>
											<i class="ion-android-star"></i><span>7.4</span>/10
										</p>
										<ul class="mv-infor">
											<li>Run Time: ${Movielist.runtime }</li>
											<li>Rated: ${Movielist.rating }</li>
										</ul>
									</div>
									<div class="btn-transform transform-vertical">
										<div>
											<a href="/moviesingle.do?mcode=${Movielist.mcode }" class="item item-1 redbtn">more detail</a>
										</div>
										<div>
											<a href="/moviesingle.do?mcode=${Movielist.mcode }" class="item item-2 redbtn hvrbtn">more detail</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-12 col-xs-12">
								<div class="mv-img-2">
									<%-- <c:forEach var="f" items="${requestScope.Filepath }"> --%>
										<%-- <a href="fileDown.do?fno=${f.fno}&mcode=${f.mcode}">
							${f.fileName}</a><br> --%>
									<%-- 	<c:if test="${f.type =='image' }"> --%>
											<img src="fileDown.do?fno=1&mcode=${Movielist.mcode }" style="width: 270px;height: 414px;">
								<%-- 		</c:if> --%>
									<%-- </c:forEach> --%>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>