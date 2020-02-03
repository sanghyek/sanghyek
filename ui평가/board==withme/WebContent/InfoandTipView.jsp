<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Date" %>
<%@page import="Mybatismodel.InfoandTipDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoandTipView</title>
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
function delclick(){//삭제버튼이벤트
	var result =confirm("정말로 삭제 하시겠습니까?");	
	if(result){
		$("#tipView").attr("action","delete.my?command=del");
		$("#tipView").submit();
	}
}
function updata(){//수정버튼이벤트
	  $("#update").attr("value","등록");
	  $("#update").removeAttr("onclick");
	  $("#tipView").attr("onsubmit","return up()");
	  $("#tipView").attr("action","update.my?command=update");
	  $("#title").removeAttr("readonly");
	  $("#contents").removeAttr("readonly");
	  $("#update").attr("type","submit");
	  return false;
}
function up(){//등록버튼 이벤트
	var result =confirm("게시글을 수정 하시겠습니까?");	
	if(result){
		return true;
	}else{
		return false;		
	}
	return false;
}

$(document).ready(function() {//게시글 상세보기를 했을때 세션ID값과 작성자ID가 동일하면 히든버튼 활성화 수정 삭제 가능하게 함
	var writer=$("#writer").val();
	var sessionID=$("#sessionID").val();
	
	if(writer==sessionID){
		//alert("d");
		$("#update").attr("type","button");
		$("#delete").attr("type","button");		
	}
});
</script>
<form  method="post" id="tipView">
<input type="hidden" id="num" name="num" value="<%=num%>">
카테고리:<input type="text" id="category"name="category" value="<%=category%>" readonly>
제목:<input type="text" id="title" name="title" value="<%=title%>" readonly>
글쓴이:<input type="text" id="writer" name="writer" value="<%=writer%>" readonly>
date:<input type="text" id="date" name="date" value="<%=date%>" readonly>
<input type="hidden" id="hits" name="hits" value="<%=hits%>" readonly>
내용:<input type="text" id="contents" name="contents" value="<%=contents%>" readonly>
<input type="hidden" name="sessionID" id="sessionID" value=${ID}>
<input type="hidden" id="update" onclick="return updata()" value="수정" >
<input type="hidden" id="delete" onclick="delclick()" value="삭제">
</form>
</section>
</body>
</html>