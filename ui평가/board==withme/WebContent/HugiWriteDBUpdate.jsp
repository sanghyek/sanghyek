<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.HugiDto"%>
<%@ page import="dao.HugiDao"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HugiWriteDBUpdate</title>
</head>
<body>
<jsp:useBean id="board" class="dao.HugiDao"/>
<%
String number=request.getParameter("number");
String category=request.getParameter("category");
String title=request.getParameter("title");
String contents=request.getParameter("contents");
//out.print("<br>"+category+"<br>"+title+"<br>"+"<br>"+contents);
board.Boardupdate(number,category,title,contents);
out.print("<script>location.href='Hugi.jsp'</script>");
%>
</body>
</html>