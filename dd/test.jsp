<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% String city=request.getParameter("city");%>
	<!DOCTYPE html>
	<html lang="en" >
	<head>
	<title>index</title>
	</head>
	<body>
<% out.print(city);%>
	</body>
	</html>