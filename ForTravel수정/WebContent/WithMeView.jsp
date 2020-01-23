<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.bean.WithMeDto"%>
<%@ page import="dao.dao.WithMeDao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%
	request.setCharacterEncoding("UTF-8");
String n=request.getParameter("num");//파라미터로 게시글번호 가지고옴
//String hits=request.getParameter("hits");//조회수를 가지고옴
//board.hitsUpdate(hits,no);//게시글번호로 해당 조회수 체크후 값+1 증가시켜서 저장(조회수증가처리)

%>
<jsp:useBean id="WithMe" class="dao.dao.WithMeDao"/>
<%
ArrayList<WithMeDto> view=WithMe.WithMeView(n);
String title=view.get(0).getTitle();
Date date=view.get(0).getDate();
int people=view.get(0).getPeople();
String limit=view.get(0).getLimit();
String photo=view.get(0).getPhoto();
Date Writedate=view.get(0).getWritedate();
Date limitdate=view.get(0).getLimitdate();
String writer=view.get(0).getWriter();
String localcontent=view.get(0).getLocalcontent();
String contents=view.get(0).getContents();
%>
 <link rel="stylesheet" href="css/board_with.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <link rel='stylesheet' href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<link rel='stylesheet' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css'><link rel="stylesheet" href="css/style.css">


<style>
section{
width:100%;
height:100%;
}
th{
width:100px;
text-align:center;
}
.btnwich{
position:absolute;
left:49%;
}
#listpage{
margin-left:18px;
}
.container{
position:absolute;
top:800px;
left:20%;
}

footer{
position:absolute;
bottom:0px;
height:200px;
width:100%;
background:#D6503E; 
}

.btnwich{
position:relative;
top:200px;}
</style>
<!DOCTYPE html>
<html>

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
<div class="container">
<form action=""  method="post" id="WithMeform">
<table class="table table-bordered">
    <thead>
        <h1>게시글 작성</h1>
    </thead>
    <tbody>
              <tr>
                <th width=250px>카테고리</th>
                <td><input class="form-control" name="category" id="category" value="함께해요"  readonly class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>작성자</th>
                <td width=250px><input type="text" name="writer" id="writer" value="<%=writer%>" readonly class="form-control"/></td>
            </tr>
             <tr>
                <th>제목</th>
                <td><input type="text" placeholder="제목을 입력하세요." name="title" id="title" class="form-control" value="<%=title%>"/></td>
            </tr>
             <tr>
                <th width=250px>투어일자</th>
                <td width=250px><input type="text" name="date" id="date" placeholder="투어일자를 입력하세요."  class="form-control" value="<%=date%>"/></td>
            </tr>
            <tr>
                <th width=250px>모집기간</th>
                <td width=250px><input type="text" name="limitdate" id="limitdate" placeholder="인원 모집기간을 입력하세요."  class="form-control"value="<%=limitdate%>"/></td>
            </tr>
             <tr>
                <th width=250px>모집인원</th>
                <td width=250px><input type="text" name="people" id="people" placeholder="모집인원수"  class="form-control"value="<%=people%>"/></td>
            </tr>
             <tr>
                <th width=250px>제한조건</th>
                <td width=250px><input type="text" name="limit" id="limit" placeholder="모집조건"  class="form-control" value="<%=limit%>"/></td>
            </tr>
             <tr>
                <th width=250px>연락처</th>
                <td width=250px><input type="text" name="localcontent" id="localcontent" placeholder="현지 연락처를 입력하세요"  class="form-control" value="<%=localcontent%>"/></td>
            </tr>
            <tr>
                <th width=250px>대표이미지</th>
                <td contenteditable="true"><img id="blah" name="photo" src="http://placehold.it/180" alt="your image" /><input type='file' onchange="readURL(this);" /></td>
             </tr>
             <tr>
                <th>내용</th>
                 <td width=250px>하단의 여행일정표를 작성하세요</td>
                 </tr>
                 </tbody>
                 </table>
               
                

<!-- partial:index.partial.html -->

  <pre id="pre"><%=contents %></pre>
<textarea id="contents" name="contents"></textarea>
<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore.js'></script><script  src="js/script.js"></script>
<script type="text/javascript">
</script>
</div>
 <div class="btnwich"><input type="button" onclick="text()" value="등록">
<input type="button" id="listpage" value="취소" onclick="location.href='board.jsp'">
</div>
</form>
</section>

</body>
</html>