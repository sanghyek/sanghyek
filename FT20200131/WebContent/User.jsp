<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="vo.UserDto"%>
<%@ page import="dao.UserDao"%>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>userinfo</title>
  <!-- CSS -->
  <link rel="stylesheet" href="css/signup.css?ver=1">
    <link rel="stylesheet" href="css/user.css">
	<!-- JS -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/user.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
<!-- partial -->
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js?ver=1"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?ver=1"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
 <body style="font-family: 'Open sans', sans-serif; overflow-x: hidden;">

  <% 
 String ses=null;
 ses=(String)session.getAttribute("ID");
 if(ses==null){%>
 <jsp:include page="header.jsp"/>
 <%} else{%>
 <jsp:include page="Loginheader.jsp"/>
 <%} %>
 
 
  <section>
  <jsp:useBean id="user" class="dao.UserDao"/>
 <%
 String id=(String)session.getAttribute("ID");
 ArrayList<UserDto> us=user.UserList(id);
 String name=us.get(0).getName();
 String pw=us.get(0).getPassword();
 String email=us.get(0).getEmail();
 Date birth=us.get(0).getBirth();
 String phone=us.get(0).getPhone();
 String post=us.get(0).getPostcode();
 String addr1=us.get(0).getAddr1();
 String addr2=us.get(0).getAddr2();
 out.print(pw);
 if(post==null){
	 post="";
 }
 if(addr1==null){
	 addr1="";
 }
 if(addr2==null){
	 addr2="";
 }
 %>
<!--   사이드메뉴 -->
<aside>
<ul class="note-wrap note" style="list-style-type:none">

 <li align="left"><a href="User.jsp">회원정보수정</a></li>
 <li align="left"><a href="#">스크랩</a></li>
 <li align="left"><a href="Air.jsp">항공예약확인/취소</a></li>
 <li align="left"><a href="#">작성 게시물 관리</a></li>
  <li align="left"><a href="UserDelete.jsp">회원탈퇴</a></li>
 </ul>
 </aside> 

<!-- 메인배너   -->
<div class="mainbox" >
<img src="img/08.jpg"width="100%" height="500"/>
</div>
<div id="in"><h1><회원정보 수정></h1><br><br>
 ***님의 회원가입 정보입니다.
회원정보는 개인정보처리방침에 따라 안전하게 보호되며, <br><br>회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.
</div>
<div class="signup-page-container signup-form-open">
  <div class="signup__container signup-form">
    <div class="container__child signup__thumbnail" style="background: url(https://p.w3layouts.com/demos_new/template_demo/19-06-2017/assets-demo_Free/554297363/web/images/7.jpg);">
      <div class="thumbnail__logo"><img src="http://192.168.1.6:8080/house-rent-management/owner_front_end/assets/img/logo.png" alt=""/></div>
      <div class="thumbnail__content text-center">
        <h1 class="heading--primary"><%=name%> 님 안녕하세요?</h1>
        <h2 class="heading--secondary">회원정보를 변경하시겠습니까?</h2>
      </div>
      <div class="signup__overlay"></div>
    </div>
    <div class="container__child signup__form">


      <form  method="post" action="userDBupdate.jsp" onsubmit="return check()" name="signup">
	    <div class="form-group">
          <label for="username">Username</label>
          <input class="form-control" id="username" type="text" name="username" value="<%=name%>" readonly/>
        </div>
		  <div class="form-group">
          <label for="userid">Userid</label><label id="ajaxReturn" style="position:relative;left:50px;"></label>
          <input class="form-control" id="userid" type="text" name="userid" value="${ID}" onkeydown="onkey()" readonly /><input type="hidden" id="chid" value="un"><input type="button" value="ID중복확인" onclick="idc()" id="btnid"/>
        </div>
         <div class="form-group">
          <label for="password">Password</label>
          <input class="form-control" id="password" type="password" name="password" placeholder="비밀번호를 8~12 영문대소문자 와 숫자로 입력하세요" value="" />
        </div>
        <div class="form-group">
          <label for="passwordRepeat">Repeat Password</label>
          <input class="form-control" id="passwordRepeat" type="password" name="passwordRepeat" placeholder="비밀번호를 한번더 입력하세요" />
        </div>
		 <div class="form-group">
          <label for="email">Email</label><label id="ajaxReturnmail" style="position:relative;left:50px;"></label>
          <input class="form-control" id="email" type="email" name="email" value="<%=email%>" onkeydown="onkeymail()" /><input type="hidden" id="chmail" value="un"><input type="button" onclick="ma()" value="mail중복확인" id="btnmail"/>
        </div>
			<div class="form-group">
          <label for="username">Userphone</label>
          <input class="form-control" id="userphone" type="text" name="userphone" value="<%=phone%>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="13"/>
        </div>
		<div class="form-group">
          <label for="username">Userbirth</label>
          <input class="form-control" id="userbirth" type="text" name="userbirth" readonly value="<%=birth%>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="6"/>
        </div>
		<div class="form-group">
          <label for="username">Useraddress</label>
		  <input class="form-control" type="text" id="sample6_postcode" name="sample6_postcode" value="<%=post%>" >
          <input type="button" id="btnad" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
  
        </div>
		<div class="form-group">
          <input class="form-control" type="text" id="sample6_address" name="sample6_address" value="<%=addr1%>">
        </div>
        <div class="m-t-lg">
		<div class="form-group">
          <input class="form-control" type="text" id="sample6_detailAddress" name="sample6_detailAddress" value="<%=addr2%>">
        </div>
        <div class="m-t-lg">
          <ul class="list-inline">
            <li>
			
              <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
              <input class="btn btn--form" type="submit" value="확인"/>
            </li>
            <li><input class="btn btn--form" type="button" onclick="location.href='Mypages.jsp'" value="취소"/>
          </ul>
        </div>
      </form>
</section>

   <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
 </body>
</html>
