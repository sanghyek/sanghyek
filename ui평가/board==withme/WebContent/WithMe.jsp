<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="vo.WithMeBean"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="dao.WithMeDao"%>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<WithMeBean> articleList=(ArrayList<WithMeBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>WithMe</title>
 </head>
 <body>

  <%
  	String ses=null;
     ses=(String)session.getAttribute("ID");
     if(ses==null){
  %>
 <jsp:include page="header.jsp"/>
 <%
 	} else{
 %>
 <jsp:include page="Loginheader.jsp"/>
 <%
 	}
 %>
 
 
 <section>
 <link rel="stylesheet" href="css/withme.css">
<script>
function writepage(){//글쓰기누를시 페이지이동
	var sessioncheck=$("#sessioncheck").val();
	var check="null";
	if(sessioncheck==check){
		alert("로그인이 필요합니다.");
	} 
	else{
		location.href='WithMeWrite.jsp';
	}
}
</script>

<!-- 메인배너   -->
<div class="mainbox" >
<img src="img/08.jpg"width="100%" height="500"/></div>

<div id="withmebox">
<%
request.setCharacterEncoding("UTF-8");
ArrayList<WithMeBean> list=(ArrayList<WithMeBean>)request.getAttribute("articleList");
out.print("<input type='hidden' id=size value="+list.size()+">");
//out.print(list.size());
String path="./upload/";
if(articleList != null && listCount > 0){
for(int i=0; i<list.size(); i++){
	String st="모집중";
//out.print(path+list.get(i).getPhoto());
if(list.get(i).getPeoplecount()==list.get(i).getPeople()){
	st="마감";
}
%>
 <div class="card card--1">
  <div class="card__img"></div>
  <a href=boardDetail.do?num=<%=list.get(i).getNum()%>&page=<%=nowPage%> class="card_link">
  <div class="card__img--hover" style=background-image:url("<%=path%><%=list.get(i).getPhoto()%>");></div>
  </a>
  <div class="card__info">
    <span class="card__category"><%=list.get(i).getTitle()%></span>
    <h5 class="card__title">모집인원 : <%=list.get(i).getPeoplecount() %> / <%=list.get(i).getPeople() %></h5>    
	<h5 class="card__title">만남일 : <%=list.get(i).getDate()%></h5>
	<h5 class="card__title">마감일 : <%=list.get(i).getLimitdate()%></h5>
    <span class="card__by">by <label class="card__author" title="author"><%=list.get(i).getWriter()%></label></span>
	<label class="setting" title="author" i><%=st%></label>
  </div>
</div>
<%} %>
</div>
<input type="hidden" name="sessioncheck" id="sessioncheck" value=<%=ses%>>
<input type=button onclick="writepage()" name="write" id="btnwrite" value="글쓰기"/>
<div id="pageList">
		<%if(nowPage<=1){ %>
		[이전]&nbsp;
		<%}else{ %>
		<a href="WithMe.do?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="WithMe.do?page=<%=a %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		[다음]
		<%}else{ %>
		<a href="WithMe.do?page=<%=nowPage+1 %>">[다음]</a>
		<%} %>
	</div>
	<%
    }
	else
	{
	%>
	<div id="emptyArea">등록된 글이 없습니다.</div>
	<input type="hidden" name="sessioncheck" id="sessioncheck" value=<%=ses%>>
    <input type=button onclick="writepage()" name="write" id="btnwrite" value="글쓰기"/>
	<%
	}
%>

 </section>
 </body>
</html>
