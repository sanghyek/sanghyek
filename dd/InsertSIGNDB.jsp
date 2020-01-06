<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<%
String name=request.getParameter("namea");
String gender=request.getParameter("chk_male");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String phone2=request.getParameter("phone_2");
String phone3=request.getParameter("phone_3");
String phone4=request.getParameter("phone_4");
String email_1=request.getParameter("email");
String email_2=request.getParameter("email_dns");
String addr1=request.getParameter("addr1");
String addr2=request.getParameter("addr2");
String id=request.getParameter("idd");
String pw=request.getParameter("pw_1");
String birth=year+"-"+month+"-"+day;
String phone=phone2+"-"+phone3+"-"+phone4;
String email=email_1+"@"+email_2;
String addr=addr1+addr2;
Connection conn=null; 
Statement stmt=null;
try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataex?useSSL=false&useUnicode=true&characterEncoding=utf8","root","123456789a");
if(conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
stmt=conn.createStatement();
String command = String.format("insert into sign values"+"('"+name+"','"+gender+"','"+birth+"','"+phone+"','"+email+"','"+addr+"','"+id+"','"+pw+"');");
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
	
	session.setAttribute("NA",name);
	RequestDispatcher dispatcher=request.getRequestDispatcher("InsertSIGNRead.jsp");
    dispatcher.forward(request,response);
%>