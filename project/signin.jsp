<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Sign In</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script  src="js/Signin.js"></script>
  <style>
  body{
  }
  #sign_box{   
  background-color:#F7F7F7;
  }
  table{
  margin-left:500px;
  padding:0 200px;
  background-color:#F7F7F7;
  width:600px;
  height:1000px;
  }
  font{color:red;}
  td{
  font-size:10pt;
  text-align:
  }
  h1{
  text-align:center;
  }
  #size{font-size:7;}
  input{
  height:25px;
  border-radius:10px;}
  select{
  font-size:9pt;
  font-weight:bold;
  border-radius:10px;
  width:70px;
  height:30px;
  }
  .bb{
  width:150px;
  height:20px;
  border-radius:10px
  }
  button{
  font-weight:bold;
  font-size:8pt;
  width:65px;
  height:23px;
  border-radius:10px
  }
  .ad{font-size:8pt;}
  .ac{font-size:9pt; font-weight:bold;}  
  .aa{background-color:#747474; font-weight:bold; color:white; font-size:16pt;}

  
footer{
height:250px;
width:100&;
background:gray;
}

  </style>
 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
  </script>
 </head>
 <body>
<section>
 <form method="get" action="InsertDB.jsp" name="SIGNIN">
 <div id="sign_box">
  <table align="center">
	  <tr>	  
	  <th colspan="2"><h3>1.회원 정보</h3></th></tr>
	  <tr>
      <td><font>*</font> 이름</td>
	  <td><input type="text" name="namea" size="25" maxlength="4"></td></tr>
	  <tr>
	  <td><font>&nbsp&nbsp</font>성별</td>
	  <td><div class="ac"><input type="radio" name="chk_male" value="남자" style="vertical-align: middle;"> 남자&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		    <input type="radio" name="chk_male" value="여자" style="vertical-align: middle;">여자
      </div></td>
	  </tr>
	  <td><font>*</font> 생년월일</td>
          <td><div class="ac"><select name="year" size='1'>
		  <option value="">select</option>
          <option value="1990">1990</option>
          <option value="1991">1991</option>
          <option value="1992">1992</option>
          <option value="1993">1993</option>
          <option value="1994">1994</option>
          <option value="1995">1995</option>
          <option value="1996">1996</option>
          <option value="1997">1997</option>
          <option value="1998">1998</option>
          <option value="1999">1999</option>
		  <option value="2000">2000</option></select> 년

		  <select name="month" size='1'>
          <option value="">select</option>
		  <option value="01">01</option>
          <option value="02">02</option>
          <option value="03">03</option>
          <option value="04">04</option>
          <option value="05">05</option>
          <option value="06">06</option>
          <option value="07">07</option>
          <option value="08">08</option>
          <option value="09">09</option>
          <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option></select> 월

		  <select name="day" size='1'>
          <option value="">select</option>
		  <option value="01">01</option>
          <option value="02">02</option>
          <option value="03">03</option>
          <option value="04">04</option>
          <option value="05">05</option>
          <option value="06">06</option>
          <option value="07">07</option>
          <option value="08">08</option>
          <option value="09">09</option>
          <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
          <option value="13">13</option>
		  <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
		  <option value="24">24</option>
		  <option value="25">25</option>
		  <option value="26">26</option>
		  <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option></select> 일</div></td> 
		  </tr>
	  <tr>
      <td><font>*</font> 휴대폰번호</td>
	  <td><select name="phone_1" size='1'>
          <option value="">select</option>
		  <option value="sk">SKT</option>
          <option value="kt">KT</option>
          <option value="lg">LGU+</option>
          <option value="sk2">알뜰폰SKT</option>
		  <option value="kt2">알뜰폰KT</option>
		  <option value="lg2">알뜰폰LGU+</option></select> &nbsp&nbsp&nbsp
	  <select name="phone_2" size='1'>
          <option value="">select</option>
		  <option value="010">010</option>
          <option value="011">011</option>
          <option value="016">016</option>
          <option value="019">019</option></select>
	  - <input type="text" name="phone_3" size="6" maxlength="4"> - <input type="text" name="phone_4" size="6" maxlength="4"></td></tr>
	  <tr>
	  <td><font>*</font> E-mail</td><td>
          <input type='text' name="email" size="8" maxlength="8"> @ 
          <input type='text' name="email_dns" size="16" maxlength="15">&nbsp&nbsp
          <select name="emailaddr" onChange=emailselect(SIGNIN.emailaddr) size="1" style="width:75px;">
		  <option value="">직접입력</option>
          <option value="daum.net">daum.net</option>
          <option value="empal.com">empal.com</option>
          <option value="gmail.com">gmail.com</option>
          <option value="hanmail.net">hanmail.net</option>
          <option value="msn.com">msn.com</option>
          <option value="naver.com">naver.com</option>
          <option value="nate.com">nate.com</option>
          </select>
      </td></tr>
	
	<tr>
    <td><font>*</font>주소</td>
	<td><input type="text" id="sample6_postcode" placeholder="우편번호">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td></tr>
	<tr><td></td><td>
<input type="text" id="sample6_address" size="55" placeholder="주소"></td></tr><tr><td colspan="2">
<input type="text" id="sample6_detailAddress" size="70" placeholder="상세주소" name="addr1"></td></tr><tr><td colspan="2">
<input type="hidden" id="sample6_extraAddress" size="70" placeholder="참고항목" name="addr2"></td>
	</tr>


	  <tr>
	  <th colspan="2"><h3>2.로그인 정보</h3></th></tr>
	  <tr>
      <td><font>*</font> 아이디</td>
      <td><input type="text" name="idd" size="25" maxlength="8"> <a href='#' style='cursor:help'><button type="button" onClick=idcheck(idd)>중복확인</button><br></a></td></tr>         
	  <td><font>*</font> 비밀번호</td>
	  <td><div class="ad"><input type="password" name="pw_1" size="25" maxlength="10"> 8~10자리 로 입력해주세요</div></td>
	  <tr>
	  <td><font>*</font> 비밀번호 확인</td>
	  <td><div class="ad"><input type="password" name="pw_2" size="25" maxlength="10"> 비밀번호를 한번더 입력하세요</div></td>
	  </tr>
	  
	  <tr>
	   <tr height="50"></tr>
	   <tr><td colspan="2"></tr>
	   <tr>
            <td colspan="2" align="center">
			<input type="button" value="확인" onClick=irum() style="background-color:#056072; color:white; width:80px; height:30px;">
            <input type="reset" value="취소" style="background-color:#056072; color:white; width:80px; height:30px;">
            </td>
           </tr>
           </table>          
		  </div>
          </form>

         </section>
		 <footer>

		 </footer>
 </body>
</html>
