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
	var result =confirm("정말로 삭제 하시겠습니까?");
	
	if(result){
		$("#view").attr("action","HugiWriteDBDelete.jsp");
		$("#delete").removeAttr("onclick");
		$("#view").removeAttr("onsubmit");
		$("#delete").attr("type","submit");
	}
}

function page(){//목록보기누를시 페이지이동
	location.href='Hugi.jsp';
}
function boardcheck(){
	if($("#title").val()==""||$("#title").val()==null){
		alert("제목을 입력해주세요");
		return false;
	}
	if($("#contents").val()==""||$("#contents").val()==null){
		alert("내용을 입력해주세요");
		return false;
	}
	var result =confirm("게시글을 수정 하시겠습니까?");	
	if(result){
		return true;
	}
	return false;
}