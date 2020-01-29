<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="vo.UserDto"%>
<%@ page import="dao.UserDao"%>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="dao.UserDao"/>
<%
String id=(String)session.getAttribute("ID");
ArrayList<UserDto> userlist=user.UserList(id);
String name = userlist.get(0).getName();
String phone = userlist.get(0).getPhone();
String email = userlist.get(0).getEmail();
Date birth = userlist.get(0).getBirth();
String postcode = userlist.get(0).getPostcode();
String addr1 = userlist.get(0).getAddr1();
String addr2 = userlist.get(0).getAddr2();
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Mypage</title>
  <!-- CSS -->
  <link rel="stylesheet" href="css/mypage.css">
	<!-- JS -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/Mypages.js"></script>

</body>
 </head>
 <body>

  <section>
<!--   사이드메뉴 -->
<aside>
<ul class="note-wrap note" style="list-style-type:none">

 <li align="left", list style="none"><a href="User.jsp">회원정보수정</a></li>
 <li align="left"><a href="#">스크랩</a></li>
 <li align="left"><a href="Air.jsp">항공예약확인/취소</a></li>
 <li align="left"><a href="board.jsp">작성 게시물 관리</a></li>
 <li align="left"><a href="#">Q & A</a></li>
 </ul>
 </aside> 

<!-- 메인배너   -->
<div class="mainbox" >
<img src="img/08.jpg"width="100%" height="500"/>
</div>

<!--본문-->
<div class="in_section">
<h1>MY PAGE</h1>
<br><br><br>
<hr>
<div id="box_1">
<div id="in_1">
<b><%=name%> 님</b> <button type="button" id="btn1"><a href="User.jsp">수정</button></a><br>
<br>
휴대폰번호 : <%=phone%><br>
<br>
이 메 일  : <%=email%><br>
<br>
집 주 소  : <%=addr1%><br><br>
<%=addr2%>
</div>
</div>
<div id="box_2">
<div id="in_2">
<b>항공권 총 결제금액 : 1,601,000원</b><br>
<br>
적립금 : 16,010원<br>
<br>
예치금 : 0원<br>
<br>
포인트 : 0원<br>
<br>
쿠폰 : 0개<br>


</div>
</div>
<br><br>
<hr>
	<div><img src="img/blue.png"><h2>구매한 항공권</h2></div>
	<table class="basic">

		<tr><td style="background:#EAEAEA"><b>구매일자</b></td>
		<td style="background:#EAEAEA"><b>편명</b></td> 
		<td style="background:#EAEAEA"><b>출발/도착지</b></td>
		<td style="background:#EAEAEA"><b>결제금액</b></td>
		<td style="background:#EAEAEA"><b>좌석</b></td>
		<td style="background:#EAEAEA"><b>세부내용</b></td>
		</tr>
		<tr>
		<td>2019-12-15</td>
		<td>****</td>
		<td>인천-파리</td>
		<td>994,000 원</td>
		<td>1석</td>
		<td><button type="button" id="btn1"><a href="Air.jsp">조 회</button></a></td>

		<tr>
		<td>2019-01-02</td>
		<td>****</td>
		<td>인천-다낭</td>
		<td>350,000 원</td>
		<td>1석</td>
		<td><button type="button" id="btn1"><a href="Air.jsp">조 회</button></a></td>
		</tr>

		<tr>
		<td>2018-05-11</td>
		<td>****</td>
		<td>인천-코타키나발루</td>
		<td>257,000 원</td>
		<td>1석</td>
		<td><button type="button" id="btn1"><a href="Air.jsp">조 회</button></a></td>
		</tr>
		 
	 </table>
    
	 <br><br>
     <hr>

	<div id="menubox1"><img src="img/board.png"><h2>등록한 게시물</h2></div>
	<table class="basic2">

		<tr><td width="156"style="background:#EAEAEA"><b>등록일자</b></td>
		<td width="470"style="background:#EAEAEA"><b>글 제목</b></td> 
		<td width="156"style="background:#EAEAEA"><b>게시판</b></td>
		<td width="156"style="background:#EAEAEA"><b>조회수</b></td>
		</tr>
		<tr>
		<td>2019-12-01</td>
		<td>aaa</td>
		<td>함께해요</td>
		<td>50</td>

		<tr>
		<td>2019-02-15</td>
		<td>bbb</td>
		<td>여행후기</td>
		<td>200</td>
		</tr>

		<tr>
		<td>2018-05-04</td>
		<td>ccc</td>
		<td>정보&팁</td>
		<td>157</td>
		</tr>
	 </table>
	 
	 <br><br>
     <hr>
	 <div><img src="img/scrap.png"><h2>나의 스크랩</h2></div>

	    <ul id="sub-menu">
        <li id="list2"><div class="wrapper2">
    <div class="product-img">
      <img src="img/da.png" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
       <h3>다낭여행 <br>맛집후기!</h3>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="img/post2.png" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
      <h3>코타키나발루 <br>여행후기</h3>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   <li id="list2"> <div class="wrapper2">
    <div class="product-img">
      <img src="img/food1.png" height="210" width="200">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h3>파리 BEST <br>맛집추천!!</h3>
      </div>
      <div class="product-price-btn">
        <a><button type="button">바로가기</button></a>
      </div>
    </div>
  </div>
  </li>
   
       </ul>
  
</div>
</section>
   <footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
 </body>
</html>
