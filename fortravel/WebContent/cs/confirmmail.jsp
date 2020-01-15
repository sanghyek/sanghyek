<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
  String email = request.getParameter("mail");
  String check = null;
  int str;
  
  Connection conn = null;
  Statement stmt = null;
  HashMap<String,String>map=new HashMap<String,String>();
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dataex?useSSL=false&useUnicode=true&characterEncoding=utf8","root","123456789a");
	  if (conn == null)
		  throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
	  stmt = conn.createStatement();
	  ResultSet rs = stmt.executeQuery("select * from userinfo where email ='" + email +"';");
	  if(rs.next()){   
		 //String idd = rs.getString("id");
		  str=1;
		  out.print(str);
		  
	  }else{
		  str=0;
		  out.print(str);
	  }
  }finally {
	  try {
		  stmt.close();
	  } catch (Exception ignored) {
	  }
	  try {
		  conn.close();
	  }catch (Exception ignored) {
	  }
  }
  

%>
