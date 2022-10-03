<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.seat{
		display: inline-block;
		width: 50px;
		height: 50px;
		text-decoration: none;
		font-weight: bold;
		color: white;
		text-align: center;
		background-color: rgb(2,13,24);
		background-size: 50px;
		background-image: url("images/seaticon.png");
		background-repeat: no-repeat;
		background-position: -2px 0px;
		box-sizing: border-box;
		border: 2px solid rgb(2,13,24);
		transition: background-color 0.5s, border 0.5s;
		border-radius: 10px;
	}
	.seat:disabled{
		color: gray;
		background-color: rgb(2,13,24);
		background-size: 50px;
		background-image: url("images/rseaticon.png");
		background-repeat: no-repeat;
		background-position: -2px 0px;
		box-sizing: border-box;
		border: 2px solid rgb(2,13,24);
	}
	.seat:selection{
		margin: 2px;
	}
	.empty{
		width: 50px;
		height: 50px;
		display: inline-block;
		background-color: rgb(2,13,24);
		box-sizing: border-box;
	}
	.clicked {
        color: white;
		background-color: rgb(2,13,24);
		background-size: 50px;
		background-image: url("images/sseaticon.png");
		background-repeat: no-repeat;
		background-position: -2px 0px;
		box-sizing: border-box;
		border: 2px solid rgb(185,237,248);
		border-radius: 10px;
		background-color: rgb(185,237,248);
		transition: background-color 0.5s, border 0.5s;
    }
    .reserve-container{
    	margin: 0 auto;
    }
    .screen-view{
    	width: 1140px;
    	height: 50px;
    	border: none;
    	margin: 0 auto;
    	margin-bottom: 20px;
    	color: white;
    	background-color: rgb(7,24,41);
    	text-align: center;
    	padding: 10px;
    }
    .count-text{
    	color: #abb7c4;
    	padding-left: 8px;
    	font-weight: bold;
    	font-size: 14px;
    }
    .count-container{
    	display: flex;
    	flex-flow: row nowrap;
    	padding: 10px;
    	justify-content: flex-start;
    }
    .adult-count, .minor-count{
    	background-color: #233a50 !important;
    	color: #abb7c4 !important;
    	border: 2px solid #233a50 !important;
    	width: 60px !important;
    	height: 24 !important;
    	border-radius: 7px;
    	text-align: center;
    	display: inline-block;
    	font-weight: bold;
    }
    .btn-c{
    	width: 20px;
    	height: 20px;
    	color: white;
    	border: none;
    	box-sizing: border-box;
    	border-radius: 15px;
    	margin: 0px 5px;
    	font-weight: bold;
    	margin-top: 8px;
    	padding: 0px;
    }
    .adult-pluscount, .minor-pluscount{
    	background-image: url("images/seatplusicon.png");
    	background-size: 20px;
    	background-position: 0px 0px;
    }
    .adult-minuscount, .minor-minuscount{
    	background-image: url("images/seatminusicon.png");
    	background-size: 20px;
    	background-position: 0px 0px;
    }
    .remain-count{
    	background-color: #233a50 !important;
    	color: #abb7c4 !important;
    	border: 2px solid #233a50 !important;
    	width: 60px !important;
    	height: 24 !important;
    	border-radius: 7px;
    	text-align: center;
    	display: inline-block;
    	font-weight: bold;
    }
    .total-price{
    	background-color: #233a50 !important;
    	color: #abb7c4 !important;
    	border: 2px solid #233a50 !important;
    	width: 120px !important;
    	height: 24 !important;
    	border-radius: 7px;
    	text-align: right;
    	display: inline-block;
    	font-weight: bold;
    }
    .total-price:focus{
    	padding: 6px 12px;
    }
    .booking-btn{
    	border-radius: 10px;
    	margin-left: 20px;
    	margin-top: -5px;
    }
    .price-container{
    	display: flex;
    	flex-flow: row nowrap;
    	justify-content: flex-end;
    	align-content: center;
    }
    .booking-container{
    
    }
    .topbar-filter{
    	padding-bottom: 20px;
    }
    .page-single{
    	padding: 30px 0px;
    }
    .seat-count-container{
    	display: flex;
    	flex-flow: row nowrap;
    }
    .select-text{
    	color: rgb(220,248,54);
    	font-size: 11px;
    	margin-top: 7px !important;
    	margin-right: 10px;
    }
    .won-text{
    	color: white;
    	margin-top: 7px;
    	margin-left: 10px;
    	font-size: 13px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		var seatList = new Array();
		seatList.push($("input[name='screenCode']").val());
		seatList.push($("input[name='timeCode']").val());
		seatList.push($("input[name='mcode']").val());
		seatList.push($("input[name='price']").val());
		$(".seat").click(function () { 
			if(parseInt($(".adult-count").val()) == 0 && parseInt($(".minor-count").val()) == 0){
				alert("인원수를 지정한 후 좌석을 선택할 수 있습니다");
				return;
			}
			
			if($(this).hasClass("clicked")){
				$(this).removeClass("clicked");
				seatList.splice(seatList.indexOf($(this).val()), 1);
				console.log(seatList);
			}else{
				if($(".clicked").length >= (parseInt($(".adult-count").val()) + parseInt($(".minor-count").val()))){
					alert("지정한 인원수보다 많은 좌석을 선택할 수 없습니다");
					return;
				}
				$(this).addClass("clicked");
				seatList.push($(this).val());
				console.log(seatList);
			}
			$(".remain-count").val(parseInt($(".adult-count").val()) + parseInt($(".minor-count").val()) - $(".clicked").length);
		});
		$(".booking-btn").click(function () {
			if($(".clicked").length != (parseInt($(".adult-count").val()) + parseInt($(".minor-count").val()))){
				alert("지정한 인원수만큼 좌석을 선택한 후 예매하기 버튼을 눌러주세요");
				return;
			}
			
			console.log(seatList);
			$.ajax({
				url : 'booking.do',
				traditional : true,
				data : {"seatList" : seatList},
				dataType : "json",
				type : 'post',
				success:function(r){
					if(r == 1){
						var d = "timeCode=" + $("input[name='timeCode']").val() + "&price=" + seatList[3]
								+ "&count=" + $(".clicked").length;
						$.ajax({
							url : "kakaopay.do",
							data : d,
							dataType : 'json',
							success:function(data){
								console.log('kakaopay-Success');
								var url = data.next_redirect_pc_url;
								window.open(url, '_blank','width=600px, height=800px');
							},
							error:function(data){
								console.log('kakaopay-Error');
								alert(data);
							}
						});
					}
				}
			});
			
			
		});
		
		$(".adult-pluscount").click(function () {
			$(".adult-count").val(parseInt($(".adult-count").val()) + 1);
			$(".remain-count").val(parseInt($(".adult-count").val()) + parseInt($(".minor-count").val()) - $(".clicked").length);
			seatList[3] = (parseInt($(".adult-count").val()) * 10000) + (parseInt($(".minor-count").val()) * 6000);
			$(".total-price").val(String(seatList[3]).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		});
		$(".adult-minuscount").click(function () {
			if(parseInt($(".adult-count").val()) == 0){
				return;
			}
			$(".adult-count").val(parseInt($(".adult-count").val()) - 1);
			$(".remain-count").val(parseInt($(".adult-count").val()) + parseInt($(".minor-count").val()) - $(".clicked").length);
			seatList[3] = (parseInt($(".adult-count").val()) * 10000) + (parseInt($(".minor-count").val()) * 6000);
			$(".total-price").val(String(seatList[3]).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		});
		
		$(".minor-pluscount").click(function () {
			$(".minor-count").val(parseInt($(".minor-count").val()) + 1);
			$(".remain-count").val(parseInt($(".adult-count").val()) + parseInt($(".minor-count").val()) - $(".clicked").length);
			seatList[3] = (parseInt($(".adult-count").val()) * 10000) + (parseInt($(".minor-count").val()) * 6000);
			$(".total-price").val(String(seatList[3]).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		});
		$(".minor-minuscount").click(function () {
			if(parseInt($(".minor-count").val()) == 0){
				return;
			}
			$(".minor-count").val(parseInt($(".minor-count").val()) - 1);
			$(".remain-count").val(parseInt($(".adult-count").val()) + parseInt($(".minor-count").val()) - $(".clicked").length);
			seatList[3] = (parseInt($(".adult-count").val()) * 10000) + (parseInt($(".minor-count").val()) * 6000);
			$(".total-price").val(String(seatList[3]).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		});
		
	});

</script>
</head>
<body>
	<div class="buster-light">
		<div class="hero common-hero">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="hero-ct">
							<h1>Seat Selection</h1>
							<ul class="breadcumb">
								<li class="active"><a href="#">Home</a></li>
								<li><span class="ion-ios-arrow-right"></span>Seat Selection</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<span class="count-text">> 인원 선택</span>
					<div class="seat-count-container">
						<div class="count-container"><p class="select-text">성인</p><button class="adult-minuscount btn-c"></button><input type="text" class="adult-count" readonly="readonly" value="0"><button class="adult-pluscount btn-c"></button></div>
						<div class="count-container"><p class="select-text">미성년자</p><button class="minor-minuscount btn-c"></button><input type="text" class="minor-count" readonly="readonly" value="0"><button class="minor-pluscount btn-c"></button></div>
						<div class="count-container"><p class="select-text">남은 선택 좌석 수</p><input type="text" class="remain-count" readonly="readonly" value="0"></div>
					</div>
					<div class="screen-view">
						<h2>S C R E E N</h2>
					</div>
					<div class="topbar-filter fw">
						<div class="reserve-container">
							<form id="frm">
								${tag }
							</form>
						</div>
					</div>
					<div class="booking-container">
						<div class="price-container"><p class="select-text">총 합계금액</p><input type="text" class="total-price" readonly="readonly" value="0"><p class="won-text">원</p><button type="button" class="booking-btn redbtn">예매하기</button></div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	
	</script>
</body>
</html>