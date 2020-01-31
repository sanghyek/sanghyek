
// 이미지 미리보기
$("#uploadInputBox0").change(function(event) {  
	if($("#uploadInputBox0").val()!=""||$("#uploadInputBox0").val()!=null){
		$("#1xbutton").attr("type","button");
	}
  RecurFadeIn();
  readURL5(this);    
});
$("#uploadInputBox0").on('click',function(event){
  RecurFadeIn();
});
function readURL5(input) {    
  if (input.files && input.files[0]) {   
    var reader = new FileReader();
    var filename = $("#uploadInputBox0").val();
    filename = filename.substring(filename.lastIndexOf('\\')+1);
    reader.onload = function(e) {
      debugger;      
      $('#img1').attr('src', e.target.result);   
	  $('#img2').attr('src', e.target.result);   
    }
    reader.readAsDataURL(input.files[0]);    
  } 
  $(".alert").removeClass("loading").hide();
}
function RecurFadeIn(){ 
  console.log('ran');
  FadeInAlert("Wait for it...");  
}
function FadeInAlert(text){
  $(".alert").show();
  $(".alert").text(text).addClass("loading");  
}

$("#uploadInputBox1").change(function(event) {  
	if($("#uploadInputBox1").val()!=""||$("#uploadInputBox0").val()!=null){
		$("#2xbutton").attr("type","button");
	}
  RecurFadeIn();
  readURL(this);    
});
$("#uploadInputBox1").on('click',function(event){
  RecurFadeIn();
});
function readURL(input) {    
  if (input.files && input.files[0]) {   
    var reader = new FileReader();
    var filename = $("#uploadInputBox1").val();
    filename = filename.substring(filename.lastIndexOf('\\')+1);
    reader.onload = function(e) {
      debugger;      
      $('#img3').attr('src', e.target.result);          
    }
    reader.readAsDataURL(input.files[0]);    
  } 
  $(".alert").removeClass("loading").hide();
}
function RecurFadeIn(){ 
  console.log('ran');
  FadeInAlert("Wait for it...");  
}
function FadeInAlert(text){
  $(".alert").show();
  $(".alert").text(text).addClass("loading");  
}


$("#uploadInputBox2").change(function(event) {  
	if($("#uploadInputBox2").val()!=""||$("#uploadInputBox0").val()!=null){
		$("#3xbutton").attr("type","button");
	}
  RecurFadeIn();
  readURL2(this);    
});
$("#uploadInputBox2").on('click',function(event){
  RecurFadeIn();
});
function readURL2(input) {    
  if (input.files && input.files[0]) {   
    var reader = new FileReader();
    var filename = $("#uploadInputBox2").val();
    filename = filename.substring(filename.lastIndexOf('\\')+1);
    reader.onload = function(e) {
      debugger;      
      $('#img4').attr('src', e.target.result);          
    }
    reader.readAsDataURL(input.files[0]);    
  } 
  $(".alert").removeClass("loading").hide();
}
function RecurFadeIn(){ 
  console.log('ran');
  FadeInAlert("Wait for it...");  
}
function FadeInAlert(text){
  $(".alert").show();
  $(".alert").text(text).addClass("loading");  
}


$("#uploadInputBox3").change(function(event) { 
	if($("#uploadInputBox3").val()!=""||$("#uploadInputBox0").val()!=null){
		$("#4xbutton").attr("type","button");
	}
  RecurFadeIn();
  readURL3(this);    
});
$("#uploadInputBox3").on('click',function(event){
  RecurFadeIn();
});
function readURL3(input) {    
  if (input.files && input.files[0]) {   
    var reader = new FileReader();
    var filename = $("#uploadInputBox3").val();
    filename = filename.substring(filename.lastIndexOf('\\')+1);
    reader.onload = function(e) {
      debugger;      
      $('#img5').attr('src', e.target.result);          
    }
    reader.readAsDataURL(input.files[0]);    
  } 
  $(".alert").removeClass("loading").hide();
}
function RecurFadeIn(){ 
  console.log('ran');
  FadeInAlert("Wait for it...");  
}
function FadeInAlert(text){
  $(".alert").show();
  $(".alert").text(text).addClass("loading");  
}


$("#uploadInputBox4").change(function(event) {  
	if($("#uploadInputBox4").val()!=""||$("#uploadInputBox0").val()!=null){
		$("#5xbutton").attr("type","button");
	}
  RecurFadeIn();
  readURL4(this);    
});
$("#uploadInputBox4").on('click',function(event){
  RecurFadeIn();
});
function readURL4(input) {    
  if (input.files && input.files[0]) {   
    var reader = new FileReader();
    var filename = $("#uploadInputBox4").val();
    filename = filename.substring(filename.lastIndexOf('\\')+1);
    reader.onload = function(e) {
      debugger;      
      $('#img6').attr('src', e.target.result);          
    }
    reader.readAsDataURL(input.files[0]);    
  } 
  $(".alert").removeClass("loading").hide();
}
function RecurFadeIn(){ 
  console.log('ran');
  FadeInAlert("Wait for it...");  
}
function FadeInAlert(text){
  $(".alert").show();
  $(".alert").text(text).addClass("loading");  
}


//이미지 선택시 메인이미지 바꾸기
class ImageViewer {
  constructor(selector) {
    this.selector = selector;
    $(this.secondaryImages).click(() => this.setMainImage(event));
    $(this.mainImage).click(() => this.showLightbox(event));
    $(this.lightboxClose).click(() => this.hideLightbox(event));
  }

  get secondaryImageSelector() {
    return '.secondary-image';
  }

  get mainImageSelector() {
    return '.main-image';
  }

  get lightboxImageSelector() {
    return '.lightbox';
  }

  get lightboxClose() {
    return '.lightbox-controls-close';
  }

  get secondaryImages() {
    var secondaryImages = $(this.selector).find(this.secondaryImageSelector).find('img');
    return secondaryImages;
  }

  get mainImage() {
    var mainImage = $(this.selector).find(this.mainImageSelector);
    return mainImage;
  }

  get lightboxImage() {
    var lightboxImage = $(this.lightboxImageSelector);
    return lightboxImage;
  }

  setLightboxImage(event) {
    var src = this.getEventSrc(event);
    this.setSrc(this.lightboxImage, src);
  }

  setMainImage(event) {
    var src = this.getEventSrc(event);
    this.setSrc(this.mainImage, src);
  }

  getSrc(node) {
    var image = $(node).find('img');
  }

  setSrc(node, src) {
    var image = $(node).find('img')[0];
    image.src = src;
  }

  getEventSrc(event) {
    return event.target.src;
  }

  showLightbox(event) {
    this.setLightboxImage(event);
    $(this.lightboxImageSelector).addClass('show');
  }

  hideLightbox() {
    $(this.lightboxImageSelector).removeClass('show');
  }}


new ImageViewer('.image-viewer');


//클릭시 파일 첨부
$('#fileclick').on('click',function() {	
	var filecheck0=$("#uploadInputBox0").val();
	var filecheck1=$("#uploadInputBox1").val();
	var filecheck2=$("#uploadInputBox2").val();
	var filecheck3=$("#uploadInputBox3").val();
	
	if(filecheck0!=""){
		$("#fileclick").prop("for","uploadInputBox1");
		if(filecheck1!=""){
			$("#fileclick").prop("for","uploadInputBox2");
			if(filecheck2!=""){
				$("#fileclick").prop("for","uploadInputBox3");
				if(filecheck3!=""){
					$("#fileclick").prop("for","uploadInputBox4");
				}else{
					$("#fileclick").prop("for","uploadInputBox3");
				}
				
			}else{
				$("#fileclick").prop("for","uploadInputBox2");
			}
		}else{
			$("#fileclick").prop("for","uploadInputBox1");
		}
		
	}else{
		$("#fileclick").prop("for","uploadInputBox0");
	}			
});


//이미지 삭제버트 이벤트
function file1del(){
	$("#uploadInputBox0").val("");
	$('#img1').attr('src', ""); 
	$('#img2').attr('src', ""); 
	$("#1xbutton").attr("type","hidden");
}
function file2del(){
	$("#uploadInputBox1").val("");
	$('#img3').attr('src', ""); 
	$("#2xbutton").attr("type","hidden");
}
function file3del(){
	$("#uploadInputBox2").val("");
	$('#img4').attr('src', ""); 
	$("#3xbutton").attr("type","hidden");
}
function file4del(){
	$("#uploadInputBox3").val("");
	$('#img5').attr('src', ""); 
	$("#4xbutton").attr("type","hidden");
}
function file5del(){
	$("#uploadInputBox4").val("");
	$('#img6').attr('src', ""); 
	$("#5xbutton").attr("type","hidden");
}


$(document).ready(function() {//이미지가 없는건 블라인드처리
	
	if($("#checkimg2").val()=="null"){
		$("#img3").css("display","none");
	}
	if($("#checkimg3").val()=="null"){
		$("#img4").css("display","none");
	}
	if($("#checkimg4").val()=="null"){
		$("#img5").css("display","none");
	}
	if($("#checkimg5").val()=="null"){
		$("#img6").css("display","none");
	}
});
function updata(){//수정버튼 누를시이벤트
		$('#contents').summernote({
			width:710,
			minWidth:710,
			maxWidth:710,
	        height: 400,                 // set editor height
	        minHeight: 400,             // set minimum height of editor
	        maxHeight: 400,             // set maximum height of editor
	        focus: true                    // set focus to editable area after initializing summernote
	    });		
    $("#pre").css("display","none");
    $("#img3").css("display","block");
    $("#img4").css("display","block");
    $("#img5").css("display","block");
    $("#img6").css("display","block");
    $("#contents").css("display","none");
    $("#fileclick").css("display","block");
    $("#people").removeAttr("readonly");
    $("#limit").removeAttr("readonly");
	$("#title").removeAttr("readonly");
	$("#localcontent").removeAttr("readonly");
	$("#date").removeAttr("readonly");
	$("#limitdate").removeAttr("readonly");
	$("#update").attr("value","등록");
	$("#update").removeAttr("onclick");
	$("#sin").attr("type","hidden");
    $("#WithMeform").attr("action","boardModifyPro.do");
	$("#WithMeform").attr("onsubmit","return insertcheck()");
	$("#update").attr("type","submit");
	return false;
}
function insertcheck(){//입력폼 체크
	if($("#title").val()==null||$("#title").val()==""){
		alert("글 제목을 입력해주세요");
		return false;
	}
	if($("#people").val()==null||$("#people").val()==""){
		alert("모집인원을 적어주세요");
		return false;
	}
	if($("#localcontent").val()==null||$("#localcontent").val()==""){
		alert("연락가능한 연락처를 적어주세요");
		return false;
	}
	if($("#date").val()==null||$("#date").val()==""){
		alert("만나는 날짜를 선택해주세요"+$("#date").val());
		return false;
	}
	if($("#limitdate").val()==null||$("#limitdate").val()==""){
		alert("마감일을 선택해주세요");
		return false;
	}
	if($("#contents").val()==null||$("#contents").val()==""){
		alert("내용을 입력해주세요");
		return false;
	}
	var result =confirm("게시글을 수정 하시겠습니까?");	
	if(result){
		return true;
	}else{
		return false;		
	}
	return false;
	
}
function validation(fileName) {//파일 체크
	fileName = fileName + "";
	var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	var fileNameExtension = fileName.toLowerCase().substring(
			fileNameExtensionIndex, fileName.length);
	if (!((fileNameExtension === 'jpg')
			|| (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
		alert('jpg, gif, png 확장자만 업로드 가능합니다.');
		return true;
	} else {
		return false;
	}
}

function boarddel(){//삭제버튼 이벤트
	var result =confirm("정말로 삭제 하시겠습니까?");
	var number = $("#num").val();
	var del = "boardDeletePro.do?num="+number;
	
	if(result){
		location.href=del;
	}
}

function sinchung(){//신청버튼 이벤트
	var people = $("#people").val();
	var peoplecount = $("#peoplecount").val();
	if(people==peoplecount){
		alert("모집인원이 마감되었습니다");
	}
	else{
	var result =confirm("신청 하시겠습니까?");
	var num = $("#num").val();
	var sin = "WithMePeopleCount.do?num="+num;
	
	if(result){
		location.href=sin;
	}
	}
}

$(document).ready(function() {//게시글 상세보기를 했을때 세션ID값과 작성자ID가 동일하면 히든버튼 활성화 수정 삭제 가능하게 함
	var writer=$("#writer").val();
	var sessionID=$("#sessionID").val();
	
	if(writer==sessionID){
		//alert("d");
		$("#update").attr("type","button");
		$("#delete").attr("type","button");		
	}
});