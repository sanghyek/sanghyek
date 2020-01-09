<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="border.bean.BordDto"%>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<style>
th{
background:yellow;
}
</style>
<html lang="en">
 <head>
  <meta charset="UTF-8">

  <title>board</title>
 </head>
 <body>

<jsp:useBean id="bor" class="border.dao.BordDao" ></jsp:useBean>
<table border="solid 1px black ">
<th width=50 align=center>NO</th><th width=50 align=center>카테고리</th>
<th width=200 align=center>제목</th><th width=100 align=center>작성자</th>
<th width=100 align=center>작성일</th><th width=50 align=center>조회수</th></tr>
<%
ArrayList<BordDto> list=bor.List();

for(int i=0; i<list.size(); i++){
	out.println("<tr>"+"<td width=50 align=center>"+list.get(i).getNumber()+"</td>");
	out.println("<td width=50 align=center>"+list.get(i).getCategory()+"</td>");
	out.println("<td width=200 align=center>"+list.get(i).getTitle()+"</td>");
	out.println("<td width=100 align=center>"+list.get(i).getWritter()+"</td>");
	out.println("<td width=100 align=center>"+list.get(i).getDate()+"</td>");
	out.println("<td width=50 align=center>"+list.get(i).getHits()+"</td>"+"<tr>");
}
%>
</table>



 </body>
</html>
