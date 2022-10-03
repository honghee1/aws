<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart popup</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- <script type="text/javascript">
	$(function(){

	$("#gocartlist").click(function(){
	console.log("sdfsasdasd")
	/* Window.opener.location.href="/shoping-cart.do"; */
	Window.opener.location.reload();
	window.close();
	});
	
	});

	
</script> -->
<script type="text/javascript">
	function gocartlist(){
	window.opener.location.href = window.opener.location="/shoping-cart.do";
	window.close();
	
	};

	function reload(){
		  window.opener.location.href = window.opener.document.URL;
		window.close();
	};
	

	
</script>



	<%
		request.setCharacterEncoding("utf-8");
	String colorname = request.getParameter("colorname");
	String sizekind = request.getParameter("sizekind");
	int price = Integer.parseInt(request.getParameter("price"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	String memberid = request.getParameter("memberid");
	String productname = request.getParameter("productname");
	
	%>
</head>
<body>
	<p><%=colorname%></p>
	<p><%=sizekind%></p>
	<p><%=price%></p>
	<p><%=quantity%></p>
	<p><%=memberid%></p>
	<p><%=productname%></p>
	<p><%=price * quantity%></p>
	<button onclick="reload()" id="continue">쇼핑 계속 하기</button><button onclick="gocartlist()" id="gocartlist">장바구니로 가기</button>
	
</body>
</html>