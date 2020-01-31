<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
height:2700px;
}
#flight_src{width:100%;
margin:10px,0;
}
#box{width:60%;
position:absolute;
top:320px;
left:350px;
z-index:9999;
opacity:0.7;
}
#back{width:100%;
height:550px;
vertical-align: middle;
position:relative;
}
footer{
height:200px;
width:100&;
background:#D6503E; 
}
</style>
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
<form id="flight_src">

<img src="img/backwidget1.png" id="back">

<div id="box">
<meta name="originLocation" content="incheon" />
<div 
  data-skyscanner-widget="FlightSearchWidget"
  data-origin-name="document.querySelector('meta[name=originLocation]').content"
  data-locale = "ko-KR" data-flight-type = "return"
  data-params="colour:lunar;fontColour:#000;buttonColour:malt;buttonFontColour:#fff;"
  data-widget-scale = "1.0"
  data-widget-padding = "12px 200px 12px 200px"><!-- 여백을 설정합니다 : 위쪽 오른쪽 아래쪽 왼쪽 -->
</div>
<script src="https://widgets.skyscanner.net/widget-server/js/loader.js" async></script>
</div>
</form>
</section>
<footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
</body>
</html>
