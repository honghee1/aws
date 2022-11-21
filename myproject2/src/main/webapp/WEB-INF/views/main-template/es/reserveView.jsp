<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<link rel="stylesheet" href="css/template_es/reserve.css">
</head>
<body>
	<div class="buster-light">
		<div class="hero common-hero">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="hero-ct">
							<h1>Movie Reservation - Special Experience</h1>
							<ul class="breadcumb">
								<li class="active"><a href="#">Home</a></li>
								<li><span class="ion-ios-arrow-right"></span>movie reservation</li>
							</ul>
							<h2 class="today-word">TODAY</h2>
							<h3 class="today"></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content test 시작 부분  -->
	<div class="page-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="topbar-filter fw">
						<div class="reserve-container">
					        <div class="movie-part">
					            <div class="reserve-title">영화</div>
						            <c:forEach var="c" items="${requestScope.movielist }">
									<div class="movie-list"><img class="age-limit" src="/images/19age.png"><a class="movie-list-wrapper" data-value="${c.title }">${c.title }</a><input type="hidden" name="mcode" value="${c.mcode}"></div>
								</c:forEach>
					        </div>
					        <div class="theater-part">
					            <div class="reserve-title">극장</div>
					             <c:forEach var="c" items="${requestScope.screenlist }">
									<div class="screen-list"><a class="screen-list-wrapper" data-value="${c.cinemaName }">${c.cinemaName }</a><input type=hidden name="screenCode" value="${c.cinemaCode}"></div>
								</c:forEach>
					        </div>	
					        <div class="day-part">
					            <div class="reserve-title">날짜</div>
					            <div class="reserve-date"></div>
					        </div>
					        <div class="time-part">
					            <div class="reserve-title">시간</div>
					        </div>
				   		</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
        const date = new Date();
        // console.log(date.getFullYear());
        const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        const reserveDate = document.querySelector(".reserve-date");
		console.log(date.getDate());
		console.log(lastDay.getDate());
		$(".today").html(date.getFullYear() +"/"+ (date.getMonth()+1) +"/"+ date.getDate());
		console.log(date.getFullYear() +"/"+ date.getMonth() +"/"+ date.getDate());
      
            const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
            const year = date.getFullYear();
            const month = date.getMonth() + 1;
            console.log(month);
            var count = 0;
            for (i = date.getDate(); i <= date.getDate() + 20; i++) {

                const button = document.createElement("button");
                const spanWeekOfDay = document.createElement("span");
                const spanDay = document.createElement("span");

                button.classList = "movie-date-wrapper"
                spanWeekOfDay.classList = "movie-week-of-day";
                spanDay.classList = "movie-day";

                const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

                if (dayOfWeek === "토") {
                    spanWeekOfDay.classList.add("saturday");
                    spanDay.classList.add("saturday");
                } else if (dayOfWeek === "일") {
                    spanWeekOfDay.classList.add("sunday");
                    spanDay.classList.add("sunday");
                }
                spanWeekOfDay.innerHTML = dayOfWeek;
                button.append(spanWeekOfDay);
                //날짜 넣기
                spanDay.innerHTML = i;
                button.append(spanDay);
                //button.append(i);
                reserveDate.append(button);
                count++;
				console.log("first count : " + count);
            }
            if(count <= 20){
            	const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 1);
            	console.log(lastDay.getDate());
            	console.log("second count : " + count);
            	for (i = lastDay.getDate(); i <= lastDay.getDate() + (20 - count); i++) {
					
                    const button = document.createElement("button");
                    const spanWeekOfDay = document.createElement("span");
                    const spanDay = document.createElement("span");
                    const year = lastDay.getFullYear();
                    const month = lastDay.getMonth() + 1;
                    //class넣기
                    button.classList = "movie-date-wrapper"
                    spanWeekOfDay.classList = "movie-week-of-day";
                    spanDay.classList = "movie-day";

                    //weekOfDay[new Date(2020-03-날짜)]
                    const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

                    //요일 넣기
                    if (dayOfWeek === "토") {
                        spanWeekOfDay.classList.add("saturday");
                        spanDay.classList.add("saturday");
                    } else if (dayOfWeek === "일") {
                        spanWeekOfDay.classList.add("sunday");
                        spanDay.classList.add("sunday");
                    }
                    spanWeekOfDay.innerHTML = dayOfWeek;
                    button.append(spanWeekOfDay);
                    //날짜 넣기
                    spanDay.innerHTML = i;
                    button.append(spanDay);
                    //button.append(i);
                    reserveDate.append(button);

                }
            	console.log("last count : " + count);
            }
            
            var screenfirst = 0;
           	var moviefirst = 0;
            var datefirst = 0;
            
        $(document).on("click",".movie-date-wrapper",function(){
        	datefirst = 1;
        	if(moviefirst == 0){
        		alert("영화를 먼저 선택해주세요");
        		return;
        	}else if(screenfirst == 0){
        		alert("극장을 먼저 선택해주세요");
        		return;
        	}
        	$(".time-part").html("<div class='reserve-title'>시간</div>");
                const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) => {
                    list.classList.remove("movie-date-wrapper-active");
                });
                $(this).addClass("movie-date-wrapper-active");
                var mcode = $(".movie-list-active").find("input[name='mcode']").val();
                var cinemaCode = $(".screen-list-active").find("input[name='cinemaCode']").val();
                var y = year.toString();
                if(month.length < 2){
                    month = "0" + month;
                 }
                 var data = "mcode=" + mcode + "&cinemaCode=" + cinemaCode + "&sdate=" + y.substring(2, 4) + '/' + month + '/' + $(this).find(".movie-day").text();
                console.log(data);
                
                $.ajax({
    				url:"movieListView.do",
    				data : data,
    				dataType:"json",
    				success:function(r){
    					var tag = "<div class='reserve-title'>시간</div><div class='time-flex'>";
    					for(i=0;i<r.length;i++){
    							
    							if(r[i].screenName.toString() == old){
    								tag += "<div class='time-list'><a class='time-list-wrapper' type='button' data-value='" + r[i].startTime + 
    									"'>"+r[i].startTime+"</a><input class='time-list-hidden' type='hidden' name='endTime' value='종료 : " + r[i].endTime + "'>"
    									+ "<span class='seat-list-wrapper'>" + r[i].remainseat + "/" + r[i].allseat + "석2" + "</span>";
    								tag += "<input type='hidden' name='screencode' value='" + r[i].screenCode + "'>";
    								tag += "<input type='hidden' name='timecode' value='" + r[i].timeCode + "'>";
    								tag += "<input type='hidden' name='mcode' value='" + r[i].mcode + "'></div>";
    							}
    							else{
    								tag += "<div class='time-title'><span class='time-title-wrapper'>" + r[i].screenName + "</span></div>";
    								tag += "<div class='time-list'><a class='time-list-wrapper' type='button' value='" + r[i].startTime +
    									"'>"+r[i].startTime+"</a><input class='time-list-hidden' type='hidden' name='endTime' value='종료 : " + r[i].endTime + "'>"
    									+ "<span class='seat-list-wrapper'>" + r[i].remainseat + "/" + r[i].allseat + "석1" + "</span>";
    								tag += "<input type='hidden' name='screencode' value='" + r[i].screenCode + "'>";
    								tag += "<input type='hidden' name='timecode' value='" + r[i].timeCode + "'>";
    								tag += "<input type='hidden' name='mcode' value='" + r[i].mcode + "'></div>";
    							}
    							var old = r[i].screenName.toString();
    							console.log(old);
    					}
    								tag += "</div>";
    					$(".time-part").html(tag);
    					}
    			});
                
                
        });
        
        $(document).on("click",".movie-list",function(){
        		moviefirst = 1;
        		screenfirst = 0;
        		datefirst = 0;
        		$(".time-part").html("<div class='reserve-title'>시간</div>");
            	const movieListActive = document.querySelectorAll(".movie-list-active");
        		movieListActive.forEach((list) => {
                    list.classList.remove("movie-list-active");
                });
    			$(this).addClass("movie-list-active");
    			
    			const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) => {
                    list.classList.remove("movie-date-wrapper-active");
                });
    			
    			var d = "mcode=" + $(this).find("input[name='mcode']").val();
                console.log(d);
                $.ajax({
    				url:"screenListView.do",
    				data : d,
    				dataType:"json",
    				success:function(r){
    					var tag = "<div class='reserve-title'>극장</div>";
    					for(i=0;i<r.length;i++){
    						tag += "<div class='screen-list'><a class='screen-list-wrapper' data-value='"+r[i].cinemaName+"'>"+r[i].cinemaName+"</a><input type='hidden' name='cinemaCode' value='" + r[i].cinemaCode + "'></div>";
    					}
    					$(".theater-part").html(tag);
    				}
    			});
        });
        
        $(document).on("click",".screen-list",function(){ 
        	screenfirst = 1;
        	if(moviefirst == 0){
        		alert("영화를 먼저 선택해주세요");
        		return;
        	}
        	screenfirst++;
        		const screenListActive = document.querySelectorAll("screen-list-active");
        		screenListActive.forEach((list) => {
                list.classList.remove("screen-list-active");
            })
				$(this).addClass("screen-list-active");
        		
        });
        
        
        $(document).on("click",".time-list",function(){
        	
        	var d = "?screenCode=" + $(this).find("input[name='screencode']").val();
        		d += "&timeCode=" + $(this).find("input[name='timecode']").val();
        		d += "&mcode=" + $(this).find("input[name='mcode']").val();
        		d += "&cinemacode=" + $(".screen-list-active").find("input[name='cinemaCode']").val();
        		console.log(d);
        	
				alert("좌석 선택창으로 이동합니다");
				
        	
        	$("#form").attr('action','seatCreate.do'+d);
        	 $("#form").append($('<input type="hidden" class="t1" value="'+d+'" name=tag>'));
        	 $("#form").submit();
        	
        });
        $(document).on("mouseover",".time-list",function(){
    		
			var obj = $(this);
			var tX = (obj.position().left + 56);
			var tY = (obj.position().top - 33);

	 		if($(this).find("input[name='endTime']").css("display") == "none"){
	 			$(this).find("input[name='endTime']").attr("type", "button");
	 				$(this).find("input[name='endTime']").css({
	 					"top" : tY
	 					,"left" : tX
	 					,"position" : "absolute"
	 				}).show();
	 		}
	 			
	 	});
     	$(document).on("mouseout",".time-list",function(){
			$(this).find("input[name='endTime']").attr("type", "hidden");
		});
				
    </script>
    <form id='form' method="post">
	</form>
</body>
</html>