<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="css/WithMeWrite.css">
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>WithMeWrite</title>
 </head>
 <body>
<style>
.textboxcontainer{
position:absolute;
top:350px;
left:650px;
}
section{
height:2000px;
width:100%;
}
</style>
  <section>
<% 
 String ses=null;
 ses=(String)session.getAttribute("ID");
 if(ses==null){%>
 <jsp:include page="header.jsp"/>
 <%} else{%>
 <jsp:include page="Loginheader.jsp"/>
 <%} %>

<!-- partial:index.partial.html -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<form action="WithMeWrite.do" method="post" id="WithMeform" onsubmit="return insertcheck()" enctype="multipart/form-data">
<!-- 이미지 미리보기 컨테이너  -->
<div class="image-viewer">
<!-- 파일첨부 버튼  -->
<label class="waves-effect waves-teal btn-flat" for="uploadInputBox0" id="fileclick">사진첨부:Click!</label>
    <div class="main-image">
      <img  src="" id="img1" width="500" height="500">
    </div>
    <div class="secondary-images">
      <div class="secondary-image">
        <img src="" id="img2" width="50" height="50"/>
      </div>
      <div class="secondary-image">
        <img src="" id="img3" width="50" height="50"/>
      </div>
      <div class="secondary-image">
        <img src="" id="img4" width="50" height="50"/>
      </div>
      <div class="secondary-image">
        <img src="" id="img5" width="50" height="50"/>
      </div>
	  <div class="secondary-image">
        <img src="" id="img6" width="50" height="50"/>
      </div>
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
</div>
  <div class="textboxcontainer">
      <h2>함 께 해 요</h2><br>
        <div class="inputContainer">
          <input type="text" class="taskName" name="category" id="category" value="함께해요" readonly>
          <label>카테고리</label>
        </div>
        <div class="inputContainer">
          <input type="text" class="taskName" name="writer" id="writer" value="${ID}" readonly>
          <label>작성자</label>
        </div>
        <div class="inputContainer">
          <input type="text" class="taskName" placeholder="제목을 입력하세요" name="title" id="title" value="">
          <label>제목</label>
        </div>
        <div class="inputContainer">
          <input type="text" class="taskName" placeholder="제한조건이 있으면 적어주세요" name="limit" id="limit" value="">
          <label>제한조건</label>
        </div>        
        <div class="inputContainer">
          <input type="text" class="taskName" placeholder="숫자만 입력해주세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="people" id="people" value="">
          <label>모집인원</label>
        </div>
        <div class="inputContainer">
          <input type="text" class="taskName" placeholder="연락가능한 연락처를 적어주세요" name="localcontent" id="localcontent" value="">
          <label>현지연락처</label>
        </div>		
	    <div class="inputContainer half last right">
          <input type="date" class="taskDate" name="date" id="date" value="">
          <label>만남일</label>
        </div>
		  <div class="inputContainer half last right">
          <input type="date" class="taskDate" name="limitdate" id="limitdate" value="">
          <label>마감일</label>
        </div><br><br><br><br>
		 <div>
         <textarea name='contents' id='contents'></textarea>
        </div>
</div>
 <div class="btnwich">
<input type="submit" id="update"  value="등록">
<input type="button" id="listpage" value="목록으로" onclick="">
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
<script  src="js/WithMeWrite.js"></script>
</section>

</div>
<footer>
제작자 : 박하영, 홍준영, 한상혁<br>
   copyright ⓒ TOURTIPS Inc. All rights Reserved.
</footer>
 </body>
</html>