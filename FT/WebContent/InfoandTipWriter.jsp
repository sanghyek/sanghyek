<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<form action="insert.my?command=insert" method="post">
카테고리:<input type="text" id="category" name="category"/>
제목:<input type="text" id="title" name="title"/>
글쓴이:<input type="text" id="writer" name="writer"/>
내용:<input type="text" id="contents" name="contents"/>
<input type="submit" value="등록"/>
</form>
</section>
</body>
</html>