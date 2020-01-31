<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="user" class="dao.UserDao"/>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");
int str=user.Login(id, password);
out.print(str);
if(str==3){
	session.setAttribute("ID", id);
}
%>

