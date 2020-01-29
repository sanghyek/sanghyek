<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- css -->
<link rel="stylesheet" href="css/signupsuc.css">

<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>SignupSuccess</title>
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
<div id="box1" class="box blurred-bg tinted">
  <div class="content">
    <h1>${Name} 님 가입을 환영합니다</h1><br><br><br>
    <p class="related">로그인하시겠습니까?
  <a href="Login.jsp">Login</a></p>  
  </div>
</div>
</section>

<footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>
</html>

