<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>FindPW</title>

<link href='http://fonts.googleapis.com/css?family=Shadows+Into+Light' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

<!-- css -->
<link href='./css/FindPW.css' rel='stylesheet' type='text/css'>
<!-- js -->
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
	
	<h1>PW 찾기</h1>
	
	<form action="findIDdb.jsp" method="post">
		<fieldset>
			<label for="name">userID:</label>
			<input type="text" id="userid" name="userid" />
			
			<label for="email">Email:</label>

			<input type="email" id="email" name="email" />
			

			<input type="submit" id="send" value="send" />
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