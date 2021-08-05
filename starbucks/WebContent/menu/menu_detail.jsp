<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.vo.*, com.starbucks.dao.*, java.util.*" %>
<%
	String mid = request.getParameter("mid");

	menuDAO dao = new menuDAO();
	menuVO vo = dao.getMenuDetail(mid);
	ArrayList<menuVO> list = dao.getImg();
	
	String[] l_list = {"콜드 브루 커피","브루드 커피","에스프레소","프라푸치노","블렌디드","스타벅스 피지오","티(티바나)","기타 제조 음료","스타벅스 주스(병음료)",
			"브레드","따뜻한 푸드","과일 & 요거트","스낵 & 미니 디저트","아이스크림","머그","플라스틱 텀블러","스테인리스 텀블러","보온병","액세서리"};
	String[] l_list2 = {"coldbrew","brood","esp","fra","blended","fizzo","tea","etc","juice","bread","hot","fru","snack","ice",
			"mug","pla","stain","thermos","acc"
	};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
div.drink_detail{
	text-align: center;
	width: 1110px;
	margin: 60px auto 0 auto;
}
div.title{
	position: relative;
}
div.title>div>h2{
	text-align: left;
	padding-bottom: 40px;
}
ul.route {
	list-style-type: none;
	text-align: right;
	margin: 0;
	padding: 0;
	position: absolute;
	right: 0;
	bottom: 20px;
}
ul.route li{
	display: inline-block;
	vertical-align: middle;
}
ul.route li:last-child>a{
	color: black;
}
ul.route li>a{
	vertical-align: middle;
	text-decoration: none;
	color: gray;
	font-size: 13px;
}
ul.route li>a:hover{
	text-decoration: underline;
}

/* 내용 */
div.content>div:first-child{
	display: inline-block;
	padding-bottom: 40px;
	border-bottom: 1px solid lightgray;
}

/* 이미지 */
div.image{
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
	right: 80px;
	bottom: 15px;
}
div.image>div>ul{
	list-style-type: none;
	text-align: right;
	width: 350px;
}
div.image>div>ul>li{
	display: inline-block;
	float:left;
	margin-right: 10px;
}
div.image>div>ul>li>img{
	margin-top: 5px;
	width: 106px;
	height: 111px;
}
div.image>div>ul>li>img:hover{
	cursor: pointer;
}
/* 정보 */
div.inform{
	text-align: left;
	float: right;
	width: 595px;
}
div.inform h2{
	font-size: 24px;
}
div.inform h2 + span{
	font-size: 14px;
	color: #666;
}
div.inform>div:first-child{
	margin-bottom: 40px;
}
div.inform>div:first-child>div {
	background-color: #333;
	width: 100%;
	height: 2px;	
	display: block;
	margin: 20px 0;
}
div.inform>div:first-child>span:last-child{
	font-size: 15px;
}
div.inform>div:last-child>div:first-child {
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
	padding: 20px 10px;
}
div.inform>div:last-child>div:first-child>span:first-child {
	font-size: 18px;
}
div.inform>div:last-child>div:first-child>span:last-child {
	float: right;
	font-size: 16px;
}
div.inform>div:last-child>div:nth-child(2){
	padding: 20px 10px;
	column-count: 2;
	column-rule: 1px dashed lightgray;
}
div.inform>div:last-child ul{
	list-style-type: none;
}
div.inform>div:last-child li{
	margin-bottom: 15px;
	font-size: 14px;
}
div.inform>div:last-child ul>li>span:last-child {
	float: right;
}
div.inform>div:last-child>div.allergy{
	background-color: #f4f4f2;
	padding: 13px 7px;
	border: 1px solid #f4f4f2;
	border-radius: 2px;
}
div.inform>div:last-child>div:last-child>span{
	font-size: 14px;
}
div.content>div:last-child {
	clear: both;
	text-align: left;
	padding: 30px 0 80px 0;
}
div.content>div:last-child>span{
	font-size: 14px;
	color: #666;
}

/* 하단 소식 */
div.bottom_news{
	background-color: #f4f4f2;
	padding: 40px 0 60px 0;
}
div.bottom_news>div{
	width: 1110px;
	text-align: left;
	margin: 0 auto;
	position: relative;
	height: 171px;
	padding: 0 0 10px 0;
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
div.bottom_news>div:first-child>div>div.siren img {
	display: inline-block;
	position: relative;
	top: -15px;
	left: 30px;
	height: 171px;
	width: 171px;
}
div.bottom_news>div:first-child>div>div.siren>div {
	margin-left: 60px;
}
div.bottom_news>div:first-child>div>div.siren>div>span:first-child{
	display: block;
	margin-bottom: 10px;
	font-size: 18px;
	font-weight: bold;
	color: #444;
}
div.bottom_news>div:first-child>div>div.siren>div>span:last-child{
	font-size: 13px;
}


div.bottom_news>div:first-child>div>div.product_news{
	width:555px;
	display: flex;
	justify-content: space-around;
	height: 140px;
}
div.bottom_news>div:first-child>div>div.product_news img {
	display: inline-block;
	position: relative;
	left: 10px;
}
div.bottom_news>div:first-child>div>div.product_news>div>span:first-child {
	color: #006633;
}
div.bottom_news>div:first-child>div>div.product_news>div>span:nth-child(2){
	display: block;
	margin: 10px 0;
	font-size: 13px;
	font-weight: bold;
}
div.bottom_news>div:first-child>div>div.product_news>div>span:last-child{
	font-size: 13px;
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
	$(".zoomImg").elevateZoom({
		zoomWindowWidth: 610,
		zoomWindowHeight: 468,
		zoomWindowOffetx: 45,
		zoomWindowOffety: -1,
		borderSize: 1,
		borderColour: "lightgray",
	});
	$(".title>div>h2").has('img').css("margin-top","-20px");
});
</script>
</head>
<body>
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	
	<div class="drink_detail">
		<div class="title"><!-- 타이틀 -->
			<div>
				<h2>
			<% for(int i=0;i<l_list.length;i++){ %>
				<% if(vo.getP_type().equals(l_list[i])){ %>
					<img src="http://localhost:9000/starbucks/images/<%= l_list2[i] %>_tit.png">
				<% } %>
			<% } %>
				</h2>
				<ul class="route">
					<li>
						<a href="../index.jsp">
							<img src="http://localhost:9000/starbucks/images/icon_home.png">
						</a>
					</li>
					<li>
						<img class="arrow" src="http://localhost:9000/starbucks/images/icon_arrow.png">
					</li>
					<li>
						<a href="menu_main.jsp">MENU</a>
					</li>
					<li>
						<img class="arrow" src="http://localhost:9000/starbucks/images/icon_arrow.png">
					</li>
					<li>
						<% if(vo.getM_type().equals("음료")){ %>
						<a href="menu_drink.jsp"><%= vo.getM_type() %></a>
						<% }else if(vo.getM_type().equals("푸드")){ %>
						<a href="menu_food.jsp"><%= vo.getM_type() %></a>
						<% }else if(vo.getM_type().equals("상품")){ %>
						<a href="menu_product.jsp"><%= vo.getM_type() %></a>
						<% } %>
					</li>
					<li>
						<img class="arrow" src="http://localhost:9000/starbucks/images/icon_arrow.png">
					</li>
					<li>
						<% if(vo.getM_type().equals("음료")){ %>
						<a href="menu_drink.jsp"><%= vo.getP_type() %></a>
						<% }else if(vo.getM_type().equals("푸드")){ %>
						<a href="menu_food.jsp"><%= vo.getP_type() %></a>
						<% }else if(vo.getM_type().equals("상품")){ %>
						<a href="menu_product.jsp"><%= vo.getP_type() %></a>
						<% } %>
					</li>
					<li>
						<img class="arrow" src="http://localhost:9000/starbucks/images/icon_arrow.png">
					</li>
					<li>
						<a href="#"><%= vo.getK_name() %></a>
					</li>
				</ul>
			</div>
		</div><!-- 타이틀 -->
		<div class="content"><!-- 내용 -->
			<div>
				<div class="image"><!-- 이미지 -->
					<div><!-- 큰 이미지 -->
						<img class="zoomImg" src="http://localhost:9000/starbucks/images/<%= vo.getImg() %>.jpg">
						<img src="http://localhost:9000/starbucks/images/more.png">
					</div>
					<div><!-- 작은 이미지 -->
						<ul>
							<li>
								<img src="http://localhost:9000/starbucks/images/<%= vo.getImg() %>.jpg">
							</li>
							<% for(menuVO vo_list : list){ %>
							<% if(vo.getImg().equals(vo_list.getBig_img())){ %>
							<li>
								<img src="http://localhost:9000/starbucks/images/<%= vo_list.getSmall_img() %>.jpg">
							</li>
							<% } %>
							<% } %>
						</ul>
					</div>
				</div><!-- 이미지 -->
				<div class="inform"><!-- 정보 -->
					<div><!-- 정보 타이틀 -->
						<h2><%= vo.getK_name() %></h2>
						<span><%= vo.getE_name() %></span>
						<div></div>
						<span><%= vo.getIntro_t() %></span>
					</div><!-- 정보 타이틀 -->
					<% if(!vo.getM_type().equals("상품")){ %>
					<div><!-- 정보 내용 -->
						<div>
							<span>제품 영양 정보</span>
							<span><%= vo.getNutri_inform() %></span>
						</div>
						<div>
							<ul>
								<li>
									<span>1회 제공량 (kcal)</span>
									<span><%= vo.getKcal() %></span>
								</li>
								<li>
									<span>포화지방 (g)</span>
									<span><%= vo.getFat() %></span>
								</li>
								<li>
									<span>단백질 (g)</span>
									<span><%= vo.getProtein() %></span>
								</li>
							</ul>
							<ul>
								<li>
									<span>나트륨 (mg)</span>
									<span><%= vo.getNa() %></span>
								</li>
								<li>
									<span>당류 (g)</span>
									<span><%= vo.getSugar() %></span>
								</li>
								<% if(vo.getCaffeine()!=null){ %>
								<li>
									<span>카페인 (mg)</span>
									<span><%= vo.getCaffeine() %></span>
								</li>
								<% } %>
							</ul>
						</div>
						<% if(vo.getAllergy()!=null){ %>
						<div class="allergy">
							<span>알레르기 유발요인 : <%= vo.getAllergy() %></span>
						</div>
						<% } %>
					</div><!-- 정보 내용 -->
					<% } %>
				</div><!-- 정보 -->
			</div>
			<div>
			<% if(vo.getIntro_b()!=null){ %>
				<span><%= vo.getIntro_b() %></span>
			<% } %>
			</div>
		</div><!-- 내용 -->
	</div><!-- drink_detail -->
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
				<% if(!vo.getM_type().equals("상품")){ %>
				<div class="siren"><!-- 사이렌 오더 -->
					<img src="http://localhost:9000/starbucks/images/sirenOrder_img_171109.png">
					<div>
						<span>사이렌오더란?</span>
						<span>매장에서 줄을 서지 않고 주문하는 쉽고 간편한 O2O (Online to Offline) 서비스로서 앱을 통해 스타벅스 음료, 푸드 및 원두의 결제 및 주문을 완료하면 매장에서 즉시 메뉴를 받을 수 있는 스타벅스만의 신개념 서비스 입니다.</span>
					</div>
				</div>
				<% }else{ %>
				<div class="product_news">
					<img src="http://localhost:9000/starbucks/images/footer_product_bn.png">
					<div>
						<span>텀블러를 구매하는 모든 분들께<br>
						텀블러 음료 쿠폰을 드립니다.</span>
						<span>텀블러 음료쿠폰이란?</span>
						<span>텀블러 음료쿠폰은 주문하신 음료와<br>
						Extra 한 개를 무료로 즐기실 수 있는 음료권입니다.</span>
					</div>
				</div>
				<% } %>
			</div>
		</div>
	</div>
	<!--  footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>