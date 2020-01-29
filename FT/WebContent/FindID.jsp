<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>FindID</title>

<link href='http://fonts.googleapis.com/css?family=Shadows+Into+Light' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

<!-- css -->
<link href='./css/FindID.css' rel='stylesheet' type='text/css'>
<!-- js  -->
<script src="./js/FindID.js"></script>
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
<div id="container">
	
	<h1>ID 찾기</h1>
	
	<form method="post" name="findid" id="findid">
	<input type="hidden" id="find" name="find">
		<fieldset>
			<label for="name">Name:</label>
			<input type="text" id="username" name="username" placeholder="이름을 입력하세요"/>
			
			<label for="email">Email:</label>

			<input type="email" id="email" name="email" placeholder="email을 입력하세요"/>
			
			<input type="button" id="send" value="send" onclick="FindID()"/>
		</fieldset>
	</form>
<div id="box_mainback">메인으로 돌아가기: <a href="index.jsp">HOME</a></div>
</div>
</section>
 <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>

</html>