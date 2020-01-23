<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>userinfo</title>
  <!-- CSS -->
    <link rel="stylesheet" href="css/user.css">
	<!-- JS -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/user.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

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
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
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
 </head>
 <body>

  <% 
 String ses=null;
 ses=(String)session.getAttribute("ID");
 if(ses==null){%>
 <jsp:include page="header.jsp"/>
 <%} else{%>
 <jsp:include page="Loginheader.jsp"/>
 <%} %>
 
 
  <section>
<!--   사이드메뉴 -->
<aside>
<ul class="note-wrap note" style="list-style-type:none">

 <li align="left"><a href="User.jsp">회원정보수정</a></li>
 <li align="left"><a href="#">스크랩</a></li>
 <li align="left"><a href="Air.jsp">항공예약확인/취소</a></li>
 <li align="left"><a href="#">작성 게시물 관리</a></li>
  <li align="left"><a href="#">Q & A</a></li>
 </ul>
 </aside> 

<!-- 메인배너   -->
<div class="mainbox" >
<img src="img/08.jpg"width="100%" height="500"/>
</div>
<div id="in"><h1><회원정보 수정></h1><br><br>
 ***님의 회원가입 정보입니다.
회원정보는 개인정보처리방침에 따라 안전하게 보호되며, <br><br>회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</div>
 <div class="babo"><table border=0 align="center">
	  <div class="listlist">
      <td>이름</td>
	  <td>홍길동</td></tr>	 
	  <tr>
      <td>휴대폰번호</td>
	  <td>010-xxxx-xxxx</td></tr>
	  <tr>
	  <td>주소</td>
	<td><input type="text" id="sample6_postcode" placeholder="우편번호">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td></tr>
	<tr><td></td><td>
<input type="text" id="sample6_address" size="55" placeholder="주소"></td></tr><tr><td></td><td>
<input type="text" id="sample6_detailAddress" size="55" placeholder="상세주소" name="addr1"></td></tr>
  <tr>
	  <td id="tdtd">비밀번호</td>
	  <td><div class="ad"><input type="password" name="pw_1" size="25" maxlength="10"> 8~10자리 로 입력해주세요</div></td>
	  </tr>
	  <tr><td></td><td colspan="2">
<input type="hidden" id="sample6_extraAddress" size="70" placeholder="참고항목" name="addr2"></td>
	  </tr>
		 </table>
		 <table bottom=solid #FFC8C3 align="center" >
	  <tr><td colspan="2"></td></tr>
           </div>
           </table>
		   </div>
		     <button type="button" class="btn1" onclick="alert('회원정보가 수정되었습니다\n메인으로 돌아가 다시로그인해주세요.');"><a href="?pageChange=main.jsp">
			 <b>수정완료</b></button></a>
  <button type="button" class="btn2"><a href="index.jsp"><b>취소하기</b></button></a>

</section>

   <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
 </body>
</html>
