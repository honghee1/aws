<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script>
$(function(){
	$(document).on("change", "#imageFile1",function() {
    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview1").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$(document).on("change", "#imageFile2",function() {
	console.log("asdasd")
    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview2").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$(document).on("change", "#imageFile3",function() {
	console.log("asdas123d")
    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview3").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$(document).on("change", "#imageFile4",function() {
	
    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview4").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
}); 
$(document).on("change", "#imageFile5",function() {

    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview5").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
});
function isImageFile(file) {

    var ext = file.name.split(".").pop().toLowerCase(); 

    return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
}
function isOverSize(file) {

    var maxSize = 3 * 1024 * 1024; 

    return (file.size > maxSize) ? true : false;
}
$(function(){
	var count = ${fn:length(Filepath)};
		 $(document).on("click","button[id=plus]",function(){
		console.log(count);
		if(count == 5) return;
		count++;
		$(".setimgcontainer").append("<div><img id=preview"+count+"><br><input type='file' id=imageFile"+count+" name=newfile><input type='hidden' name='newfileindex' value="+count+"></div>");
	});
	$("#minus").click(function(){
		console.log(count);
		if(count == 1) return;
			$("#preview"+count).remove();
			$("#imageFile"+count).remove();
		count--;
	});
});
</script>
  <style>
 
    li {
      list-style: none;
    }

    img {
      width: 200px;
      height: 200px;
    }

    .real-upload {
      display: none;
    }

    .upload {
      width: 200px;
      height: 200px;
      background-color: antiquewhite;
    }

    .image-preview {
      width: 200px;
      height: 200px;
      background-color: aquamarine;
      display: flex;
      gap: 20px;
    }
    .setimgcontainer{
   		display:flex;
    }
    
    
    .form-group {
	position: relative;
	width: 200px;
}
.form-input {
	position: relative;
	font-family: "Source Sans Pro", sans-serif;
	font-weight: 600;
	width: 100%;
	height: 40px;
	border: none;
	padding: 0 10px;
	box-shadow: none;
	outline: none;
	-webkit-transition: all .5s ease;
	   -moz-transition: all .5s ease;
	    -ms-transition: all .5s ease;
	     -o-transition: all .5s ease;
	        transition: all .5s ease;
}
p{
	position: relative;
	font-family: "Source Sans Pro", sans-serif;
	font-weight: 600;
	width: 100%;
	height: 20px;
	border: none;
	box-shadow: none;
	outline: none;
	-webkit-transition: all .5s ease;
	   -moz-transition: all .5s ease;
	    -ms-transition: all .5s ease;
	     -o-transition: all .5s ease;
	        transition: all .5s ease;
}
textarea{
position: relative;
	font-family: "Source Sans Pro", sans-serif;
	font-weight: 600;
	
}

/* Border bottom effects */
.form-input.border-bottom {
	position: relative;
	background: transparent;
	padding: 0;
	border-bottom: 2px solid rgba(0, 0, 0, .2);
}
.form-input.border-bottom ~ .border-bottom-animation {
	position: absolute;
	content: "";
	width: 0;
	background: rgba(0, 0, 0, .2);
	height: 2px;
	z-index: 99;
	-webkit-transition: all .5s ease;
	   -moz-transition: all .5s ease;
	    -ms-transition: all .5s ease;
	     -o-transition: all .5s ease;
	        transition: all .5s ease;
}
/* Border bottom left */
.form-input.border-bottom ~ .border-bottom-animation.left {
	left: 0;
	bottom: 0;
}
.form-input.border-bottom:focus ~ .border-bottom-animation.left {
	background: #4285F4;
	width: 100%;
}
/* Border bottom right */
.form-input.border-bottom ~ .border-bottom-animation.right {
	right: 0;
	bottom: 0;
}
.form-input.border-bottom:focus ~ .border-bottom-animation.right {
	background: #4285F4;
	width: 100%;
}
/* Border bottom center */
.form-input.border-bottom ~ .border-bottom-animation.center {
	left: 0;
	right: 0;
	bottom: 0;
	margin: 0 auto;
}
.form-input.border-bottom:focus ~ .border-bottom-animation.center {
	background: #4285F4;
	width: 100%;
}
/* Border bottom both side */
.form-input.border-bottom ~ .border-bottom-animation.both-side {
	height: 0px;
	width: 100%;
	left: 0;
	right: 0;
	bottom: 0;
}
.form-input.border-bottom ~ .border-bottom-animation.both-side:before,
.form-input.border-bottom ~ .border-bottom-animation.both-side:after {
	position: absolute;
	content: " ";
	bottom: 0;
	width: 0;
	height: 2px;
	-webkit-transition: all .5s ease;
	   -moz-transition: all .5s ease;
	    -ms-transition: all .5s ease;
	     -o-transition: all .5s ease;
	        transition: all .5s ease;
}
.form-input.border-bottom ~ .border-bottom-animation.both-side:before {
	left: 0;
}
.form-input.border-bottom ~ .border-bottom-animation.both-side:after {
	right: 0;
}
.form-input.border-bottom:focus ~ .border-bottom-animation.both-side:before,
.form-input.border-bottom:focus ~ .border-bottom-animation.both-side:after {
	background: #4285F4;
	width: 50%;
}
.layout {
  width: 520px;
  height: 100%px;
  display: flex;
  gap: 16px;
  align-items: center;
  flex-wrap: wrap;
  
}
.layout1 {
  width: 1040px;
  height: 100%px;
  display: flex;
  gap: 16px;
  align-items: center;
  flex-wrap: wrap;
  
}
.search_btn{
	width: 40px;
	height: 30px;
}
.search_container{
	border: 2px solid rgba(0, 0, 0, .2);
	padding: 10px;
	margin-bottom: 20px;
	display: flex;
	flex-wrap: wrap;
	width: 1600px;
	
}
.movie_info_container{
	padding: 10px;
	margin-bottom: 20px;
	display: flex;
	flex-wrap: wrap;
	width: 66%;
	gap: 16px;
}
.movie_flot_container{
	padding: 10px;
	margin-bottom: 20px;
	display: flex;
	flex-wrap: wrap;
	width: 33%;
}
.search_hide{
	display: flex;
	align-items: center;
}
.search_hide div {
	border: 2px solid rgba(0, 0, 0, .2);
	border-radius: 50%;
	font-size: 16px;
	width:30px;
	height:30px;
	text-align: center;
	line-height: 28px; 
	font-weight: bold;
	margin-left: 10px;
}
#plus{
	background-color: rgba(0, 0, 0, .1);
	border-radius: 50%;
	font-size: 16px;
	width:30px;
	height:30px;
	text-align: center;
/* 	line-height: 27px;  */
	font-weight: bold;
	margin-left: 10px;
}
#minus{
	background-color: rgba(0, 0, 0, .1);
	border-radius: 50%;
	font-size: 16px;
	width:30px;
	height:30px;
	text-align: center;
	/* line-height: 30px; */ 
	font-weight: bold;
	margin-left: 10px;
}
  </style>
</head>
<body>
<h2>영화 상세 정보 페이지</h2>
		<form id="file_form" action="uploadmovie.do" method="post" enctype="multipart/form-data">
		
		<div class="search_container">
		<div class="movie_info_container">
		<div class="form-group">
		<input type="text" name="title" id="movie_title_kr" value="${requestScope.movie.title }" class="form-input border-bottom" placeholder="영화 제목(한)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" name="titleEng" id="movie_title_eng" value="${requestScope.movie.titleEng }" class="form-input border-bottom" placeholder="영화 제목(영)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" name="directorNm" id="directorNm" value="${requestScope.movie.directorNm }"class="form-input border-bottom" placeholder="감독(한)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" name="directorEnNm" id="directorEnNm" value="${requestScope.movie.directorEnNm }"class="form-input border-bottom" placeholder="감독(영)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 83%">
		<input type="text" name="actorNm" id="actorNm" value="${requestScope.movie.actorNm }" class="form-input border-bottom" placeholder="배우(한)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 83%">
		<input type="text" name="actorEnNm" id="actorEnNm" value="${requestScope.movie.actorEnNm }" class="form-input border-bottom" placeholder="배우(영)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 83%">
		<input type="text" name="company" id="company" value="${requestScope.movie.company }" class="form-input border-bottom" placeholder="제작사">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 83%">
		<input type="text" name="keywords" id="keywords" value="${requestScope.movie.keywords }"  class="form-input border-bottom" placeholder="키워드">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text"  name="nation" id="nation" value="${requestScope.movie.nation }" class="form-input border-bottom" placeholder="국가">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" name="genre" id="genre" value="${requestScope.movie.genre }" class="form-input border-bottom" placeholder="장르">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" name="runtime" id="runtime" value="${requestScope.movie.runtime }" class="form-input border-bottom" placeholder="상영시간">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" name="repRlsDate" id="repRlsDate" value="${requestScope.movie.repRlsDate }" class="form-input border-bottom" placeholder="개봉일">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 41%">
		<input type="text" name="trailer" id="trailer" value="https://youtu.be/${requestScope.movie.trailer }" class="form-input border-bottom" placeholder="예고편 링크 *유튜브 공유 버튼을 눌러 링크를 복사해주세요">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="date" name="startdate" id="startdate" value="${requestScope.scdto.startdate }" class="form-input border-bottom" placeholder="상영 시작 날짜">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="date" name="enddate" id="enddate" value="${requestScope.scdto.enddate }" class="form-input border-bottom" placeholder="상영 종료 날짜">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 41%">
		<input type="text"  name="rating" id="rating" value="${requestScope.movie.rating }" class="form-input border-bottom" placeholder="관람 등급">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 41%">
		<input type="text" name="kmdbUrl" id="kmdbUrl" value="${requestScope.movie.kmdbUrl }" class="form-input border-bottom" placeholder="상세보기 페이지">
		<span class="border-bottom-animation left"></span>
		</div>
		</div>
		<div class="movie_flot_container">
		<div class="form-group" >
		<p>줄거리</p>
		<textarea name="plotText"  id="plotText" rows="20" cols="65" name="plotText"  placeholder="${requestScope.movie.plotText }"></textarea>
		</div>
		</div>
		<section  class="layout">
		<br>
		<div class="setimgcontainer">
		<c:forEach var="f" items="${requestScope.Filepath }">
		<div>
		<img id="preview${f.fno}" src="fileDown.do?fno=${f.fno}&mcode=${f.mcode}"><br>
		<input type="file" id="imageFile${f.fno}" name="file">
		<input type="hidden" value="${f.fno}" name="oldfile">
		</div>
		</c:forEach> 
		</div>
		<br>
		<button type="button" id="plus">+</button> <button type="button" id="minus">-</button>
		<p><input type="hidden" name="update" value=${requestScope.movie.mcode }></p>
		<p><button>저장</button></p><p><button>뒤로가기</button></p>
		</section>
			</div>
	</form>
</body>
</html>