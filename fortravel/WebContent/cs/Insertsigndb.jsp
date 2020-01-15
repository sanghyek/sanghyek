<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<%
String name=request.getParameter("username");
String idd=request.getParameter("userid");
String pw=request.getParameter("password");
String email=request.getParameter("email");
String phone=request.getParameter("userphone");
String birth=request.getParameter("userbirth");
String postcode=request.getParameter("sample6_postcode");
String addr1=request.getParameter("sample6_address");
String addr2=request.getParameter("sample6_detailAddress");
String addr=addr1+addr2;
//out.print(name+id+pw+email+phone+birth+postcode+addr);
 
Connection conn=null; 
Statement stmt=null;
try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataex?useSSL=false&useUnicode=true&characterEncoding=utf8","root","123456789a");
if(conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
stmt=conn.createStatement();
String command = String.format("insert into userinfo values"+"('"+name+"','"+idd+"','"+pw+"','"+email+"','"+phone+"','"+birth+"','"+postcode+"','"+addr+"');");
int rowNum = stmt.executeUpdate(command);
if(rowNum<1)
throw new Exception("데이터를 DB에 입력할 수 없습니다."); 
}finally{
	try{
		stmt.close();
		}catch(Exception ignored){
		}
		try{
			conn.close();}
		catch(Exception ignored){
		}
	}
	
	session.setAttribute("Name",name);
	RequestDispatcher dispatcher=request.getRequestDispatcher("signupsuc.jsp");
    dispatcher.forward(request,response);
%>