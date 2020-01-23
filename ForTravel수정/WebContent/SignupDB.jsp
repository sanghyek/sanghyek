<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignupDB</title>
</head>
<body>
<jsp:useBean id="user" class="dao.dao.UserDao"/>
<%
String name=request.getParameter("username");
String id=request.getParameter("userid");
String password=request.getParameter("password");
String email=request.getParameter("email");
String phone=request.getParameter("userphone");
String birth=request.getParameter("userbirth");
String postcode=request.getParameter("sample6_postcode");
String addr1=request.getParameter("sample6_address");
String addr2=request.getParameter("sample6_detailAddress");
//out.print(name+id+pw+email+phone+birth+postcode+addr);
user.Signup(name, id, password, email, phone, birth, postcode, addr1, addr2);
session.setAttribute("Name",name);
out.print("<script>location.href='SignupSuccess.jsp'</script>");
%>

</body>
</html>