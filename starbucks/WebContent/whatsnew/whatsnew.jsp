<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>WHAT'S NEW | Starbucks Coffee Korea</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
.sub_title{
	width: 100%;
	height: 98px;
	background: #ffffff;
}
ul.smap li{
	float: left;
	margin: 0 2.5px;
}
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}

.sub_inner_title{
	width: 1100px;
	height: 91px;
	margin: 0 auto;
	position: relative;
}
ul.smap{
	position: absolute;
	right: 0;
	top: 60px;
	list-style: none;
	display: inline-block;
	font-size:13px;
	text-decoration:none;
}
ul.smap a:hover { text-decoration:underline; }
ul.smap li{
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
.slide_images{
	width: 600vw;
	transition: transform 0.5s;
}
.slides {
	width: 100vw;
	float: left;
}
.slides img{
	width: 100%;
}
.other {
	width: 1100px;
	height: 70px;
	background: url(http://localhost:9000/starbucks/images/green_bg.jpg);
	position: relative;
    left: 50%;
    margin-left: -550px;
    margin-top: 0;	
}
.other p {
	text-align: center;
    position: relative;
    left: 20px;
    line-height: 70px;
}
.other p a{
	font-size: 26px;
	color: #ffffff;
	cursor:pointer;
}
.other p a:hover { text-decoration:underline; }
.other_lo {
	width: 100%;
	height:70px;
    background: #7b7c7f;
    margin:0;
}
.other p a img{
	vertical-align: middle;
	-webkit-filter: opcity(.5) drop-shadow(0 0 0 white);
	filter: opcity(.5) drop-shadow(0 0 0 white);	
}
.down {
	width:100%;
	height:800px;
	background-color:white;
	position:relative;
	display:none;
	text-align:center;
}
.down div {
	height:500px;
	text-align:center;
}
.down div section {
	display:inline-block;	
	width:1000px;
	height:400px;
}
.down div section>p {
	text-align:left;
	font-weight:bold;
	margin:20px 0;
	font-size:18px;
}
.event_list {
	width: 100%;
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
	margin:10px;
	position: relative;
	width: 260px;
	height:320px;
	display: inline-block;
	border:1px solid lightgray;
}
.event__list > li {
	float:left;
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
	 -webkit-transform: scale(1.1);
	transition: all 1s ease-in-out;
}

div > button{
padding: 0;
border: none;
background: none;
}

.div_btn {
    height: 12px;
    text-align: center;
    width: 100%;
    display: inline-block;
}

	/***** 이벤트 ******/
	.event {
		text-align:center;
		width:100%; height:420px;
		background-image:url("http://localhost:9000/starbucks/images/promotion_bimg1.jpg");
		background-repeat: no-repeat;
		background-position:left;
		background-size: cover;
	}	
	.event div { display:inline-block; text-align:left; margin:100px 0 0 700px; }
	
	.event a { 
		color:white; text-decoration:none; border:2px solid white; border-radius:3px; padding:5px 20px 5px 20px;
		font-size:13px; display:inline-block; margin-top:20px;		
	}
	.event a:hover, .store_event a:hover {
		color:black;
		background-color:white;
		text-decoration:underline;
	}
	
	
	/***** 뉴스 ******/
	.news {
		text-align:center;
		width:100%; height:420px;
		background-image:url("http://localhost:9000/starbucks/images/promotion_bimg2.jpg");
		background-repeat: no-repeat;
		background-position:center;
		background-size: cover;
	}	
	.news div { 
		display:inline-block;
		text-align:left; margin:120px 570px 0 0;
	}
	.news img, .store_event img, .download  img { margin-bottom:20px; }
	.news a, .download  a { border:2px solid; padding:5px 20px 5px 20px; font-size:13px; border-radius:3px; }
	.news a:hover, .download a:hover {
		color:white;
		background-color:black;
		text-decoration:underline;
	}
	
	
	/***** 스토어이벤트 ******/
	.store_event {
		text-align:center;
		width:100%; height:420px;
		background-image:url("http://localhost:9000/starbucks/images/promotion_bimg3.jpg");
		background-repeat: no-repeat;
		background-position:left;
		background-size: cover;
	}		
	.store_event div { 
		display:inline-block;
		text-align:left; margin:120px 0 0 700px;
	 }
	.store_event a { 
	 	border:2px solid white; padding:5px 20px 5px 20px; font-size:13px; border-radius:3px; color:white;
	  }	
	
	
	/***** 웰페이퍼 ******/
	.download {
		text-align:center;
		width:100%; height:420px;
		background-image:url("http://localhost:9000/starbucks/images/promotion_bimg2.jpg");
		background-repeat: no-repeat;
		background-position:left;
		background-size: cover;
	}	
	.download  div { display:inline-block;  text-align:left; margin:120px 570px 0 0; }

</style>
<script src="http://localhost:9000/starbucks/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	$("#down_click").click(function() {
		var name = $("#down_img").attr("name");
		
		if ( name == "down" ) {
			$(".down").slideDown();
			$("#down_img").attr("src","http://localhost:9000/starbucks/images/useInfo_btn_up.png");
			$("#down_img").attr("name","up");			
		} else {
			$(".down").slideUp();
			$("#down_img").attr("src","http://localhost:9000/starbucks/images/useInfo_btn_down.png");
			$("#down_img").attr("name","down");			
		}
	});
	
	$(".btn_pv").click(function(){
		var id=$(this).attr("id");
		if(id=="up_btn"){
			$(".btn_pv img").attr("src","http://localhost:9000/starbucks/images/product_view_down.png");
			$(".btn_pv").attr("id","down_btn");
			$(".product_view").slideUp(500);
		}else{
			$(".btn_pv img").attr("src","http://localhost:9000/starbucks/images/product_view_up.png");
			$(".btn_pv").attr("id","up_btn");
			$(".product_view").slideDown(500);
		}
	});
});
		
</script>
<link rel="stylesheet" href="http://localhost:9000/starbucks/menu/menu_carousel.css">
</head>

<body>
<!--  Header  -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- Sub Title -->
 <div class= "sub_title"> 
	<div class= "sub_inner_title">
	<h1>What's new</h1>
	
	<ul class="smap">
	<li><a href="http://localhost:9000/starbucks/index.jsp"><img class="home_icon" src="http://localhost:9000/starbucks/images/icon_home.png"></a></li>
	<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
	<li><a class= "this" href="http://localhost:9000/starbucks/whatsnew.jsp" >WHAT'S NEW</a></li>
	</ul>
	</div>
 </div>	
<!-- 캐러셀 시작 -->
				<div id="demo" class="carousel slide" data-ride="carousel">
				
					<!-- Indicators -->
					<div class="indicators">
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
							<li data-target="#demo" data-slide-to="3"></li>
							<li data-target="#demo" data-slide-to="4"></li>
							<li data-target="#demo" data-slide-to="5"></li>
							<li data-target="#demo" data-slide-to="6"></li>
						</ul>
					</div>
					
					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="http://localhost:9000/starbucks/images/whatsnew1.jpg" width="2000" height="400">
						</div>
						<div class="carousel-item">
							<img src="http://localhost:9000/starbucks/images/whatsnew2.jpg" width="2000" height="400">
						</div>
						<div class="carousel-item">
							<img src="http://localhost:9000/starbucks/images/whatsnew3.jpg" width="2000" height="400">
						</div>
						<div class="carousel-item">
							<img src="http://localhost:9000/starbucks/images/whatsnew4.jpg" width="2000" height="400">
						</div>
						<div class="carousel-item">
							<img src="http://localhost:9000/starbucks/images/whatsnew5.jpg" width="2000" height="400">
						</div>
						<div class="carousel-item">
							<img src="http://localhost:9000/starbucks/images/whatsnew6.jpg" width="2000" height="400">
						</div>
					</div>
					
					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
					
				</div>
				<!-- 캐러셀 종료 -->

<!--  전체보기  -->
<div class="other_lo" >
	<div class="other">
		<p>
			<a id="down_click">전체 보기&nbsp;&nbsp;<img name="down" id="down_img" src="http://localhost:9000/starbucks/images/useInfo_btn_down.png" ></a>
		</p>
	</div>
</div>
<div class="down">
	<img src="http://localhost:9000/starbucks/images/green_edge.png" style="vertical-align:top;">
	<div>
		<section>
			<p>프로모션 & 이벤트
			<div class="event_list">
			<div class="event_list_inner">
				<ul class="event__list">
					<li><div><a href ="event_content.jsp?eid=E_2"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210517083147274.jpg"></div></div></a><h4>스타벅스 현대카드 5~6월 한정 혜택</h4><p>2021-05-01 ~ 2021-06-30</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_6"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210503091447483.jpg"></div></div></a><h4>2021 서머 e-프리퀀시</h4><p>2021-05-11 ~ 2021-07-19</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_7"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210429161452776.jpg"></div></div></a><h4>e-Gift item 보너스 스타 이벤트</h4><p>2021-01-01 ~ 2021-12-31</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_8"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_20210412153011014.jpg"></div></div></a><h4>서머1 프로모션</h4><p>2021-04-13 ~ 2021-06-07</p></div></li>
					<li><div><a href ="event_content.jsp?eid=E_9"><div class="box"><div class="image"><img src="http://localhost:9000/starbucks/images/WEB_THUM_FILE20210202095614358.jpg"></div></div></a><h4>만원당 별 적립 이벤트</h4><p>2021-01-01 ~ 2021-12-31</p></div></li>
				</ul>
			</div>
		</div>
		</section>
	</div>
</div>

	<div class="event">
		<div>
			<img src="http://localhost:9000/starbucks/images/promotion_btxt1_20210218.png"><br>
			<a href="#">자세히 보기</a>
		</div>
	</div>
	<div class="news">
		<div>
			<img src="http://localhost:9000/starbucks/images/promotion_btxt2_20210218.png"><br>
			<a href="#">자세히 보기</a>
		</div>
	</div>
	<div class="store_event">
		<div>
			<img src="http://localhost:9000/starbucks/images/promotion_btxt3.png"><br>
			<a href="#">자세히 보기</a>
		</div>
	</div>
	<div class="download">
		<div>
			<img src="http://localhost:9000/starbucks/images/promotion_btxt4.png"><br>
			<a href="#">자세히 보기</a>
		</div>
	</div>
<!-- Footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
function toggleImg() {	
    document.getElementById("img").src = "http://localhost:9000/starbucks/images/visual_on.png";
  }
</script>
</html>