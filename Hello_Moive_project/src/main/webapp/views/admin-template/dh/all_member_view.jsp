<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function add_event_update(){   
		$(".btn_update").click(function(){
			var arr = $(this).parent().parent().find("input");
			var d = "";
			$.each(arr,function(i,obj){
				d += $(obj).attr("name") + "=" + $(obj).val() + "&";
			});
			$.ajax({
				url:"update.do",
				data : d,
				type: "post",
				success:function(r){
					console.log(d)
					if(r == 1)
						alert("회원 정보 수정 완료");
					else 
						alert("회원 정보 수정 실패");
					location.reload();
				}
			});
		});
	}
	function add_event_delete(){
		$(".btn_delete").click(function(){
			var d = "userEmail="+ $(this).parent().parent().find("input[name=userEmail]").val();
			$.ajax({
				url:"delete.do",
				data : d,
				type: "post",
				success:function(r){
					if(r == 1)
						alert("회원 정보 삭제 완료");
					else 
						alert("회원 정보 삭제 실패");
					location.reload();
				}
			});
		});
	}
	
	$(function(){
		add_event_update();
		add_event_delete();
	});
</script>
<style>
	.btn_delete{
		margin-top:10px;
		margin-left: 10px;
	}
	.member-detail{
		margin-top:10px;
	}
	.btn-array{
		text-align: right;
		justify-content: right;
	}
	.box-body{
		width: 1000px;
	}
</style>
</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>${title }</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i
						class="fa fa-dashboard"></i>MEMBER</a></li>
				<li class="breadcrumb-item"><a href="#">회원 관리</a></li>
				<li class="breadcrumb-item active">전체 회원관리</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="box">
						<div class="box-body">
							<div class="table-responsive">
								<table id="example5" class="table table-hover">
									<thead class="d-none">
										<tr>
											<!-- <th>이메일</th>
											<th>비밀번호</th>
											<th>이름</th>
											<th>닉네임</th>
											<th>핸드폰 번호</th>
											<th>우편번호</th>
											<th>도로명주소</th>
											<th>상세주소</th>
											<th>포인트</th>
											<th>생년월일</th>
											<th>비고</th> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${requestScope.list }">
											<tr>
												<td class="w-20"><i class="fa fa-square-o pt-15"></i></td>
												<td class="w-20"><i
													class="fa fa-star text-yellow pt-15"></i></td>
												<td class="w-60"><a
													class="avatar avatar-lg status-success" href="#"><img
														src="images/avatar/1.jpg" alt="..." /></a>
												</td>
												<td class="w-300">
													<p class="mb-0">
														<a href="memberProfile.do?userEmail=${member.userEmail }"><strong>${member.userName }</strong></a>
														<small>email)</small><small class="sidetitle" name="sidetitle">${member.userEmail }</small>
													</p>
													<p class="mb-0">tel) ${member.userTel }</p>
												</td>
												<td>
													<nav class="nav mt-1 btn-array">
														<a href="memberProfile.do?userEmail=${member.userEmail }" class="member-detail btn btn-warning btn-sm text-white">회원 상세 보기</a>
														<a class="btn_delete btn btn-warning btn-sm text-white">계정 정보 삭제</a>
													</nav>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
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
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                      
                    
                    } 
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
	<script>
		$(function(){
			$('.btn_delete').click(function(){
				if(!confirm("정말로 해당 회원 정보를 삭제하시겠습니까?"))
					return;
				var d = 'userEmail='+$(this).parent().parent().parent().find("small.sidetitle").text();
				$.ajax({
					url:"memberDelete.do",
					data : d,
					type: "post",
					success:function(r){
						if(r == 1)
							alert("회원 정보 삭제 완료");
						else 
							alert("회원 정보 삭제 실패");
						location.reload();
					}
				});
			});
			});
	</script>
</body>
</html>