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
<link rel="stylesheet" href="css/usermodify.css">
<!-- JS -->
<script src="js/User.js"></script>
<script src="js/address.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script>

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
 //out.print(pw);
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


<!-- 메인배너   -->
<div class="mainbox" >
<img src="img/08.jpg"width="100%" height="500"/>
</div>

<div id="in">
<h1>회원정보 수정</h1><br><br>
<%=name%> 님의 회원가입 정보입니다.
회원정보는 개인정보처리방침에 따라 안전하게 보호되며, <br><br>회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.
</div>
<div id='userinfo'>
  <div class='info'>
    <form  method="post" action="userDBupdate.jsp" onsubmit="return check()" name="signup"> 
	<label for="username">Username</label>
    <input class="user"  id="username" type="text" name="username" value="<%=name%>" readonly/>
    <label for="userid">Userid</label>
    <input class="user" id="userid" type="text" name="userid" value="<%=id%>" readonly />
    <label for="password">Password</label>
    <input class="user" id="password" type="password" name="password" placeholder="비밀번호를 8~12 영문대소문자 와 숫자로 입력하세요" value="" />
    <label for="passwordRepeat">Repeat Password</label>
    <input class="user" id="passwordRepeat" type="password" name="passwordRepeat" placeholder="비밀번호를 한번더 입력하세요" value="" />
    <label for="email">Email</label><label id="ajaxReturnmail" style="position:relative;margin:0;left:20px;width:400px;"></label>
    <input class="user" id="email" type="email" name="email" placeholder="email을 입력하세요" value="<%=email%>" onkeydown="onkeymail()" readonly/><input type="hidden" id="chmail" value=""><input type="button"  onclick="mailmodify()" value="mail변경" id="btnmail"/>
    <label for="username">Userphone</label>
    <input class="user" id="userphone" type="text" name="userphone" placeholder="휴대폰번호를 입력하세요" value="<%=phone%>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="13"/>
    <label for="username">Userbirth</label>
    <input class="user" id="userbirth" type="text" name="userbirth" placeholder="생년월일6자리를 - 없이 입력하세요" value="<%=birth%>" readonly/>
    <label for="username">Useraddress</label>
	<input class="user" type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" value="<%=post%>" >
    <input type="button" id="btnadd" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
    <input class="user" type="text" id="sample6_address" name="sample6_address" placeholder="주소" value="<%=addr1%>">
    <input class="user" type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소" value="<%=addr2%>">
    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
    <input type='submit' class="modi" value="수정" />
	<input type='button' class="modi" onclick="location.href='Mypages.jsp'" value="취소" />
    </form>
  </div>
</div>

</section>
 </body>
</html>
