<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="vo.WithMeBean"%>
<%@ page import="dao.WithMeDao"%>
<%@ page import="java.util.ArrayList" %>

<style>
@import url('https://fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700');
@import url('https://fonts.googleapis.com/css?family=Raleway:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i');

*{
  box-sizing: border-box;
}

section {
font-family: 'Roboto Slab', serif;
margin: 0;
width: 100%;
height: 100%;
padding: 0;
}



.cards {
    width: 100%;
    display: flex;
    display: -webkit-flex;
    justify-content: center;
    -webkit-justify-content: center;
    max-width: 290px;
}

.card card--1  {
    display:inline-bolck;
}

.card__img {
  visibility: hidden;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    width: 100%;
    height: 235px;
    border-top-left-radius: 12px;
    border-top-right-radius: 12px;
  
}

.card__info-hover {
  position: absolute;
  padding: 16px;
  width: 100%;
  opacity: 0;
  top: 0;
}

.card__img--hover {
  transition: 0.2s all ease-out;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    width: 100%;
    position: absolute;
    height: 235px;
    border-top-left-radius: 12px;
    border-top-right-radius: 12px;
    top: 0;
  
}
.card {
  display: inline-block;
  width: 23.3%;
  margin: 1em;
  transition: all .4s cubic-bezier(0.175, 0.885, 0, 1);
  background-color: #fff;
  width: 21.3%;
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0px 13px 10px -7px rgba(0, 0, 0,0.1);
}

.card__info {
z-index: 2;
  background-color: #fff;
  border-bottom-left-radius: 12px;
border-bottom-right-radius: 12px;
   padding: 16px 24px 24px 24px;
}

.card__category {
    font-family: 'Raleway', sans-serif;
    text-transform: uppercase;
    font-size: 15px;
    letter-spacing: 2px;
    font-weight: 500;
  color: #868686;
}

.card__title {
letter-spacing: 3px;
    margin-top: 5px;
    margin-bottom: 10px;
    font-family: 'Roboto Slab', serif;
}

.card__by {
    font-size: 12px;
    font-family: 'Raleway', sans-serif;
    font-weight: 500;
}

.card__author {
    font-weight: 600;
    text-decoration: none;
    color: #AD7D52;
}

.card:hover .card__img--hover {
    height: 100%;
    opacity: 0.3;
}
.setting{
font-weight: 600;
text-decoration: none;
color: #AD7D52;
margin-left:60px;
}
#withmebox{
position:absolute;
top:1000px;
left:30%;
width:1100px;
height:950px;
}
</style>
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
String st="모집중";
for(int i=0; i<list.size(); i++){
//out.print(path+list.get(i).getPhoto());
%>
 <div class="card card--1">
  <div class="card__img"></div>
  <a href=boardDetail.do?num=<%=list.get(i).getNum()%> class="card_link">
  <div class="card__img--hover" style=background-image:url("<%=path%><%=list.get(i).getPhoto()%>");></div>
  </a>
  <div class="card__info">
    <span class="card__category"><%=list.get(i).getTitle()%></span>
    <h5 class="card__title">모집인원 : 0 / <%=list.get(i).getPeople() %></h5>    
	<h5 class="card__title">만남일 : <%=list.get(i).getDate()%></h5>
	<h5 class="card__title">마감일 : <%=list.get(i).getLimitdate()%></h5>
    <span class="card__by">by <label class="card__author" title="author"><%=list.get(i).getWriter()%></label></span>
	<label class="setting" title="author"><%=st%></label>
  </div>
</div>
<%} %>
</div>
<input type="hidden" name="sessioncheck" id="sessioncheck" value=<%=ses%>>
<input type=button onclick="writepage()" name="write" id="btnwrite" value="글쓰기"/>


 </section>
 </body>
</html>
