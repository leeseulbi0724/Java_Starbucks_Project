<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 | Insert title here</title>
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
.event_section {position: relative;} .container{width: 100%;}
.wn_cont{
    position: relative;
	left: 50%;
	width: 96%;
    margin: 0 0 0 -48%;
}
.on{
	width: 100%;
	background: #006633;
	color: #ffffff;
	border-radius: 3px;
	display: block;
	font-size: 14px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	width: 250px;
}
div.wn_cont h3{
	display: block;
	position: absolute;
	
	border-radius: 3px;
}
.all{left: 2%; width: 22%;}.all_1{	left: 26.6%;} .all_2{left: 51.3%;} .all_3{left: 76%;}
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
    height: 71px;
    width: 1098px;
    border-radius: 3px;
}

section.campaign_wrap {position:relative;}
section.campaign_wrap h3 {display:block;position:absolute;top:20px;border-radius:3px;}
section.campaign_wrap h3.campaign_all { left:30px; }
section.campaign_wrap h3.campaign_store { left:240px; }
section.campaign_wrap h3.campaign_card { left:294px; }
section.campaign_wrap h3.campaign_reserve { left:557px; }
section.campaign_wrap h3.campaign_online { left:820px; }
section.campaign_wrap h3 a { background:#f4f4f2; color:#222222; border-radius:3px; display:block; font-size:14px; height:35px; line-height:35px; text-align:center; width:250px; }
section.campaign_wrap h3 a.on {background:#006633;color:#ffffff;border-radius:3px;display:block;font-size:14px;height:35px;line-height:35px;text-align:center;width:250px;}

.campaign_list {
	height: 90px;
	width: 1098px;
	background: #ffffff;
	margin: 0 auto;
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
.event_list {
	width: 100%;
	margin-bottom:70px;
}
.event_list_inner{
	width: 1150px;
	margin: 0 auto;
}	
.event__list > li > div > h4{
	text-align: center;
	font-size: 14px;
	color: #444444;
	height: 16px;
	line-height: 16px;
	white-space: nowrap;
	overflow: hidden;
}
.event__list > li{
	margin: 10px;
	position: relative;
	width: 260px;
	display: inline-block;
}
.event__list > li > div > p{
	font-size: 12px;
	color: #666666;
	height: 16px;
	margin-top: 8px;
	text-align: center;
}
.event__list div.box { 
	width:260px; height:260px; overflow:hidden;
	margin-bottom:12px;
}
.image:hover { 
	 -webkit-transform: scale(1.2);
	transition: all 1s ease-in-out;
}
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
			<li><a class= "this" href="http://localhost:9000/starbucks/whatsnew/event.jsp">이벤트</a></li>
		</ul>
	</div>
</div>	

<!-- 이벤트  -->
	<div id= "container">
		<div class="wn_cont">
			<section class="campaign_wrap">
                        <div class="box_bg"></div>
                        <!-- 1. All  -->
                        <h3 class="campaign_all"><a class="on" href="">전체</a></h3>         
                        <h3 class="campaign_card"><a href="">스타벅스 카드</a></h3>                   
        				<h3 class="campaign_reserve"><a href="">스타벅스 리워드</a></h3>                   
        			   <h3 class="campaign_online"><a href="">온라인</a></h3>
              </section>
		</div>
	</div>
<!-- 진행중인 이벤트 -->
	<article style="display:block">
		<div class="campaign_list">
			<p>진행 이벤트</p>
		</div>
		<div class="event_list">
			<div class="event_list_inner">
				<ul class="event__list">
					<li><div><a href ="event_content.jsp?eid=E_2"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210517083147274.jpg"></div></div></a><h4>스타벅스 현대카드 5~6월 한정 혜택</h4><p>2021-05-01 ~ 2021-06-30</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_3"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210517142856685.jpg"></div></div></a><h4>SSG X 스타벅스 카드 충전 이벤트</h4><p>2021-05-18 ~ 2021-05-31</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_4"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210512081703575.jpg"></div></div></a><h4>YES or NO, Frappuccino 이벤트</h4><p>2021-05-13 ~ 2021-05-27</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_5"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210504131841554.jpg"></div></div></a><h4>SSG.COM에서 스타벅스 푸드를 만나보세요</h4><p>2021-05-06 ~ 2021-05-30</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_6"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210503091447483.jpg"></div></div></a><h4>2021 서머 e-프리퀀시</h4><p>2021-05-11 ~ 2021-07-19</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_7"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210429161452776.jpg"></div></div></a><h4>e-Gift item 보너스 스타 이벤트</h4><p>2021-01-01 ~ 2021-12-31</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_8"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210607085024446.jpg"></div></div></a><h4>서머2 프로모션</h4><p>2021-06-08 ~ 2021-07-19</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_9"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_FILE20210202095614358.jpg"></div></div></a><h4>만원당 별 적립 이벤트</h4><p>2021-01-01 ~ 2021-12-31</p></div></li>
				</ul>
			</div>
		</div>
	</article>
<!-- Footer -->	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>