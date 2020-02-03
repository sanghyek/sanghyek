<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>

<link rel="stylesheet" href="css/signin.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src='./js/Login.js'></script>

<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>login</title>
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
<form  method="post" id="Loginform" onsubmit="return login()">
<div class="box">
  <img class="logo" src="img/logo2.png" />
  <input class="inputtext"placeholder="ID" name="userid" id="userid" type="text">
  <br/>
  <input class="inputtext" placeholder="Password" name="password" id="password" type="password">
  <input type="submit" id="button" value="Login">
</form>
  <p class="foot-txt"><a id="alink" href="FindID.jsp" >아이디를 잊으셨나요?</a><a id="alink2" href="FindPW.jsp">비밀번호를 잊으셨나요?</a><a href="Signup.jsp">회원이 아니신가요?</a></p>
</div>

</section>
</body>
</html>