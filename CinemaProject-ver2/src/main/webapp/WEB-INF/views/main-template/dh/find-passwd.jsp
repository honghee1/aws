<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
        function idCheck(){
            var id = document.querySelector('#id');
            var id_result = document.querySelector('.id_result');

            if(id.value.length < 8 || id.value.length > 20){
                id_result.innerHTML = '아이디는 글자수가 8~20글자 사이로 사용하세요';
                if(id_result.classList.contains('true')) //true 클래스가 있는지?
                id_result.classList.remove('true'); //true 클래스 제거
                if(!id_result.classList.contains('false'))
                    id_result.classList.add('false'); // false 클래스 추가
                return false;
            }
            if(!isNaN(id.value)){
                id_result.innerHTML = '아이디는 숫자만 쓸수 없습니다.';
                if(id_result.classList.contains('true'))
                id_result.classList.remove('true'); 
                if(!id_result.classList.contains('false'))
                    id_result.classList.add('false');
                return false;
            }
            if(id_result.classList.contains('false'))
                id_result.classList.remove('false');
            if(!id_result.classList.contains('true'))
                id_result.classList.add('true');
            id_result.innerHTML = '아이디가 올바르게 입력되었습니다.';
            return true;
        }
        function passCheck(){
            var pass = document.querySelector('#pass');
            var pass_chk = document.querySelector('#pass_chk');
            var pass_check = document.querySelector('.pass_check');

            var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{8,20}$/;
            var flag = false;
            if(!reg.test(pass.value)){
                pass_check.innerHTML = '암호 형식에 일치하지 않습니다.'
                flag = true;
            }else if(pass.value != pass_chk.value){
                pass_check.innerHTML = '암호가 일치하지 않습니다.';
                flag = true;
            }
            if(flag){
                if(pass_check.classList.contains('true'))
                    pass_check.classList.remove('true');
                if(!pass_check.classList.contains('false'))
                    pass_check.classList.add('false');
                    return false;
            }
            pass_check.innerHTML = '암호가 정상적으로 입력되었습니다.';
            if(pass_check.classList.contains('false'))
                pass_check.classList.remove('false');
            if(!pass_check.classList.contains('true'))
                pass_check.classList.add('true');
                
            return true;
        }
        function checkNick(){
            var nick = document.querySelector('#nick');
            var nick_length = document.querySelector('#nick_length');
            if(nick.value.length > 20){
                nick.value = nick.value.substr(0,20);
                return false;
            }
            nick_length.innerHTML = `${nick.value.length}/20`;
            return true;
        }
        function checkTel(){
            var tel = document.querySelector("#tel");
            console.log(isNaN(tel.value),tel.value.length != 10, tel.value.length != 11)
            if(isNaN(tel.value)){
                if(tel.classList.contains('true'))
                    tel.classList.remove('true');
                if(!tel.classList.contains('false'))
                    tel.classList.add('false');
                return false;
            }
            if(tel.value.length != 10 && tel.value.length != 11){
                if(tel.classList.contains('true'))
                    tel.classList.remove('true');
                if(!tel.classList.contains('false'))
                    tel.classList.add('false');
                return false;
            }            
            if(tel.classList.contains('false'))
                    tel.classList.remove('false');
            if(!tel.classList.contains('true'))
                tel.classList.add('true');
            return true;
        }
        window.onload = () => {
            var frm = document.querySelector("#frm");
            var id = document.querySelector("#id");
            var pass = document.querySelector('#pass');
            var pass_chk = document.querySelector('#pass_chk');
            var nick = document.querySelector('#nick');
            var tel = document.querySelector("#tel");

            id.onkeyup = idCheck;
            pass.onkeyup = pass_chk.onkeyup = passCheck;
            nick.onkeyup = checkNick;
            tel.onkeyup = checkTel;

            frm.onsubmit = (e) => {
                if(!idCheck())
                    e.preventDefault();
                else if(!passCheck())
                    e.preventDefault();
                else if(!checkNick)
                    e.preventDefault();
                else if(!checkTel)
                    e.preventDefault();
            }
        }
    </script>

<script type="text/javascript">

	$(function(){
		$("#btn_find").click(function(){
			var d = "userEmail=" + $("#id").val() + $("#email").val() + "&userName=" + $("#userName").val() + "&userTel=" + $("#userTel").val();
			console.log(d);
			$.ajax({
				url: "findPasswd.do",
				data: d,
				dataType: "json",
				success: function(r){
					console.log(r);
					console.log(r[0].userEmail);
					var tag = "";
					tag += '<form action="updatePasswd.do" method="post"><input type="text" name="userEmail" value="'+ r[0].userEmail +'"><br>';
					tag += '<input type="password" id="pass" name="userPasswd" placeholder="새 비밀번호 입력"><br>';
					tag += '<input type="password" id="pass_chk" name="userPasswdChk" placeholder="비밀번호 확인"><br>';
					tag += '<p class="pass_check"></p><br>';
					tag += '<button type="submit">비밀번호 변경</button></form>';
					$(".find_result").html(tag);
				}
			})
		})
	});
</script>
<style>
	.input_area input {
		width: 350px;
	}
</style>
</head>
<body>
	<div class="slider sliderv2">
		<div class="find-container">
		<h2>비밀번호 찾기</h2>
		<div class="input_wrap">
			<div class="semi_title">가입정보를 입력하시면 아이디를 확인하실 수 있습니다.</div>
			<div class="login_area">
				<div class="input_area">
					<div>
						<input type="text" name="id" id="id" placeholder="아이디(이메일)" />
						<select name="email" id="email">
							<option value="@gmail.com">@gmail.com</option>
							<option value="@naver.com">@naver.com</option>
							<option value="@nate.com">@nate.com</option>
							<option value="@hanmail.net">@hanmail.net</option>
						</select>
					</div>
					<div><input type="text" name="userName" id="userName" placeholder="이름" /></div>
					<div><input type="text" name="userTel" id="userTel" placeholder="휴대폰번호는 -를 제외하고 입력하세요" /></div>
					<div class="find_result"></div>
				</div>
				<div class="btn_area">
					<button id="btn_find">비밀번호 찾기</button>
				</div>
			</div>
		</div>
		</div>
	</div>
	 </body>
</html>