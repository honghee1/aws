<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
}
  </style>
<script type="text/javascript">
$(function() {
	v$.ajax({
        url : 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101',
        type:'get',
       dataType:'json',
       success:function(r){
    	   	console.log(r)
       
       }
	

	         
});
/* $(function() {
	var xhr = new XMLHttpRequest();
	var url = '	http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101';
	xhr.open('GET', url ,true); 
	
	xhr.onreadystatechange = function () { 
		if (this.readyState == 4) { 
			alert('Status: '+this.status+'Headers: '+JSON.stringify(this.getAllResponseHeaders())+'Body: '+this.responseText); 
			} }; 
			xhr.send('');
	

	         
}); */
</script>
</head>
<body>
		
</body>
</html>