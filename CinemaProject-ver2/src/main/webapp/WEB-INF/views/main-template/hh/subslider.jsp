<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="movie-items  full-width">
	<div class="row">
		<div class="col-md-12">
			<div class="title-hd">
				<h2>in theater</h2>
				<a href="#" class="viewall">View all <i
					class="ion-ios-arrow-right"></i></a>
			</div>
			<div class="tabs">
				<ul class="tab-links">
					<li class="active"><a href="#tab1-h2">#Now showing</a></li>
					<li><a href="#tab2-h2">#Coming soon</a></li>
					<li><a href="#tab3-h2"> #Top rated </a></li>
					<li><a href="#tab4-h2">#Most reviewed</a></li>
				</ul>
				<div class="tab-content">

					<!-- BEGIN | #Now showing -->
					<div id="tab1-h2" class="tab active">
						<div class="row">
							<div class="slick-multiItem2">
								<c:forEach var="Movielist" items="${requestScope.NowShowingMovielist }"
									varStatus="status">
									<div class="slide-it">
										<div class="movie-item">
											<div class="mv-img">
												<img src="fileDown.do?fno=1&mcode=${Movielist.mcode }">
											</div>
											<div class="hvr-inner">
												<a href="moviesingle.do?mcode=${Movielist.mcode }">Read more <i
													class="ion-android-arrow-dropright"></i></a>
											</div>
											<div class="title-in">
												<h6>
													<a href="#">${Movielist.title }</a>
												</h6>
												<p>
													<i class="ion-android-star"></i><span>7.4</span>/10
												</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- END | #Now showing-->

					<!-- BEGIN | #Coming soon -->
					<div id="tab2-h2" class="tab">
						<div class="row">
							<div class="slick-multiItem2">
							<c:forEach var="Movielist" items="${requestScope.ComingSoonMovieList }"
									varStatus="status">
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="fileDown.do?fno=1&mcode=${Movielist.mcode }">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.do?mcode=${Movielist.mcode }">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">${Movielist.title }</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- END | #Coming soon -->

					<!-- BEGIN | #Top rated -->
					<div id="tab3-h2" class="tab">
						<div class="row">
							<div class="slick-multiItem2">
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it5.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END | #Top rated  -->

					<!-- BEGIN | #Most reviewed -->
					<div id="tab4-h2" class="tab">
						<div class="row">
							<div class="slick-multiItem2">

								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it8.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END | #Most reviewed -->

				</div>
			</div>
			<div class="title-hd">
				<a href="#" class="viewall">View all <i
					class="ion-ios-arrow-right"></i></a>
			</div>
			<div class="tabs">
				<ul class="tab-links-2">
					<li class="active"><a href="#tab21-h2">#Popular</a></li>
					<li><a href="#tab22-h2">#Coming soon</a></li>
					<li><a href="#tab23-h2"> #Top rated </a></li>
					<li><a href="#tab24-h2">#Most reviewed</a></li>
				</ul>
				<div class="tab-content">
					<div id="tab21-h2" class="tab active">
						<div class="row">
							<div class="slick-multiItem2">
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it7.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Interstellar</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it8.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">The revenant</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it9.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it4.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">The walk</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it5.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it6.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Interstellar</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it7.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it8.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="tab22-h2" class="tab">
						<div class="row">
							<div class="slick-multiItem2">
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it4.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">The walk</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it5.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it6.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Interstellar</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it7.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it8.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="tab23-h2" class="tab">
						<div class="row">
							<div class="slick-multiItem2">
								<div class="movie-item">
									<div class="mv-img">
										<img src="images/uploads/mv-it1.jpg" alt="">
									</div>
									<div class="hvr-inner">
										<a href="moviesingle.html">Read more <i
											class="ion-android-arrow-dropright"></i></a>
									</div>
									<div class="title-in">
										<h6>
											<a href="#">Interstellar</a>
										</h6>
										<p>
											<i class="ion-android-star"></i><span>7.4</span>/10
										</p>
									</div>
								</div>
								<div class="movie-item">
									<div class="mv-img">
										<img src="images/uploads/mv-it2.jpg" alt="">
									</div>
									<div class="hvr-inner">
										<a href="moviesingle.html">Read more <i
											class="ion-android-arrow-dropright"></i></a>
									</div>
									<div class="title-in">
										<h6>
											<a href="#">The revenant</a>
										</h6>
										<p>
											<i class="ion-android-star"></i><span>7.4</span>/10
										</p>
									</div>
								</div>
								<div class="movie-item">
									<div class="mv-img">
										<img src="images/uploads/mv-it3.jpg" alt="">
									</div>
									<div class="hvr-inner">
										<a href="moviesingle.html">Read more <i
											class="ion-android-arrow-dropright"></i></a>
									</div>
									<div class="title-in">
										<h6>
											<a href="#">Die hard</a>
										</h6>
										<p>
											<i class="ion-android-star"></i><span>7.4</span>/10
										</p>
									</div>
								</div>
								<div class="movie-item">
									<div class="mv-img">
										<img src="images/uploads/mv-it4.jpg" alt="">
									</div>
									<div class="hvr-inner">
										<a href="moviesingle.html">Read more <i
											class="ion-android-arrow-dropright"></i></a>
									</div>
									<div class="title-in">
										<h6>
											<a href="#">The walk</a>
										</h6>
										<p>
											<i class="ion-android-star"></i><span>7.4</span>/10
										</p>
									</div>
								</div>
								<div class="movie-item">
									<div class="mv-img">
										<img src="images/uploads/mv-it3.jpg" alt="">
									</div>
									<div class="hvr-inner">
										<a href="moviesingle.html">Read more <i
											class="ion-android-arrow-dropright"></i></a>
									</div>
									<div class="title-in">
										<h6>
											<a href="#">Die hard</a>
										</h6>
										<p>
											<i class="ion-android-star"></i><span>7.4</span>/10
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="tab24-h2" class="tab">
						<div class="row">
							<div class="slick-multiItem2">
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it4.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">The walk</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it5.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it6.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Interstellar</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it7.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">
										<div class="mv-img">
											<img src="images/uploads/mv-it8.jpg" alt="">
										</div>
										<div class="hvr-inner">
											<a href="moviesingle.html">Read more <i
												class="ion-android-arrow-dropright"></i></a>
										</div>
										<div class="title-in">
											<h6>
												<a href="#">Die hard</a>
											</h6>
											<p>
												<i class="ion-android-star"></i><span>7.4</span>/10
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>