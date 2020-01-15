<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<%
String na=request.getParameter("username");
String em=request.getParameter("email");
//out.print(na+em);
Connection conn=null;
Statement stmt=null;
try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataex?useSSL=false&useUnicode=true&characterEncoding=utf8","root","123456789a");
if(conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from userinfo where name='"+na+"' and email='"+em+"';");
if(rs.next()){
	String id = rs.getString("id");
	String name = rs.getString("name");
	String email = rs.getString("email");

	if(email.equals(em)){
		
	out.print("<script>$(document).ready(function(){$('#yourid').val("+id+" 입니다.)});</script>");
    }

}
	else{
		out.println("<script>alert('입력하신 정보가 다릅니다'); history.back();</script>");
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
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>findIDmessage</title>
	<script  src="http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js"></script>
	<!--[if IE]><script>
	$(document).ready(function() { 

$("#form_wrap").addClass('hide');

})

</script><![endif]-->

<style>

section{
	margin: 0; padding: 0; border: 0; outline: none;
}


@font-face {
	font-family: 'YanoneKaffeesatzRegular';
	src: url('yanonekaffeesatz-regular-webfont.eot');
	src: url('yanonekaffeesatz-regular-webfont.eot?#iefix') format('embedded-opentype'),
	url('yanonekaffeesatz-regular-webfont.woff') format('woff'),
	url('yanonekaffeesatz-regular-webfont.ttf') format('truetype'),
	url('yanonekaffeesatz-regular-webfont.svg#YanoneKaffeesatzRegular') format('svg');
	font-weight: normal;
	font-style: normal;
}

section {background: #ccc url('images/bg_out.png'); color: #7c7873; font-family: 'YanoneKaffeesatzRegular';
width:100%;
height:800px;}
#message p {text-shadow:0 1px 0 #fff; font-size:24px;}
#wrapp {width:530px; margin:20px auto 0; height:700px;
position:absolute;
top:300px;
left:730px;}
#message h1 {margin-bottom:20px; text-align:center;font-size:48px; text-shadow:0 1px 0 #ede8d9; }


	#form_wrap { overflow:hidden; height:446px; position:relative; top:80px;
		-webkit-transition: all 1s ease-in-out .3s;
		-moz-transition: all 1s ease-in-out .3s;
		-o-transition: all 1s ease-in-out .3s;
		transition: all 1s ease-in-out .3s;}
	
	#form_wrap:before {content:"";
		position:absolute;
		bottom:128px;left:0px;
		background:url('images/before.png');
		width:530px;height: 316px;}
	
	#form_wrap:after {content:"";position:absolute;
		bottom:0px;left:0;
		background:url('images/after.png');
		width:530px;height: 260px; }

	#form_wrap.hide:after, #form_wrap.hide:before {display:none; }
	#form_wrap:hover {height:776px;top:-200px;}


	#message {background:#f7f2ec url('images/letter_bg.png'); 
		position:relative;top:200px;overflow:hidden;
		height:200px;width:400px;margin:0px auto;padding:20px; 
		border: 1px solid #fff;
		border-radius: 3px; 
		-moz-border-radius: 3px; -webkit-border-radius: 3px;
		box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 27px #fff;
		-moz-box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 14px #fff;
		-webkit-box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 27px #fff;
		-webkit-transition: all 1s ease-in-out .3s;
		-moz-transition: all 1s ease-in-out .3s;
		-o-transition: all 1s ease-in-out .3s;
		transition: all 1s ease-in-out .3s;}


		#form_wrap:hover form {height:530px;}

		#message label {
			margin: 11px 20px 0 0; 
			font-size: 16px; color: #b3aba1;
			text-transform: uppercase; 
			text-shadow: 0px 1px 0px #fff;
		}

		
		#yourid:focus {background:rgba(255,255,255,.35);}

		#yourid {
		    margin-top:40px;
			height:90px;
			width:100%;
			font-size:35px; color: #7c7873;
			background:rgba(255,255,255,.35);
			text-align:center;
			}

			#box_login{
			margin-top:40px;
			font-size:18px;
			text-align:center;
			}
			#box_login a{
			margin-left:20px;
			font-size:18px;
			color:black;

			}

  footer{
height:200px;
width:100%;
background:#D6503E; 
}
</style>
</head>
<body>
<section>
	<div id="wrapp">		
		<div id='form_wrap'>
			<form id="message">
			<h1>Send a message</h1>

				<p>회원님의 ID는,</p>
				<label for="email">Your ID:</label>
				<input type=text  name="yourid" value="" id="yourid" disabled>
			<div id="box_login">로그인 하시겠습니까? <a href="?pageChange=login.jsp">Login</a></div>
			</form>
		</div>
	</div>
</section>
<footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>
</html>
