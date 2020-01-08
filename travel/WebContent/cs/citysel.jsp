<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
	<!DOCTYPE html>
	<html lang="en" >
	<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>index</title>
<link rel="stylesheet" href="css/citysel.css">
<script  src="js/tourinfo.js"></script>
	</head>
	<body>
	<!--내용 -->
	<section>
<!--배너 -->
	<div id="mainbanner">
	<div id="captioned-gallery">
	<figure class="slider">
		<figure>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/hobbiton-lake.jpg" alt>
			<figcaption>Hobbiton, New Zealand</figcaption>
		</figure>
		<figure>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/wanaka-drowned-tree.jpg" alt>
			<figcaption>Wanaka, New Zealand</figcaption>
		</figure>
		<figure>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/utah-peak.jpg" alt>
			<figcaption>Utah, United States</figcaption>
		</figure>
		<figure>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/bryce-canyon-utah.jpg" alt>
			<figcaption>Bryce Canyon, Utah, United States</figcaption>
		</figure>
		<figure>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/hobbiton-lake.jpg" alt>
			<figcaption>Hobbiton, New Zealand</figcaption>
		</figure>
	</figure>
</div>
<div id="back"><p>도시를 선택해주세요.</p></div>
<form name="cnjform">
<select class="sel" name="cityname" id="getWeatherForcast" onChange="city_time();">
<option value="0" selected>도시, 지역 선택</option>
<option value="-19">Anchorage</option>
<option value="-7">Athens</option>
<option value="-14">Atlanta</option>
<option value="3">오클랜드(Auckland)</option>
<option value="-6">바그다드(Baghdad)</option>
<option value="-2">방콕(Bangkok)</option>
<option value="-1">베이징(Beijing)</option>
<option value="-8">베를린(Berlin)</option>
<option value="1">브리즈번(Brisbane)</option>
<option value="-7">카이로(Cairo)</option>
<option value="0">도쿄(Tokyo)</option>
<option value="-14">토론토(Toronto)</option>
<option value="-17">밴쿠버(Vancouver)</option>
<option value="3">웰링턴(Wellington)</option>
</select>
</form>
</div>
	</div>
	<!-- 명소 -->
    <div class="wrapper">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="420" width="327">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BESt 명소</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation<br> of peeled fruits and vegetables as<br> functional objects. The surfaces<br> appear to be sliced and pulled aside,<br> allowing room for growth. </p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
<!--  맛집 -->
     <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="420" width="327">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 맛집</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation<br> of peeled fruits and vegetables as
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
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