<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
session.invalidate();//전체세션 지우기
// session.removeAttribute("지울내용의 name값"); 선택한 세션만 지울수있다
out.print("<script>location.href='index.jsp';</script>");
%>