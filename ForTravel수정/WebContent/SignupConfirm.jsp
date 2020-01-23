<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="user" class="dao.dao.UserDao"/>
<%
String id = null;
String email = null;
id=request.getParameter("id");
email=request.getParameter("mail");

if(email==null||email==""){//파라미터 값으로 비교해서 id가 들어오면 id중복체크
int str=user.ConfirmID(id);
out.print(str);
}
if(id==null||id==""){//id가아닌 email이 파라미터값으로 오면 email중복체크를 한다
int str=user.ConfirmMail(email);
out.print(str);
}
%>
