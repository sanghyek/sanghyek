<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.bean.BoardDto"%>
<%@ page import="dao.dao.BoardDao"%>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<!-- css -->
<link href="./css/BoardContentsView.css" rel="stylesheet">
<!-- jst -->
<script src="./js/BoardContentsView.js"></script>
<head>
<meta charset="UTF-8">
<title>BoardContentsView</title>
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
<%
String no=request.getParameter("NO");//파라미터로 게시글번호 가지고옴
String hits=request.getParameter("hits");//조회수를 가지고옴
board.hitsUpdate(hits,no);//게시글번호로 해당 조회수 체크후 값+1 증가시켜서 저장(조회수증가처리)
%>
<div class="containerset">
<table class="table table-bordered">
<input type="hidden" name="sessionID" id="sessionID" value=${ID}>
<thead>
<caption>글쓰기</caption>
</thead>
<tbody>
<form action="BoardWriteDBUpdate.jsp" name="view" id="view" method="post">
<tr>
<%
ArrayList<BoardDto> list=board.BoardContentsView(request.getParameter("NO"));//게시글번호로 해당하는 내용들 출력<th width=250px>카테고리</th>
out.print("<input type='hidden' name='number' value='"+list.get(0).getNumber()+"'>");//게시글번호 hidden으로 값저장
out.print("<th>카테고리</th><td><input class='form-control' name='category' id='category' readonly placeholder='카테고리를 선택해주세요' value='"+list.get(0).getCategory()+"'/></td></tr><tr>");//카테고리
out.print("<th>작성자</th><td><input type='text' name='writer' id='writer' value='"+list.get(0).getWriter()+"' readonly class='form-control'/></td></tr><tr>");//작성자
out.print("<th>제목</th><td><input type='text' placeholder='제목을 입력하세요.' name='title' id='title' class='form-control' value='"+list.get(0).getTitle()+"'/></td> </tr><tr>");//제목
out.print("<th>내용</th><td><pre id='pre'>"+list.get(0).getContents()+"</pre>");//컨텐츠 내용이 보여지는 화면 수정버튼 클릭시 display:none 처리
out.print("<textarea name='contents' id='contents'>"+list.get(0).getContents()+"</textarea></td> ");//기본설정은 display:none 이지만 수정버튼 클릭시 활성화 되고 컨텐츠내용을 수정할수있는 입력화면으로 바뀜 
%>
</tr>
<tr height="50">
<td colspan="2">
<div id="btnwichbox"><input name="update" id="update" type="hidden" onclick="return up()" value="수정">
<input name="delete" id="delete" type="hidden" onclick="del()" value="삭제">
</div>
<input name="viewpage" id="viewpage" type="button" onclick="page()" value="목록으로">
</td>
</tr>
</form>
</tbody>
</table>
</div>
</section>

</body>
</html>