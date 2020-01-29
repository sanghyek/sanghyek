//회원가입후 뒤로가기막아서 회원가입 페이지로 뒤로가기 안되게함
window.history.forward();

function noBack() {

	window.history.forward();

}
//주소검색창
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

//id중복중복확인 버튼을 누를경우
function idc(){
			var getCheckid= RegExp(/^[a-zA-Z0-9]{5,8}$/);
			 //아이디 공백 확인
		      if($("#userid").val() == ""){
		        alert("아이디를 입력하세요");
		        $("#userid").focus();
		      }
		      else{ //공백이아닐경우
		    	  if(!getCheckid.test($("#userid").val())){//ID 유효성체크
		          alert("형식에 맞게 ID를 입력해주세요");
		          $("#userid").val("");
		          $("#userid").focus();
		        }
		    	  else{//ID가형식에 맞으면 ajax를 호출해서 중복여부 검사
    		    	  callAjax();
    		      }
		      }
}
function callAjax() {//ajax 이용해서 ID중복확인
	$.ajax({
		type : "post",
		url : "./SignupConfirm.jsp",
		data : {
			
			id : $('#userid').val()
			
		},
		success : whenSuccess,
		error : whenError
	})
}
function whenSuccess(resdata) {
 	if(resdata==1){
 		$("#ajaxReturn").css("color","red");
	    $("#ajaxReturn").html("중복된 ID 입니다");
		$("#userid").val("");
        $("#userid").focus();
        }
 	else{
 		$("#ajaxReturn").css("color","black");
 		$("#ajaxReturn").html("사용하셔도 좋은 ID 입니다")
 		$("#chid").val("");//중복체크를 했는지 확인하기위한 요소로 기본적인 값이 셋팅되어있고 사용가능하면 값을 ""로 바꿔서 전체 폼체크시 값이 ""이면 중복체크를 한것으로 간주
 	}
}
function whenError() {
	alert("Error");
}
function out() {
	
	callAjax();
	}

//email중복확인
function ma(){
var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		
//이메일 공백 확인
if($("#email").val() == ""){
alert("이메일을 입력해주세요");
$("#email").focus();
} 
else{//이메일 공백아닐경우
if(!getMail.test($("#email").val())){//이메일의 유효성을 검사
alert("이메일형식에 맞게 입력해주세요")
$("#email").val("");
$("#email").focus();
}
else{//형식에맞으면 ajax를 호출해서 email중복체크
callAjaxmail();
}
}
}
function callAjaxmail() {//ajax이용하여 메일중복확인하기

    		$.ajax({
    			type : "post",
    			url : "./SignupConfirm.jsp",
    			data : {
	    				
    				mail : $('#email').val()
    				
    			},
    			success : Success,
    			error : Error
	    		})
    	}
	function Success(resdata) {
    	
	    	 	if(resdata==1){
	    	 	$("#ajaxReturnmail").css("color","red");
	    		$("#ajaxReturnmail").html("중복된 email 입니다");
    			$("#email").val("");
    	        $("#email").focus();
    	        }
	    	 	else if(resdata==0){
	    	 		$("#ajaxReturnmail").css("color","black");
	    	 		$("#ajaxReturnmail").html("사용하셔도 좋은 email 입니다")
	    	 		$("#chmail").val("");//중복체크를 했는지 확인하기위한 요소로 기본적인 값이 셋팅되어있고 사용가능하면 값을 ""로 바꿔서 전체 폼체크시 값이 ""이면 중복체크를 한것으로 간주
	    	 	}
    	
    	
	    	}
	    	function Error() {
	    		alert("Error");
	    	}
    	function out() {
	    		
	    		callAjaxmail();
	    		}
//중복확인후 id를 재입력시 가입안되게 히든에 있는 value값바꿔서 중복체크다시하게 만들기
function onkey(){
	var keycode = event.keyCode;
	if($("#chid").val()==""){
		$("#chid").val("un");
	}
}
//중복확인후 email을 재입력시 가입안되게 히든에 있는 value값바꿔서 중복체크다시하게 만들기
function onkeymail(){
	var keycode = event.keyCode;
	if($("#chmail").val()==""){
		$("#chmail").val("un");
	}
}
//회원가입 확인을 눌렀을때 전체 폼을체크
function check() {
      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	  var getCheckid= RegExp(/^[a-zA-Z0-9]{5,8}$/);
      var getCheck= RegExp(/^[a-zA-Z0-9]{8,12}$/);
      var getName= RegExp(/^[가-힣]+$/);
      var fmt = RegExp(/^\[0-9]{6}$/); //형식 설정
      var v=document.signup;
 
    //이름 공백 확인
      if($("#username").val() == ""){
        alert("이름을 입력하세요");
        $("#username").focus();
        return false;
      }
     //이름 유효성
      if (!getName.test($("#username").val())) {
        alert("이름이 형식에 맞지 않습니다");
        $("#username").val("");
        $("#username").focus();
        return false;
      }
     
     
      //아이디 공백 확인
      if($("#userid").val() == ""){
        alert("아이디를 입력하세요");
        $("#userid").focus();
        return false;
      }
 
      //id 유효성 검사
      if(!getCheckid.test($("#userid").val())){
        alert("형식에 맞게 ID를 입력해주세요");
        $("#userid").val("");
        $("#userid").focus();
        return false;
      }
 
      //비밀번호
      if(!getCheck.test($("#password").val())) {
      alert("형식에 맞춰서 PW를 입력해주세요");
      $("#password").val("");
      $("#password").focus();
      return false;
      }
 
      //아이디랑 비밀번호랑 같은지
      if ($("#userid").val()==($("#password").val())) {
      alert("비밀번호가 ID와 똑같으면 안됩니다");
      $("#password").val("");
      $("#password").focus();
    }
 
      //비밀번호 똑같은지
      if($("#password").val() != ($("#passwordRepeat").val())){ 
      alert("비밀번호가 다릅니다.");
      $("#password").val("");
      $("#passwordRepeat").val("");
      $("#password").focus();
      return false;
     }
 
     //이메일 공백 확인
      if($("#email").val() == ""){
        alert("이메일을 입력해주세요");
        $("#email").focus();
        return false;
      }
           
      //이메일 유효성 검사
      if(!getMail.test($("#email").val())){
        alert("이메일형식에 맞게 입력해주세요")
        $("#email").val("");
        $("#email").focus();
        return false;
      }

	
	   //휴대폰번호 공백 확인
      if($("#userphone").val() == ""){
        alert("휴대폰번호를 입력해주세요");
        $("#userphone").focus();
        return false;
      }

	  //생년월일 공백 확인
      if($("#userbirth").val() == ""){
        alert("생년월일을 입력해주세요");
        $("#userbirth").focus();
        return false;
      }
 

    //생년월일 유효성 검사
      if($("#userbirth").val().length!=6){
        alert("생년월일을 형식에 맞게 입력해주세요");
        $("#userbirth").val("");
        $("#userbirth").focus();
        return false;
      }
    
      //ID중복확인 버튼 눌렀는지확인
      if ($("#chid").val()!="") { //버튼을누르면 #chid value값이 "" 가되는데 ""이아닐경우 버튼을누른게 아니므로 누르라고 경고창
         alert("ID 중복확인을 해주세요");
         return false;
      }
         
      //email중복확인 버튼 눌렀는지확인
      if ($("#chmail").val()!="") {//버튼을누르면 #chmail value값이 "" 가되는데 ""이아닐경우 버튼을누른게 아니므로 누르라고 경고창 
         alert("email 중복확인을 해주세요");
         return false;
      }
    return true;
  }

