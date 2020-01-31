<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoandTipWrite</title>
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
<form action="insert.my?command=insert" onsubmit="return boardcheck()" method="post">
카테고리:<input type="text" id="category" name="category" value="정보&팁" readonly/>
글쓴이:<input type="text" id="writer" name="writer" value="${ID}" readonly/>
제목:<input type="text" id="title" name="title"/>
내용:<input type="text" id="contents" name="contents"/>
<input type="submit" value="등록"/>
</form>
<script>
function boardcheck(){
	if($("#title").val()==""||$("#title").val()==null){
		alert("제목을 입력해주세요");
		return false;
	}
	if($("#contents").val()==""||$("#contents").val()==null){
		alert("내용을 입력해주세요");
		return false;
	}
	var result =confirm("게시글을 등록 하시겠습니까?");
	
	if(result){
		return true;
	}
	return false;
}
return false;
</script>
</section>
</body>
</html>