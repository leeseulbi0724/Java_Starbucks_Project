<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.*, com.starbucks.vo.*, java.util.*"
%>
<%
	noticeDAO dao = new noticeDAO();
	ArrayList<noticeVO> list = dao.getSelectResult();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>Starbucks Coffee Korea</title>
<link rel="stylesheet"  href="http://localhost:9000/starbucks/css/carousel.css">
<style>
body { overflow-x:hidden; overflow-y:auto; }
 div.reward{ 
	width:1000px; margin:auto;
}
div.carousel { 
	text-align:center;
	width:100%; height:585px;
	background-image:url("http://localhost:9000/starbucks/images/2021_summer1_bg.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
/***************************** caraousel **********************************/
div.carousel article div {  	display:inline-block;  }
div.carousel article div:first-child>img { margin-bottom:200px; margin-left:80px;  }
div.carousel article div:first-child>a { 
	position:relative; right:200px; bottom:150px;  
	text-decoration:none; 
	border:2px solid #333;
	border-radius:4px;
	padding:5px 15px 5px 15px;
	font-size:13px;
	color:black;
}
div.carousel article div:first-child>a:hover { text-decoration:underline; background-color:white; }

div.carousel article div:nth-child(2)  { text-align:center;}
div.carousel article div:nth-child(2)>img  { margin:10px 0 50px 20px; }
div.carousel article div:nth-child(2)>p:first-child { 
	margin:100px 30px 0 0;
	font-weight:bold;
	font-size:22px;
	color:rgb(89,88,87);
 }
div.carousel article div:nth-child(2)>p{
	margin:0 30px 0 0;
	font-size:15px;
	font-weight:bold;
	color:rgb(89,88,87);
}
div.carousel article div:nth-child(2) div { display:inline-block;  width:70%; border-bottom: 1px solid rgb(136,135,137); margin:0 30px 5px 0;}
div.carousel article div:nth-child(3)>p:nth-child(2) {
	margin:0 20px 0 20px;
	font-weight:bold;
	font-size:22px;
	color:rgb(89,88,87);
}
div.carousel article div:nth-child(3) div { display:inline-block;  width:90%; border-bottom: 1px solid rgb(136,135,137); margin:0 0 5px 0;}
div.carousel article div:nth-child(3)>p:last-child {
	font-size:15px;
	font-weight:bold;
	color:rgb(89,88,87);
	margin-top:0;
}
div.carousel article div:nth-child(3)>img { margin:20px 20px 0 34px; }
div.carousel article div:nth-child(4)>img { margin:0 0 50px 0; }
div.carousel article div:nth-child(4)>p:first-child { 
	margin:100px 140px 0 0;
	font-weight:bold;
	font-size:22px;
	color:rgb(89,88,87);
 }
div.carousel article div:nth-child(4) div { display:inline-block;  width:50%; border-bottom: 1px solid rgb(136,135,137); margin:0 140px 5px 0;}
div.carousel article div:nth-child(4)>p {
	font-size:15px;
	font-weight:bold;
	color:rgb(89,88,87);
	margin-top:0; margin-right:140px;
}

/******************************************************************************/
div.notice {
	background-color:black;
	display:inline-block;
	color:white;
	width:50%; height:70px;
	text-align:center;
	font-size:15px;
	margin:0; padding:0;
}
div.promotion {
	background-color:rgb(246,245,239);
	width:50%; height:70px;
	float:right;
	text-align:center;
	font-size:15px;
	cursor:pointer;
	margin:0; padding:0;
}
div.notice label, div.promotion label { font-size:17px; font-weight:bold;  }
div.promotion label { position:relative; top:25px; }
div.notice label { position:relative; bottom:15px; }

#n_link { text-decoration:none; color:white; left:5px; right:100px; font-size:15px; }
div.notice ul { display:inline-block; }
div.notice li { list-style-type:none;  }
div.sub_notice { 
	display:inline-block; overflow:hidden; height:40px; display:inline-block; 
	margin-top:20px; text-align:left; margin-left:10px;
}
.rolling { position:relative; height:auto; width:100%; }
.rolling li { height:40px; width:100%; line-height:40px;}
.rolling li:hover { text-decoration:underline; }


div.promotion label { color:#333; }
div.notice img, div.promotion img { display:inline-block;  float:right; position:relative; top:5px; right:5px; }
div.promotion img { top:15px; right:100px; }
label.p_link { cursor:pointer; }

#down_content { display:none; width:100%; height:600px; background-color:rgb(246,246,238); float:left; text-align:center; }
#demo { 
margin-top:20px;
background-image:url("http://localhost:9000/starbucks/images/demo_bg.jpg");
background-color:rgb(246,246,238); 
}
.carousel-inner a { 
	position:absolute;
	bottom:50px;
	color:black;
}
.carousel-inner a:hover { text-decoration:underline; color:white; background-color:black; } 


/******************************************************************************/
div.reward { background-color:rgb(30,57,50); }
div.reward>div:first-child { text-align:center; display:inline-block; }
div.reward>div:first-child >img{ padding:10px;  }
div.reward>div:last-child { display:inline-block; text-align:left; margin:20px 5px 20px 0; }
div.reward>div:last-child>div{ display:inline-block;  width:140%; border-bottom: 1px solid rgb(75,97,91); margin:0 0 20px 0; }
div.reward p { color:white; padding:0; margin:0; }
div.reward>div:last-child>p:first-child { margin-top:0; font-size:23px; }
div.reward>div:last-child>p:nth-child(2) { margin-top:0; font-size:15px; }
div.reward>div:last-child>p:nth-child(7) { margin-top:0; font-size:14px; }
div.reward_bg { width:100%; background-color:rgb(30,57,50); }
div.reward>div:nth-child(2) a, div.reward a:nth-child(8) { 
	float:right; 
	color:white;	
	text-decoration:none;
	font-size:14px;
	border-radius:5px;
}
div.reward a:nth-child(5) { 
	margin:0  5px 0 10px; 
	border:3px solid white;
	padding:3px 15px 3px 15px;	
	background-color:rgb(30,57,50);
	position:relative; left:250px; bottom:30px;	
	
}
div.reward a:nth-child(4) {
	border:3px solid rgb(0,112,74);
	background-color:rgb(0,112,74);
	padding:3px 15px 3px 15px;
	margin:0 0 0 50px;
	position:relative; left:210px; bottom:30px;
}
div.reward a:nth-child(8) {
	margin:0  5px 0 10px; 
	border:3px solid white;
	padding:3px 20px 3px 20px;	
	background-color:rgb(30,57,50);
	position:relative; left:210px; bottom:30px;
}
div.reward>div:nth-child(2) a:hover, div.reward a:hover { text-decoration:underline; }

 div.login_div { display:inline-block; }
 div.login_div:first-child { position:relative; right:50px; }
 div.login_div:nth-child(2) { position:relative; bottom:50px; right:50px; }
 div.login_div:nth-child(3) { margin-left:150px; position:relative; bottom:25px; }
 div.login_div:last-child { position:relative; bottom:45px; left:20px; }


/******************************************************************************/
/** 이미지 공통 **/
div.img article.second>div, div.img article.third div, 
div.img article.four div, div.img article.five div { display:inline-block; }
a.btn { position:relative; text-decoration:none; border:2px solid #333; font-size:13px; border-radius:4px; padding:5px 15px 5px 15px;   }

/** 첫번째 이미지 **/
div.img article.first {
	text-align:center;
	width:100%; height:585px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-image:url("http://localhost:9000/starbucks/images/2021_summer1_bean_bg.jpg");
}
div.img article.first>div:first-child>img {	
	position:relative; 
	top:70px; right:200px;  
	opacity:0;
    margin-left:-900px;     
 }
div.img article.first>div:last-child>img {	
	position:relative; 
	left:200px; bottom:250px; 
	
}
div.img article.first a { 
	right:125px; bottom:200px; color:black; 
}
.first_02 {
	opacity:0;
    margin-right:-900px;     
}
div.img article.first a:hover {
	color:white;
	background-color:black;
	text-decoration:underline;
}

/** 두번째 이미지 **/
div.img article.second {
	text-align:center;
	 width:100%; height:385px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-image:url("http://localhost:9000/starbucks/images/reserve_sundried_brazil_bean4_1.png");
	background-color:rgb(234,201,166);
}
div.img article.second>div>img { margin-top:100px; padding-right:500px; }
div.img article.second a { 
	position:relative; border:2px solid rgb(129,89,50); color:rgb(129,89,50);
	right:730px; top:50px;
}
div.img article.second a:hover {
	color:white;
	background-color:rgb(129,89,50);
	text-decoration:underline;
}

/** 세번째 이미지 **/
div.img article.third {
	text-align:center;
	width:100%; height:700px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-attachment: fixed;
	background-image:url("http://localhost:9000/starbucks/images/fav_prod_bg_new.jpg");
}
div.img article.third div:first-child>div:first-child>img {  }
div.img article.third>div:first-child {
	display:inline-block;
	width:500px;
	text-align:right;
	margin-top:80px;
}
div.img article.third>div:first-child>div {
	margin:20px 0;
}
div.img article.third div:first-child { opacity:0;  margin-left:-900px;  }
div.img article.third div:last-child { margin:0 80px; margin-top:80px; opacity:0;  margin-right:-900px; }
div.img article.third div:first-child a { color:white; border:2px solid white; }
div.img article.third div:first-child a:hover { 
	color:black;
	background-color:white;
	text-decoration:underline;
}


/** 네번째 이미지 **/
div.img article.four { text-align:center; }
div.img article.four div:first-child { padding:35px; }
div.img article.four>div:nth-child(2) { display:inline-block; width:1px; height:350px; border-left:1px solid lightgray; }
div.img article.four>div:nth-child(3)>div:nth-child(2) { 
	display:inline-block; 
	width:100%; height:1px; 
	border-bottom:1px solid lightgray; 
	text-align:center;
	position:relative; bottom:90px;
}
div.img article.four>div:nth-child(3)>div:first-child { position:relative; bottom:80px;}
div.img article.four>div:nth-child(3) p { 
	position:relative; 
	bottom:80px; right:130px;  
 }
 div.img article.four>div:nth-child(3) a { text-decoration:none; color:black; padding:3px 7px 3px 7px; }
 div.img article.four>div:nth-child(3) a:hover { background-color:rgb(151, 109, 63); color:white; }
 

/** 다섯번째 이미지**/
div.img article.five {
	margin:0; padding:0; 
	text-align:center;
	width:100%; height:320px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-image:url("http://localhost:9000/starbucks/images/store_bg.jpg");
}
div.img article.five div:last-child { position:relative; bottom:-16px; left:50px; }
div.img article.five div:nth-child(2) { position:relative; bottom:100px; left:40px; }
div.img article.five div:nth-child(2)>img:first-child { position:relative; left:8px; }
div.img article.five a { position:relative; color:#333; bottom:50px; right:340px; }
div.img article.five a:hover { 
	color:#fff;
	background-color:black;	
	text-decoration: underline;
}



/******************************************************************************/
/** 이미지 효과 **/
.carousel_01, .carousel_02, .carousel_03, .carousel_04 {
	opacity: 0;
}
/* .first_01, .third_01, .third_02 {
  animation: 2s slide-right;
}
@keyframes slide-right {
  from {
    margin-left: -1500px;
  }
  to {
    margin-left: 0%;
  }
}
.first_02 {
 	animation: 2s slide-left;
}
@keyframes slide-left {
  from {
    margin-right: -1500px;
  }
  to {
    margin-right: 0%;
  } */
}

</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script>
      $( document ).ready( function() {
        var jbTime = 800;
        $( '.carousel_01' ).animate( {
          opacity: '1'
        }, jbTime, function() {
          $( '.carousel_02' ).animate( {
            opacity: '1'
          }, jbTime, function() {
            $( '.carousel_03' ).animate( {
              opacity: '1'
            }, jbTime, function() {
                $( '.carousel_04' ).animate( {
                    opacity: '1'
                  }, jbTime );
          } );
        } );
      } ); 
        
        $(".promotion").click(function() {
        	var name = $(".icon_name").attr("id");
        	
        	if ( name == "down") {
	        	$("#down_content").slideDown();
	        	$("#down").attr("src", "http://localhost:9000/starbucks/images/btn_prom_up.png").attr("id", "up");        		
        	} else {
        		$("#down_content").slideUp();
	        	$("#up").attr("src", "http://localhost:9000/starbucks/images/btn_prom_down.png").attr("id", "down");        	
        	}
        });
        $("#next").click(function() {
        	var name = $(".down_img").attr("id");
        	
        	if ( name == "down01") {
        		$(".down_img").attr("id", "down02");
        		$(".down_img").attr("src", "http://localhost:9000/starbucks/images/down_02.jpg")
        	} else if ( name == "down02") {
        		$(".down_img").attr("id", "down03");
        		$(".down_img").attr("src", "http://localhost:9000/starbucks/images/down_03.jpg")
        	} else {
        		$(".down_img").attr("id", "down01");
        		$(".down_img").attr("src", "http://localhost:9000/starbucks/images/down_04.jpg")
        	}
        });
        
        var height = $(".sub_notice").height();
        var num = <%= list.size() %>
        
        var max = height * num;
        var move = 0;
        
        function noticeRolling() {
        	move+=height;
        	
        	$(".rolling").animate({"top":-move}, 600, function() {
        		if (move >= max) {
        			$(this).css("top",0);
        			move = 0;
        		};
        	});
        };
        noticeRollingOff = setInterval(noticeRolling, 2000);
        
        $(".rolling").append($(".rolling li").first().clone());            

       
        $(window).scroll( function(){
            $('div.img article.first>div:first-child>img, div.img article.third div:first-child').each( function(i){                
                var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                var bottom_of_window = $(window).scrollTop() + $(window).height();
                
                if( bottom_of_window > bottom_of_element ){
                    $(this).animate({'opacity':'1','margin-left':'0px'},1000);
                }
                
            }); 
            
             $('div.first_02, div.img article.third div:last-child').each( function(i){
                var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                var bottom_of_window = $(window).scrollTop() + $(window).height();
                
                if( bottom_of_window > bottom_of_element ){
                    $(this).animate({'opacity':'1','margin-right':'0px'},1000);
                }
                
            }); 
        });
        
   } ); 
</script> 

</head>
<body>
	<!--  header -->
	<jsp:include page ="header.jsp"></jsp:include>
	
	<!--  content -->
		<div class="carousel">
		<section>
			<article>
				<div class="carousel_01"><img src="http://localhost:9000/starbucks/images/2021_summer1_slogan.png" width=200 height=255>
				<a href="#">자세히 보기</a></div>
				<div class ="carousel_02">
					<p>FOREST<br>COLD BREW</p>
					<div></div>
					<p>포레스트 콜드 브루</p>
					<img src="http://localhost:9000/starbucks/images/2021_m_summer1_coldbrew.png" width=180 height=263>
				</div>
				<div class="carousel_03">
					<img src="http://localhost:9000/starbucks/images/2021_summer1_blended.png" width=180 height=320>
					<p>BANANA CREAM<br>DARK CHOCO BLENDED</p>
					<div></div>
					<p>바나나 크림 다크 초코 블렌디드</p>
				</div>
				<div class ="carousel_04">
					<p>SHINING<br>MUSCAT ADE</p>
					<div></div>
					<p>샤이닝 머스캣 에이드</p>
					<img src="http://localhost:9000/starbucks/images/2021_summer1_ade.png" width=290 height=257>
				</div>
			</article>
		</section>
		</div>
		<div class="main">
			<div class="notice">			
				<label>공지사항</label>
				<div class="sub_notice">
					<ul class="rolling">
					<% for(noticeVO vo : list) { %>
					<li>
						<a href="http://localhost:9000/starbucks/whatsnew/notice_content.jsp?nid=<%=vo.getNid()%>&no=<%=vo.getNo() %>" id="n_link"><%= vo.getTitle() %></a>
					</li>
					<% } %>
					</ul>	
				</div>			
			<a href="http://localhost:9000/starbucks/whatsnew/notice.jsp"><img src="http://localhost:9000/starbucks/images/plus.PNG"  width=60 height=61 ></a>
			</div>
			<a  id="p_link"><div class="promotion">
				<label class="p_link">스타벅스 프로모션</label>
				<img src="http://localhost:9000/starbucks/images/btn_prom_down.png" width=40 height=40 id="down" class="icon_name"></div></a>
				<div id="down_content">
					<div id="demo" class="carousel slide" data-ride="carousel">
						<section>
						  <!-- Indicators -->
						  <ul class="carousel-indicators">
						    <li data-target="#demo" data-slide-to="0" class="active" ></li>
						    <li data-target="#demo" data-slide-to="1"></li>
						    <li data-target="#demo" data-slide-to="2"></li>
						  </ul>
					  
						  <!-- The slideshow -->
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="http://localhost:9000/starbucks/images/down_04.jpg"width="819" height="553"><br>
						      <a href="http://localhost:9000/starbucks/whatsnew/event_content.jsp?eid=E_8" class="btn">자세히 보기</a>
						    </div>
						    <div class="carousel-item">
						      <img src="http://localhost:9000/starbucks/images/down_02.jpg" width="819" height="553"><br>
						      <a href="#" class="btn">자세히 보기</a>
						    </div>
						    <div class="carousel-item">
						      <img src="http://localhost:9000/starbucks/images/down_03.jpg" width="819" height="553"><br>
						      <a href="http://localhost:9000/starbucks/whatsnew/event_content.jsp?eid=E_9" class="btn">자세히 보기</a>
						    </div>
						  </div>
						  
						  <!-- Left and right controls -->
						  <a class="carousel-control-prev" href="#demo" data-slide="prev" >
						    <img src="http://localhost:9000/starbucks/images/arrow_left_on.png">
						  </a>
						  <a class="carousel-control-next" href="#demo" data-slide="next">
						    <img src="http://localhost:9000/starbucks/images/arrow_right_on.png">
						  </a>
						  </section>
						</div>					
				</div>
		<% if(session.getAttribute("signedUser") == null) { %>
		<div class="reward_bg">
		<div class="reward">	
			<div><img src="http://localhost:9000/starbucks/images/rewards-logo.png" width=180px height=150px></div>
			<div>
					<p> 스타벅스만의 특별한 혜택, <strong>스타벅스 리워드</strong></p><br>
					<p><strong>스타벅스 회원이세요?</strong> 로그인을 통해 나만의 리워드를 확인해보세요.<br>
					<strong>스타벅스 회원이 아니세요?</strong> 가입을 통해 리워드 혜택을 즐기세요.</p>
					<a href="http://localhost:9000/starbucks/join/join.jsp">회원가입</a>
					<a href="http://localhost:9000/starbucks/login/login.jsp">로그인</a>
					<div></div>
					<p>회원 가입 후, 스타벅스 e-Gift Card를 <strong>"나에게 선물하기"로 구매하시고, 편리하게 등록하세요!</strong><br>
					카드를 등록하여 스타벅스 리워드 회원이 되신 후, 첫 구매를 하시면 무료 음료쿠폰을 드립니다!</p>
					<a href="#">e-Gift Card 선물하기</a>
			</div>
		</div>
		</div>
		<% } else { %>
		<div class="reward_bg" style="background-color:black">
		<div class="reward" style="background-color:black">
			<div class="login_div"><img src="http://localhost:9000/starbucks/images/icon_msr_cup.png"></div>
			<div class="login_div">
				<p style="font-size:20px"><strong><%= session.getAttribute("signedUser") %></strong>님, 안녕하세요!
				<p>혜택에 편리함까지 더한 스타벅스 리워드를 즐겨보세요.
			</div>
			<div class="login_div"><img src="http://localhost:9000/starbucks/images/icon_add_card.png"></div>
			<div class="login_div">
				<p style="font-size:15px"><strong>스타벅스 카드 등록</strong><br>
				등록된 카드가 없습니다.<br>
				새로운 카드를 등록하세요.</p>
			</div>
		</div>
		</div>
		<% } %>
		
		<div class="img">
			<article class="first">
				<div class="first_01"><img src="http://localhost:9000/starbucks/images/2021_summer1_bean.png" ></div>				
				<div class="first_02"><img src="http://localhost:9000/starbucks/images/2021_summer1_bean_txt.png" >
				<a href="#" class="btn">자세히 보기</a></div>
			</article>
			<article class="second">					
				<div><img src="http://localhost:9000/starbucks/images/reserve_sundried_brazil_title.png" width=400 height=116></div>
				<a href="#" class="btn">자세히 보기</a>
			</article>
			<article class="third">
				<div >
					<div><img src="http://localhost:9000/starbucks/images/fav_prod_txt01.png" ></div>
					<div><img src="http://localhost:9000/starbucks/images/fav_prod_txt02.png"></div>
					<p><a href="http://localhost:9000/starbucks/menu/menu_drink.jsp" class="btn">자세히 보기</a></p>
				</div>
				<div><img src="http://localhost:9000/starbucks/images/2021_summer1_fav.png"></div>
			</article>
			<article class="four">
				<div><img src="http://localhost:9000/starbucks/images/reserve_visual_pc.png" width=350 height=384></div>
				<div></div>
				<div>
					<div><img src="http://localhost:9000/starbucks/images/reserve_text_pc.png" width=500 height=73></div>
					<div class="aa"></div>
					<p class="bb"><a href="#">E X P L O R E　O U R　S T O R Y</a></p>
				</div>
			</article>
			<article class="five">
				<div><img src="http://localhost:9000/starbucks/images/bottom_image.PNG"></div>
				<div><img src="http://localhost:9000/starbucks/images/store_txt01.png">
				<p class="bb"><img src="http://localhost:9000/starbucks/images/store_txt02.png"></p></div>
				<a href="http://localhost:9000/starbucks/map/map.jsp" class="btn">매장 찾기</a>
				<div><img src="http://localhost:9000/starbucks/images/store_exp_img04.png" width=200 height=89></div>
			</article>
		</div>
		</div>
		
	<!--  footer -->
	<jsp:include page ="footer.jsp"></jsp:include>
</body>
</html>