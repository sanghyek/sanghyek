<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.bean.BoardDto"%>
<%@ page import="dao.dao.BoardDao"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWriteDBDelete</title>
</head>
<body>
<jsp:useBean id="board" class="dao.dao.BoardDao"/>
<%
String num=request.getParameter("number");
//out.print(num);
board.BoardDelete(num);
out.print("<script>location.href='board.jsp'</script>");
%>
</body>
</html>