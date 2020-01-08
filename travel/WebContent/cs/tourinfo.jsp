<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
	<!DOCTYPE html>
	<html lang="en" >
	<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>index</title>
<link rel="stylesheet" href="css/tourinfo.css">
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
<div id="back"><p>어디로 여행을 가시나요?</p></div>
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
<!-- 나라선택메뉴 -->
<div class="container">
  <div class="tab-section1">
            <input id="section1" type="radio" name="tab" checked="checked" />
            <label for="section1">아시아</label>
            <input id="section2" type="radio" name="tab" />
            <label for="section2">동남아</label>
            <input id="section3" type="radio" name="tab" />
            <label for="section3">유럽</label>
			 <input id="section4" type="radio" name="tab" />
            <label for="section4">미주</label>
			 <input id="section5" type="radio" name="tab" />
			 <label for="section5">남태평양</label>

            <div id="sec1" class="tab2-content">
                <p>
        <ul id="sub-menu">
        <li id="list2"><a href="#"><img id="flag" src="img/flag_HKG.gif" width="40" height="25">홍콩</a></li>
        <li id="list2"><a href="#"><img id="flag" src="img/flag_MFM.gif" width="40" height="25">마카오</a></li>
        <li id="list2"><a href="#"><img id="flag" src="img/flag_OSA.gif" width="40" height="25">오사카</a></li>
        <li id="list2"><a href="#"><img id="flag" src="img/flag_OSA.gif" width="40" height="25">도쿄</a></li>
		<li id="list2"><a href="#"><img id="flag" src="img/flag_TPE.gif" width="40" height="25">타이베이</a></li>
		<li id="list2"><a href="#" style="position:relative; left:-27px;"><img id="flag" src="img/flag_TPE.gif" width="40" height="25" >가오슝</a></li>
		<li id="list2"><a href="#" style="position:relative; left:-27px;"><img id="flag" src="img/flag_BJS.gif" width="40" height="25">상하이</a></li>
		<li id="list2"><a href="#" style="position:relative; left:-27px;"><img id="flag" src="img/flag_BJS.gif" width="40" height="25">칭다오</a></li>	
       </ul>
                </p>
            </div>
            <div id="sec2" class="tab2-content">
                <p>
                    <ul id="sub-menu">
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_SIN.gif" width="40" height="25">싱가폴</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_LA1.gif" width="40" height="25">라오스</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_BKK.gif" width="40" height="25">푸켓</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_BKK.gif" width="40" height="25">방콕</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_DAD.gif" width="40" height="25">나트랑</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_DAD.gif" width="40" height="25">호치민</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_DAD.gif" width="40" height="25">다낭</a></li>
		<li id="list2"><a href="#"><img id="flag"  src="img/flag_CEB.gif" width="40" height="25">세부</a></li>
		<li id="list2"><a href="#"><img id="flag"  src="img/flag_CEB.gif" width="40" height="25">보라카이</a></li>
        <li id="list2"><a href="#" style="position:relative; left:-13px;"><img id="flag"  src="img/flag_BKI.gif" width="40" height="25">코타키나발루</a></li>
		</ul>
                </p>
            </div>
            <div id="sec3" class="tab2-content">
                <p>
        <ul id="sub-menu">
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_PAR.gif" width="40" height="25">파리</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_ROM.gif" width="40" height="25">로마</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_LON.gif" width="40" height="25">런던</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_BCN.gif" width="40" height="25">바르셀로나</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_IST.gif" width="40" height="25">이스탄불</a></li>
		<li id="list2"><a href="#" style="position:relative; left:-27px;"><img id="flag"  src="img\flag_VVO.gif" width="40" height="25">블라디보스톡</a></li>		
        </ul>
		</p>
				</div>
			<div id="sec4" class="tab2-content">
                <p>
         <ul id="sub-menu">
         <li id="list2"><a href="#"><img id="flag" src="img/flag_Z01.gif" width="40" height="25">뉴욕</a></li>
         <li id="list2"><a href="#"><img id="flag" src="img/flag_Z01.gif" width="40" height="25">하와이</a></li>
         </ul>     
	           </p>
            </div>
			<div id="sec5" class="tab2-content">
                <p>
                    <ul id="sub-menu">
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_Z01.gif" width="40" height="25">괌</a></li>
        <li id="list2"><a href="#"><img id="flag"  src="img/flag_SYD.gif" width="40" height="30">시드니</a></li>
      </ul>
                </p>
            </div>
        </div>
    </div>

<!-- 테마선택카드 -->
<div class="gallery">  
<br><br><br><p style="font-size: 34px;
  color: #474747; font-weight:bold;">테 마 여 행</p>
<div class="view">
  <img src="img/banner6.jpg" width="100%" height="100%"/>
  <div class="mask">
    <h2>가족</h2>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
    <a href="#" class="info">Read More</a>
  </div>
</div>

<div class="view">
  <img src="http://farm4.staticflickr.com/3672/9759934733_30459e24b6_c.jpg"/>
  <div class="mask">
    <h2>연인</h2>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
    <a href="#" class="info">Read More</a>
  </div>
</div>

<div class="view">
  <img src="img/banner5.jpg" width="100%" height="100%"/>
  <div class="mask">
    <h2>힐링</h2>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
    <a href="#" class="info">Read More</a>
  </div>
</div>
  
<div class="view">
  <img src="http://farm3.staticflickr.com/2830/9479528002_33660b24ef_c.jpg"/>
  <div class="mask">
    <h2>익사이팅</h2>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
    <a href="#" class="info">Read More</a>
  </div>
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