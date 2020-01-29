<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Mybatismodel.InfoandTipDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보&팁</title>
</head>
<body>
<section>
<table>
<tr>
<th>No</th>
<th>category</th>
<th>title</th>
<th>writer</th>
<th>date</th>
<th>hits</th>
<th>contents</th>
</tr>
<% ArrayList<InfoandTipDto> list = (ArrayList<InfoandTipDto>)request.getAttribute("data");
out.print(list.size());
for (int i=0; i<list.size(); i++){
	out.print("<tr><td>"+list.get(i).getNum()+"</td>");
	out.print("<td>"+list.get(i).getCategory()+"</td>");
	out.print("<td><a href='Info&TipView.my?command=view&num="+list.get(i).getNum()+"'>"+list.get(i).getTitle()+"</a></td>");
	out.print("<td>"+list.get(i).getWriter()+"</td>");
	out.print("<td>"+list.get(i).getDate()+"</td>");
	out.print("<td>"+list.get(i).getHits()+"</td>");
	out.print("<td>"+list.get(i).getContents()+"</td>");
}
%>
</table>
<a href="Info&TipWriter.jsp">글쓰기</a>
</section>
</body>
</html>