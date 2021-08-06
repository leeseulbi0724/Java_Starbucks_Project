<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="com.starbucks.dao.*, com.starbucks.vo.*, java.util.*"  %>
 <%
 	String etype = request.getParameter("etype_id");	
 		
 
	coffeeDAO dao = new coffeeDAO();
	CoffeeVO vo = dao.getEspressoDetail(etype);
	ArrayList<menuVO> list = dao.getEspressoProduct(etype);

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>에스프레소 음료 | Starbucks Coffee Korea</title>
<style>
/******************* 타이틀 ****************************/
.espresso_ttl{
	padding-top: 30px;
	position: relative;
}
.sub_title{
	width: 100%;
	height: 98px;
	font-size:13px;
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
/******************* 에스프레소 content ****************************/
.espresso, section.espresso_list {
	position: relative;
	text-align:center;

}
.espresso {
	width:100%; height:auto;
}
.espresso_img {
	padding-bottom:30px;

}
.espresso div {
	width:1100px;
	position: relative;
	margin:10px auto;
}

.espresso_info dd {
	text-align:left;
	font-size: 13px;
	padding: 20px 20px;
}
.espresso_info dt{
	color:#006633; font-size:18px; line-height:1.4; font-weight:normal; letter-spacing:-1px;
	text-align:left;
	padding: 10px 20px;
}
/******************* 관련제품 content ****************************/
.espresso_list {
	width:100%; height:100%;
	position: absolute;
	text-align:center;
	background-color:rgb(244,244,242);
	padding-top:30px;
}
.line {
	border-bottom:1px solid lightgray;
	width:1100px;
	margin:10px auto;
}
.product_title {
	width:1100px;
	margin:20px auto;
	text-align:left;
	font-weight:bold;
	font-size:18px;
}
.product_list {
	width:1100px; 
	margin:auto;
	display:inline-block;
}
.espresso_list ul {
	list-style-type:none;
	width:1100px;
	float:left;
}
.espresso_list ul li div {
	display:inline-block;
	float:left;
	text-align:left;
	padding:5px 10px;
	width:150px; height:180px;
	
}
.espresso_list ul li>div span {
	font-weight:bold;
	font-size:14px;
}
.espresso_list ul li>div p {
	padding:15px 0;
	font-size:12px;
}
.product_img {
	width:160px; height:160px;
}


</style>
</head>
<body>
<!-- Header -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- content -->

	<!-- 타이틀  -->
	<div class="sub_title">
		<div class="sub_inner_title">
			<img class="espresso_ttl"src="http://localhost:9000/starbucks/images/<%= vo.getEname_tit() %>">
		<ul class="smap">
			<li><a href="http://localhost:9000/starbucks/index.jsp"><img class="home_icon" src="http://localhost:9000/starbucks/images/icon_home.png"></a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/coffee/coffee_main.jsp" style="text-decoration-line: none;">COFFEE</a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/coffee/espresso_main.jsp" style="text-decoration-line: none;">에스프레소 음료</a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/coffee/espresso_doppio.jsp" style="text-decoration-line: none;"><%= vo.getEname() %></a></li>
		</ul>
	</div>
	</div>	

	<!-- 에스프레소 content -->
	<section class="espresso">
		<div>
			<p class="espresso_img"><img src="http://localhost:9000/starbucks/images/<%= vo.getEfile_content() %>"></p>
			<dl class="espresso_info">
				<dt><%= vo.getEtitle() %></dt>
				<dd>
					<p><%= vo.getEcontent() %></p>
				</dd>
			</dl>
		</div>
	</section>

	<!-- 관련 제품 -->
	<section class="espresso_list">
		<div class="line"></div>
		
			<div class="product_title">관련 제품</div>
			
				<div class="product_list">
					<ul>
					<% for(menuVO mvo :list){ %>
						<li><div><a href="http://localhost:9000/starbucks/menu/menu_detail.jsp?mid=<%= mvo.getMid()%>"><img src="http://localhost:9000/starbucks/images/<%= mvo.getImg() %>.jpg" class="product_img"></a></div>
							<div class="product">
								<span><%= mvo.getK_name() %></span>
								<p><%= mvo.getIntro_t() %></p>
								<a href="http://localhost:9000/starbucks/menu/menu_detail.jsp?mid=<%= mvo.getMid()%>"><img src="http://localhost:9000/starbucks/images/cf_more_btn.png"></a>
							</div>
						</li>		
					<% } %>	
					</ul>
				</div>s
	</section>
		
<!-- Footer -->	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>













