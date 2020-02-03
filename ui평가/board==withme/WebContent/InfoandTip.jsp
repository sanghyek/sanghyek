<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Mybatismodel.InfoandTipDto"%>
<!DOCTYPE html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<style>
@charset "UTF-8";

section{position:relative;
left:300px;
width:70%;
}
/* 게시판 리스트 목록 */
.sub_news{
position:relative;
top:50px;
left:100px;
width:1000px;
}

.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:80%;border-bottom:1px solid #999;color:#666;font-size:13px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:10px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .date,.sub_news .hit.num{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
.sub_news tr.reply .title a{padding-left:16px;background:url(첨부파일/ic_reply.png) 0 1px no-repeat}
/* //게시판 리스트 목록 */

/* 마우스오버 */
#tr_hover:hover {
    background-color:#D6F0FF;}
    

th{
background:yellow;
}
.newimg{
width:30px;
height:20px;
float:left;
display:none;
color:red;
font-weight: 400;
}
#btnwrite{
position:relative;
top:60px;
left:100px;
}
#scbox{
position:absolute;
top:230px;
left:300px;
}
</style>


<html>
<head>
<meta charset="UTF-8">
<title>InfoandTip</title>
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

<table class="sub_news" border="1" cellspacing="0">
<caption>정보 & TIP</caption>
<thead>
<tr>
<th width="50">글번호</th>
<th width="170">카테고리</th>
<th width="250">제목</th>
<th width="170">글쓴이</th>
<th width="170">날짜</th>
<th width="170">조회수</th>
</tr>
</thead>
<% ArrayList<InfoandTipDto> list = (ArrayList<InfoandTipDto>)request.getAttribute("data");
out.print("<input type='hidden' id=size value="+list.size()+">");
for (int i=0; i<list.size(); i++){
	out.print("<tr id='tr_hover'><td>"+list.get(i).getNum()+"</td>");
	out.print("<td>"+list.get(i).getCategory()+"</td>");
	out.print("<td><label class='newimg' id='newimg"+i+"'>new</label><a href='Info&TipView.my?command=view&num="+list.get(i).getNum()+"&hits="+list.get(i).getHits()+"'>"+list.get(i).getTitle()+"</a></td>");
	out.print("<td>"+list.get(i).getWriter()+"</td>");
	out.print("<td>"+list.get(i).getDate()+"</td>");
	out.print("<td>"+list.get(i).getHits()+"</td>");
	out.print("<input type='hidden' id='date"+i+"' value='"+list.get(i).getDate()+"'>");//hidden타입에 value값으로 날자를 넣어 스크립트에서 비교하기
}
%>
<input type="hidden" value="${ID}" id="sessioncheck"/>
</table>
<input type="button" onclick="writepage()" value="글쓰기"/>
<script>
function writepage(){//session 을 ID가sessionchek인 input hidden박스에 value값으로 넣어주고 값 을 비교하여 로그인과 비로그인 구별하여 글쓰기제한둠
	var sessioncheck=$("#sessioncheck").val();
	var check="null";
	var check2="";
	if(sessioncheck==check||sessioncheck==check2){
		alert("로그인이 필요합니다.");
	} 
	else{
		location.href="InfoandTipWrite.jsp";
	}
}
	
$(document).ready(function() {//현재날짜와 게시글작성일을 비교해서 new출력
	var today=new Date();//날짜를 가져온다
	var dd=today.getDate();//일
	var mm=today.getMonth()+1;//월
	var yyyy=today.getFullYear();//년
	if(dd<10){
		dd='0'+dd
	}
	if(mm<10){
		mm='0'+mm
	}
	var today=yyyy+"-"+mm+"-"+dd;//년-월-일 로 변수에담는다
	var size=$("#size").val();//list사이즈를 변수로 담는다
	
	for(var i=0;i<size;i++){//list사이즈만큼 for문을 돌린다
		if(today==$("#date"+i).val())//현재날짜와 hidden에 담긴 작성일을 비교해서 일치하면 new출력
		$("#newimg"+i).css("display","block"); 		
	}
});
</script>
</section>
</body>
</html>