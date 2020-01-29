<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="user" class="dao.UserDao"/>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String str=user.FindID(name, email);
out.print(str);
%>