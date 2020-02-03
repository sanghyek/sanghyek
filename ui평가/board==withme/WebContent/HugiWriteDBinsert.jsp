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
<title>HugiWriteDBinsert</title>
</head>
<body>
<jsp:useBean id="board" class="dao.HugiDao"/>
<%
String category=request.getParameter("category");
String title=request.getParameter("title");
String writer=request.getParameter("writer");
String contents=request.getParameter("contents");
//out.print(number+"<br>"+category+"<br>"+title+"<br>"+writer+"<br>"+hits+"<br>"+contents);
board.BoardWrite(category,title,writer,contents);
out.print("<script>location.href='Hugi.jsp'</script>");
%>

</body>
</html>