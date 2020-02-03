<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 


<script type="text/javascript">
/* summernote에서 이미지 업로드시 실행할 함수 */
	function sendFile(file, editor) {
    // 파일 전송을 위한 폼생성
		data = new FormData();
	    data.append("uploadFile", file);
	    $.ajax({ // ajax를 통해 파일 업로드 처리
	        data : data,
	        type : "POST",
	        url : "./summernote_imageUpload.jsp",
	        cache : false,
	        contentType : false,
	        processData : false,
	        success : function(data) { // 처리가 성공할 경우
            // 에디터에 이미지 출력
            
	        	$(editor).summernote('editor.insertImage', data.url);
	        }
	    });
	}
</script>
<script>
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 400,
					callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
					    onImageUpload: function(files, editor, welEditable) {
						    sendFile(files[0], this);
						}
					}
				});
			});
		</script>
<style>
table{
border:solid 1px black;
}
td{
width:100px;
height:50px;
border:solid 1px black;
}
.tdmenu{
text-align:center;
}
</style>
<form action="HugiWriteDBinsert.jsp"  method="post" onsubmit="return boardcheck()" >

<input type="text"  name="category" id="category" value="여행후기">
<input type="text" name="writer" id="writer" value="zzkin1">
<input type="text" placeholder="제목을 입력하세요. " name="title" id="title">
<textarea name="contents" id="summernote" value=""></textarea></td>

<input type="submit" value="등록">
</from>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</body>
</html>