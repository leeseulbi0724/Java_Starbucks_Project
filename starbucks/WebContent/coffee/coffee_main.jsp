<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>COFFEE | Starbucks Coffee Korea</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://localhost:9000/starbucks/menu/menu_carousel.css">
 
  <style>
 /**************************** Carousel ***************************/
 body { overflow-x:hidden; overflow-y:auto; }

	div.menu_carousel h2{
		text-align: left;
		padding-top:40px;
	}
	ul.route {
		list-style-type: none;
		text-align: right;
	}
	ul.route li{
		display: inline-block;
		vertical-align: middle;
	}
	ul.route li>a{
		vertical-align: middle;
		text-decoration: none;
		color: black;
		font-size: 12px;
	}
	ul.route li>a:hover{
		text-decoration: underline;
	}
	div.div_route{
		width: 1100px;
		height: 115px;
		margin: 0 auto;
	}
/*************************** 서브 타이틀 **********************************/

.coffee_txt{
	padding-top: 30px;
	position: relative;
}
.sub_title{
	width: 100%;
	height: 98px;
	background: #ffffff;
	font-size:12px;
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
}
ul.smap li{
	display: inline-block;
	margin-right:2px;
	color: #ffffff;
}
.sub_title h1{
	font: bold 36px Avenir, Arial, georgia;
	color: #222222;
	padding-top: 30px;
	position: relative;
}


/************* 메인 이미지 ***************/

	section.coffee_choice_wrap, section.coffee_reserve_wrap, section.coffee_espresso_wrap, section.coffee_best_wrap , section.coffee_hs_wrap {
		width: 100%;
		height:430px;
		background-size:cover;
		background-position:left;
		background-repeat:no-repeat;
		padding :0;
		margin:0;
		
		
	}	
	section.coffee_choice_wrap{
		background-image:url("http://localhost:9000/starbucks/images/coffee_choice_wrap_bg.jpg");
	}
	section.coffee_reserve_wrap {
		background-image:url("http://localhost:9000/starbucks/images/coffee_reserve_wrap_bg.jpg");
	}
	section.coffee_espresso_wrap {
		background-image:url("http://localhost:9000/starbucks/images/coffee_espresso_wrap_bg.jpg");
	}
	section.coffee_best_wrap {
		background-image:url("http://localhost:9000/starbucks/images/coffee_best_wrap_bg.jpg");
	} 
	section.coffee_hs_wrap {
		background-image:url("http://localhost:9000/starbucks/images/coffee_hs_wrap_bg.jpg");
	}
	div.coffee_wrap_inner_r {
		display : inline-block;
		margin-top:120px;
		margin-left:55%;
	}
	div.coffee_wrap_inner_r div {
		display : inline-block;
		border:2px solid white;
		border-radius:3px;
		padding: 7px 20px;
		bottom: 120px;
		right: 840px;
	}
	div.coffee_wrap_inner_r div>a {
		text-decoration: none;
		color:white;
	}
	div.coffee_wrap_inner_r div>a:hover{
		text-decoration: underline;
	}
	
	div.coffee_wrap_inner_l {
		display : inline-block;
		margin-top:120px;
		margin-left:30%;
	}
	div.coffee_wrap_inner_l div {
		display : inline-block;
		border:2px solid black;
		border-radius:3px;
		padding: 7px 20px;
		bottom: 120px;
		right: 840px;
	}
	div.coffee_wrap_inner_l div>a {
		text-decoration: none;
		color:black;
	}
	div.coffee_wrap_inner_l div>a:hover{
		text-decoration: underline;
	}
	.coffee_choice_btn:hover, .coffee_espresso_btn:hover, .coffee_hs_btn:hover { background-color:white; }
	.coffee_choice_btn:hover a, .coffee_espresso_btn:hover a, .coffee_hs_btn:hover a { color:black;  }	
	
	.coffee_reserve_btn:hover, .coffee_best_btn:hover { background-color:black; }
	.coffee_reserve_btn:hover a, .coffee_best_btn:hover a { color:white; }
	
	.coffee_choice_btn, .coffee_espresso_btn, .coffee_hs_btn,
	.coffee_reserve_btn, .coffee_best_btn { margin-top:10px; }
    
</style>
</head>
<body>
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	
	<!--  content -->
<div class="menu_carousel">
		<section>
			<article>
				<div class="div_route">
					<h2>
						<img src="http://localhost:9000/starbucks/images/coffee_tit.jpg">
					</h2>
					<ul class="route">
						<li>
							<a href="/">
								<img src="http://localhost:9000/starbucks/images/icon_home.png">
							</a>
						</li>
						<li>
							<img class="arrow" src="http://localhost:9000/starbucks/images/icon_arrow.png">
						</li>
						<li>
							<a href="coffee_main.jsp">COFFEE</a>
						</li>
					</ul>
				</div>
				 <!-- 캐러셀 시작 -->
				<div id="demo" class="carousel slide" data-ride="carousel">
				
					<!-- Indicators -->
					<div class="indicators">
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
						</ul>
					</div>
					
					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="http://localhost:9000/starbucks/images/20210412163132808.jpg" width="2000" height="400">
						</div>
						<div class="carousel-item">
							<img src="http://localhost:9000/starbucks/images/20210405101646743.jpg" width="2000" height="400">
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
				
			</article>
		</section>
	</div>
		

				<!-- 나와 어울리는 커피 찾기 -->
				<section class="coffee_choice_wrap">
					<div class="coffee_wrap_inner_r" >
						<p class="coffee_choice_txt"><img class="w_pic" src="http://localhost:9000/starbucks/images/coffee_choice_txt.png"></p>
						<div class="coffee_choice_btn"><a href="#">자세히 보기</a></div>
					</div>
				</section>
				<!-- 나와 어울리는 커피 찾기 end -->

				<!-- 스타벅스 리저브 -->
				<section class="coffee_reserve_wrap">
					<div class="coffee_wrap_inner_l">
						<p class="coffee_reserve_txt"><img class="w_pic" src="http://localhost:9000/starbucks/images/coffee_reserve_txt.png"></p>
						<div class="coffee_reserve_btn"><a href="#">자세히 보기</a></div>
					</div>
				</section>
				<!-- 스타벅스 리저브 end -->

				<!-- 에스프레소 음료 -->
				<section class="coffee_espresso_wrap">
					<div class="coffee_wrap_inner_r">
						<p class="coffee_espresso_txt"><img class="w_pic" src="http://localhost:9000/starbucks/images/coffee_espresso_txt.png"></p>
						<div class="coffee_espresso_btn"><a href="http://localhost:9000/starbucks/coffee/espresso_main.jsp">자세히 보기</a></div>
					</div>
				</section>
				<!-- 에스프레소 음료 end -->

				<!-- 최상의 커피를 즐기는 법 -->
				<section class="coffee_best_wrap">
					<div class="coffee_wrap_inner_l">
						<p class="coffee_best_txt"><img class="w_pic" src="http://localhost:9000/starbucks/images/coffee_best_txt.png"></p>
						<div class="coffee_best_btn"><a href="#">자세히 보기</a></div>
					</div>
				</section>
				<!-- 최상의 커피를 즐기는 법 end -->
				
				<!-- 커피 이야기 -->
				<section class="coffee_hs_wrap">
					<div class="coffee_wrap_inner_r">
						<p class="coffee_hs_txt"><img class="w_pic" src="http://localhost:9000/starbucks/images/coffee_hs_txt.png"></p>
						<div class="coffee_hs_btn"><a href="#">자세히 보기</a></div>
					</div>
				</section>
				<!-- 커피 이야기  end -->
	
	
	<!--  footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>