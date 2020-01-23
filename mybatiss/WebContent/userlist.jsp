<%@page import="model.Dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% ArrayList<Dto> list = (ArrayList<Dto>)request.getAttribute("data");
for (int i=0; i<list.size(); i++){
	out.print(list.get(i).getId());
	out.print(list.get(i).getName());
	out.print(list.get(i).getPw());	
}
%>
</body>
</html>