<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>FindPW</title>

<link href='http://fonts.googleapis.com/css?family=Shadows+Into+Light' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<style>
section,#container,#container  h1,#container  form,#container  fieldset,#container  input {
	margin: 0; padding: 0; border: 0; outline: none;
}

section {
width:100%;
height:900px;
	background: #abb5cb url(img/blue-bg.png);
	font-family: Helvetica, Sans-Serif; color: #525c73;
	text-transform: uppercase;
}


#container {
	width: 560px; height:420px;
	margin: 0px auto; padding: 51px 0 0 0;
	background: url(lines.png); position: relative;
	top:180px;
}
	#container:before {
		content: ""; width: 19px; height: 365px; position: absolute; left: -19px; top: 0;
		background: url(shadow.png); 
	}

#container h1 {
	font-size: 30px;
	text-align: center; letter-spacing: 5px;
	margin: 0 0 44px 0;
}

#container label {
	width: 150px; display: block;
	text-align: right; float: left;
	font-size: 18px; letter-spacing: 3px;
	margin: 0 10px 40px 0; clear: left;
}

#container input {
	width: 300px; height: 40px; float: left; margin: -14px 0 0 0;
	background: url(dots.png); 
	font-family: 'Shadows Into Light', cursive;
	font-size: 15px; color: #18326d; letter-spacing: 3px;
}


#container  input#send {
	width: 202px; height: 84px; float: right;
	margin: 0 70px 36px 0; padding: 0 0 0 77px;
	margin-top:50px;
	background: url(post-mark.png);
	font: bold 30px Helvetica, Sans-Serif; text-transform: uppercase; color: #525c73;
	cursor: pointer;
	
}
#box_mainback{
margin-left:150px;
}
#box_mainback a{
	font-family: Helvetica, cursive;
	font-size: 24px; color: #18326d; letter-spacing: 3px;
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
<div id="container">
	
	<h1>PW 찾기</h1>
	
	<form action="findIDdb.jsp" method="post">
		<fieldset>
			<label for="name">userID:</label>
			<input type="text" id="userid" name="userid" />
			
			<label for="email">Email:</label>

			<input type="email" id="email" name="email" />
			

			<input type="submit" id="send" value="send" />
		</fieldset>
	</form>
<div id="box_mainback">메인으로 돌아가기: <a href="?pageChange=main.jsp">HOME</a></div>
</div>
</section>
 <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>

</html>