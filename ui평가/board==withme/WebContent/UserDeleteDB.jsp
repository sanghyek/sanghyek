<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.UserDto"%>
<%@ page import="dao.UserDao"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="dao.UserDao"/>
<%
String id=request.getParameter("id");
String userid=null;
userid=request.getParameter("userid");
String password=request.getParameter("password");
String x=null;
x=request.getParameter("x");
if(userid==null||userid==""){
int str=user.Login(id, password);
out.print(str);
}
if(x!=null){
 	user.UserDelete(userid);//키값인 id로 회원탈퇴진행
	session.invalidate();//탈퇴후 세션값 초기화
	out.print("<script>location.href='index.jsp'</script>");//메인페이지로이동 
	}
%>
