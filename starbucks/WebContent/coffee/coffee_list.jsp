<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.dao.*, com.starbucks.vo.*, java.util.*"  %>
<%
	String bean = request.getParameter("beanid");	

	coffeeDAO dao = new coffeeDAO();
	ArrayList<CoffeeVO> list = dao.getList(bean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE | Starbucks Coffee Korea</title>
</head>
<style>
	html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent;
}
.coffee_kor_txt{
	padding-top: 30px;
	position: relative;`
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
	color: #ffffff;
	float:left;
	margin-right:5px;
}
.wn_conf{
	left: 50%;
	margin: 0 0 0 -550px;
	position: relative;
	width: 1100px;
}
.wn_cont {
	border: 1px solid #dddddd;
	width: 100%;
	background: #ffffff;
	height: 71px;
	width: 1098px;
	border-radius: 3px;
	margin: 0 auto;
}
.cname_section{position: relative;} .container{width: 100%;}

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

/******************* 카테고리 **********************/
section.coffee_wrap {
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
    background: #ffffff;
    border: 1px solid #dddddd;
    height: auto;
    border-radius: 3px;
    padding-bottom:20px;
}
div.cate{
	text-align: left;
	margin: 25px 0 0 20px;
}
div.cate button.btn_style{
	width: 200px;
	height:35px;
	font-size: 14px;
	border-radius: 3px;
	margin-right: 5px;
	background: #f4f4f1;
	color:#333;
	border: 1px solid #f4f4f1;
}

div.cate button#<%= bean %>{
	width: 200px;
	height:35px;
	background: #006633;
	border: 1px solid #006633;
	color: white;
	font-size: 14px;
	border-radius: 3px;
	margin-right: 5px;
}

div.cate button.btn_style:hover,{
	text-decoration: underline;
	cursor: pointer;
}

form>ul{	
	list-style-type: none;
	text-align: left;
	padding: 20px 0 10px 30px;;
	
}
form>ul>li{
	display: inline-block;
	vertical-align: middle;
	margin:0; padding:0 20px 0 0;
	font-size: 13px;
}
input[type="checkbox"],
#checkboxes>label>input[type="checkbox"]{
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0
}
input[type="checkbox"] + label,
#checkboxes>label>input[type="checkbox"] + label{
	display: inline-block;
	position: relative;
	cusor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
input[type="checkbox"] + label:before,
#checkboxes>label>input[type="checkbox"] + label:before {
	content: ' ';
	display: inline-block;
	width: 10px;
	height: 10px;
	margin: -2px 8px 0 0;
	text-align: center;
	vertical-align: middle;
	background: white;
	border: 1px solid #cacece;
}
input[type="checkbox"] + label:hover:before,
input[type="checkbox"] + label:hover,
#checkboxes>label>input[type="checkbox"] + label:hover:before{
	cursor: pointer;
}
input[type="checkbox"] + label:active:before,
input[type="checkbox"]:checked + label:active:before,
#checkboxes>label>input[type="checkbox"] + label:active:before,
#checkboxes>label>input[type="checkbox"]:checked + label:active:before {
	border:1px solid green;
	content: '\2714';
	color: green;
	background: white;
	border-color: green;
	line-height: 10px;
	font-size: 6px;
}
input[type="checkbox"]:checked + label:before,
#checkboxes>label>input[type="checkbox"]:checked + label:before{
	content: '\2714';
	color: green;
	background: white;
	border-color: #cacece;
	line-height: 10px;
	font-size: 6px;
}
/********************** 상세분류 ********************/
div.show{
	width:1100px;
	height:80px;
	margin:10px auto;
	position: relative;
}
/*상세분류 로고*/
#mark_l{
	position:absolute;
	bottom: 80px;
	left: 20px;
}
#mark_r{
	position:absolute;
	bottom: 80px;
	left: 70px;
}

/********************** 상세분류 드롭다운 **************/
.multiselect {
	width: 270px;
	position: absolute;
	right: 0;
	top:40px;
	z-index: 3;
}
.selectBox {
  	position: relative;
}
.selectBox:hover{
	cursor: pointer;
}
.selectBox select {
 	width: 100%;
 	font-weight: bold;
  	padding:10px;
  	border-color: lightgray;
  	color: #444444;
}
.overSelect {
  	position: absolute;
 	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
}
#checkboxes {
	display: none;
}
#checkboxes label.chk_drop {
	display: block;
	border: 1px solid lightgray;
	background-color: white;
	padding:5px;
	font-size: 14px;
	vertical-align: middle;
}
#checkboxes label>span:hover {
	cursor: pointer;
}
#checkboxes img {
	vertical-align: middle;
}
/************************* 상품 리스트 ***********************/
.coffee_list{
	height: auto;
	width: 1098px;
	background: #ffffff;
	margin: 0 auto;
}
.coffee_list f{
	font-size: 21px;
	color: #222222;
	font-weight: bold;
	margin-bottom: 21px;
	padding: 21px;
	vertical-align: baseline;
	line-height: 90px;
}
.cname_list{
	width: 100%;
}
.cname_list_inner{
	width: 1150px;
	margin: 0 auto;
}	
.cname__list > li{
	margin:20px 10px;
	position: relative;
	width: 260px;
	display: inline-block;
}
.cname__list > li > div > p{
	font-size: 12px;
	color: #666666;
	height: 16px;
	text-align: center;
	padding:20px 0 10px 25px;
}
.cname_list img:hover {
	transform: scale(1.1, 1.1);
	transition: all 1s ease-in-out;
}
.category span{
	margin-left:20px;
	padding:30px 15px 15px 15px;
	display:inline-block;
	font-weight:bold;
}	
.category div {
	margin-left:20px;
	width:95%; 
	border-bottom:1px solid #dddddd;
	padding:5px;
}
.category button{
	background:none;
	border:none;
	float:right;
	padding:15px 30px 0 0;
	display:inline-block;
	
}
.check {
	padding:65px 0 0 20px;;
}
div.detail_list {
	position:relative;
	width:100%;
	text-align:center;
	padding:20px 0;
	padding-left:400px;
}
div.detail_list>select {
	width:290px;
	height:30px;
}
div.coffee_list>div {
	background-color:rgb(244,244,242);
	margin-top:10px;
}
div.coffee_list>div>img{
	padding-top:5px;
	position:relative;
	
}
div.coffee_list>div p {
	display:inline-block;
	padding:12px 0 5px 15px;
	position:absolute;
	font-weight:bold;
}
.bottom_sp {
	height:100px;
}
#bean1:hover, #bean2:hover, #bean3:hover { text-decoration:underline; cursor:pointer; }


</style>

<script src="../js/jquery-3.6.0.min.js"></script>
<script>
////////////카테고리 업다운//////////////
	$(document).ready(function(){
	
		$(".btn_class img").click(function(){
			var id=$(this).attr("id");
			if(id=="up_btn"){
				$(".btn_class img").attr("src","http://localhost:9000/starbucks/images/list_down_btn.png");
				$(".btn_class img").attr("id","down_btn");
				$(".line").hide();
				$(".coffee_wrap").hide();
			}else{
				$(".btn_class img").attr("src","http://localhost:9000/starbucks/images/list_up_btn.png");
				$(".btn_class img").attr("id","up_btn");
				$(".line").show();
				$(".coffee_wrap").show();
			}
		});
	});


//////////////체크박스////////////////////
function allCheck() {
    if ($("#all").is(':checked')) {
        $(".chk").prop("checked", false);
        $("#all").prop("checked", true);
        $("#list_cate *").each(function(){
        	$(this).show();
        });
    }
    else if (!$("#all").is(':checked')) {
    	$("#list_cate *").each(function(){
        	$(this).hide();
        });
    }
} 

function checkboxCheck(){
		if($("#blond").is(':checked')){
			$("#all").prop("checked", false);
			$("#blond_list").show();
			$("#blond_img").show();
		}else if(!$("#blond").is(':checked')){
	        $("#blond_list").hide();
	        $("#blond_img").hide();
	    	if($("#one").is(':checked') || $("#two").is(':checked')){
	    		$("#blond_list").show();
	    	}
		}
		if($("#medium").is(':checked')){
			$("#all").prop("checked", false);
			$("#medium_list").show();
			$("#medium_img").show();
		}else if(!$("#medium").is(':checked')){
	        $("#medium_list").hide();
	        $("#medium_img").hide();
	    	if($("#one").is(':checked') || $("#two").is(':checked')){
	    		$("#medium_list").show();
	    	}
		}
		if($("#dark").is(':checked')){
			$("#all").prop("checked", false);
			$("#dark_list").show();
			$("#dark_img").show();
		}else if(!$("#dark").is(':checked')){
	        $("#dark_list").hide();
	        $("#dark_img").hide();
	    	if($("#one").is(':checked') || $("#two").is(':checked')){
	    		$("#dark_list").show();
	    	}
		}
		if($("#flavor").is(':checked')){
			$("#all").prop("checked", false);
			$("#flavor_list").show();
			$("#flavor_img").show();
		}else if(!$("#flavor").is(':checked')){
	        $("#flavor_list").hide();
	        $("#flavor_img").hide();
		}
		
}


/////////////////////////// 상세분류 /////////////////////////
/* 상세분류 리스트*/
var expanded = false;
function Checkboxes() {
	var checkboxes = document.getElementById("checkboxes");
	if (!expanded) {
		checkboxes.style.display = "block";
		expanded = true;
	} else if(expanded){
		checkboxes.style.display = "none";
		expanded = false;
	}
}
function showCheckboxes() {
	var checkboxes = document.getElementById("checkboxes");
	if (!expanded) {
		checkboxes.style.display = "block";
		expanded = true;
	}
}
function hideCheckboxes() {
	var checkboxes = document.getElementById("checkboxes");
	if (expanded) {
		checkboxes.style.display = "none";
		expanded = false;
	}
}
/* 상세분류 기능*/
function categoryCheck(){    	
		if($("#one").is(':checked')){
			$(".mark01").show();
			$(".normal").hide();
		}else if(!$("#one").is(':checked')){
			$(".mark01").hide();
		}
	 	if($("#two").is(':checked')){
			$(".mark02").show();
			$(".normal").hide();
		}else if(!$("#two").is(':checked')){
			$(".mark02").hide();
		}
	 	if($("#one").is(':checked') || $("#two").is(':checked')){
			$(".mark03").show();
			$(".normal").hide();
		}else if(!$("#one").is(':checked') || !$("#two").is(':checked')){
			$(".mark03").hide();
 		} 
	 	if($("#three").is(':checked')){
			$(".mark04").show();
			$(".normal").hide();
		}else if(!$("#three").is(':checked')){
			$(".mark04").hide();
 		} 
}
</script>

<body>
<!-- Header -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- 서브 타이틀  -->
	<div class="sub_title">
		<div class="sub_inner_title">
			<img class="coffee_kor_txt"src="http://localhost:9000/starbucks/images/coffee_tit1.jpg">
		<ul class="smap">
			<li><a href="http://localhost:9000/starbucks/index.jsp"><img class="home_icon" src="http://localhost:9000/starbucks/images/icon_home.png"></a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/coffee/coffee_main.jsp" style="text-decoration-line: none;">COFFEE</a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/coffee/coffee_list.jsp" style="text-decoration-line: none;">커피</a></li>
		</ul>
	</div>
</div>	

<!-- 커피 분류 -->
	<div id= "container">
		<div class="wn_cont">
                   <div class ="category">
	                   	<span>분류보기</span>
	                   	<button type="button" class="btn_class"><img src="http://localhost:9000/starbucks/images/list_down_btn.png" id="up_btn"></button>
	                   	<div class="line"></div>
                   </div>
			<section class="coffee_wrap">
                   <div class="box_bg">
                    <!-- 카테고리 테마 -->
					<div class="cate">
						<a href="http://localhost:9000/starbucks/coffee/coffee_list.jsp?beanid=<%="bean1"%>"><button type="button" class="btn_style" id="bean1">스타벅스 원두</button></a>
						<a href="http://localhost:9000/starbucks/coffee/coffee_list.jsp?beanid=<%="bean2"%>"><button type="button" class="btn_style" id="bean2">스타벅스 비아</button></a>
						<a href="http://localhost:9000/starbucks/coffee/coffee_list.jsp?beanid=<%="bean3"%>"><button type="button" class="btn_style" id="bean3">스타벅스 오리가미</button></a>
					</div>               
        			</div>
        			<div id="cate_class">
						<form method="post">
							<ul>
								<li>
									<input type="checkbox" id="all" checked="checked" onclick="allCheck()">
									<label for="all">전체 상품보기</label>
								</li>
								<li>
									<input type="checkbox" id="blond" class="chk" onclick="checkboxCheck()">
									<label for="blond">블론드 로스트</label>
								</li>
								<li>
									<input type="checkbox" id="medium" class="chk" onclick="checkboxCheck()">
									<label for="medium">미디엄 로스트</label>
								</li>
								<li>
									<input type="checkbox" id="dark" class="chk" onclick="checkboxCheck()">
									<label for="dark">다크 로스트</label>
								</li>
								<li>
									<input type="checkbox" id="flavor" class="chk" onclick="checkboxCheck()">
									<label for="flavor">플레이버</label>
								</li>
							</ul>
						</form>
					</div>

            </section>
		</div>
	</div>
	
<!-- 상세분류 -->				
				<div class="show">
					<form>
					  <div class="multiselect">
					    <div class="selectBox" onclick="Checkboxes()" onmouseleave="hideCheckboxes()">
					      <select>
					        <option>상세분류</option>
					      </select>
					      <div class="overSelect"></div>
					    </div>
					    <div id="checkboxes" onmouseenter="showCheckboxes()" onmouseleave="hideCheckboxes()">
					      <label class="chk_drop">
					        <input type="checkbox" id="one" onclick="categoryCheck()"/><label for="one"><img src="http://localhost:9000/starbucks/images/mark01.png" width="21px" height="21px"><span>신규 출시된 메뉴</span></label></label>
					      <label class="chk_drop">
					        <input type="checkbox" id="two" onclick="categoryCheck()"/><label for="two"><img src="http://localhost:9000/starbucks/images/mark02.png" width="21px" height="21px"><span>한정기간 출시되는 시즌성 메뉴</span></label></label>
					      <label class="chk_drop">
					        <input type="checkbox" id="three" onclick="categoryCheck()"/><label for="three"><img src="http://localhost:9000/starbucks/images/mark04.png" width="21px" height="21px"><span>판매 완료된 메뉴</span></label></label>
					    </div>
					  </div>
					</form>
				</div>
				<!-- 상세분류 끝 -->
	
<!-- coffee list -->
	<div class="list" id="list_cate">
	   <% for(CoffeeVO vo : list){
			coffeeDAO dao2 = new coffeeDAO();
			ArrayList<CoffeeVO> list2 = dao.getImgList(bean, vo.getCtype_id());
		   %>
		<article id="coffee_content" >
			<div class="coffee_list" >
				<div id="<%= vo.getCtype_id()%>_list">
					<img src="http://localhost:9000/starbucks/images/<%= vo.getClogo() %>"><p><%= vo.getCname() %></p>
					
				</div>
			</div>
			
			<div class="cname_list">
				<div class="cname_list_inner" id="<%= vo.getCtype_id()%>_img">
					<ul class="cname__list">
					 <% for(CoffeeVO vo2 : list2){ %>
							 <%if(vo2.getM_new()==null && vo2.getLimit()==null && vo2.getSoldout()==null){ %>
									<li class="normal"><div><a href ="coffee_detail.jsp?ctype_id=<%=vo2.getCtype_id()%>&cimg_file=<%= vo2.getCimg_file()%>">
									<img src="http://localhost:9000/starbucks/images/<%= vo2.getCimg_file()%>"></a><p><%= vo2.getCimg_text()%></p>
									</div></li>
								<% } %>	
							<% if(vo2.getM_new()!=null && vo2.getLimit()==null){ %>
									<li class="mark01"><div><a href ="coffee_detail.jsp?ctype_id=<%=vo2.getCtype_id()%>&cimg_file=<%= vo2.getCimg_file()%>">
									<img src="http://localhost:9000/starbucks/images/<%= vo2.getCimg_file()%>"></a><p><%= vo2.getCimg_text()%></p>
									<img src="http://localhost:9000/starbucks/images/mark01.png" id="mark_l" >
									</div></li>
							<% }else if( vo2.getM_new() ==null && vo2.getLimit()!=null){ %>
									<li class="mark02"><div><a href ="coffee_detail.jsp?ctype_id=<%=vo2.getCtype_id()%>&cimg_file=<%= vo2.getCimg_file()%>">
									<img src="http://localhost:9000/starbucks/images/<%= vo2.getCimg_file()%>"></a><p><%= vo2.getCimg_text()%></p>	
									<img src="http://localhost:9000/starbucks/images/mark02.png" id="mark_l">
									</div></li>
							<% }else if( vo2.getM_new() !=null && vo2.getLimit()!=null){  %>
									<li class="mark03"><div><a href ="coffee_detail.jsp?ctype_id=<%=vo2.getCtype_id()%>&cimg_file=<%= vo2.getCimg_file()%>">
									<img src="http://localhost:9000/starbucks/images/<%= vo2.getCimg_file()%>"></a><p><%= vo2.getCimg_text()%></p>	
									<img src="http://localhost:9000/starbucks/images/mark01.png" id="mark_l">
									<img src="http://localhost:9000/starbucks/images/mark02.png" id="mark_r">
									</div></li>
									<% } %>
							<% if(vo2.getSoldout()!=null){  %>
									<li class="mark04"><div><a href ="coffee_detail.jsp?ctype_id=<%=vo2.getCtype_id()%>&cimg_file=<%= vo2.getCimg_file()%>">
									<img src="http://localhost:9000/starbucks/images/<%= vo2.getCimg_file()%>"></a><p><%= vo2.getCimg_text()%></p>	
									<img src="http://localhost:9000/starbucks/images/mark03.png" id="mark_l">
									</div></li>
								<% } %>
							
					<% } %>
					</ul>
				</div>
			</div>
		</article>
<% } %>
	</div>
	
<!-- Footer -->	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>