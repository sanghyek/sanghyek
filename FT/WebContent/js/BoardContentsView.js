/**
 * 
 */
$(document).ready(function() {//게시글 상세보기를 했을때 세션ID값과 작성자ID가 동일하면 히든버튼 활성화 수정 삭제 가능하게 함
	
	var writer=$("#writer").val();
	var sessionID=$("#sessionID").val();
	
	if(writer==sessionID){
		//alert("d");
		$("#update").attr("type","button");
		$("#delete").attr("type","button");		
	}
});

function del(){//삭제버트누를시 정보변경후 삭제실행
	$("#view").attr("action","BoardWriteDBDelete.jsp");
	$("#delete").removeAttr("onclick");
	$("#view").removeAttr("onsubmit");
	$("#delete").attr("type","submit");
}
function up(){//수정버튼누를시 정보변경
	$('#contents').summernote({
		width:800,
		minWidth:800,
		maxWidth:800,
        height: 550,                 // set editor height
        minHeight: 550,             // set minimum height of editor
        maxHeight: 550,             // set maximum height of editor
        focus: true                  // set focus to editable area after initializing summernote
    });
    $("#update").attr("value","등록");
    $("#pre").css("display","none");
    $("#category").removeAttr("readonly");
	$("#title").removeAttr("readonly");
	$("#update").removeAttr("onclick");
	$("#view").attr("onsubmit","return boardcheck()");
	$("#update").attr("type","submit");
	return false;
}
function page(){//목록보기누를시 페이지이동
	location.href='board.jsp';
}
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