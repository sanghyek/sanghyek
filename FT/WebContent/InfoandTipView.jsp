<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Date" %>
<%@page import="Mybatismodel.InfoandTipDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<% 
ArrayList<InfoandTipDto> list = (ArrayList<InfoandTipDto>)request.getAttribute("data");
int num=list.get(0).getNum();
String category=list.get(0).getCategory();
String title=list.get(0).getTitle();
String writer=list.get(0).getWriter();
Date date=list.get(0).getDate();
int hits=list.get(0).getHits();
String contents=list.get(0).getContents();
%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function delclick(){
	$("#tipView").attr("action","delete.my?command=del");
	$("#tipView").submit();
}
</script>
<form action="update.my?command=update" method="post" id="tipView">
번호:<input type="text" id="num" name="num" value="<%=num%>">
카테고리:<input type="text" id="category"name="category" value="<%=category%>">
제목:<input type="text" id="title" name="title" value="<%=title%>">
글쓴이:<input type="text" id="writer" name="writer" value="<%=writer%>">
date:<input type="text" id="date" name="date" value="<%=date%>">
조회수:<input type="text" id="hits" name="hits" value="<%=hits%>">
내용:<input type="text" id="contents" name="contents" value="<%=contents%>">
<input type="submit" value="수정">
<input type="button" onclick="delclick()" value="삭제">
</form>
</section>
</body>
</html>