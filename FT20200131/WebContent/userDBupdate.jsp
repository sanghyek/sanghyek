<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.UserDto"%>
<%@ page import="dao.UserDao"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="dao.UserDao"/>
<%
String id=request.getParameter("userid");
String pw=request.getParameter("password");
String email=request.getParameter("email");
String phone=request.getParameter("userphone");
String post=request.getParameter("sample6_postcode");
String addr1=request.getParameter("sample6_address");
String addr2=request.getParameter("sample6_detailAddress");

int count=user.Userupdate(id, pw, email, phone, post, addr1, addr2);
if(count>=1){
	out.print("<script>location.href='Mypages.jsp';</script>");
}
%>
