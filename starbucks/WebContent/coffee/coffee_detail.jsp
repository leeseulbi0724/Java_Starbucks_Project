<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.dao.*, com.starbucks.vo.*, java.util.*"  %>
 <%
	String ctype = request.getParameter("ctype_id");	
	String cimg = request.getParameter("cimg_file");	

	coffeeDAO dao = new coffeeDAO();
	CoffeeVO vo = dao.getDetailImg(ctype, cimg);
	CoffeeVO vo2 = dao.getProductlImg(vo.getProduct_name()); 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE | Starbucks Coffee Korea</title>

<style>
/******************* 타이틀 ****************************/
.coffee_ttl{
	padding-top: 30px;
	position: relative;
}
.sub_title{
	width: 100%;
	height: 98px;
	background: #ffffff;
	font-size:13px;
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
	margin-right: 2px;
	color: #ffffff;
}

/************************* 원두 상세화면 -상단 **********************/
.top_content>div.inner_content{
	width:1110px;
	height:650px;
	padding-top:10px;
	margin:0 auto;
	position: relative;
}

/* 이미지 */
div.image>div>ul{
   list-style-type: none;
   text-align: right;
   width: 350px;
}
div.image{
	margin:0;
	padding:0;
	width:500px;
	text-align: left;
	display: inline-block;
	float: left;
}
div.image>div>img:first-child{
	width: 450px;
	height: 470px;
}
div.image>div>img:last-child {
	position: relative;
	float:right;
	margin-right:80px;
	bottom: 50px;
}
div.image>div>ul>li{
	display: inline-block;
	float:left;
}
div.image>div>ul>li>img{
	width: 106px;
	height: 111px;
}
div.image>div>ul>li>img:hover{
	cursor: pointer;
}

/* 설명 */
div.bean_name{
	margin:0;
	padding:0;
	width:610px;
	float:right;
}
.bean_name>span {
	text-align:left;
	display:inline-block;
}
.bean_name>span p:first-child {
	text-align:left;
	font-size: 24px;
	font-weight:bold;
}
.myproduct_btn{
	margin-top:10px;
	padding:5px 10px;
	float :right;
	display:inline-block;
	background-color:green;
	border-radius:5px;
}
.lineup {
	height:70px;
	
}
 .lineup_btn {
 	background-color:rgb(198,146,20);
 	margin-top:10px;
	padding:5px 10px;
	float :right;
	border-radius:5px;
	
 }
.myproduct_btn>a, .lineup_btn>a {
	color: white;
	font-size:12px;
	font-weight:bold;
}
.myproduct_btn>a:hover, .lineup_btn>a:hover{
	text-decoration: underline;
}
.line1 {
	border-bottom: 1px solid black;
	margin:20px auto;
}
.line2 {
	border-bottom: 1px solid lightgray;
	margin:20px auto;
}
.text {
	font-size:14px;
}
.roast {
	width:100%;
	background:rgb(244,244,242);
	border-radius:5px;
	text-aling:left;
	margin:45px 0;
	padding-left:20px;
}
.roast img {
	padding:5px;
}
.roast>div>div {
	display:inline-block;
	padding:15px 0;
	position:absolute;
}

.line3 {
	border-left:1px solid lightgray;
	display:inline-block;
	height:15px;
	padding:0 5px;
}
.inner_img img:first-child, .inner_img img:last-child {
	display:inline-block;
}
.facebook {
	display:block;
	float:right;
}

/************************* 원두 상세화면 -하단 **********************/
/* 왼쪽 */
.top_content>div.inner_content2, .bottom_content>div.inner_content3{
	width:1110px;
	height:500px;
	margin: 0 auto;
	position: relative;
}
.line4 {
	border-bottom: 1px solid lightgray;
	width:100%;
	margin:30px 0;
}
.bean_text {
	width:65%;
	display:inline-block;
	float:left;
	text-align:left;
}
.bean_text p {
	font-size:12.5px;
}
.bean_text span {
	float:left;
	width:348px;
	display:inline-block;
	margin:20px 0;
}
.bean_text span:first-child {
	padding-right:20px;
}
.bean_text span>img {
	width:340px;
	padding:10px 0;
}
.bean_text span>p {
	font-size:11px;
	padding:10px 0;
}
.bean_text span>h3 {
	font-size:13px;
	font-weight:bold;
}
/* 오른쪽 */
.note {
	width:34%;
	height:auto;
	background-color:rgb(244,244,242);
	float:right;
	position:relative;
}
.note div {
	margin:5% 30px;
}
.note div>p {
	font-size:14px;
	padding:10px 0;
	color:gray;
}
.line5 {
	border-bottom: 1px solid lightgray;
	width:90%;
	margin:30px auto;
}

/************************* 프로모션 **********************/
div.bottom_news{
	background-color: #f4f4f2;
	padding: 40px 0 60px 0;
	height: auto;
}
div.bottom_news>div{
	width: 1110px;
	text-align: left;
	margin: 0 auto;
	position: relative;
	height: 100px;
}
div.bottom_news>div:first-child>div{
	display: flex;
	justify-content: space-between;
}
div.bottom_news>div:first-child>div>div{
	width:555px;
	display: flex;
	justify-content: space-between;
	height: 140px;
}
div.bottom_news>div:first-child>div>div:first-child {
	border-right: 1px solid lightgray;
}
div.bottom_news>div:first-child>div>div:first-child span {
	font-size: 18px;
	font-weight: bold;
	display: inline-block;
	color: #444;
}
div.bottom_news>div:first-child>div>div:first-child li {
	font-size: 13px;
	list-style-type: none;
	background-image: url("http://localhost:9000/starbucks/images/dot.jpg");
	background-repeat: no-repeat;
	background-position: left center;
	padding-left: 8px;
	line-height: 40px;
}
div.bottom_news>div:first-child>div>div:first-child img {
	display: block;
	width: 36px;
	height: 36px;
	margin-right: 40px;
}
div.bottom_news>div:first-child>div>div:last-child img {
	display: inline-block;
	position: relative;
	top: -15px;
	left: 30px;
	height: 171px;
	width: 171px;
}
div.bottom_news>div:first-child>div>div:last-child>div {
	margin-left: 60px;
}
div.bottom_news>div:first-child>div>div:last-child>div>span:first-child{
	display: block;
	margin-bottom: 10px;
	font-size: 18px;
	font-weight: bold;
	color: #444;
}
div.bottom_news>div:first-child>div>div:last-child>div>span:last-child{
	font-size: 13px;
}
div.bottom_news>div:last-child{
	display: block;
	border-top: 1px solid lightgray;
	padding: 40px 0;
	display: none;
}
div.bottom_news>div:last-child>span{
	font-size: 18px;
	font-weight: bold;
	color: #444;
}
div.bottom_news>div:last-child>div {
	display: flex;
	justify-content: flex-start;
	margin-top: 20px;
}
div.bottom_news>div:last-child>div>img:first-child{
	width: 160px;
	height: 167px;
}
div.bottom_news>div:last-child>div>div {
	margin-left: 20px;
}
div.bottom_news>div:last-child>div>div>span:first-child {
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}
div.bottom_news>div:last-child>div>div>span:last-child {
	font-size: 14px;
	color: #666;
}
div.bottom_news>div:last-child>img {
	position: relative;
	bottom: 7px;
	left: 180px;
	width: 65px;
	height: 16px;
}
.line7 {
	border-bottom: 1px solid lightgray;
	width:100%;
}
/******************* 관련제품 content ****************************/
.bean_list {
	width:100%; height:220px;
	text-align:center;
	padding-top:30px;
	position:relative;
}
.product_title {
	width:1100px;
	margin:5px auto;
	text-align:left;
	font-weight:bold;
	font-size:18px;
}
.product_list {
	width:1100px; 
	margin:0 auto;
}
.bean_list ul {
	list-style-type:none;
	float:left;
}
.bean_list ul li>div {
	display:inline-block;
	text-align:left;
	padding:0 10px 0 10px;
	
}
.bean_list ul li>div span {
	font-weight:bold;
}
.bean_list ul li>div p {
	padding:15px 0;
	font-size:13px;
}
.product_img {
	width:160px; height:160px;
}
.dproduct {
	width:180px; height:100px;
}
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.elevatezoom.js"></script>
<script>
/* 작은 이미지 선택 시 큰 이미지 변경 */
$( document ).ready(function() {
	$(".image li>img").click(function(){
		var img = $(this).attr("src");
		$(".zoomImg").attr("src",img);
		$(".zoomWindow").css("background-image","url("+img+")");
	});
	
	/* 돋보기 기능 */
	 $('.zoomContainer').remove();
	$(".zoomImg").elevateZoom({
		responsive : true,
		zoomWindowWidth: 610,
		zoomWindowHeight: 468,
		zoomWindowOffetx: 45,
		zoomWindowOffety: -1,
		borderSize: 1,
		borderColour: "lightgray",
	});
});
</script>

</head>
<body>
	<!-- Header -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- content -->

	<!-- 타이틀  -->
	<div class="sub_title">
		<div class="sub_inner_title">
			<img class="coffee_ttl"src="http://localhost:9000/starbucks/images/sb_bean_ttl.png">
		<ul class="smap">
			<li><a href="http://localhost:9000/starbucks/index.jsp"><img class="home_icon" src="http://localhost:9000/starbucks/images/icon_home.png"></a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/coffee/coffee_main.jsp" style="text-decoration-line: none;">COFFEE</a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/coffee/coffee_list.jsp" style="text-decoration-line: none;">커피</a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="#" style="text-decoration-line: none;"><%= vo.getCname() %></a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="#" style="text-decoration-line: none;"><%= vo.getDproduct_name() %></a></li>
		</ul>
	</div>
	</div>	
	
	<!-- 원두 content -->
	<section class="top_content">
	<div class="inner_content">
	
	
	<div class="image"><!-- 이미지 -->
		<div><!-- 큰 이미지 -->
			<img class="zoomImg" src='http://localhost:9000/starbucks/images/<%= cimg %>' data-zoom-image="http://localhost:9000/starbucks/images/<%= vo.getCimg_bfile() %>" />
			<img src="http://localhost:9000/starbucks/images/more.png">
		</div>
		<div><!-- 작은 이미지 -->
			<ul>
				<li>
					<img src="http://localhost:9000/starbucks/images/<%= vo.getCimg_bfile() %>">
				</li>
			</ul>
		</div>
	</div><!-- 이미지 -->
		
		<article>
			<div class="bean_name">
				<span>
					<p><%= vo.getDproduct_name() %></p>
					<p><%= vo.getDproduct_ename() %></p>
				</span>
	<!-- 			<span class="myproduct_btn">
					<a href="#">나만의 상품으로 등록</a>
				</span> -->
				
				<div class="line1"></div>
				
				<p class="text">
				<% if(vo.getDproduct_text() != null ) { %>
					<%= vo.getDproduct_text() %>
				<% } %>
				</p>
				
				<div class="roast">
					<div>
						<img src="http://localhost:9000/starbucks/images/icon_blond.png">
						<div><%= vo.getCname() %> <div class="line3"></div><%= vo.getCtext() %></div>
					</div>
				</div>
				
				<div class="line2"></div>
				
				<div class="lineup">
					<span class="lineup_btn">
						<a href="#">STARBUCKS COFFEE LINE-UP</a>
					</span>
				</div>
				
				<div class="inner_img">
					<a href="#"><img src="http://localhost:9000/starbucks/images/product_investigate_img01.jpg"></a>
					<a href="#"><img src="http://localhost:9000/starbucks/images/product_investigate_img02.jpg"></a>
				</div>
				<div class="facebook">
					<a href="#"><img src="http://localhost:9000/starbucks/images/sns_f.png"></a>
				</div>
			</div>
		</article>
	</div>
	

		<div class="inner_content2">
				
			<div class="line4"></div>
			
			<div class="bean_text">
				<% if(vo.getDproduct_content() != null){ %>
					<p><%= vo.getDproduct_content() %></p>
				<% } %>
				<div>
					<span>
						 <img src="http://localhost:9000/starbucks/images/productInvestigate_img01.jpg">
						 <h3>디자인 스토리</h3>
						 <% if(vo.getDproduct_story() != null){ %>
						 	<p><%= vo.getDproduct_story() %></p>
						 <% } %>
					</span>
					<span>
						<img src="http://localhost:9000/starbucks/images/productInvestigate_img02.jpg">
						 <h3>커피 테이스팅 노트</h3>
						 <% if( vo.getDproduct_tasting() != null){ %>
						 <p><%= vo.getDproduct_tasting() %></p>
						 <% } %>
					</span>
				</div>
			</div>
				
				<% if( vo.getDproduct_note() != null && vo.getDproduct_enjoy() != null ){ %>
				<div class="note">
					<div> <h3>Tasting Notes</h3>
						<% if( vo.getDproduct_note() != null){ %>
						<p><%= vo.getDproduct_note() %></p>
						<% } %>
					</div>
					<div class="line5"></div>
					<div>
						 <h3>Enjoy with</h3>
						 <% if( vo.getDproduct_enjoy() != null){ %>
						 <p><%= vo.getDproduct_enjoy() %></p>
						 <% } %>
					</div>
				</div>
				<% } %>
		</div>

	
	</section>
	<!--  프로모션 content -->
		<div class="bottom_news"><!-- 하단 소식 -->
		<div>
			<div>
				<div><!-- 프로모션 새소식 -->
					<div>
						<span>프로모션 새소식</span>
						<ul>
							<li>해당 상품과 관련된 진행 중인 프로모션이 없습니다.</li>
						</ul>
					</div>
					<a href="http://localhost:9000/starbucks/whatsnew/event.jsp"><img src="http://localhost:9000/starbucks/images/news_more.png"></a>
				</div>
				<div><!-- 사이렌 오더 -->
					<img src="http://localhost:9000/starbucks/images/sirenOrder_img_171109.png">
					<div>
						<span>사이렌오더란?</span>
						<span>매장에서 줄을 서지 않고 주문하는 쉽고 간편한 O2O (Online to Offline) 서비스로서 앱을 통해 스타벅스 음료, 푸드 및 원두의 결제 및 주문을 완료하면 매장에서 즉시 메뉴를 받을 수 있는 스타벅스만의 신개념 서비스 입니다.</span>
					</div>
				</div>
			</div>
		</div>
			
		<div class="line7"></div>
		
		<% if(vo.getProduct_name() != null){%>
		<!-- 관련 제품 -->
		<section class="bean_list">
			<div class="product_title">관련 제품</div>
				<div class="product_list">
					<ul>
						<li><a href="coffee_detail.jsp?ctype_id=<%=vo2.getCtype_id()%>&cimg_file=<%= vo2.getCimg_file()%>"><img src="http://localhost:9000/starbucks/images/<%= vo2.getCimg_file() %>" class="product_img"></a>
							<div>
								<span><%= vo.getProduct_name() %></span>
								<div class="dproduct">
								<p><%= vo2.getDproduct_text() %></p>
								</div>
								<a href="coffee_detail.jsp?ctype_id=<%= vo2.getCtype_id() %>&cimg_file=<%= vo2.getCimg_file()%>"><img src="http://localhost:9000/starbucks/images/cf_more_btn.png"></a>
							</div>
						</li>					
					</ul>
				</div>
		</section>
		<% } %>
	</div>
				
<!-- Footer -->	
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>