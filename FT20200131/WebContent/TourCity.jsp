<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>tourcity</title>
  <!-- CSS -->
  <link rel="stylesheet" href="css/tourcity.css">
	<!-- JS -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/TourCity.js"></script>

</body>


 </head>
 <body>

  <% 
 String ses=null;
 ses=(String)session.getAttribute("ID");
 if(ses==null){%>
 <jsp:include page="header.jsp"/>
 <%} else{%>
 <jsp:include page="Loginheader.jsp"/>
 <%} %>
 
 
  <section>
 <!-- 도시이름을 담아놨다가 스크립트에서 이름을 뽑아서 해당도시 날짜를 가져오는 스크립트에 도시이름을 가져간다 -->
<input type="hidden" value="<%=request.getParameter("cityname")%>" id="test">
<!--   사이드메뉴 -->
<aside>
<ul class="note-wrap note">
 <li align="center"><a href="CitySel.jsp">도시</a></li>
 <li align="center"><a href="#">테마</a></li>
 <li align="center"><a href="#">명소</a></li>
 <li align="center"><a href="#">맛집</a></li>
 </ul>
 </aside> 

<!-- 메인배너   -->
<div class="mainbox" >
<img src="" id="mainimg" width="100%" height="500"/>
<!-- 나라선택폼 -->
<form name="cnjform">
<!-- 나라선택 -->
<div class="cityment">여행하실 도시를 선택해주세요</div>
<!-- select메뉴 -->
<select class="sel" name="cityname" id="getWeatherForcast" onChange="city_time();">
<option value="0" selected>도시, 지역 선택</option>
<option value="-9">런던(London)</option>
<option value="-8">파리(Paris)</option>
<option value="-14">뉴욕(NewYork)</option>
<option value="1">시드니(Sydeny)</option>
<option value="-2">다낭(Danang)</option>
<option value="-1">상해(Shanghai)</option>
</select>
<div class="cityname" id="cityname"><%=request.getParameter("cityname")%></div>
<!-- 배너에시간표시 -->
<div class="clockwich" id="clockwich">
<%="현지시간 "+request.getParameter("time")+"   "+request.getParameter("citymonth")+"월 "+request.getParameter("cityday")+"일"%>
</div>
<!-- 도시정보상단에 도시이름표시 -->
<div class="wich" id="wich"><%=request.getParameter("cityname")%></div>

</form>

<!-- 날씨폼 -->
<form  name="ab" class="weather">
<!-- 도시이름영어로 변환해서날씨폼에 입력 -->
<input type="text" name="dosi" id="city" value=""></input>
<!-- 배너에날씨정보표시 -->
<div id="showWeatherForcast"></div>
</form>
 </div>
</div>
</div>
<!-- 도시정보 -->
<div class="cityinfo">
<div class="subinfo">미국 최대의 도시로서, 1790년 이래 수도로서의 지위는 상실했으나, 미국의 상업·금융·무역의 중심지로서, 또 공업도시로서 경제적 수도라 하기에 충분한 지위에 있으며, 또 많은 대학·연구소·박물관·극장·영화관 등 미국 문화의 중심지로도 중요한 위치를 차지하고 있다. 교외를 포함하여 1600만이 넘는 방대한 인구를 수용하는 이 거대도시는 미국 내에서도 독자적인 세계를 이루는 독특한 도시이다. 국제적으로는 대무역항으로서 대서양 항로의 서단에 위치하는 가장 중요한 항구이며, 1920년대 이후에는 런던을 대신하여 세계 금융의 중심지가 되었다. 특히 제2차 세계대전 후에는 미국의 국제적인 지위향상과 더불어 세계 경제에 대한 지배적 지위는 한층 강화되었으며, 1946년 국제연합(UN) 본부가 설치된 후에는 국제정치의 각축장이 되었다.

뉴욕주의 남동단, 뉴욕만(灣)으로 흘러드는 허드슨강 어귀 일대에 위치한다. 허드슨강·이스트강·할렘강·뉴욕만 및 롱아일랜드 수로(水路) 등에 의하여 구획된다. 대도시권으로서의 뉴욕은 시역 밖으로 뻗어, 뉴저지·코네티컷의 두 주에도 미치고 있다.

시는 맨해튼·브롱크스·브루클린·퀸스 및 스태튼섬의 5개구(boroughs)로 이루어져 있다. 맨해튼은 시의 중심부이며, 그 남단에 금융 중심지인 월가(街)가 있다. 월가에서 북동쪽으로 브로드웨이와, 이것과 비스듬히 교차하는 5번가의 두 대로가 시를 종관(縱貫)하고 있다. 브로드웨이의 42번가는 타임스스퀘어로 시에서 가장 번화한 곳이며, 그 남쪽에 펜실베이니아역(驛), 동쪽에 그랜드센트럴역 등 도심의 두 주요역이 있으며, UN 본부도 동쪽 이스트 강가에 있다.

</div></div>
<!--best명소&맛집-->
<div class="best">

<div class="bestbanner">
<div class="subtitle"><span>Best1</span></div>
<img src="img/logo2.png">
</div>
<div class="bestbanner">
<div class="subtitle"><span>Best2</span></div>
<img src="img/logo2.png">
</div>
<div class="bestbanner">
<div class="subtitle"><span>Best3</span></div>
<img src="img/logo2.png">
</div>

</div>

<!-- 탭메뉴 -->
<div class="container">
  <div class="tab-section1">
            <input id="section1" type="radio" name="tab" checked="checked" />
            <label for="section1">명소</label>
            <input id="section2" type="radio" name="tab" />
            <label for="section2">맛집</label>
			<div id="sec1" class="tab2-content">
                <p>
        <ul id="sub-menu">
        <li id="list2"><div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 명소</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 명소</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 명소</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 명소</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 명소</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 명소</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
       </ul>
                </p>
            </div>
            <div id="sec2" class="tab2-content">
                <p>
                    <ul id="sub-menu">
         <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 맛집</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 맛집</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 맛집</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 맛집</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 맛집</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="http://bit.ly/2tMBBTd" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>BEST 맛집</h1>
        <h2>by studio and friends</h2>
        <p>Harvest Vases are a reinterpretation</p>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
  </ul>
   </div>
    </div>
 </section>
   <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
 </body>
</html>
