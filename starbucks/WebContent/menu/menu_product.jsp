<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.vo.*, com.starbucks.dao.*, java.util.*" %>
<%
	String[] l_list = {"머그","글라스","플라스틱 텀블러","스테인리스 텀블러","보온병","액세서리","커피 용품","패키지 티(티바나)"};
	String[] e_list = {"mug","glass","pla","stain","thermos","acc","cof","pack"};
	menuDAO dao = new menuDAO();
	ArrayList<menuVO> list = dao.getProductList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>상품 | Starbucks Coffee Korea</title>
<style>
div.product{
	text-align: center;
	width: 1110px;
	margin: 40px auto 150px auto;
	position: relative;
}

ul.route {
	list-style-type: none;
	text-align: right;
	margin: 0;
	padding: 0;
	position: absolute;
	right: 0;
	top: 20px;
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
h2{
	text-align: left;
	padding: 20px 0 20px 0;
}
/* 분류 */
div.class {
	 border:1px solid lightgray;
	 border-radius: 5px;
	 padding: 20px 30px;
	 margin: 30px 0 20px 0;
}
div.btn_class{
	text-align: left;
}
div.class p{
	font-weight: bold;
	font-size: 18px;
	display: inline-block;
	margin:5px 0 10px 0;
}
div.btn_class img{
	float:right;
}
div.btn_class img:hover{
	cursor: pointer;
}
div.line{
	background-color: lightgray;
	width: 100%;
	height: 1px;	
	display: inline-block;
}
div.cate{
	text-align: left;
	margin: 25px 0 15px 0;
}
div.cate .btn_style{
	width: 200px;
	height:35px;
	background: #006633;
	border: 1px solid #006633;
	color: white;
	font-size: 14px;
	border-radius: 3px;
	margin-right: 5px;
}
div.cate .btn_style:last-child{
	background: #f4f4f1;
	color:#333;
	border: 1px solid #f4f4f1;
}
div.cate .btn_style:hover{
	text-decoration: underline;
	cursor: pointer;
}
div.class>div>div ul{	
	list-style-type: none;
	text-align: left;
	margin-bottom: 20px; padding:0;
}
div.class>div>div ul>li{
	display: inline-block;
	vertical-align: middle;
	margin:0; padding:0 20px 0 0;
	font-size: 13px;
}
div.class>div>div>form>ul>li>input[type="checkbox"],
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
div.class>div>div>form>ul>li>input[type="checkbox"] + label,
#checkboxes>label>input[type="checkbox"] + label{
	display: inline-block;
	position: relative;
	cusor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
div.class>div>div>form>ul>li>input[type="checkbox"] + label:before,
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
div.class>div>div>form>ul>li>input[type="checkbox"] + label:hover:before,
div.class>div>div>form>ul>li>input[type="checkbox"] + label:hover,
#checkboxes>label>input[type="checkbox"] + label:hover:before{
	cursor: pointer;
}
div.class>div>div>form>ul>li>input[type="checkbox"] + label:active:before,
div.class>div>div>form>ul>li>input[type="checkbox"]:checked + label:active:before,
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
div.class>div>div>form>ul>li>input[type="checkbox"]:checked + label:before,
#checkboxes>label>input[type="checkbox"]:checked + label:before{
	content: '\2714';
	color: green;
	background: white;
	border-color: #cacece;
	line-height: 10px;
	font-size: 6px;
}

#theme_class{
	display: none;
}
#theme_class li{
	padding: 7px 15px 0 0;
}
#theme_class li:nth-child(3){
	padding-right: 0;
}
/* 상세분류 */
div.content>div>div.show{
	text-align: left;
	padding:20px 0;
	position: relative;
}
/* 상세분류 드롭다운 */
.multiselect {
	width: 250px;
	position: absolute;
	right: 0;
	top:0;
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
/* 이미지 리스트 */
div.label{
	background-color: #f4f4f1;
	padding: 15px 0;
	vertical-align: middle;
	text-align: left;
	margin-top: 15px;
}
span.list_label{
	font-size: 17px;
	font-weight: bold;
	padding: 0 10px 0 20px;
}
div.list>div ul{
	list-style-type: none;
	text-align: left;
	margin:0; padding:0;
}
div.list>div>ul{
	width: 1140px;
	position: relative;
	left: -20px;
}
div.list>div>ul>li{
	display: inline-block;
	vertical-align: middle;
	margin:20px 0 20px 20px; padding:0;
	font-size: 13px;
	position: relative;
}
div.list>div>ul>li>ul>li>a>img{
	width: 258px;
	height: 269px;
	overflow:hidden;
	transform: scale(1.0, 1.0);
	transition: all 1s ease-in-out;
}
div.list>div>ul>li>ul>li{
	width: 258px;
	max-height: 269px;
	overflow:hidden;
}
div.list>div>ul>li>ul>li>a>img:hover{
	transform: scale(1.1, 1.1);
	transition: all 1s ease-in-out;
}
div.list>div>ul>li>ul>li:nth-child(2)>img{
	position:absolute;
	bottom: 40px;
	left: 10px;
}
div.list>div>ul>li>ul>li:nth-child(3)>img{
	position:absolute;
	bottom: 40px;
	left: 60px;
}
div.list>div>ul>li>ul>li>label{
	display:block;
	margin-top:10px;
	text-align: center;
	font-size: 14px;
}
#list_theme{
	display: none;
	padding-top: 40px;
}
	
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
/* 상세분류 */
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

//////////////체크박스////////////////////
function allCheck() {
    if ($("#all").is(':checked')) {
        $(".chk").prop("checked", false);
        $("#all").prop("checked", true);
        $(".list#list_cate *").each(function(){
        	$(this).show();
        });
    }
    else if (!$("#all").is(':checked')) {
    	$(".list#list_cate *").each(function(){
        	$(this).hide();
        });
    }
} 
///////////////////////////////////////////////////

/* 분류 보기 업다운 */
$( document ).ready(function() {
	$(".btn_class img").click(function(){
		var id=$(this).attr("id");
		if(id=="up_btn"){
			$(".btn_class img").attr("src","http://localhost:9000/starbucks/images/list_down_btn.png");
			$(".btn_class img").attr("id","down_btn");
			$(".line").hide();
			$(".chk_class").hide();
		}else{
			$(".btn_class img").attr("src","http://localhost:9000/starbucks/images/list_up_btn.png");
			$(".btn_class img").attr("id","up_btn");
			$(".line").show();
			$(".chk_class").show();
		}
	});
	
	$("#theme").click(function(){
		$("#list_cate").hide();
		$(".show").hide();
		$("#cate_class").hide();
		$("#theme_class").show();
		$("#list_theme").show();
		$("#category").css("background-color","#f4f4f1").css("border-color","#f4f4f1").css("color","#333");
		$("#theme").css("background-color","#006633").css("border-color","#006633").css("color","white");
	});
	$("#category").click(function(){
		$("#list_cate").show();
		$(".show").show();
		$("#list_theme").hide();
		$("#cate_class").show();
		$("#theme_class").hide();
		$("#theme").css("background-color","#f4f4f1").css("border-color","#f4f4f1").css("color","#333");
		$("#category").css("background-color","#006633").css("border-color","#006633").css("color","white");
	});
	
	
	$("#menu_th01").click(function(){
		$("#theme_class>form>ul>li>img").each(function(idx, item){
			$(item).css('border-style','none').css('margin','0');
		});
		$("#menu_th01").css('border','2px solid #006633').css('margin','-2px');
		$("#th_img_list>ul>li").hide();
		$("#th_img_list>ul>li").each(function(idx, item){
			if($(item).attr("id")=="th01"){
				$(item).show();
			}
		});
	});
	$("#menu_th02").click(function(){
		$("#theme_class>form>ul>li>img").each(function(idx, item){
			$(item).css('border-style','none').css('margin','0');
		});
		$("#menu_th02").css('border','2px solid #006633').css('margin','-2px');
		$("#th_img_list>ul>li").hide();
		$("#th_img_list>ul>li").each(function(idx, item){
			if($(item).attr("id")=="th02"){
				$(item).show();
			}
		});
	});
	$("#menu_th03").click(function(){
		$("#theme_class>form>ul>li>img").each(function(idx, item){
			$(item).css('border-style','none').css('margin','0');
		});
		$("#menu_th03").css('border','2px solid #006633').css('margin','-2px');
		$("#th_img_list>ul>li").hide();
		$("#th_img_list>ul>li").each(function(idx, item){
			if($(item).attr("id")=="th03"){
				$(item).show();
			}
		});
	});
	$("#menu_th04").click(function(){
		location.href='https://www.starbucks.co.kr/upload/b2b/co_goods.pdf';
		$("#theme_class>form>ul>li>img").each(function(idx, item){
			$(item).css('border-style','none').css('margin','0');
		});
		$("#menu_th04").css('border','2px solid #006633').css('margin','-2px');
	});
	
	
	/* 상세분류 */
	$("#one, #two").click(function(){
		var check_name = [];
		var list_name = [];
		var item_list = [];
		var i = 0, j = 0;
		$("#cate_class input[type=checkbox]").each(function(idx, item){
			if($(item).is(":checked")==true){
				check_name[i]=$(item).attr("id");/* 체크된 체크박스 이름 */
				i++;
			}
		});
		$("#list_cate>div>ul>li, #list_cate>div.label").hide();
		if($("#one").is(':checked')){
			$("#list_cate ul>li>ul>li").each(function(idx, item){
				if(($(item).children().attr("id")=="mark01")==true){
					item_list[j] = item;
					list_name[j] = $(item).parents("div").eq(0).attr("id").split("_")[0];
					j++;
				}
			});
				for(var k=0;k<list_name.length;k++){
					for(var l=0;l<check_name.length;l++){
						if(check_name[l]=="all"){
							$(item_list[k]).parents("#list_cate ul>li").show();
							$(item_list[k]).parents("#list_cate>div").prev().show();
						}else if(list_name[k]==check_name[l]){
							$(item_list[k]).parents("#list_cate ul>li").show();
							$(item_list[k]).parents("#list_cate>div").prev().show();
						}
					}
				}
		}else if($("#two").is(':checked')){
			$("#list_cate ul>li>ul>li").each(function(idx, item){
				if(($(item).children().attr("id")=="mark02")==true){
					item_list[j] = item;
					list_name[j] = $(item).parents("div").eq(0).attr("id").split("_")[0];
					j++;
				}
			});
				for(var k=0;k<list_name.length;k++){
					for(var l=0;l<check_name.length;l++){
						if(check_name[l]=="all" || list_name[k]==check_name[l]){
							$(item_list[k]).parents("#list_cate ul>li").show();
							$(item_list[k]).parents("#list_cate>div").prev().show();
						}
					}
				}
		}else if($("#one").is(':checked')==false || $("#two").is(':checked')==false){
			$("#list_cate>div>ul>li").show();
			for(var l=0;l<check_name.length;l++){
				var label_name = check_name[l]+"_label";
				if(check_name[l]=="all"){
					$("#list_cate>div>ul>li").parents("#list_cate>div").prev().show();
				}else{
					$("#list_cate>div>ul>li").parents("#list_cate>div").prev().filter("#"+label_name).show();
				}
			}
		}
	});

	$(".chk").change(function(){
		$("#list_cate *").show();
		$("#list_cate ul").hide();
		$("#list_cate table").hide();
		$("#all").prop("checked", false);
		if($("#show_inform").data('clicked')){
			$("#list_cate table").show();
		}else if(!$("#show_inform").data('clicked')){
			$("#list_cate ul").show();
		}
		if($("#mug").is(':checked')){
			$("#mug_label").show();
		}else if(!$("#mug").is(':checked')){
			$("#mug_label").hide();
			$("#mug_list").hide();
		}
		if($("#glass").is(':checked')){
			$("#glass_label").show();
		}else if(!$("#glass").is(':checked')){
			$("#glass_label").hide();
			$("#glass_list").hide();
		}
		if($("#pla").is(':checked')){
			$("#pla_label").show();
		}else if(!$("#pla").is(':checked')){
			$("#pla_label").hide();
			$("#pla_list").hide();
		}
		if($("#stain").is(':checked')){
			$("#stain_label").show();
		}else if(!$("#stain").is(':checked')){
			$("#stain_label").hide();
			$("#stain_list").hide();
		}
		if($("#thermos").is(':checked')){
			$("#thermos_label").show();
		}else if(!$("#thermos").is(':checked')){
			$("#thermos_label").hide();
			$("#thermos_list").hide();
		}
		if($("#acc").is(':checked')){
			$("#acc_label").show();
		}else if(!$("#acc").is(':checked')){
			$("#acc_label").hide();
			$("#acc_list").hide();
		}
		if($("#cof").is(':checked')){
			$("#cof_label").show();
		}else if(!$("#cof").is(':checked')){
			$("#cof_label").hide();
			$("#cof_list").hide();
		}
		if($("#etc").is(':checked')){
			$("#etc_label").show();
		}else if(!$("#etc").is(':checked')){
			$("#etc_label").hide();
			$("#etc_list").hide();
		}
		if($("#pack").is(':checked')){
			$("#pack_label").show();
		}else if(!$("#pack").is(':checked')){
			$("#pack_label").hide();
			$("#pack_list").hide();
		}
		if($("#plan").is(':checked')){
			$("#plan_label").show();
		}else if(!$("#plan").is(':checked')){
			$("#plan_label").hide();
			$("#plan_list").hide();
		}
	});
	
	/***************************
	메뉴바에서 값 가져와 체크박스 체크
	******************************/
	$.urlParam = function(name){
		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		return results[1] || 0;
	}
	if($.urlParam('chk') != "all"){
		$("#all").prop("checked", false);
	}
	
	if($.urlParam('chk') == "mug"){
		$("#mug").prop("checked", true);
	}else if($.urlParam('chk') == "glass"){
		$("#glass").prop("checked", true);
	}else if($.urlParam('chk') == "pla"){
		$("#pla").prop("checked", true);
	}else if($.urlParam('chk') == "stain"){
		$("#stain").prop("checked", true);
	}else if($.urlParam('chk') == "thermos"){
		$("#thermos").prop("checked", true);
	}else if($.urlParam('chk') == "acc"){
		$("#acc").prop("checked", true);
	}else if($.urlParam('chk') == "cof"){
		$("#cof").prop("checked", true);
	}else if($.urlParam('chk') == "pack"){
		$("#pack").prop("checked", true);
	}else if($.urlParam('chk') == "plan"){
		$("#plan").prop("checked", true);
	}

	if($("#show_inform").data('clicked')){
		$("#list_cate table").show();
	}else if(!$("#show_inform").data('clicked')){
		$("#list_cate ul").show();
	}
	if($("#mug").is(':checked')){
		$("#mug_label").show();
	}else if(!$("#mug").is(':checked')){
		$("#mug_label").hide();
		$("#mug_list").hide();
	}
	if($("#glass").is(':checked')){
		$("#glass_label").show();
	}else if(!$("#glass").is(':checked')){
		$("#glass_label").hide();
		$("#glass_list").hide();
	}
	if($("#pla").is(':checked')){
		$("#pla_label").show();
	}else if(!$("#pla").is(':checked')){
		$("#pla_label").hide();
		$("#pla_list").hide();
	}
	if($("#stain").is(':checked')){
		$("#stain_label").show();
	}else if(!$("#stain").is(':checked')){
		$("#stain_label").hide();
		$("#stain_list").hide();
	}
	if($("#thermos").is(':checked')){
		$("#thermos_label").show();
	}else if(!$("#thermos").is(':checked')){
		$("#thermos_label").hide();
		$("#thermos_list").hide();
	}
	if($("#acc").is(':checked')){
		$("#acc_label").show();
	}else if(!$("#acc").is(':checked')){
		$("#acc_label").hide();
		$("#acc_list").hide();
	}
	if($("#cof").is(':checked')){
		$("#cof_label").show();
	}else if(!$("#cof").is(':checked')){
		$("#cof_label").hide();
		$("#cof_list").hide();
	}
	if($("#etc").is(':checked')){
		$("#etc_label").show();
	}else if(!$("#etc").is(':checked')){
		$("#etc_label").hide();
		$("#etc_list").hide();
	}
	if($("#pack").is(':checked')){
		$("#pack_label").show();
	}else if(!$("#pack").is(':checked')){
		$("#pack_label").hide();
		$("#pack_list").hide();
	}
	if($("#plan").is(':checked')){
		$("#plan_label").show();
	}else if(!$("#plan").is(':checked')){
		$("#plan_label").hide();
		$("#plan_list").hide();
	}
	
});
</script>
</head>
<body>
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	<div class="product">
		<!-- 상품 -->
		<div>
			<div>
				<h2>
					<img src="http://localhost:9000/starbucks/images/menu_tit7.jpg">
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
					<li>
						<img class="arrow" src="http://localhost:9000/starbucks/images/icon_arrow.png">
					</li>
					<li>
						<a href="#">상품</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="content">
			<!-- 분류 -->
			<div class="class">
				<div class="btn_class">
					<p>분류 보기</p>
					<img src="http://localhost:9000/starbucks/images/list_up_btn.png" id="up_btn">
				</div>
				<div class="line"></div>
				<div class="chk_class">
					<!-- 카테고리 테마 -->
					<div class="cate">
						<button type="button" class="btn_style" id="category">카테고리</button>
						<button type="button" class="btn_style" id="theme">테마</button>
					</div>
					<!-- 상품분류 -->
					<div id="cate_class">
						<form method="post">
							<ul>
								<li>
									<input type="checkbox" id="all" checked="checked" onclick="allCheck()">
									<label for="all">전체 상품보기</label>
								</li>
								<li>
									<input type="checkbox" id="mug" class="chk"  onclick="checkboxCheck()">
									<label for="mug">머그</label>
								</li>
								<li>
									<input type="checkbox" id="glass" class="chk"  onclick="checkboxCheck()">
									<label for="glass">글라스</label>
								</li>
								<li>
									<input type="checkbox" id="pla" class="chk"  onclick="checkboxCheck()">
									<label for="pla">플라스틱 텀블러</label>
								</li>
								<li>
									<input type="checkbox" id="stain" class="chk"  onclick="checkboxCheck()">
									<label for="stain">스테인리스 텀블러</label>
								</li>
								<li>
									<input type="checkbox" id="thermos" class="chk"  onclick="checkboxCheck()">
									<label for="thermos">보온병</label>
								</li>
								<li>
									<input type="checkbox" id="acc" class="chk"  onclick="checkboxCheck()">
									<label for="acc">액세서리</label>
								</li>
								<li>
									<input type="checkbox" id="cof" class="chk"  onclick="checkboxCheck()">
									<label for="cof">커피 용품</label>
								</li>
								<li>
									<input type="checkbox" id="pack" class="chk"  onclick="checkboxCheck()">
									<label for="pack">패키지 티(티바나)</label>
								</li>
								<li>
									<input type="checkbox" id="plan" class="chk"  onclick="checkboxCheck()">
									<label for="plan">스타벅스 플래너</label>
								</li>
							</ul>
						</form>
					</div>
					<div id="theme_class">
						<form method="post">
							<ul>
								<li>
									<img src="http://localhost:9000/starbucks/images/menu_th01.jpg" id="menu_th01">
								</li>
								<li>
									<img src="http://localhost:9000/starbucks/images/menu_th06.jpg" id="menu_th02">
								</li>
								<li>
									<img src="http://localhost:9000/starbucks/images/menu_th07.png" id="menu_th03">
								</li>
								<li>
									<img src="http://localhost:9000/starbucks/images/menu_th08.jpg" id="menu_th04">
								</li>
							</ul>
						</form>
					</div>
					<!-- 상품분류 끝 -->
				</div>
			</div>
			<!-- 분류 끝 -->
			<div>
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
					        <input type="checkbox" id="one" /><label for="one"><img src="http://localhost:9000/starbucks/images/mark01.png" width="21px" height="21px"><span>신규 출시된 메뉴</span></label></label>
					      <label class="chk_drop">
					        <input type="checkbox" id="two" /><label for="two"><img src="http://localhost:9000/starbucks/images/mark02.png" width="21px" height="21px"><span>한정기간 출시되는 시즌성 메뉴</span></label></label>
					    </div>
					  </div>
					</form>
				</div>
				<!-- 상세분류 끝 -->
				<!-- 이미지 리스트 -->
				<div class="list" id="list_cate">
					<!-- 라벨 -->
					<% for(int i=0;i<l_list.length;i++){ %>
					<div class="label" id="<%= e_list[i] %>_label">
						<span class="list_label"><%= l_list[i] %></span>
					</div>
					<!-- 이미지 -->
					<div id="<%= e_list[i] %>_list">
						<ul>
							<% for(menuVO vo : list){ %>
							<% if(vo.getP_type().equals(l_list[i])){ %>
							<li>
								<ul>
									<li><a href="menu_detail.jsp?mid=<%=vo.getMid()%>"><img src="http://localhost:9000/starbucks/images/<%= vo.getImg() %>.jpg"></a></li>
									<% if(vo.getM_new()!=null || vo.getLimit()!=null){ %>
										<li><img src="http://localhost:9000/starbucks/images/mark01.png" id="mark01"></li>
										<% } %>
										<% if(vo.getLimit()!=null&&vo.getLimit().equals("limit")){  %>
										<li><img src="http://localhost:9000/starbucks/images/mark02.png" id="mark02"></li>
										<% } %>
									<li><label><%=vo.getK_name() %></label></li>
								</ul>
							</li>
							<% } %>
							<% } %>
						</ul>
					</div>
					<% } %>
					<!-- 콜드브루 끝 -->
				</div><!-- 카테고리 -->
				<!-- 테마 -->
				<div class="list" id="list_theme">
					<!--이미지 -->
					<div id="th_img_list">
						<ul>
							<% for(menuVO vo : list){ %>
							<% if(vo.getTheme() != null){ %>
							<li id=<%= vo.getTheme() %>>
								<ul>
									<li><a href="menu_detail.jsp?mid=<%=vo.getMid()%>"><img src="http://localhost:9000/starbucks/images/<%= vo.getImg() %>.jpg"></a></li>
									<li><label><%=vo.getK_name() %></label></li>
								</ul>
							</li>
							<% } %>
							<% } %>
						</ul>
					</div>
					<!-- 이미지 끝 -->
				</div><!--테마 -->
			
			</div>
		</div>
		
	</div>
	<!--  footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>