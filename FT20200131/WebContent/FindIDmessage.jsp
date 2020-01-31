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

<style>
#form_wrap:before {content:"";
		position:absolute;
		bottom:128px;left:0px;
		background:url('img/before.png');
		width:530px;height: 316px;
}
#form_wrap:after {content:"";position:absolute;
		bottom:0px;left:0;
		background:url('img/after.png');
		width:530px;height: 260px; 
}
#message {background:#f7f2ec url('img/letter_bg.png'); 
		position:relative;top:200px;overflow:hidden;
		height:200px;width:400px;margin:0px auto;padding:20px; 
		border: 1px solid #fff;
		border-radius: 3px; 
		-moz-border-radius: 3px; -webkit-border-radius: 3px;
		box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 27px #fff;
		-moz-box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 14px #fff;
		-webkit-box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 27px #fff;
		-webkit-transition: all 1s ease-in-out .3s;
		-moz-transition: all 1s ease-in-out .3s;
		-o-transition: all 1s ease-in-out .3s;
		transition: all 1s ease-in-out .3s;
}

</style>
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