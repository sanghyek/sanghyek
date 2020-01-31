	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Signup</title>
<link rel="stylesheet" href="css/signup.css?ver=1">
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
<!-- partial -->
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js?ver=1"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?ver=1"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/Signup.js"></script>
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
<div class="signup-page-container signup-form-open">
  <div class="signup__container signup-form">
    <div class="container__child signup__thumbnail" style="background: url(https://p.w3layouts.com/demos_new/template_demo/19-06-2017/assets-demo_Free/554297363/web/images/7.jpg);">
      <div class="thumbnail__logo"><img src="http://192.168.1.6:8080/house-rent-management/owner_front_end/assets/img/logo.png" alt=""/></div>
      <div class="thumbnail__content text-center">
        <h1 class="heading--primary">가입을 환영합니다</h1>
        <h2 class="heading--secondary">가입 할 준비가 되셨나요?</h2>
      </div>
      <div class="signup__overlay"></div>
    </div>
    <div class="container__child signup__form">


      <form  method="post" action="SignupDB.jsp" onsubmit="return check()" name="signup">
	    <div class="form-group">
          <label for="username">Username</label>
          <input class="form-control" id="username" type="text" name="username" placeholder="이름을 입력하세요"/>
        </div>
		  <div class="form-group">
          <label for="userid">Userid</label><label id="ajaxReturn" style="position:relative;left:50px;"></label>
          <input class="form-control" id="userid" type="text" name="userid" placeholder="ID를 5~8자리 영문대소문자와 숫자로 입력하세요" onkeydown="onkey()" /><input type="hidden" id="chid" value="un"><input type="button" value="ID중복확인" onclick="idc()" id="btnid"/>
        </div>
         <div class="form-group">
          <label for="password">Password</label>
          <input class="form-control" id="password" type="password" name="password" placeholder="비밀번호를 8~12 영문대소문자 와 숫자로 입력하세요" />
        </div>
        <div class="form-group">
          <label for="passwordRepeat">Repeat Password</label>
          <input class="form-control" id="passwordRepeat" type="password" name="passwordRepeat" placeholder="비밀번호를 한번더 입력하세요" />
        </div>
		 <div class="form-group">
          <label for="email">Email</label><label id="ajaxReturnmail" style="position:relative;left:50px;"></label>
          <input class="form-control" id="email" type="email" name="email" placeholder="email을 입력하세요" onkeydown="onkeymail()" /><input type="hidden" id="chmail" value="un"><input type="button"  onclick="ma()" value="mail중복확인" id="btnmail"/>
        </div>
			<div class="form-group">
          <label for="username">Userphone</label>
          <input class="form-control" id="userphone" type="text" name="userphone" placeholder="휴대폰번호를 입력하세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="13"/>
        </div>
		<div class="form-group">
          <label for="username">Userbirth</label>
          <input class="form-control" id="userbirth" type="text" name="userbirth" placeholder="생년월일6자리를 - 없이 입력하세요"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="6"/>
        </div>
		<div class="form-group">
          <label for="username">Useraddress</label>
		  <input class="form-control" type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" >
<input type="button" id="btnad" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
  
        </div>
		<div class="form-group">
          <input class="form-control" type="text" id="sample6_address" name="sample6_address" placeholder="주소">
        </div>
        <div class="m-t-lg">
		<div class="form-group">
          <input class="form-control" type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소">
        </div>
        <div class="m-t-lg">
          <ul class="list-inline">
            <li>
			
              <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
              <input class="btn btn--form" type="submit" value="확인"/>
            </li>
            <li><a class="signup__link" id="signup__link" href="login.jsp">아이디가 있으신가요?</a></li>
          </ul>
        </div>
      </form>
    </div>
  </div>
 </section>
 <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>
</html>
