<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="./css/BoardWrite.css" rel="stylesheet">
<!-- js -->
<script src='./js/BoardWrite.js'></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
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
<table class="table table-bordered">
    <thead>
        <caption>글쓰기</caption>
    </thead>
    <tbody>
      <form action="BoardWriteDBinsert.jsp"  method="post" onsubmit="return boardcheck()" >
              <tr>
                <th width=250px>카테고리</th>
                <td><input class="form-control" name="category" id="category" placeholder="카테고리를 선택해주세요" value=""/></td>
            </tr>
             <tr>
                <th width=250px>작성자</th>
                <td width=250px><input type="text" name="writer" id="writer" value=${ID} readonly class="form-control"/></td>
            </tr>
             <tr>
                <th>제목</th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="title" id="title" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="contents" id="contents" value=""></textarea></td>
            </tr>
             <tr height="50">
                <td colspan="2">
                    <div class="btnwich"><input type="submit" value="등록">
                    <input type="button" id="listpage" value="취소" onclick="location.href='board.jsp'"></div>
                 </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</section>

</body>
</html>