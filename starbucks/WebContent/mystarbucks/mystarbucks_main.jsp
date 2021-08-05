<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
	
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/mycgv2/css/carousel.css">
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
      var imgs;
      var img_count;
      var img_position = 1;
      imgs = $(".bx-viewport ul");
      img_count = imgs.children().length;
      //버튼을 클릭했을 때 함수 실행
      $('#back').click(function () {
        back();
      });
      $('#next').click(function () {
        next();
      });
      function back() {
        if(1<img_position){
          imgs.animate({
            left:'+=155px'
          });
          img_position--;
        }
      }
      function next() {
        if(img_count>img_position){
          imgs.animate({
            left:'-=155px'
          });
          img_position++;
        }
      }
    });
    
    var gall  = setInterval(galleryFun, 2000);
    var inter = true;
    var idx = 2;
    
     function galleryFun(){
       
        $(".gallery ul").animate({
          "left":-300*idx+"px"
        },300);
       $(".g_item ul li").eq(idx-1).addClass("on").siblings().removeClass("on");
       idx++;
       if(idx> $(".gallery ul li").length-3){
         $(".gallery ul").animate({
           "left":0
         },0);
         idx=0;
         
       }
     }
     
     
     $(".gallery , .g_item").hover(function(){
       if(inter==true){
         clearInterval(gall);
         inter=false;
       }
     },function(){
       if(inter==false){
         gall  = setInterval(galleryFun, 2000);
         inter=true;
       }
       
     });
     
     
     
     $(".g_item ul li").on('click',function(){
       $(this).addClass("on").siblings().removeClass("on");
       idx = $(this).index()+1;
       $(".gallery ul").animate({
          "left":-300*idx+"px"
        },1000);
       
     });
     
  </script>
<style>
.sub_title {
	width: 100%;
	height: 178px;
	background:
		url(http://localhost:9000/starbucks/images/ms_sub_ttl_bg.jpg);
	font-size:13px;
}
.sub_inner_title {
	width: 1100px;
	height: 91px;
	margin: 0 auto;
	position: relative;
}
.smap a:link {
	text-decoration: none;
	color: #ffffff;
}
.smap a:visited {
	text-decoration: none;
	color: #ffffff;
}
ul.smap {
	position: absolute;
	right: 0;
	top: 116px;
	list-style: none;
	display: inline-block;
}
ul.smap li {
	display: inline-block;
	margin-right: 2px;
	color: #ffffff;
}
.sub_title h1 {
	font: bold 36px Avenir, Arial, georgia;
	color: #ffffff;
	padding-top: 30px;
	position: relative;
	top: 60px;
}
.center p {
	margin-top: 50px;
}

.font {
	color: #444;
	display: block;
	font-size: 12px;
	padding: 6px 0 6px 15px;
	width: 205px;
}
.center p span {
	color: #666;
	font-size: 14px;
}
.regular_info {
	height: 148px;
	width: 830px;
}
.ms_cont_wrap {
	width: 1100px;
	margin: 0 auto;
	margin-bottom:50px;
}
.center {
	width: auto;
	padding-left: 30px;
	box-sizing: border_box;
}
.center a {
	background: #fcfcfc;
	border: 1px solid #ccc;
	border-radius: 3px;
	color: #444;
	display: block;
	font-size: 12px;
	font-weight: bold;
	height: 26px;
	margin: 20px 10px 0 0;
	text-align: center;
	width: 84px;
	line-height: 26px;
	float: left;
}
.center a:hover { text-decoration:underline; }

.right {
	top: -63px;
	float: right;
	width: 235px;
	position: relative;
	height: 148px;
	background:
		url(http://localhost:9000/starbucks/images/ms_user_info_cbg.jpg)
}
.rt {
	border-bottom: 1px dotted #bbb;
	height: 74px;
	position: relative;
	width: 235px;
}
.rt a {
	display: block;
	height: 100%;
	width: 100%;
}
.rb {
	height: 74px;
	position: relative;
	width: 235px;
}
.rb a {
	display: block;
	height: 100%;
	width: 100%;
}
.icon_new_store {
	background:
		url(http://localhost:9000/starbucks/images/icon_new_store.png)
		no-repeat;
	background-size: 100% auto;
	height: 35px;
	left: 36px;
	position: absolute;
	top: 23px;
	width: 63px;
}
.icon_new_store2 {
	background: url(http://localhost:9000/starbucks/images/icon_evt_cup.png)
		no-repeat;
	background-size: 100% auto;
	height: 41px;
	left: 38px;
	position: absolute;
	top: 16px;
	width: 46px;
}
.icon_new_txt {
	color: #444;
	font-size: 14px;
	left: 105px;
	line-height: 18px;
	position: absolute;
	top: 20px;
}
.icon_new_txt2 {
	color: #444;
	font-size: 14px;
	left: 105px;
	line-height: 18px;
	position: absolute;
	top: 31px;
}
.icon_new_txt strong {
	color: #222;
	font-size: 15px;
}
.icon_new_txt2 strong {
	color: #222;
	font-size: 16px;
	line-height: 26px;
}
.next_arrow {
	background:
		url(http://localhost:9000/starbucks/images/regu_next_arrow.png);
	display: block;
	height: 12px;
	position: absolute;
	right: 30px;
	top: 32px;
	width: 7px;
}
.card_wrap {
	border: 1px solid #ddd;
	border-radius: 3px;
	height: 222px;
	margin-top: 30px;
	padding: 30px 28px 23px 28px;
	width: 772px;
}
.card_int {
	border-bottom: 1px solid #ddd;
	height: 107px;
	width: 772px;
}
.card_int_icon {
	float: left;
	height: 107px;
	position: relative;
	width: 135px;
}
.icon_1 {
	background:
		url(http://localhost:9000/starbucks/images/icon_adv_card.png);
	height: 55px;
	top: 5px;
	width: 86px;
}
.icon_2 {
	background: url(http://localhost:9000/starbucks/images/icon_adv_cup.png);
	height: 107px;
	width: 102px;
}
.txt_1 strong, .txt_2 strong {
	color: #222;
	font-size: 16px;
	line-height: 24px;
}
.txt_1 {
	color: #444;
	font-size: 13.2px;
	line-height: 18px;
}
.txt_2 {
	color: #444;
	font-size: 13.2px;
	line-height: 18px;
	top: 30px;
	position: absolute;
}
.card_btn1 {
	top: 0;
	height: 30px;
	position: absolute;
	right: 0;
	width: 185px;
}
.card_btn3 {
	top: 44px;
	height: 30px;
	position: absolute;
	right: 0;
	width: 185px;
}
.card_btn1 a, .card_btn3 a {
	background: #222;
	border: 1px solid #222;
	color: #fff;
	border-radius: 3px;
	font-size: 12px;
	font-weight: bold;
	display: block;
	height: 28px;
	line-height: 28px;
	text-align: center;
	width: 183px;
	text-decoration: none;
}
.card_int_cont {
	float: left;
	height: 107px;
	position: relative;
	width: 637px;
}
.card_btn2 {
	top: 40px;
	height: 30px;
	position: absolute;
	right: 0;
	width: 185px;
}
.card_btn2 a:link {
	text-decoration: none;
	color: #444;
}
.card_btn2 a:visited {
	text-decoration: none;
	color: #444;
}
.card_btn2 a {
	background: #e2c383;
	border: 1px solid #222;
	color: #222;
	border-radius: 3px;
	font-size: 12px;
	font-weight: bold;
	display: block;
	height: 28px;
	line-height: 28px;
	text-align: center;
	width: 183px;
}
.card_inb {
	margin-top: 7px;
	width: 772px;
	height: 107px;
}
.user_section {
	height: 360px;
	margin-top: 30px;
	width: 830px;
}
.left_store {
	background: #f4f4f2;
	border-radius: 3px;
	float: left;
	height: 300px;
	padding: 30px;
	width: 350px;
}
.left_store header {
	border-bottom: 1px solid #ddd;
	color: #444;
	font-size: 14px;
	height: 59px;
}
.left_store strong {
	color: #222;
	font-size: 16px;
	line-height: 30px;
}
.bx-wrapper {
	max-width: 286px;
	margin: 0 auto;
}
.bx-viewport {
	width: 100%;
	overflow: hidden;
	position: relative;
	height: 209px;
}
.store_wrap {
	width: 515%;
	position: relative;
	transition-duration: 0s;
	transform: translate3d(-612px, 0px, 0px);
	margin: 0 auto;
}
.slides {
	float: left;
	list-style: none;
	width: 133px;
	margin-right: 20px;
	margin-top: 27px;
}
.slides2 {
	float: right;
	list-style: none;
	position: relative;
	width: 133px;
	margin-right: 20px;
	margin-top: 27px;
}
.slides img {
	width: 133px;
	height: 133px;
}
.slides2 img {
	width: 133px;
	height: 133px;
}
.store_img {
	height: 133px;
	width: 133px;
}
.store_img img {
	width: 100%;
	height: 100%;
	display: block;
	max-width: 100%;
}
.store_txt {
	color: #666;
	font-size: 12px;
	line-height: 16px;
	margin-top: 17px;
	text-align: center;
	width: 133px;
}
.store_txt strong {
	margin-top: 0px;
	color: #006633;
	font-size: 16px;
}
.date {
	display: block;
	margin-top: 1px;
}
.bx-prev {
	background: url(http://localhost:9000/starbucks/images/msc_arrow_l.png) no-repeat;
	background-size: 100% auto;
	left: -31px;
}
.bx-next {
	background: url(http://localhost:9000/starbucks/images/msc_arrow_r.png) no-repeat;
	background-size: 100% auto;
	left: 535px;
}
.ms_store_img {
	height: 133px;
	width: 133px;
}
.ms_store_img img {
	width: 133px;
	height: 133px;
}
.sstore {
	border: 1px solid #ddd;
	border-radius: 3px;
	float: right;
	height: 318px;
	padding: 20px;
	width: 368px;
}
.regi_card {
	border-bottom: 1px solid #ddd;
	height: 98px;
	position: relative;
	width: 368px;
}
.regi_card2 {
	border-bottom: 1px solid #ddd;
	height: 119px;
	position: relative;
	width: 368px;
}
.icon_card {
	background:
		url(http://localhost:9000/starbucks/images/icon_ms_regi_card.png);
	top: 15px;
	height: 61px;
	position: absolute;
	width: 84px;
}
.icon_card2 {
	background:
		url(http://localhost:9000/starbucks/images/icon_ms_charge_card.png);
	top: 31px;
	height: 61px;
	position: absolute;
	width: 84px;
}
.mem_icon_wrap {
	background: url(http://localhost:9000/starbucks/images/icon_sep_bg.gif);
	height: 75px;
	margin-top: 24px;
	width: 368px;
}
.icon_mem1 {
	width: 114px;
}
.icon_mem2 {
	width: 114px;
	margin-left: 15px;
}
.icon_mem3 {
	width: 114px;
	margin-left: 10px;
}
.mem_icon_wrap a {
	display: block;
	float: left;
	height: 75px;
	position: relative;
	box-sizing: border-box;
}
.regu_icon {
	background:
		url(http://localhost:9000/starbucks/images/icon_receipt_2021.jpg);
	width: 66px;
	height: 48px;
	margin: 0 auto;
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center top;
	display: block;
	position: relative;
	color: #222;
}
.regu_icon2 {
	background:
		url(http://localhost:9000/starbucks/images/icon_calendar_2021.jpg);
	width: 66px;
	height: 48px;
	margin: 0 auto;
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center top;
	display: block;
	position: relative;
	color: #222;
}
.regu_icon3 {
	background:
		url(http://localhost:9000/starbucks/images/icon_coupon_2021.jpg);
	width: 66px;
	height: 48px;
	margin: 0 auto;
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center top;
	display: block;
	position: relative;
	color: #222;
}
.regu_txt {
	margin-top: 12px;
	display: block;
	position: relative;
	color: #222;
	font-size: 12px;
	font-weight: bold;
	text-align: center;
}
nav ul, li {
	list-style: none;
}
.hide {
	display: none;
	position:relative;
}
.hide li { height:20px; margin-top:-5px; }
.hide li:last-child { margin-bottom:15px;  }
.hide li:hover { text-decoration:underline; color:green; }
.ms_nav>ul {
	border-top: 2px solid #222;
}
.ms_nav {
	float: right;
	font-weight: bold;
	width: 220px;
	margin-bottom: 90px;
}
.ms_nav>ul>li {
	border-bottom: 1px solid #ddd;	
	width: 220px;
}
.ms_nav>ul>li>a {
	color: #444;
	display: block;
	font-size: 14px;
	padding: 10px 30px 10px 15px;
	position: relative;
	width: 175px;
}
.ms_nav>ul>li>a:hover { text-decoration:underline; color:green; }
.ms_nav a:link {
	text-decoration: none;
	color: #444;
}
.ms_nav img { margin-top:3px; }
.ms_nav a:visited {
	text-decoration: none;
	color: #444;
}
.sbox_arrow_down {
	height: 7px;
	position: absolute;
	right: 15px;	
	width: 12px;
}
.ms_nav>ul>lu>ul>li {
	width: 220px;
}
.ms_nav a {
	cursor: pointer;
}
.store_slider {
	height: 210px;
	margin-top: 30px;
	width: 350px;
}
.bx-viewport ul li a div.ms_sstore_slider_img {
	height: 133px;
	width: 133px;
}
.bx-viewport ul li a div.ms_sstore_slider_img img {
	width: 100%;
	height: 100%;
}
.bx-viewport img {
	max-width: 100%;
	display: block;
}
.bx-viewport ul li a div.ms_sstore_slider_txt {
	color: #666;
	font-size: 12px;
	line-height: 16px;
	margin-top: 17px;
	text-align: center;
	width: 133px;
}
.bx-wrapper .bx-controls-direction a.bx-prev {
    background: url(../images/msc_arrow_l.png) no-repeat;
    background-size: 100% auto;
    left: 191px;
}
.bx-wrapper .bx-controls-direction a {
    background-size: 100% auto;
    display: block;
    height: 20px;
    overflow: hidden;
    text-indent: -20000px;
    top: 1012px;
    width: 12px;
    position: absolute;
    margin-left:40px;
}
a {
    margin: 0;
    padding: 0;
    font-size: 100%;
    text-decoration: none;
    vertical-align: baseline;
    color: #666;
    background: transparent;
    cursor: pointer;
}
.yes_store_wrap{
	width: 3000px;
	position: absolute;
}
</style>
<script src="../js/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		$(".user_if>a").click(function() {
			/* $(this).next("ul").toggleClass("hide"); */
			
			if ($(this).attr("id") == "down") {
				$(".hide").slideDown();
				$(".sbox_arrow_down").attr("src","http://localhost:9000/starbucks/images/sbox_arrow_up.png")
				$(this).attr("id","up");				
			} else {
				$(".hide").slideUp();
				$(".sbox_arrow_down").attr("src","http://localhost:9000/starbucks/images/sbox_arrow_down.png")
				$(this).attr("id","down");
				
			}

		});
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="sub_title">
		<div class="sub_inner_title">
			<h1>My StarBucks</h1>

			<ul class="smap">
				<li><a href="http://localhost:9000/starbucks/index.jsp"><img
						class="home_icon"
						src="http://localhost:9000/starbucks/images/icon_home_white.png"></a></li>
				<li><img class=arrow_icon
					src="http://localhost:9000/starbucks/images/icon_arrow_w.png"></li>
				<li><a class="this"
					href="http://localhost:9000/starbucks/mystarbucks/mystarbucks.jsp"
					style="text-decoration-line: none;">My StarBucks</a></li>
			</ul>
		</div>
	</div>

	<div class="ms_cont_wrap">
		<nav class="ms_nav">
			<ul>
				<li><a href="mystarbucks_sound.jsp">My 고객의 소리</a></li>
				<li class="user_if"><a>개인정보관리<img id="down" class="sbox_arrow_down" src="http://localhost:9000/starbucks/images/sbox_arrow_down.png"></a>
					<ul class="hide">
						<li><a class="font" href="mystarbucks_out.jsp">. 개인정보확인 및
								수정</a></li>
						<li><a class="font" href="myinfo_out.jsp">. 회원 탈퇴</a></li>
						<li><a class="font"
							href="http://localhost:9000/starbucks/mystarbucks/mystarbucks_pass.jsp">.
								비밀번호 변경</a></li>
					</ul></li>
			</ul>
		</nav>
		<div class="ms_cont">
			<div class="regular_user_index">

				<section class="regular_info">
					<article class="center">
						<p>
							<strong class="user_name"><%=session.getAttribute("signedUser")%>님
								안녕하세요.</strong><br> <span>(지금 스타벅스 카드를 등록하시면 StarBucks
								Rewards 혜택을 받으실 수 있습니다.)</span>
						</p>
						<a href="mystarbucks_out.jsp">개인정보 수정</a> <a
							href="mystarbucks_pass.jsp">비밀번호 변경</a>
					</article>


					<article class="right">
						<div class="rt">
							<a href="">
								<p class="icon_new_store"></p>
								<p class="icon_new_txt">
									신규 매장<br> <strong>오픈 이벤트</strong>
								</p> <span class="next_arrow"></span>
							</a>
						</div>
						<div class="rb">
							<a href="">
								<p class="icon_new_store2"></p>
								<p class="icon_new_txt">
									스타벅스<br> <strong>전체 이벤트</strong>
								</p> <span class="next_arrow"></span>
							</a>
						</div>
					</article>
				</section>

				<section class="card_wrap">
					<div class="card_int">
						<div class="card_int_icon">
							<figure class="icon_1"></figure>
						</div>
						<div class="card_int_cont">
							<div class="txt_1">
								<strong>아직 등록된 스타벅스 카드가 없으신가요?</strong><br> 스타벅스 카드를 등록하시고
								생일 무료음료 쿠폰과 다양한 스타벅스의<br> 리워드를 경험하세요. 스타벅스만의 특별한 혜택을 경험하실 수
								있습니다.
							</div>
							<p class="card_btn1">
								<a href="">스타벅스 카드 보기</a>
							</p>
							<p class="card_btn2">
								<a href="">스타벅스 e-Gift Card 구매</a>
							</p>
						</div>
					</div>



					<div class="card_inb">
						<div class="card_int_icon">
							<figure class="icon_2"></figure>
						</div>
						<div class="card_int_cont">
							<div class="txt_2">
								<strong>스타벅스만의 특별한 혜택이 궁금하신가요?</strong><br> 혜택에 편리함까지 더한
								스타벅스 리워드로<br> 한층 더 스타벅스를 특별하게 즐기세요.
							</div>
							<p class="card_btn3">
								<a href="">스타벅스 혜택보기</a>
							</p>

						</div>
					</div>
			</div>
			</section>
			<section class="user_section">


				<article class="left_store">
					<header>
						<strong>새로운 스타벅스 매장을 소개합니다.</strong><br> 전국의 새로운 스타벅스의 얼굴들을
						만나보세요~!
					</header>
					<div class="store_slider">
						<div class="bx-wrapper">
							<div class="bx-viewport"style="width: 100%; overflow: hidden; position: relative; height: 209px;">
							
							
								<ul class="yes_store_wrap"
									style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(-306px, 0px, 0px);">
									<li
										style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;"
										class="bx-clone"><a href="">
											<div class="ms_sstore_slider_img">
												<img alt=""
													src="http://localhost:9000/starbucks/images/20210608100757_izwnd.jpg">
											</div>
											<div class="ms_sstore_slider_txt">
												<strong>도산사거리</strong><br> 서울 강남구<br> <span
													class="date">2021-06-10</span>
											</div>
									</a></li>
									<li
										style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;"
										class="bx-clone"><a href="">
											<div class="ms_sstore_slider_img">
												<img alt=""
													src="http://localhost:9000/starbucks/images/20210608072858_t0kmq.jpg">
											</div>
											<div class="ms_sstore_slider_txt">
												<strong>세종충남대학교병원</strong><br> 세종 <br> <span
													class="date">2021-06-09</span>
											</div>
									</a></li>
									<li
										style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;">
										<a href="">
											<div class="ms_sstore_slider_img">
												<img alt=""
													src="http://localhost:9000/starbucks/images/20210612102608_qymcr.jpg">
											</div>
											<div class="ms_sstore_slider_txt">
												<strong>간석중앙공원DT</strong><br> 인천 남동구<br> <span
													class="date">2021-06-16</span>
											</div>
									</a>
									</li>
									<li
										style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;">
										<a href="">
											<div class="ms_sstore_slider_img">
												<img alt=""
													src="http://localhost:9000/starbucks/images/20210608100757_izwnd.jpg">
											</div>
											<div class="ms_sstore_slider_txt">
												<strong>도산사거리</strong><br> 서울 강남구<br> <span
													class="date">2021-06-10</span>
											</div>
									</a>
									</li>
									<li
										style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;">
										<a href="">
											<div class="ms_sstore_slider_img">
												<img alt=""
													src="http://localhost:9000/starbucks/images/20210608072858_t0kmq.jpg">
											</div>
											<div class="ms_sstore_slider_txt">
												<strong>세종충남대학교병원</strong><br> 세종 <br> <span
													class="date">2021-06-09</span>
											</div>
									</a>
									</li>
									<li
										style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;"
										class="bx-clone"><a href="">
											<div class="ms_sstore_slider_img">
												<img alt=""
													src="http://localhost:9000/starbucks/images/20210612102608_qymcr.jpg">
											</div>
											<div class="ms_sstore_slider_txt">
												<strong>간석중앙공원DT</strong><br> 인천 남동구<br> <span
													class="date">2021-06-16</span>
											</div>
									</a></li>
									<li
										style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;"
										class="bx-clone"><a
										href="/store/store_map.do?in_biz_cd=4032">
											<div class="ms_sstore_slider_img">
												<img alt=""
													src="http://localhost:9000/starbucks/images/20210608100757_izwnd.jpg">
											</div>
											<div class="ms_sstore_slider_txt">
												<strong>도산사거리</strong><br> 서울 강남구<br> <span
													class="date">2021-06-10</span>
											</div>
									</a></li>
								</ul>
							</div>
							<div class="g_item">
							<ul>
								<li class= "on"></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
							</div>

							<div class="bx-controls bx-has-controls-direction">
								<div class="bx-controls-direction">
									<a id="back" class="bx-prev" >Prev</a><a id="next" class="bx-next" >Next</a>
								</div>
							</div>
						</div>
					</div>
				</article>


				<article class="sstore">
					<div class="regi_card">
						<a href="">
							<p class="icon_card"></p>
							<p class="icon_new_txt">
								<strong>카드 등록</strong><br>카드를 등록하시고 다양한 리워드를 만나보세요.
							</p>
						</a>
					</div>
					<div class="regi_card2">
						<a href="">
							<p class="icon_card2"></p>
							<p class="icon_new_txt2">
								<strong>카드 충전</strong><br>매장과 온라인에서 간편하게 충전하세요.
							</p>
						</a>
					</div>


					<div class="mem_icon_wrap">
						<a class="icon_mem1" href=""> <span class="regu_icon"></span>
							<span class="regu_txt">전자영수증</span>
						</a> <a class="icon_mem2" href=""> <span class="regu_icon2"></span>
							<span class="regu_txt">캘린더</span>
						</a> <a class="icon_mem3" href=""> <span class="regu_icon3"></span>
							<span class="regu_txt">e-쿠폰</span>
						</a>
					</div>
				</article>
			</section>

		</div>







	</div>
						<script id="storeList" type="text/x-jquery-tmpl">
                                        	<li>
                                                <a href="/store/store_map.do?in_biz_cd=${s_biz_code}">
                                                    <div class="ms_sstore_slider_img">
                                                        <img alt="" src="${defaultimage}" onerror="this.src='/common/img/util/edwDefault.png'">
                                                    </div>
                                                    <div class="ms_sstore_slider_txt">
                                                        <strong>${s_name}</strong><br>
                                                        ${sido_name} ${gugun_name}<br>
                                                        <span class="date">${open_dt.substr(0, 4)}-${open_dt.substr(4, 2)}-${open_dt.substr(6, 2)}</span>
                                                    </div>
                                                </a>
                                            </li>
                                    	</script>






	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>