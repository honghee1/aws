<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
window.onload = function(){
    var area = document.querySelector('#area');
            var theater = document.querySelector('#theater');
            var gg = document.querySelectorAll('.gg');
            var sl = document.querySelectorAll('.sl');
            area.onchange = () => {
                theater.disabled = false;                    
                if(area.value == 0) {
                    theater.disabled = true;
                }else if(area.value == 'seoul') {
                    for(i=0;i<gg.length;i++) {
                        gg[i].style.display = 'none';
                        for(j=0;j<sl.length;j++) {
                            sl[j].style.display = 'initial';
                        }
                    }      
                }else if(area.value == 'gyunggi') {
                    for(i=0;i<sl.length;i++) {
                        sl[i].style.display = 'none';
                        for(j=0;j<gg.length;j++) {
                            gg[j].style.display = 'initial';
                        }
                    }
                }
            }
            

            var mail = document.querySelector('#mail');
            var direct = document.querySelector('#direct');
            
            mail.onchange = () => {
                if(mail.value == 4) {
                    direct.style.display = 'initial';
                }else {
                    direct.style.display = 'none';
                }
            }
            function contentLength() {
                var content = document.querySelector('#content');
                var ct_length = document.querySelector('.length');
                if(content.value.length > 2000) {
                    content.value = content.value.substr(0,2000);
                    return false;
                }
                ct_length.innerHTML = `${content.value.length} / 2000`;
                return true;
            }
            
            content.onkeyup = contentLength;

            frm.onsubmit = (e) => {
                if(!contentLength()) {
                    e.preventDefault();
                }
            }

}
</script>
</head>
<body>
	<section>
	<article>
	<div class="slider sliderv2">
		<div class="qna-container">
	 	 	<h2>문의</h2>
                <form action="qnaWrite.do" method="post">
                    <table>
                        <caption>* 필수</caption>
                        <tr>
                            <th>문의지점 <span>*</span></th>
                            <td colspan="3">
                                <input type="radio" name="qnaPoint" id="point" checked >
                                <label for="point">지점문의</label>
                                <select name="qnaArea" id="area">
                                    <option value="0" selected>지역선택</option>
                                    <option value="seoul">서울</option>
                                    <option value="gyunggi">경기</option>
                                </select>
                                <select name="theater" id="theater" disabled>
                                    <option value="0" selected>극장선택</option>
                                    <option value="1" class="sl">강남</option>
                                    <option value="2" class="sl">신촌</option>
                                    <option value="3" class="sl">홍대</option>
                                    <option value="4" class="gg">수원</option>
                                    <option value="5" class="gg">동탄</option>
                                </select>
                                <input type="radio" name="point" id="etc">
                                <label for="etc">기타문의</label>
                            </td>
                        </tr>
                        <tr>
                            <th>문의유형 <span>*</span></th>
                            <td colspan="3">
                                <select name="qnaQuiryType" id="quiryType">
                                    <option value="0" selected>문의유형 선택</option>
                                    <option value="1">일반문의</option>
                                    <option value="2">불만</option>
                                    <option value="3">제안</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>이름 <span>*</span></th>
                            <td><input type="text" name="userName" id="name" value="${sessionScope.userName }" readonly></td>
                            <th>이메일 <span>*</span></th>
                            <td>
                                <input type="text" name="userEmail" id="email" value="${sessionScope.userEmail }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>휴대전화 <span>*</span></th>
                            <td colspan="3">
                                <input type="text" name="userTel" id="firstnum" required>
                            </td>
                        </tr>
                        <tr>
                            <th>제목 <span>*</span></th>
                            <td colspan="3"><input type="text" name="qnaTitle" id="title" required></td>
                        </tr>
                        <tr>
                            <th>내용 <span>*</span></th>
                            <td colspan="3">
                                <div class="textarea_container">
                                    <textarea name="qnaContent" id="content" cols="30" rows="10" placeholder="※ 불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변드리겠습니다                        ※ 문의 내용에 개인정보(이름, 연락처, 카드번호 등)가 포함되지 않도록 유의하시기 바랍니다." required></textarea>
                                    <div class="length_container">
                                        <p><span class="length">0 / 2000</span></p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="btn">
                                <button>등록</button>
                                <button type="reset">초기화</button>
                            </td>
                        </tr>
                    </table>
                </form>
               </div>
               </div>
               </article>
               </section>
</body>
</html>