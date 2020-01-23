<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.bean.BoardDto"%>
<%@ page import="dao.dao.BoardDao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>
<!doctype html>
  <!-- CSS -->
<link rel="stylesheet" href="css/board.css">
  <!-- js -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="./js/board.js"></script>

<html>
 <head>
  <meta charset="UTF-8">

  <title>board</title>
 </head>
 <body>
 
  <% 
 String ses=null;
 ses=(String)session.getAttribute("ID");
 if(ses==null){%>
 <jsp:include page="header.jsp"/>
 <%} else{%>
 <jsp:include page="Loginheader.jsp"/>
 <%} %>
 
 <section>
<jsp:useBean id="board" class="dao.dao.BoardDao"/>
<table class="sub_news" border="1" cellspacing="0">
<caption>게시판 리스트</caption>
<colgroup>
<col>
<col width="110">
<col width="100">
<col width="80">
</colgroup>
<thead>
<tr>
<th scope="col" width="30px;">글번호</th>
<th scope="col" width="50px">카테고리</th>
<th scope="col">제목</th>
<th scope="col" width="70px;">글쓴이</th>
<th scope="col" width="50px;">날짜</th>
<th scope="col" width="50px;">조회수</th>
</tr>
</thead>
<%
String opt=null;
String text=null;
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
opt=(String)request.getParameter("Boardselectmenu");
text=(String)request.getParameter("searchinfo");
out.print(opt+"   "+text);
if(text==""||opt==null||text==null){//검색어가 없거나 셀렉트값이 없으면 리스트 전체 순서대로 출력
ArrayList<BoardDto> list=board.List();
out.print("<input type='hidden' id=size value="+list.size()+">");
//out.print(list.size());

 for(int i=0; i<list.size(); i++){
	out.print("<tr id='tr_hover'>"+"<td width=100 align=center>"+list.get(i).getNumber()+"</td>");
	out.print("<td width=100 align=center>"+list.get(i).getCategory()+"</td>");
	out.print("<td width=100 align=center>"+"<img src='img/new.jpg' class='newimg' id='newimg"+i+"'>"+"<a href='BoardContentsView.jsp?NO="+list.get(i).getNumber()+"&hits="+list.get(i).getHits()+"'>"+list.get(i).getTitle()+"</a>"+"</td>");
	out.print("<td width=100 align=center>"+list.get(i).getWriter()+"</td>");
	out.print("<td width=100 align=center>"+list.get(i).getDate()+"</td>");
	out.print("<td width=150 align=center>"+list.get(i).getHits()+"</td>"+"<tr>");
	out.print("<input type='hidden' id='date"+i+"' value='"+list.get(i).getDate()+"'>");//hidden타입에 value값으로 날자를 넣어 스크립트에서 비교하기
 }
}
else{//검색에따른 리스트 출력 
	 ArrayList<BoardDto> list=board.List(opt,text);
	 for(int i=0; i<list.size(); i++){
			out.print("<tr>"+"<td width=100 align=center>"+list.get(i).getNumber()+"</td>");
			out.print("<td width=100 align=center>"+list.get(i).getCategory()+"</td>");
			out.print("<td width=100 align=center>"+"<a href='BoardContentsView.jsp?NO="+list.get(i).getNumber()+"&hits="+list.get(i).getHits()+"'>"+list.get(i).getTitle()+"</a>"+"</td>");
			out.print("<td width=100 align=center>"+list.get(i).getWriter()+"</td>");
			out.print("<td width=100 align=center>"+list.get(i).getDate()+"</td>");
			out.print("<td width=150 align=center>"+list.get(i).getHits()+"</td>"+"<tr>");
		 }
}

%>
</table>
<input type="hidden" name="sessioncheck" id="sessioncheck" value=<%=ses%>>
<input type=button onclick="writepage()" name="write" id="btnwrite" value="글쓰기"/>
<div id="scbox">
<form name="boardsearchform" action="board.jsp" onsubmit="return search()" method="post">
<select class="sel" name="Boardselectmenu" id="Boardselectmenu">
<option value="none" selected>전체</option>
<option value="category">카테고리</option>
<option value="title_contents">제목+내용</option>
<option value="title">제목</option>
<option value="contents">내용</option>
<option value="writer">작성자</option>
<input type="text" value="" name="searchinfo" id="searchinfo">
<input type="submit" value="검색">
</div>
</select>
</form>
</section>

 </body>
</html>
