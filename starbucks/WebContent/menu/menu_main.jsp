<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.vo.*, com.starbucks.dao.*, java.util.*" %>
<%
	menuDAO dao = new menuDAO();
	ArrayList<menuVO> list = dao.getNewList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>MENU | Starbucks Coffee Korea</title>
<style>
	/* 메뉴 & 경로 */
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
	
	/* 이벤트 제품 사진 */
	div.btn_pv {
		position: relative;
		bottom: 52px;
		left: 445px;
		z-index: 5;
		display: inline-block;
	}
	div.btn_pv:hover{
		cursor: pointer;
	}
	
	/* 메뉴 이미지 리스트 */
	.product_view{
		width: 100%;
		background-color: #fffaf4;
		margin: 0 auto;
		text-align: center;
		position: relative;
		border-bottom: 2px solid #0d6035;
	    padding: 28px 0 80px 0;
	    display: none;
	}
	.product_view>div{
		width: 1100px;
		margin: 0 auto;
		display: block;
	}
	.product_view>div ul{
		list-style-type: none;
		text-align: left;
		margin:0; padding:0;
	}
	.product_view>div>ul{
		width: 1140px;
		position: relative;
		left: -20px;
	}
	.product_view>div>ul>li{
		display: inline-block;
		vertical-align: middle;
		margin:20px 0 20px 20px; 
		padding:0;
		font-size: 13px;
		position: relative;
	}
	.product_view>div>ul>li>ul>li>a>img{
		width: 260px;
		height: 245px;
		overflow:hidden;
		object-fit: cover;
		object-position: center top;
		transform: scale(1.0, 1.0);
		transition: all 1s ease-in-out;
	}
	.product_view>div>ul>li>ul>li{
		width: 260px;
		max-height: 245px;
		overflow:hidden;
	}
	.product_view>div>ul>li>ul>li>a>img:hover{
	transform: scale(1.1, 1.1);
	transition: all 1s ease-in-out;
	}
	.product_view>div>ul>li>ul>li>label{
		display:block;
		margin-top:10px;
		text-align: center;
		font-size: 14px;
	}
	
	article.drink div.img{
		width: 100%;
		height:430px;
		background-size:cover;
		background-image:url("http://localhost:9000/starbucks/images/menu_bimg1.jpg");
		background-position:left;
		background-repeat:no-repeat;
		text-align: center;
	}
	article.drink div.txt{
		display: inline-block;
		text-align: left;
		margin: 120px 0 0 970px;
	}
	article.drink a{
		text-decoration: none;
		color:white;
		border:2px solid white;
		border-radius:3px;
		padding: 7px 20px;
		position: relative;
		top: 50px;
		right: 285px;
	}
	article.drink a:hover{
		background-color: white;
		text-decoration: underline;
		color:black;
	}
	article.food div.img{
		width: 100%;
		height:430px;
		background-size:cover;
		background-image:url("http://localhost:9000/starbucks/images/menu_bimg2.jpg");
		background-position: left;
		background-repeat:no-repeat;
		text-align: center;
	}article.food div.txt{
		display: inline-block;
		text-align: left;
		margin: 120px 520px 0 0;
	}
	article.food a{
		text-decoration: none;
		color:black;
		border:2px solid black;
		border-radius:3px;
		padding: 7px 20px;
		position: relative;
		top: 50px;
		right: 940px;
	}
	article.food a:hover{
		text-decoration: underline;
		color:white;
		background-color: black;
	}
	article.product div.img{
		width: 100%;
		height:430px;
		background-size:cover;
		background-image:url("http://localhost:9000/starbucks/images/menu_bimg3.jpg");
		background-position:left;
		background-repeat:no-repeat;
		text-align: center;
	}
	article.product div.txt{
		display: inline-block;
		text-align: left;
		margin: 120px 0 0 1020px;
	}
	article.product a{
		text-decoration: none;
		color:white;
		border:2px solid white;
		border-radius:3px;
		padding: 7px 20px;
		position: relative;
		top: 50px;
		right: 343px;
	}
	article.product a:hover{
		background-color: white;
		text-decoration: underline;
		color:black;
	}
</style>
<link rel="stylesheet" href="http://localhost:9000/starbucks/menu/menu_carousel.css">
<script src="http://localhost:9000/mycgv/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
/* 관련 제품 보기 */
$( document ).ready(function() {
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
</head>
<body>
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	
	<div class="menu_carousel">
		<section>
			<article>
				<div class="div_route">
					<h2>
						<img src="http://localhost:9000/starbucks/images/menu_tit.jpg">
					</h2>
					<ul class="route">
						<li>
							<a href="http://localhost:9000/starbucks/index.jsp">
								<img src="http://localhost:9000/starbucks/images/icon_home.png">
							</a>
						</li>
						<li>
							<img class="arrow" src="http://localhost:9000/starbucks/images/icon_arrow.png">
						</li>
						<li>
							<a href="http://localhost:9000/starbucks/menu/menu_main.jsp">MENU</a>
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
							<img src="http://localhost:9000/starbucks/images/menu_carousel2.jpg" width="2000" height="400">
						</div>
						<div class="carousel-item">
							<img src="http://localhost:9000/starbucks/images/menu_carousel.jpg" width="2000" height="400">
						</div>
					</div>
					
					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
					<div class="btn_pv" id="down_btn"><img src="http://localhost:9000/starbucks/images/product_view_down.png"></div>
				</div>
				<!-- 캐러셀 종료 -->
				
			</article>
		</section>
	</div>
	<div class="product_view">
		<div>
			<ul>
				<% for(menuVO vo : list){ %>
				<li>
					<ul>
						<li><a href="menu_detail.jsp?mid=<%=vo.getMid()%>"><img src="http://localhost:9000/starbucks/images/<%= vo.getImg() %>.jpg"></a></li>
						<li><label><%=vo.getK_name() %></label></li>
					</ul>
				</li>
				<% } %>
			</ul>
		</div>
	</div>
	<div class="menu_img">
		<article class="drink">
			<div class="img">
				<div class="txt"><img src="http://localhost:9000/starbucks/images/menu_btxt1.png"></div>
				<a href="http://localhost:9000/starbucks/menu/menu_drink.jsp" class="btn_detail">자세히 보기</a>
			</div>
		</article>	
		<article class="food">
			<div class="img">
				<div class="txt"><img src="http://localhost:9000/starbucks/images/menu_btxt2.png"></div>
				<a href="http://localhost:9000/starbucks/menu/menu_food.jsp" class="btn_detail">자세히 보기</a>
			</div>
		</article>	
		<article class="product">
			<div class="img">
				<div class="txt"><img src="http://localhost:9000/starbucks/images/menu_btxt3.png"></div>
				<a href="http://localhost:9000/starbucks/menu/menu_product.jsp" class="btn_detail">자세히 보기</a>
			</div>
		</article>	
	</div>
	<!--  footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>