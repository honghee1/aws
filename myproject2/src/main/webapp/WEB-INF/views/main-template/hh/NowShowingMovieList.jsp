<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="hero common-hero">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct">
						<h1>현재 상역작</h1>
						<ul class="breadcumb">
							<li class="active"><a href="/main.do">Home</a></li>
							<li><span class="ion-ios-arrow-right"></span>NowShowingList</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-single">
		<div class="container">
			<div class="row ipad-width">
				<div class="col-md-8 col-sm-12 col-xs-12">
					<div class="topbar-filter">
						<p>
							Found <span>${requestScope.pageMaker.totalCount } movies</span>in total
						</p>
						<label>Sort by:</label><select><option value="popularity">Popularity
								Descending</option>
							<option value="popularity">Popularity Ascending</option>
							<option value="rating">Rating Descending</option>
							<option value="rating">Rating Ascending</option>
							<option value="date">Release date Descending</option>
							<option value="date">Release date Ascending</option></select><a
							href="movielist.html" class="list"><i
							class="ion-ios-list-outline "></i></a><a href="moviegrid.html"
							class="grid"><i class="ion-grid active"></i></a>
					</div>
					<div class="flex-wrap-movielist">
						<c:forEach var="NowShowingMovieList" items="${requestScope.NowShowingMovieList }"
					varStatus="status">
						<div class="movie-item-style-2 movie-item-style-1">
							<img src="fileDown.do?fno=1&mcode=${NowShowingMovieList.mcode }" alt="">
							<div class="hvr-inner">
								<a href="/moviesingle.do?mcode=${NowShowingMovieList.mcode }">Read more <i
									class="ion-android-arrow-dropright"></i></a>
							</div>
							<div class="mv-item-infor">
								<h6>
									<a href="/moviesingle.do?mcode=${NowShowingMovieList.mcode }">${NowShowingMovieList.title}</a>
								</h6>
								<p class="rate">
									<i class="ion-android-star"></i><span>${NowShowingMovieList.user_rating}</span>/10
								</p>
							</div>
						</div>
						</c:forEach>
					</div>
					<div class="topbar-filter">
						<div class="pagination2">
							<ul class="btn-group pagination">
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/moviegrid.do?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
    <li>
        <a href='<c:url value="/moviegrid.do?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/moviegrid.do?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>

						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-12 col-xs-12">
					<div class="sidebar">
						<div class="searh-form">
							<h4 class="sb-title">Search for movie</h4>
							<form class="form-style-1" action="#">
								<div class="row">
									<div class="col-md-12 form-it">
										<label>Movie name</label><input type="text"
											placeholder="Enter keywords">
									</div>
									<div class="col-md-12 form-it">
										<label>Genres & Subgenres</label>
										<div class="group-ip">
											<select name="skills" multiple="" class="ui fluid dropdown"><option
													value="">Enter to filter genres</option>
												<option value="Action1">Action 1</option>
												<option value="Action2">Action 2</option>
												<option value="Action3">Action 3</option>
												<option value="Action4">Action 4</option>
												<option value="Action5">Action 5</option></select>
										</div>
									</div>
									<div class="col-md-12 form-it">
										<label>Rating Range</label><select><option
												value="range">-- Select the rating range below --</option>
											<option value="saab">-- Select the rating range
												below --</option></select>
									</div>
									<div class="col-md-12 form-it">
										<label>Release Year</label>
										<div class="row">
											<div class="col-md-6">
												<select><option value="range">From</option>
													<option value="number">10</option></select>
											</div>
											<div class="col-md-6">
												<select><option value="range">To</option>
													<option value="number">20</option></select>
											</div>
										</div>
									</div>
									<div class="col-md-12 ">
										<input class="submit" type="submit" value="submit">
									</div>
								</div>
							</form>
						</div>
						<div class="ads">
							<img src="images/uploads/ads1.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>