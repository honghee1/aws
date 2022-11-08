<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	
	$(".search_btn").click(function() {
		 var s;
		    var popupX = (window.screen.width / 2) - (1200 / 2);
		 	var popupY = (window.screen.height / 2) - (800 / 2);
		 	console.log(popupX);
		 	console.log(popupY);
		    s = "&releaseDts"+'='+$("#releaseDts").val();
		    s += "&title"+'='+$("#title").val();
var xhr = new XMLHttpRequest(); 
var url = 'https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=94TY52485SP98PB338TU' + s; 
var tag = ""; 
var str = "";
/*상영월*/ xhr.open('GET', url ); 
xhr.onreadystatechange = function () { 
	 if (this.readyState == 4) { 
		 const json = this.responseText;
		 const r = JSON.parse(json);
		 
        if(r.TotalCount == 1){
        	
        console.log(r);
        var actorNm = "";
        var actorEnNm = "";
        var title = r.Data[0].Result[0].title.replace('!HS', '');
        title = title.replace('!HE', '');
        title = title.replace(/ /g, "");
        $('#movie_title_kr').val(title);
        $('#naver_mtitle').val(title);
        $('#movie_title_eng').val(r.Data[0].Result[0].titleEng);
        $('#directorNm').val(r.Data[0].Result[0].directors.director[0].directorNm);
        $('#directorEnNm').val(r.Data[0].Result[0].directors.director[0].directorEnNm);
        for(y=0;y<r.Data[0].Result[0].actors.actor.length;y++){
              if(y>8)break;
              actorNm += r.Data[0].Result[0].actors.actor[y].actorNm + " ,";
           }
        actorNm = actorNm.slice(0, -1);
        $('#actorNm').val(actorNm);
        for(y=0;y<r.Data[0].Result[0].actors.actor.length;y++){
              if(y>8)break;
              actorEnNm += r.Data[0].Result[0].actors.actor[y].actorEnNm + " ,";
           }
        actorEnNm = actorEnNm.slice(0, -1);
        $('#actorEnNm').val(actorEnNm);
        $('#company').val(r.Data[0].Result[0].company);
        $('#nation').val(r.Data[0].Result[0].nation);
        $('#genre').val(r.Data[0].Result[0].genre);
        $('#rating').val(r.Data[0].Result[0].rating);
        $('#runtime').val(r.Data[0].Result[0].runtime);
        $('#repRlsDate').val(r.Data[0].Result[0].repRlsDate);
        $('#keywords').val(r.Data[0].Result[0].keywords);
        $('#kmdbUrl').val(r.Data[0].Result[0].kmdbUrl);
        $('#plotText').val(r.Data[0].Result[0].plots.plot[0].plotText);
        $('#prodYear').val(r.Data[0].Result[0].prodYear);
        var s = "&title"+'='+title;
    	s += "&prodYear="+r.Data[0].Result[0].prodYear;
    	console.log(s);
        $.ajax({
           url : 'naver.do?'+s,
           type:'get',
           dataType:'json',
           success:function(r){
        	   console.log(r)
        	   $("#userRating").val(r.items[0].userRating);
           }
    })
        }else if(r.TotalCount > 1){
       	 var tag = "<div id=test1>";
            tag += "<form id=test action=insert_movie.do?close=close method=post>";  
            
        for(i=0;i<r.Data[0].Result.length;i++){
          var title = r.Data[0].Result[i].title.replace('!HS', '');
           title = title.replace('!HE', '');
           title = title.replace(/ /g, "");
           tag += "<tr id=Line>";
           tag += "<td><button id=data1 >선택하기</button></td>";
           tag += "<td name=title>"+title+"</td>";
           tag += "<td name='titleEng'>"+r.Data[0].Result[i].titleEng+"</td>";
           tag += "<td name='directorNm'>"+r.Data[0].Result[i].directors.director[0].directorNm+"</td>";
           tag += "<td name='directorEnNm'>"+r.Data[0].Result[i].directors.director[0].directorEnNm+"</td>";
           tag += "<td>";
           for(y=0;y<r.Data[0].Result[i].actors.actor.length;y++){
              if(y>10)break;
              tag += r.Data[0].Result[i].actors.actor[y].actorNm + " ,";
           }
           tag += "</td>";
           tag += "<td>";
           for(y=0;y<r.Data[0].Result[i].actors.actor.length;y++){
              if(y>10)break;
              tag += r.Data[0].Result[i].actors.actor[y].actorEnNm + " ,";
           }
           tag += "</td>";
           tag += "<td>"+r.Data[0].Result[i].company+"</td>";
           tag += "<td>"+r.Data[0].Result[i].nation+"</td>";
           tag += "<td>"+r.Data[0].Result[i].rating+"</td>";
           tag += "<td>"+r.Data[0].Result[i].runtime+"</td>";
           tag += "<td>"+r.Data[0].Result[i].repRlsDate+"</td>";
           tag += "<td style=display:none>" + r.Data[0].Result[i].plots.plot[0].plotText + "</td>";
           tag += "<td style=display:none>" + r.Data[0].Result[i].keywords + "</td>";
           tag += "<td style=display:none>" + r.Data[0].Result[i].genre + "</td>";
           tag += "<td style=display:none>" + r.Data[0].Result[i].prodYear + "</td>";
           tag += "</tr>";
     }
             tag += "</form>"; 
             tag += "</div>"
       	 $("#form").attr('action','insertMovie_pop_list.do');
       	 $("#form").append($('<input type="hidden" class="t1" value="'+tag+'" name=tag>'));
       	 window.open('','POP','width=1400, height=800, resizable=yes, scrollbars=yes, status=no,left='+popupX+', top='+popupY); 
       	 $("#form").submit();
        }else if(r.TotalCount == 0){
        	alert('검색 결과가 없습니다');
        }
       
	 	}
	 };
	 	
	    xhr.send(''); 
});
	
	
	
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
    var maxSize = 15 * 1024 * 1024; 
    return (file.size > maxSize) ? true : false;
}
$(function(){
	var count = 3;
	$("#plus").click(function(){
		console.log(count);
		if(count == 5) return;
		count++;
		$(".setimgcontainer").append("<div><img id=preview"+count+"><br><input type='file' id=imageFile"+count+" name=file></div>");
	});
	$("#minus").click(function(){
		console.log(count);
		if(count == 1) return;
			$("#preview"+count).remove();
			$("#imageFile"+count).remove();
		count--;
	});
});
	var flag = 0;
function search_hide_show(){
	if(flag == 0){
	document.getElementById("layout").style.display = "";
	document.getElementById("title").focus();
		flag=1;
	}
	else{
		document.getElementById("layout").style.display = "none";	
		flag=0;
	}
} 
function naverAPIUserRating(){
	var s = "&title"+'='+$("#naver_mtitle").val();
	s += "&prodYear="+$("#prodYear").val();
	console.log(s);
    $.ajax({
       url : 'naver.do?'+s,
       type:'get',
       dataType:'json',
       success:function(r){
    	   if(r.total == 1){
        	   $("#userRating").val(r.items[0].userRating);
        	   $("#prodYear").val(r.items[0].pubDate);
    	   }else{
    		   $.ajax({
    		       url :'Naver_API_List.do',
    		       data : JSON.stringify(r),		   
    		       type:'post',
    		       dataType:'text',
    		       contentType:"application/json;charset=UTF-8",
    		       success:function(r){
    		    	 var popupX = (window.screen.width / 2) - (1200 / 2);
    				 var popupY = (window.screen.height / 2) - (800 / 2);
    		    	   const json = r;
    		  		   const naver_api_list = JSON.parse(json);

    		         	  var tag = "<div id=test1>";
    		              tag += "<form id=test action=insert_movie.do?close=close method=post>";  
    		              
    		          for(i=0;i<naver_api_list.total;i++){
    		             tag += "<tr id=Line>";
    		             tag += "<td><input type='button' value='선택' id='data1'></td>";
    		             tag += "<td id=title name=title>"+naver_api_list.items[i].title+"</td>";
    		             tag += "<td id=title name=title>"+naver_api_list.items[i].pubDate+"</td>";
    		             tag += "<td id=title name=title>"+naver_api_list.items[i].userRating+"</td>";
    		             tag += "<td id=title name=title><a id=Naver_Link href=#>"+naver_api_list.items[i].link+"</a></td>";
    		             tag += "</tr>";
    		       }
    		               tag += "</form>"; 
    		               tag += "</div>"
    		         	 $("#form").attr('action','insertMovie_pop_list2.do');
    		         	 $("#form").append($('<input type="hidden" class="t1" value="'+tag+'" name=tag>'));
    		         	openWin = window.open('','POP','width=800, height=800, resizable=yes, scrollbars=yes, status=no,left='+popupX+', top='+popupY); 
    		         	 $("#form").submit();   
    		    	  
    		         	/* $("#pInput").val(naver_api_list.items[0].title); */
    		         	  /* window.name = "parentForm";  */         
    		         	 /* openWin = window.open("Child.do","childForm", "width=570, height=350, resizable = no, scrollbars = no"); */
    		         	/*  openWin.document.getElementById("#cInput").value = document.getElementById("#pInput").value; */
    		         	
    		       }
    		})
    		   
    	   }
    	  
       }
})
}
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
    .form-group1 {
	position: relative;
	width: 200px;
	display: flex;
	justify-content: space-between;
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
input[type="date"]{
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
	background-color: rgba(0, 0, 0, .2);
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
	background-color: rgba(0, 0, 0, .2);
	border-radius: 50%;
	font-size: 16px;
	width:30px;
	height:30px;
	text-align: center;
	/* line-height: 30px; */ 
	font-weight: bold;
	margin-left: 10px;
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
	flex-direction: column;
}
.naver-UserRating{
display: flex;
}
  </style>
</head>
<body>
 <br>    
		<form id="file_form" action="uploadmovie.do" method="post" enctype="multipart/form-data">
		<div class="search_container">
		<div class="search_hide" style="width: 100%">
		<h2>검색해서 정보 넣기</h2><div><a onclick="search_hide_show()" href="#">+</a></div>
		</div>
		<section id="layout" class="layout1" style="display: none">
		<div class="form-group">
		<input type="text" id="title" class="form-input border-bottom" placeholder="영화 제목">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="releaseDts" class="form-input border-bottom" placeholder="개봉 연도">
		<span class="border-bottom-animation left"></span>
		</div>
		<a class="search_btn" href="#">검색</a>
		</section>
		</div>
		
		
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
		<input type="text" name="trailer" id="trailer" value="${requestScope.movie.trailer }" class="form-input border-bottom" placeholder="예고편 링크 *유튜브 공유 버튼을 눌러 링크를 복사해주세요">
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
		<textarea name="plotText"  id="plotText" rows="15" cols="65" name="plotText"  placeholder="줄거리">${requestScope.movie.plotText }</textarea>
		</div>
		<p>네이버 평점 연결</p>
		<div class="naver-UserRating">
		<div class="form-group" >
		<input type="text" name="naver_mtitle" id="naver_mtitle" value="${requestScope.movie.title }" class="form-input border-bottom" placeholder="제목(한)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="margin-left:30px; ">
		<input type="text" name="pubDate" id="prodYear" value="${requestScope.prodYear }" class="form-input border-bottom" placeholder="제작 연도">
		<span class="border-bottom-animation left"></span>
		</div>
		</div>
		<div class="form-group">
		<input type="text" name="user_rating" id="userRating" value="" class="form-input border-bottom" placeholder="네이버 평점">
		<span class="border-bottom-animation left"></span>
		<br>
		</div>
		<a onclick="naverAPIUserRating()" href="#">검색</a>
		</div>
		
		<section  class="layout">
		<div class="setimgcontainer">
		<div>
		<img id="preview1" ><br>
		<input type="file" id="imageFile1" name="file">
		</div>
		<div>
		<img id="preview2"><br>
		<input type="file" id="imageFile2" name="file">
		</div>
		<div>
		<img id="preview3"><br>
		<input type="file" id="imageFile3" name="file">
		</div>
		</div>
		<button type="button" id="plus">+</button> <button type="button" id="minus">-</button>
		<br>
		<p><button style="width: 70px; height: 30px">업로드</button></p>
			</section>
		</div>
	</form>
	<form id='form'  method='post' target=POP>
	</form>
</body>
</html>