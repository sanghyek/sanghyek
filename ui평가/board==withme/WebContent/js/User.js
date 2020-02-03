function mailmodify(){
	$("#btnmail").val("email중복체크");
	$("#btnmail").attr("onclick","ma()");
	$("#email").removeAttr("readonly");
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
    	
    	//중복확인후 email을 재입력시 가입안되게 히든에 있는 value값바꿔서 중복체크다시하게 만들기
    	function onkeymail(){
    		var keycode = event.keyCode;
    		if($("#chmail").val()==""){
    			$("#chmail").val("un");
    		}
    	}
    	
    	//정보수정을 눌렀을때 전체 폼을체크
    	function check() {
    	      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    	      var getCheck= RegExp(/^[a-zA-Z0-9]{8,12}$/);
    	      var fmt = RegExp(/^\[0-9]{6}$/); //형식 설정
    	      var v=document.signup;
    	     	 
    	     
    	     	 
    	     if($("#password").val()!=""){//비밀번호가 null이 아닐때 check
    	    	 if(!getCheck.test($("#password").val())) {
    	    	      alert("형식에 맞춰서 PW를 입력해주세요");
    	    	      $("#password").val("");
    	    	      $("#password").focus();
    	    	      return false;
    	    	      }
    	    	      //비밀번호 똑같은지
    	    	      if($("#password").val() != ($("#passwordRepeat").val())){ 
    	    	      alert("비밀번호가 다릅니다.");
    	    	      $("#password").val("");
    	    	      $("#passwordRepeat").val("");
    	    	      $("#password").focus();
    	    	      return false;
    	    	     }
    	    	      //아이디랑 비밀번호랑 같은지
    	    	      if ($("#userid").val()==($("#password").val())) {
    	    	      alert("비밀번호가 ID와 똑같으면 안됩니다");
    	    	      $("#password").val("");
    	    	      $("#password").focus();
    	    	      return false;
    	    	    }
    	    	 
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
    	         
    	      //email중복확인 버튼 눌렀는지확인
    	      if ($("#chmail").val()!="") {//버튼을누르면 #chmail value값이 "" 가되는데 ""이아닐경우 버튼을누른게 아니므로 누르라고 경고창 
    	         alert("email 중복확인을 해주세요");
    	         return false;
    	      }
    	      
    	    var result =confirm("정보를 수정 하시겠습니까?");	
    	  	
    	    if(result){
    	  		return true;
    	  	}else{
    	  		return false;		
    	  	}
    	    return false;
    	  }
