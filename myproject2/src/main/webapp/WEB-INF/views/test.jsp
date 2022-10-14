<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

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

</style>
</head>
<body>

<div class="form-group">
	<input type="tyext" class="form-input border-bottom" placeholder="DD - Design Drastic">
	<span class="border-bottom-animation left"></span>
</div>
<div class="form-group">
	<input type="tyext" class="form-input border-bottom" placeholder="DD - Design Drastic">
	<span class="border-bottom-animation left"></span>
</div>
<div class="form-group">
	<input type="tyext" class="form-input border-bottom" placeholder="DD - Design Drastic">
	<span class="border-bottom-animation right"></span>
</div>
<div class="form-group">
	<input type="tyext" class="form-input border-bottom" placeholder="DD - Design Drastic">
	<span class="border-bottom-animation center"></span>
</div>
<div class="form-group">
	<input type="tyext" class="form-input border-bottom" placeholder="DD - Design Drastic">
	<span class="border-bottom-animation both-side"></span>
</div>


</body>
</html>