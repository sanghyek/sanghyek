<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="boarder.bean.BoardDto"%>
<%@ page import="boarder.dao.BoardDao"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWriteDBDelete</title>
</head>
<body>
<jsp:useBean id="board" class="boarder.dao.BoardDao"/>
<%
String num=request.getParameter("number");
//out.print(num);
board.BoardDelete(num);
out.print("<script>location.href='Loginheader.jsp?pageChange=board.jsp'</script>");
%>
</body>
</html>