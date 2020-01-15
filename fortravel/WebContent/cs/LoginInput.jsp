<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
 <head> <title>Logininput</title></head>
 <body>
<%
String code=request.getParameter("userid");
String pass=request.getParameter("password");
Connection conn=null;
Statement stmt=null;
try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataex?useSSL=false&useUnicode=true&characterEncoding=utf8","root","123456789a");
if(conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from userinfo where id='"+code+"';");
if(rs.next()){
	String id = rs.getString("id");
	String pw = rs.getString("password");

	if(id.equals(code)&&pw.equals(pass)){
	session.setAttribute("ID",id);
	out.println("<script>location.href='Loginheader.jsp';</script>");
    }

	else{
		out.println("<script>alert('비밀번호가 다릅니다'); history.back();</script>");
	}
}
else{
	out.println("<script>alert('ID가 없습니다'); history.back();</script>");
}
}finally{
	try{
		stmt.close();
	}catch(Exception ignored){
	}
	try{
		conn.close();
	}catch(Exception ignored){
	}
}
%>
 </body>
</html>
