	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Signup</title>
<link rel="stylesheet" href="css/signup.css">
<!-- partial -->
<script src="js/Signup.js"></script>
<script src="js/address.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
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
<!-- 메인배너   -->
<div class="mainbox" >
<img src="img/08.jpg"width="100%" height="500"/>
</div>
<div id="in"><h1>회원가입</h1></div>
<div id='userinfo'>
  <div class='info'>
    <form  method="post" action="SignupDB.jsp" onsubmit="return check()" name="signup">
	<label for="username">Username</label>
    <input class="user"  id="username" type="text" name="username" placeholder="이름을 입력하세요"/>
    <label for="userid">Userid</label><label id="ajaxReturn" style="position:relative;margin:0;left:20px;width:400px;" ></label>
    <input class="user"  id="userid" type="text" name="userid" placeholder="ID를 5~8자리 영문대소문자와 숫자로 입력하세요" onkeydown="onkey()" /><input type="hidden" id="chid" value="un"><input type="button" value="ID중복확인" onclick="idc()" id="btnid"/>
    <label for="password">Password</label>
    <input class="user" id="password" type="password" name="password" placeholder="비밀번호를 8~12 영문대소문자 와 숫자로 입력하세요"  />
    <label for="passwordRepeat">Repeat Password</label>
    <input class="user" id="passwordRepeat" type="password" name="passwordRepeat" placeholder="비밀번호를 한번더 입력하세요"  />
    <label for="email">Email</label><label id="ajaxReturnmail" style="position:relative;margin:0;left:20px;width:400px;"></label>
    <input class="user" id="email" type="email" name="email" placeholder="email을 입력하세요" onkeydown="onkeymail()" /><input type="hidden" id="chmail" value=""><input type="button"  onclick="ma()" value="mail중복확인" id="btnmail"/>
    <label for="username">Userphone</label>
    <input class="user" id="userphone" type="text" name="userphone" placeholder="휴대폰번호를 입력하세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="13"/>
    <label for="username">Userbirth</label>
    <input class="user" id="userbirth" type="text" name="userbirth" placeholder="생년월일6자리를 - 없이 입력하세요" />
    <label for="username">Useraddress</label>
	<input class="user" type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" >
    <input type="button" id="btnad" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
    <input class="user" type="text" id="sample6_address" name="sample6_address" placeholder="주소" >
    <input class="user" type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소" >
    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
    <input type='submit' class="modi" value="가입" />
	<input type='button' class="modi" onclick="location.href='index.jsp'" value="취소" />
    </form>
  </div>
</div>
 </section>
</body>
</html>
