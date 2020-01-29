<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.WithMeBean"%>
<%@ page import="dao.WithMeDao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%
request.setCharacterEncoding("UTF-8");
//String hits=request.getParameter("hits");//조회수를 가지고옴
//board.hitsUpdate(hits,no);//게시글번호로 해당 조회수 체크후 값+1 증가시켜서 저장(조회수증가처리)
%>
<%
WithMeBean view = (WithMeBean)request.getAttribute("article");
String title=view.getTitle();
Date date=view.getDate();
int people=view.getPeople();
String lim=view.getLim();
String photo=view.getPhoto();
String pic1=view.getPic1();
String pic2=view.getPic2();
String pic3=view.getPic3();
String pic4=view.getPic4();
Date Writedate=view.getWritedate();
Date limitdate=view.getLimitdate();
String writer=view.getWriter();
String localcontent=view.getLocalcontent();
String contents=view.getContents();
int num=view.getNum();
String path="./upload/";
%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>WithMeView</title>
<link rel="stylesheet" href="css/WithMeView.css">

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

<!-- partial:index.partial.html -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<form action="" method="post" id="WithMeform" enctype="multipart/form-data">
<!-- 이미지 미리보기 컨테이너  -->
<div class="image-viewer">
<!-- 파일첨부 버튼  -->
<label class="waves-effect waves-teal btn-flat" for="uploadInputBox0" style="display: none;" id="fileclick">사진첨부:Click!</label>
    <div class="main-image">
      <img  src="<%=path%><%=photo%>" id="img1" width="500" height="500">
    </div>
    <div class="secondary-images">
      <div class="secondary-image">
        <img src="<%=path%><%=photo%>" id="img2" width="50" height="50"/>
      </div>
      <div class="secondary-image">
        <img src="<%=path%><%=pic1%>" id="img3" width="50" height="50"/>
      </div>
      <div class="secondary-image">
        <img src="<%=path%><%=pic2%>" id="img4" width="50" height="50"/>
      </div>
      <div class="secondary-image">
        <img src="<%=path%><%=pic3%>" id="img5" width="50" height="50"/>
      </div>
	  <div class="secondary-image">
        <img src="<%=path%><%=pic4%>" id="img6" width="50" height="50"/>
      </div>
    </div>
    <!-- 넘어오는 img check 만약 값이 없으면 다시 업데이트시 여기안에 값을 넘겨주고 첨부파일이 있으면 첨부파일을 넘겨주기위해 비교로 필요 -->
    <input type="hidden" value=<%=photo%> name="checkimg1" id="checkimg1">
    <input type="hidden" value=<%=pic1%> name="checkimg2" id="checkimg2">
    <input type="hidden" value=<%=pic2%> name="checkimg3" id="checkimg3">
    <input type="hidden" value=<%=pic3%> name="checkimg4" id="checkimg4">
    <input type="hidden" value=<%=pic4%> name="checkimg5" id="checkimg5">
  </div>  
  <!-- 이미지 삭제버튼 -->
    <div id="xbutton1"><input type="hidden" id="1xbutton" onclick="file1del()" value="x"/></div>
    <div id="xbutton2"><input type="hidden" id="2xbutton" onclick="file2del()" value="x"/></div>
    <div id="xbutton3"><input type="hidden" id="3xbutton" onclick="file3del()" value="x"/></div>
    <div id="xbutton4"><input type="hidden" id="4xbutton" onclick="file4del()" value="x"/></div>
    <div id="xbutton5"><input type="hidden" id="5xbutton" onclick="file5del()" value="x"/></div>
    <!-- 첨부파일  -->
<input id="uploadInputBox0"  type="file" style="display:none;" name="filedata0"/>
<input id="uploadInputBox1"  type="file" style="display:none;" name="filedata1"/>
<input id="uploadInputBox2"  type="file" style="display:none;" name="filedata2"/>
<input id="uploadInputBox3"  type="file" style="display:none;" name="filedata3"/>
<input id="uploadInputBox4"  type="file" style="display:none;" name="filedata5"/>
  <div class="textboxcontainer">
      <h2>함 께 해 요</h2><br>
        <div class="inputContainer">
        <input type="hidden" class="taskName" name="num" id="num" value="<%=num%>">
          <input type="text" class="taskName" name="category" id="category" value="함께해요" readonly>
          <label>카테고리</label>
        </div>
        <div class="inputContainer">
          <input type="text" class="taskName" name="writer" id="writer" value="<%=writer%>" readonly>
          <label>작성자</label>
        </div>
        <div class="inputContainer">
          <input type="text" class="taskName" placeholder="제목을 입력하세요" name="title" id="title" value="<%=title%>" readonly>
          <label>제목</label>
        </div>
        <div class="inputContainer">
          <input type="text" class="taskName" placeholder="제한조건이 있으면 적어주세요" name="limit" id="limit" value="<%=lim%>" readonly>
          <label>제한조건</label>
        </div>        
        <div class="inputContainer">
          <input type="text" class="taskName" placeholder="숫자만 입력해주세요" name="people" id="people" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<%=people%>" readonly>
          <label>모집인원</label>
        </div>
        <div class="inputContainer">
          <input type="text" class="taskName" placeholder="연락가능한 연락처를 적어주세요" name="localcontent" id="localcontent" readonly value="<%=localcontent%>">
          <label>현지연락처</label>
        </div>				
	    <div class="inputContainer half last right">
          <input type="date" class="taskDate" name="date" id="date" value="<%=date%>" readonly>
          <label>만남일</label>
        </div>
		  <div class="inputContainer half last right">
          <input type="date"  class="taskDate" name="limitdate" id="limitdate" value="<%=limitdate%>" readonly >
          <label>마감일</label>
        </div><br><br><br><br>
		 <div>
		 <pre id="pre"><%=contents%></pre>
         <textarea name='contents' id='contents'><%=contents%></textarea>
        </div>
</div>
 <div class="btnwich">
<input type="button" id="update" onclick="return updata()" value="수정">
<input type="button" id="delete" value="삭제" onclick="location.href='boardDeletePro.do?num=<%=num%>'">
<input type="button" id="listpage" value="목록으로" onclick="location.href='board.jsp'">
</div>

</form>
<!-- include libraries(jQuery, bootstrap) 썸머노트 여기서부터-->
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
<!-- Latest compiled and minified JavaScript  여기까지-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- partial -->
<script  src="js/WithMeView.js"></script>
  </section>

</body>
</html>
