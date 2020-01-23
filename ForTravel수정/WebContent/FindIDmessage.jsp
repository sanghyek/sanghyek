<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%String id = request.getParameter("find");//폼에서 넘어온 ID를 저장해서 변수에담아준다%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>FindIDmessage</title>
	<script  src="http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js"></script>
	<!-- css -->
    <link href='./css/FindIDmessage.css' rel='stylesheet' type='text/css'> 

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
	<div id="wrapp">		
		<div id='form_wrap'>
			<form id="message">
			<h1>Send a message</h1>

				<p>회원님의 ID는,</p>
				<label for="email">Your ID: </label>
				<input type=text  name="yourid" value="<%=id%> 입니다." id="yourid" disabled>
			</form>
		</div>
	</div>
	<div id="box_login">로그인 하시겠습니까?<a id="loginbtn" href="Login.jsp">Login</a></div>
</section>
<footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>
</html>