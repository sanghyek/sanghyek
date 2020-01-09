<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>signup</title>
<link rel="stylesheet" href="css/signup.css">
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>

<!-- partial -->
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js?ver=1"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?ver=1"></script>
<script>
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
	
</script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <script type="text/javascript">
    //중복확인
     	$(document).ready(function() {
    		$("#btnid").click(function() {
    			var getCheckid= RegExp(/^[a-zA-Z0-9]{5,8}$/);
    			 //아이디 공백 확인
    		      if($("#userid").val() == ""){
    		        alert("아이디를 입력하세요");
    		        $("#userid").focus();
    		      }
    		      else{ 
    		    	  if(!getCheckid.test($("#userid").val())){
    		          alert("형식에 맞게 ID를 입력해주세요");
    		          $("#userid").val("");
    		          $("#userid").focus();
    		        }
    		    	  else{
        		    	  callAjax();
        		      }
    		      }
    		     
    			    	
    		      
    		});
    	}); 
    	function callAjax() {
    		//alert("dd");
    		$.ajax({
    			type : "post",
    			url : "./confirmId.jsp",
    			data : {
    				
    				id : $('#userid').val()
    				
    			},
    			success : whenSuccess,
    			error : whenError
    		})
    	}
    	function whenSuccess(resdata) {
    	//alert("dd");
    	//alert(resdata);
    	//alert(resdata.includes("dd"))
    	 	if(resdata==1){
    		$("#ajaxReturn").html("중복된 ID 입니다");
    			$("#userid").val("");
    	        $("#userid").focus();
    	        }
    	 	else{
    	 		$("#ajaxReturn").html("사용하셔도 좋은 ID 입니다")
    	 		$("#chid").val("");
    	 	}
    	
    		
    	//	if(resdata.includes("이미 사용중인 아이디입니다."))
    	//		document.join.hidden.value="0";
    	//	else
    	//		document.join.hidden.value="1";
    	}
    	function whenError() {
    		alert("Error");
    	}
    	function out() {
    		
    		callAjax();
    		}

    </script>
<script>


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
    
      //ID중복확인 버튼
      if ($("#chid").val()!="") {
         alert("ID 중복확인을 해주세요");
         return false;
      }
         
    return true;
  }



</script>
</head>
<body style="font-family: 'Open sans', sans-serif;
overflow-x: hidden;">
<section>
<div class="signup-page-container signup-form-open">
  <div class="signup__container signup-form">
    <div class="container__child signup__thumbnail" style="background: url(https://p.w3layouts.com/demos_new/template_demo/19-06-2017/assets-demo_Free/554297363/web/images/7.jpg);">
      <div class="thumbnail__logo"><img src="http://192.168.1.6:8080/house-rent-management/owner_front_end/assets/img/logo.png" alt=""/></div>
      <div class="thumbnail__content text-center">
        <h1 class="heading--primary">가입을 환영합니다</h1>
        <h2 class="heading--secondary">가입 할 준비가 되셨나요?</h2>
      </div>
      <div class="signup__overlay"></div>
    </div>
    <div class="container__child signup__form">


      <form  method="post" action="Insertsigndb.jsp" onsubmit="return check()" name="signup">
	    <div class="form-group">
          <label for="username">Username</label>
          <input class="form-control" id="username" type="text" name="username" placeholder="이름을 입력하세요" />
        </div>
		  <div class="form-group">
          <label for="username">Userid</label><div id="ajaxReturn" style="width:400px;color:black;font-size:12pt;"></div>
          <input class="form-control" id="userid" type="text" name="userid" placeholder="ID를 5~8자리 영문대소문자와 숫자로 입력하세요" /><input type="hidden" id="chid" value="on"><input type="button" value="ID중복확인" id="btnid"/>
        </div>
         <div class="form-group">
          <label for="password">Password</label>
          <input class="form-control" id="password" type="password" name="password" placeholder="비밀번호를 8~12 영문대소문자 와 숫자로 입력하세요" />
        </div>
        <div class="form-group">
          <label for="passwordRepeat">Repeat Password</label>
          <input class="form-control" id="passwordRepeat" type="password" name="passwordRepeat" placeholder="비밀번호를 한번더 입력하세요" />
        </div>
		 <div class="form-group">
          <label for="email">Email</label>
          <input class="form-control" id="email" type="email" name="email" placeholder="email을 입력하세요" />
        </div>
			<div class="form-group">
          <label for="username">Userphone</label>
          <input class="form-control" id="userphone" type="text" name="userphone" placeholder="휴대폰번호를 입력하세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="13"/>
        </div>
		<div class="form-group">
          <label for="username">Userbirth</label>
          <input class="form-control" id="userbirth" type="text" name="userbirth" placeholder="생년월일6자리를 - 없이 입력하세요"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="6"/>
        </div>
		<div class="form-group">
          <label for="username">Useraddress</label>
		  <input class="form-control" type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" >
<input type="button" id="btnad" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
  
        </div>
		<div class="form-group">
          <input class="form-control" type="text" id="sample6_address" name="sample6_address" placeholder="주소">
        </div>
        <div class="m-t-lg">
		<div class="form-group">
          <input class="form-control" type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소">
        </div>
        <div class="m-t-lg">
          <ul class="list-inline">
            <li>
			
<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
              <input class="btn btn--form" type="submit" value="확인"/>
            </li>
            <li><a class="signup__link" id="signup__link" href="?pageChange=login.jsp">아이디가 있으신가요?</a></li>
          </ul>
        </div>
      </form>
    </div>
  </div>
 </section>
 <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>
</html>
