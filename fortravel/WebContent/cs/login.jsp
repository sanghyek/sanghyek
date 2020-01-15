<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>login</title>
    <!-- css -->
  <link rel="stylesheet" href="css/login.css">
  <!-- js -->
  <script src='https://unpkg.com/ionicons@4.1.2/dist/ionicons.js'></script>

</head>
<body>
<section>
<div class="wrapper">
  <div class="shapes">
    <div class="row"></div>
    <div class="column">
      <div class="column__1">
        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
     width="40" height="40"
     viewBox="0 0 252 252"
     style="fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,252v-252h252v252z" fill="none"></path><g><g id="surface1"><path d="M225.75,146.4668c0,-14.68359 -9.96679,-27.2959 -25.2041,-37.2627c-3.13769,-37.79589 -34.63769,-67.2041 -74.5459,-67.2041c-39.9082,0 -71.4082,29.40821 -74.5459,67.2041c-15.75,9.45411 -24.67089,23.0918 -24.67089,37.2627c0,21 19.93359,38.8623 48.80859,48.31641c11.0332,16.26269 28.875,25.71679 50.94141,25.71679c21,0 39.88769,-10.5 50.92089,-25.71679c28.3418,-9.45411 48.2959,-27.31641 48.2959,-48.31641z" fill="#8bc34a"></path><path d="M204.2168,85.0459c0,0 -5.7627,-14.1709 1.06641,-25.7168c6.29589,-10.5 8.92089,-17.8623 8.92089,-17.8623c0,0 13.6377,12.0791 9.45411,29.4082c-4.20411,17.8418 -19.95411,22.5791 -21,22.5791c-1.57911,1.57911 2.625,0.5127 1.55859,-8.4082z" fill="#2980b9"></path><path d="M198.4541,85.0459c0,0 -11.0332,-11.01269 -9.4541,-24.13769c1.5791,-11.56641 1.5791,-18.90821 1.5791,-18.90821c0,0 17.8418,5.78321 21,23.0918c3.1377,17.8623 -8.92089,27.8291 -10.5,28.875c-1.5791,1.5791 1.57911,-1.55859 -2.625,-8.9209z" fill="#2980b9"></path><path d="M202.65821,86.625c-3.15821,-3.1582 -18.90821,-12.59179 -35.19141,-12.59179c-16.2627,0 -28.3418,9.43359 -41.4668,9.43359c-13.125,0 -25.2041,-9.43359 -41.46679,-9.43359c-16.28321,0 -21.53321,1.55859 -27.31641,7.875c-6.2959,6.29589 -7.3418,28.875 -7.3418,28.875c0,0 15.75,11.54589 35.7041,11.54589c0,0 13.125,-19.42089 39.8877,-19.42089c27.31641,0 42,19.93359 42,19.93359c18.375,-1.0459 28.3623,-6.2959 36.2373,-12.05859c2.0918,-5.78321 3.1377,-20.48731 -1.04589,-24.15821z" fill="#3498db"></path><path d="M86.625,89.78321c15.2168,0 29.40821,11.54589 29.40821,11.54589c-16.28321,3.6709 -19.44141,9.45411 -26.78321,9.9668c-12.0791,1.5791 -26.25,-5.25 -26.25,-5.25c0,0 8.40821,-16.26269 23.625,-16.26269zM164.3291,89.78321c-15.2373,0 -29.4082,11.54589 -29.4082,11.54589c16.7959,3.6709 21,9.45411 27.8291,9.9668c12.0791,1.5791 25.7168,-5.25 25.7168,-5.25c0,0 -8.9209,-16.26269 -24.1377,-16.26269z" fill="#efebe9"></path><path d="M159.0791,99.2168c-4.2041,0 -7.3623,3.1582 -7.3623,7.3623c0,0.5127 0,0.5127 0,1.0459c4.2041,2.0918 7.3623,3.6709 11.0332,4.2041c0.53321,0 1.0459,0 1.5791,0c1.57911,-1.5791 2.625,-3.1582 2.625,-5.25c0,-4.2041 -3.67089,-7.3623 -7.875,-7.3623z" fill="#000000"></path><path d="M92.9209,99.2168c-4.2041,0 -7.3418,3.1582 -7.3418,7.3623c0,2.0918 1.0459,4.20411 2.625,5.25c0.5127,0 1.0459,0 1.57911,0c3.67089,-0.5332 6.80859,-2.1123 11.01269,-4.2041c0,-0.5332 0,-0.5332 0,-1.0459c-0.51269,-4.2041 -3.6709,-7.3623 -7.875,-7.3623z" fill="#000000"></path><path d="M81.90821,163.28321c0,0 37.26269,16.79589 80.84179,0c15.75,-6.31641 15.75,10.5 2.625,13.125c-63.5332,9.43359 -83.46679,-13.125 -83.46679,-13.125z" fill="#33691e"></path><path d="M126,99.75c-36.75,0 -48.2959,35.1709 -48.2959,35.1709c10.5,-15.2168 28.875,-24.6709 48.2959,-24.6709c19.9541,0 37.7959,8.9209 48.2959,24.15821c0,0 -11.5459,-34.65821 -48.2959,-34.65821z" fill="#33691e"></path></g></g></g></svg>
      </div>
      <div class="column__2">
        <div class="line"></div>
        <div class="square"></div>
        <div class="half-circle"></div>
        <div class="sm-square"></div>
        <div class="rectangle"></div>
        <div class="star"></div>
      </div>
      <div class="column__3">
        <div class="six-circle"></div>
        <div class="pencil"></div>
      </div>
    </div>
  </div>
  <div class="form-content">
    <div class="form-content__header">
      <h2>FORTRAVEL</h2>
    </div>
    <form action="LoginInput.jsp" method="post" onsubmit="return logincheck()">
      <div class="form-row">

        <input type="text" placeholder="ID" name="userid" id="userid">
        <!--<label>id</label>-->
        <ion-icon name="mail" class="icon"></ion-icon>
      </div>
      <div class="form-row">
        <input type="password" placeholder="Password" name="password" id="password">
        <!--<label>Password</label>-->
        <ion-icon name="lock" class="icon"></ion-icon>
      </div>
      <div class="form-row">
        <button class="btn">로그인</button>
      </div>
      <div class="form-row">
        <p>계정이없으신가요? <a href="?pageChange=signup.jsp"">회원가입</a></p>
      </div>
    </form>
    <div class="form-content__footer">
	<p><a href="?pageChange=findID.jsp" style="margin-right:20px;">ID를 잊으셨나요?</a> <a href="?pageChange=findPW.jsp">비밀번호를 잊으셨나요?</a></p>
    </div>
  </div>
</div>
</section>
   <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>
</html>