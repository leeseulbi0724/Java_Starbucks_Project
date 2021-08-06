<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.eventDAO, com.starbucks.vo.eventVO"
%>
<%
	String eid = request.getParameter("eid");
	eventDAO dao = new eventDAO();
	
	eventVO vo = dao.getContentResult(eid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>이벤트 | Starbucks Coffee Korea</title>
<link rel="stylesheet"  href="http://localhost:9000/starbucks/css/carousel.css">
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.event_txt{
	padding-top: 30px;
	position: relative;
}
.sub_title{
	width: 100%;
	height: 98px;
	background: #ffffff;
}
.sub_title_inner{
	width: 96%;
	margin: 0 auto;
	padding-top: 0;
}

ul.smap li{
	float: left;
	margin: 0 2.5px;
}
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}

.sub_inner_title {
	width: 1100px;
	height: 91px;
	margin: 0 auto;
	position: relative;
}
ul.smap {
	position: absolute;
	right: 0;
	top: 60px;
	list-style: none;
	display: inline-block;
	font-size:13px;
	text-decoration:none;
}
ul.smap a:hover { text-decoration:underline; }
ul.smap li {
	display: inline-block;
	margin-right: 2px;
	color: #ffffff;
}
.sub_title h1{
	font: bold 36px Avenir, Arial, georgia;
	color: #222222;
	padding-top: 30px;
	position: relative;
}
.wn_conf {
	left: 50%;
	margin: 0 0 0 -550px;
	position: relative;
	width: 1100px;
}
.box_bg {
	border: 1px solid #dddddd;
	width: 100%;
	background: #ffffff;
	height: 71px;
	width: 1098px;
	border-radius: 3px;
	margin: 0 auto;
}
.box_bg span { font-size:13px; color:gray; font-weight:normal; margin-left:10px; }
.container{width: 100%;}
.wn_cont {
    position: relative;
	left: 50%;
	width: 96%;
    margin: 0 0 0 -48%;
}
section.campaign_wrap {
    position: relative;
}
#container {
    width: 100%;
}
.wn_cont {
    left: 50%;
    margin: 0 0 0 -550px;
    position: relative;
    width: 1100px;
}
section.campaign_wrap div.box_bg {
    background: #ffffff;
    border: 1px solid #dddddd;
    height: 51px;
    width: 1098px;
    border-radius: 3px;
    margin-bottom:10px;
    font-size:18px;
    font-weight:bold;
    line-height:50px;
    padding-left:20px;
}
section.campaign_wrap {position:relative;}

div.center { 
	width:101.5%; text-align:center;
	margin:50px 0 120px 0;
 }
 div.center img { clear:left; }
#list {
		background-color:rgb(102,102,102);
		color:white;
		font-weight:bold;
		padding:10px 20px;
		border-radius:4px;
		float:right;
		margin:20px 57px 0 0;
	}
#list:hover { text-decoration:underline; }

.campaign_list {
	height: 90px;
	width: 1000px;
	background: #ffffff;
	margin:auto;
	margin-bottom:500px;
}
.campaign_list p{
	font-size: 17px;
	color: #222222;
	font-weight: bold;
	margin: 21px 0;
	padding:0 30px;
	vertical-align: baseline;
	line-height:70px;
	background-color:rgb(244,244,242);
}
#demo section { text-align:center; }

.carousel-control-prev { 
	margin-left:-100px;
}
.carousel-control-next {
	margin-right:-100px;
}
.carousel-inner img { margin:10px 30px; }
.carousel-inner a { cursor:pointer; }
div.box { display:inline-block; font-size:13px; }
div.box span:last-child { color:gray; }

.carousel-indicators { position:relative; top:50px; }

</style>
</head>
<body>
<!-- Header -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- 서브 타이틀  -->
	<div class="sub_title">
		<div class="sub_inner_title">
			<img class="event_txt"src="http://localhost:9000/starbucks/images/campaign_tit_20210218.jpg">
		<ul class="smap">
			<li><a href=""><img class="home_icon" src="http://localhost:9000/starbucks/images/icon_home.png"></a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/whatsnew/whatsnew.jsp">WHAT'S NEW</a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/whatsnew/event.jsp" >이벤트</a></li>
		</ul>
	</div>
</div>	

<!-- 이벤트  -->
	<div id= "container">
		<div class="wn_cont">
			<section class="campaign_wrap">
                        <div class="box_bg"><%= vo.getTitle() %><span><%=vo.getStart_date() %>~<%=vo.getLast_date() %></span></div>
                        <div class="center">
                        <% if(eid.equals("E_2") ) { %>
                        	<img src="http://localhost:9000/starbucks/images/PLCC_detail_210527_1.jpg" style="vertical-align:top;">
                     		<img src="http://localhost:9000/starbucks/images/PLCC_detail_210528_2.jpg" style="vertical-align:top;"><br>
		                <% } else if (eid.equals("E_3")) { %>   
		                	<img src="http://localhost:9000/starbucks/images/ssgXstarbucks_detail_1_210517.jpg" style="vertical-align:top;">
                     		<img src="http://localhost:9000/starbucks/images/ssgXstarbucks_detail_2_210517.jpg" style="vertical-align:top;"><br>
		                <% } else if (eid.equals("E_4")) { %>
		                	<img src="http://localhost:9000/starbucks/images/YESorNO_Fin_detail_210602_1.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/YESorNO_Fin_detail_210602_2.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/YESorNO_Fin_detail_210602_3.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/YESorNO_Fin_detail_210602_4.jpg" style="vertical-align:top;"><br>                     		
		                <% } else if (eid.equals("E_5")) { %>
		                	<img src="http://localhost:9000/starbucks/images/sratbucksAtHome_detail_1_u1.jpg" style="vertical-align:top;"><br>
		                <% } else if (eid.equals("E_6")) { %>
		                	<img src="http://localhost:9000/starbucks/images/21summer_eFreq_detail_210503_01.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/21summer_eFreq_detail_210503_02.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/21summer_eFreq_detail_210503_03.jpg" style="vertical-align:top;"><br>
		                <% } else if (eid.equals("E_7")) { %>
		                	<img src="http://localhost:9000/starbucks/images/giftshop_bonusstar_detail_PC_2_210429.jpg" style="vertical-align:top;">
		                <% } else if (eid.equals("E_8")) { %>
		                	<img src="http://localhost:9000/starbucks/images/2021_summer2_detail_1.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/2021_summer2_detail_2.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/2021_summer2_detail_3.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/2021_summer2_detail_4.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/2021Summer2Tri_detailBanner_210602.jpg" style="vertical-align:top;">
		                	<img src="http://localhost:9000/starbucks/images/Summer2Icon_detailBanner_210602.jpg" style="vertical-align:top;">
		                <% } else if (eid.equals("E_9")) { %>
		                	<img src="http://localhost:9000/starbucks/images/2021bonusstar_210101.jpg" style="vertical-align:top;"><br>
		                <% } %>
		                    <a href="event.jsp" id="list">목록</a>
                        </div>
              </section>
		</div>
	</div>
	
<!-- 진행중인 이벤트 -->
	<div class="campaign_list">
		<p>진행 이벤트</p>
		<div id="demo" class="carousel slide" data-ride="carousel">
		<section>
		  <!-- Indicators -->
	  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <div class="box">
			      <a href="event_content.jsp?eid=E_2">
			      	<img src="http://localhost:9000/starbucks/images/WEB_THUM_20210531082542819.jpg" alt="Los Angeles" width="260" height="260"><br>
			      	<span>스타벅스 현대카드 5~6월 한정 혜택</span><br>
			      	<span>2021-05-01 ~ 2021-06-30</span>
			      </a>
		      </div>
		      <div class="box">
			     <a href="event_content.jsp?eid=E_7">
			      <img src="http://localhost:9000/starbucks/images/WEB_THUM_20210429161452776.jpg" alt="Los Angeles" width="260" height="260"><br>
		    	  <span>e-Gift Item 보너스 스타 이벤트</span><br>
			      <span>2021-01-01 ~ 2021-12-31</span>
			     </a>
		      </div>
		      <div class="box">
			     <a href="event_content.jsp?eid=E_6">
			      <img src="http://localhost:9000/starbucks/images/WEB_THUM_20210503091447483.jpg" alt="Los Angeles" width="260" height="260"><br>
			       <span>2021 서머 e-프리퀀시</span><br>
			      <span> 2021-05-11 ~ 2021-07-19</span>
			     </a>
		      </div>
		    </div>
		    <div class="carousel-item">
		    <div class="box">
			      <a href="event_content.jsp?eid=E_8">
		      		<img src="http://localhost:9000/starbucks/images/WEB_THUM_20210607085024446.jpg" alt="Chicago" width="260" height="260"><br>
		      		<span>서머2 프로모션</span><br>
			     	<span>2021-06-08 ~ 2021-07-19</span>
			     </a>
		      </div> 
		     <div class="box">
			    <a href="event_content.jsp?eid=E_9">
		     	 <img src="http://localhost:9000/starbucks/images/WEB_THUM_FILE20210202095614358.jpg" alt="Chicago" width="260" height="260"><br>
		   		  <span>만원당 별 적립 이벤트</span><br>
			      <span>2021-01-01 ~ 2021-12-31</span>
			     </a>
		      </div>
		    <!--   <div class="box">
			     <a>		     
		     		<img src="http://localhost:9000/starbucks/images/WEB_THUM_20210531082542819.jpg" alt="Chicago" width="260" height="260"><br>
		    		<span>스타벅스 현대카드 5~6월 한정 혜택</span><br>
			       	<span>2021-05-01 ~ 2021-06-30</span>
			     </a>
		      </div>-->
		    
		    </div>
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev" >
		    <img src="http://localhost:9000/starbucks/images/slide_arrow_l.png">
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next" >
		    <img src="http://localhost:9000/starbucks/images/slide_arrow_r.png">
		  </a>		
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active" style="background-color:gray"></li>
			    <li data-target="#demo" data-slide-to="1" style="background-color:gray"></li>
			  </ul>	  
		  </section>	
		</div>
	</div>	

<!-- Footer -->	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>