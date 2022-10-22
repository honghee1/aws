<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
$(function() {
var xhr = new XMLHttpRequest(); 
var url = 'https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=94TY52485SP98PB338TU'; 
 
 /*상영월*/ xhr.open('GET', url ); 
 xhr.onreadystatechange = function () { 
	 if (this.readyState == 4) { 
		 alert('Status: '+this.status+'Headers: '+JSON.stringify(this.getAllResponseHeaders())+'Body: '+this.responseText); 
		 const json = this.responseText;
		 const obj = JSON.parse(json);

		 console.log(obj);
		 // expected output: 42

		 

		 console.log(this.responseText);
	 	}
	 };
	 	
});
</script>
</head>
<body>

</body>
</html>