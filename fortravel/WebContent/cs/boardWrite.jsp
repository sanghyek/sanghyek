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
<style>
section{
width:100%;
height:1500px;
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
</style>
<script>
$(document).ready(function() {
	$('#contents').summernote({
		width:1050,
		minWidth:1050,
		maxWidth:1050,
        height: 600,                 // set editor height
        minHeight: 600,             // set minimum height of editor
        maxHeight: 600,             // set maximum height of editor
        focus: true                    // set focus to editable area after initializing summernote
    });
});
function boardcheck(){
	if($("#category").val()==""||$("#category").val()==null){
		alert("카테고리를 선택해주세요");
		return false;
	}
	if($("#title").val()==""||$("#title").val()==null){
		alert("제목을 입력해주세요");
		return false;
	}
	if($("#contents").val()==""||$("#title").val()==null){
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWrite</title>
</head>
<body>

<section>


<div class="container">
<table class="table table-bordered">
    <thead>
        <caption>글쓰기</caption>
    </thead>
    <tbody>
      <form action="boardWriteDBinsert.jsp"  method="post" onsubmit="return boardcheck()" >
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
                    <input type="button" id="listpage" value="취소" onclick="location.href='?pageChange=board.jsp'"></div>
                 </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</section>

</body>
</html>