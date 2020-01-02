<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String id=(String)session.getAttribute("ID");
String password=(String)session.getAttribute("PW");
String addr=(String)session.getAttribute("ADDR");
%>
<html>
 <head> <title>로그인결과</title></head>
 <body>
<h3>테이블 로그인 결과</h3>
${ID} 님 로그인 되셨습니다<a href="DBLogOut.jsp">로그아웃</a><br><br>
 </body>
</html>
