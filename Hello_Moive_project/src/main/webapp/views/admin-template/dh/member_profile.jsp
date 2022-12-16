<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>회원정보관리</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i
						class="fa fa-dashboard"></i>MEMBER</a></li>
				<li class="breadcrumb-item"><a href="#">전체 회원 조회</a></li>
				<li class="breadcrumb-item active">회원정보</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-lg-3 col-12">
					<!-- Profile Image -->
					<div class="box bg-inverse bg-dark bg-hexagons-white">
						<div class="box-body box-profile">
							<img
								class="profile-user-img rounded-circle img-fluid mx-auto d-block"
								src="images/5.jpg" alt="User profile picture" />
							<h3 class="profile-username text-center">${dto.userName }</h3>
							<div class="row social-states">
								<div class="col-6 text-right">
									<a href="#" class="link text-white"><i
										class="ion ion-ios-people-outline"></i>보유포인트 :</a>
								</div>
								<div class="col-6 text-left">
									<a href="#" class="link text-white"><i class="ion"></i>${dto.point }
										포인트</a>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="profile-user-info">
										<p>이메일 주소</p>
										<h6 class="margin-bottom">${dto.userEmail }</h6>
										<p>전화번호</p>
										<h6 class="margin-bottom">${dto.userTel }</h6>
										<p>주소</p>
										<h6 class="margin-bottom">${dto.address }</h6>

										<div class="user-social-acount"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
				<div class="col-lg-9 col-12">
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs tabstyle">
							<li><a class="active" href="#activity" data-toggle="tab">1:1
									문의 내역</a></li>
							<li><a href="#settings" data-toggle="tab">회원 정보 수정 </a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="timeline">
								<li><i class="fa fa-clock-o bg-gray"></i></li>
							</div>
							<!-- /.tab-pane -->
							<div class="active tab-pane" id="activity">
								<!-- Post -->
								<c:if test="${requestScope.qna[0].qno == null}">
									<p class="text-sm text-orange">
										<i class="fa fa-comments-o margin-r-5"></i> 등록된 문의 내역이 없습니다
									</p>
								</c:if>
								<c:forEach var="qna" items="${requestScope.qna }">
									<div class="top-line">
										<c:if test="${qna.response == null }">
											<p class="text-sm text-orange">
												<i class="fa fa-comments-o margin-r-5"></i> 답변 대기 중
											</p>
										</c:if>
										<c:if test="${qna.response != null }">
											<p class="text-sm text-success">
												<i class="fa fa-comments-o margin-r-5"></i> 답변 완료
											</p>
										</c:if>
									</div>
									<div class="post">
										<div class="activitytimeline">
											<p class="text-yellow hover-warning">문의자</p>
											<p class="tsize">${dto.userName }
											<p>
											<p class="text-yellow hover-warning">문의일</p>
											<p class="tsize">${qna.qnaDate }
											<p>
										</div>
										<!-- /.user-block -->
										<div class="activitytimeline">
											<p class="text-yellow hover-warning">문의내용</p>
											<p class="tsize">${qna.qnaContent }</p>
											<hr>
											<c:if test="${qna.response != null }">
												<p class="text-yellow hover-warning">답변내용</p>
												<p class="tsize">${qna.response }</p>
												<hr>
											</c:if>
											<ul class="list-inline">
												<li></li>

												<c:if test="${qna.response != null }">
													<li class="pull-right">
														<button id="delete-btn" type="button"
															class="btn btn-warning btn-md" style="margin-left: 10px;">
															답변 삭제</button>
													</li>
													<li class="pull-right">
														<button id="update-btn" type="button"
															class="btn btn-warning btn-md" style="margin-left: 10px;">
															답변 수정</button>
													</li>
												</c:if>
											</ul>
											<c:if test="${qna.response == null }">
												<form action="updateQnaResponse.do?"
													class="form-horizontal form-element">
													<div class="form-group row no-gutters">
														<div class="col-sm-9">
															<input name="response" class="form-control input-sm"
																placeholder="답변을 입력하세요" style="padding-left: 10px;" />
															<input name="qno" type="hidden" value="${qna.qno }">
															<input name="qnaTitle" type="hidden"
																value="${qna.qnaTitle }">
															<input name="qnaTitle" type="hidden"
																value="${dto.userEmail }">
														</div>
														<div class="col-sm-3">
															<button type="submit" class="btn btn-warning btn-lg"
																style="margin-left: 10px;">등록</button>
														</div>
													</div>
												</form>
											</c:if>
											<form id="updatefrm" action="updateQnaResponse.do"
												class="form-horizontal form-element disnone">
												<br>
												<div class="form-group row no-gutters">
													<div class="col-sm-9">
														<input name="response" class="form-control input-sm"
															placeholder="수정할 답변을 입력하세요" style="padding-left: 10px;" />
														<input name="qno" type="hidden" value="${qna.qno }">
														<input name="qnaTitle" type="hidden"
															value="${qna.qnaTitle }">
														<input name="userEmail" type="hidden"
															value="${dto.userEmail }">
													</div>
													<div class="col-sm-3">
														<button type="submit" class="btn btn-warning btn-lg"
															style="margin-left: 10px;">수정하기</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</c:forEach>
								<div class="topbar-filter">
									<div class="pagination2">
									<ul class="btn-group pagination">
										<c:if test="${pageMaker.prev }">
											<li><a
												href='<c:url value="/memberProfile.do?page=${pageMaker.startPage-1 }&userEmail=${dto.userEmail }"/>'><i
													class="fa fa-chevron-left"></i></a></li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }" var="pageNum">
											<li><a
												href='<c:url value="/memberProfile.do?page=${pageNum }&userEmail=${dto.userEmail }"/>'><i
													class="fa">${pageNum }</i></a></li>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											<li><a
												href='<c:url value="/memberProfile.do?page=${pageMaker.endPage+1 }&userEmail=${dto.userEmail }"/>'><i
													class="fa fa-chevron-right"></i></a></li>
										</c:if>
										</ul>
									</div>
								</div>

								<!-- /.post -->
							</div>
							<!-- /.tab-pane -->
							<div class="tab-pane" id="settings">
								<form action="memberUpdate.do" method="post">
									<div class="box-body">
										<div class="row">
											<div class="col-12">
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">이메일</label>
													<div class="col-sm-5">
														<input class="form-control" readonly="readonly"
															type="text" value="${dto.userEmail }" name="userEmail"
															placeholder="이메일">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">비밀번호</label>
													<div class="col-sm-5">
														<input class="form-control" type="password"
															value="${dto.userPasswd }" name="userPasswd"
															placeholder="비밀번호">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">이름</label>
													<div class="col-sm-5">
														<input class="form-control" type="text"
															value="${dto.userName }" name="userName" placeholder="이름">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">닉네임</label>
													<div class="col-sm-5">
														<input class="form-control" type="text"
															value="${dto.userNick }" name="userNick" placeholder="이름">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">생일</label>
													<div class="col-sm-5">
														<input class="form-control" type="date"
															value="${dto.userBirth }" name="userBirth"
															placeholder="이메일">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">전화번호</label>
													<div class="col-sm-5">
														<input class="form-control" type="text"
															value="${dto.userTel }" name="userTel" placeholder="전화번호">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">우편번호</label>
													<div class="col-sm-5">
														<input class="form-control" id="sample6_postcode"
															type="text" value="${requestScope.address1 }"
															name="address1" readonly>
													</div>
													<input type="button" class="btn btn-warning"
														onclick="sample6_execDaumPostcode()" value="우편번호 검색"><br>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">도로명주소</label>
													<div class="col-sm-5">
														<input class="form-control" id="sample6_address"
															type="text" value="${requestScope.address2 }"
															name="address2" readonly>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">상세주소</label>
													<div class="col-sm-5">
														<input class="form-control" id="sample6_detailAddress"
															type="text" value="${requestScope.address3 }"
															name="address3">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label"></label>
													<div class="col-sm-10">
														<button type="submit" class="btn btn-warning btn-lg">수정하기</button>
													</div>
												</div>
											</div>
											<!-- /.col -->
										</div>
										<!-- /.row -->
									</div>
								</form>





							</div>
							<!-- /.tab-pane -->
						</div>
						<!-- /.tab-content -->
					</div>
					<!-- /.nav-tabs-custom -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<style>
.tab-pane table {
	font-size: 18px;
}

.tab-pane .table2 tr td {
	padding-bottom: 10px;
}

.tab-pane .table2 tr td input {
	border: 1px solid gray;
	border-top: none;
	border-left: none;
	border-right: none;
}

.button {
	margin-top: 20px;
	border: none;
	width: 150px;
	height: 50px;
}

.page_bar {
	position: relative;
	display: block;
	text-align: center;
}

.page_bar a:link, .page_bar a:visited {
	color: black;
	text-decoration: none;
	font-size: 18px;
	margin-left: 10px;
	margin-right: 10px;
}

.page_bar a:hover {
	font-weight: bold;
	color: red;
}

.likeHate {
	cursor: pointer;
}

.tsize {
	font-size: 15px;
	margin-left: 10px;
}

.disnone {
	display: none;
}

.disblock {
	animation: fade-in 1s;
	animation-fill-mode: forwards;
	display: block;
}

@
keyframes fade-in {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.top-line {
	padding-top: 15px;
	border-top: 3px solid #ffc107;
	padding-bottom: 20px;
	font-size: 17px;
}

hr {
	height: 1px;
	background-color: #ffc107;
	margin-top: 10px;
}

.text-sm {
	font-size: 19px;
}
</style>
	<script>
		$('.likeHate').click(function() {
			style.color = 'blue';
		});

		$("#update-btn").click(function() {
			$('#updatefrm').toggleClass("disblock");
			$('#updatefrm').toggleClass("disnone");
			if ($('#updatefrm').hasClass("disnone"))
				$(this).text("답변 수정");
			if (!$('#updatefrm').hasClass("disnone"))
				$(this).text("수정 취소");
		});

		$("#delete-btn").click(
				function() {
					var qnano = $("input[name='qnano']").val();
					var email = $("input[name='email']").val();
					console.log(qnano);
					console.log(email);
					location.replace("deleteQnaResponse.do?qnano=" + qnano
							+ "&email=" + email);
				});
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}

							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
</body>
</html>