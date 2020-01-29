<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.BoardDto"%>
<%@ page import="dao.BoardDao"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWriteDBUpdate</title>
</head>
<body>
<jsp:useBean id="board" class="dao.BoardDao"/>
<%
String number=request.getParameter("number");
String category=request.getParameter("category");
String title=request.getParameter("title");
String contents=request.getParameter("contents");
//out.print("<br>"+category+"<br>"+title+"<br>"+"<br>"+contents);
board.Boardupdate(number,category,title,contents);
out.print("<script>location.href='board.jsp'</script>");
%>
</body>
</html>