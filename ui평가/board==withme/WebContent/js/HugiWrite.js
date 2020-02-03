/**
 * 
 */
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