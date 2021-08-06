<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.vo.*, com.starbucks.dao.*, java.util.*" %>
<%
	String[] l_list = {"콜드 브루 커피","브루드 커피","에스프레소","프라푸치노","블렌디드","스타벅스 피지오","티(티바나)","기타 제조 음료","스타벅스 주스(병음료)"};
	String[] e_list = {"coldbrew","brood","esp","fra","blended","fizzo","tea","etc","juice"};
	menuDAO dao = new menuDAO();
	ArrayList<menuVO> list = dao.getDrinkList();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>음료 | Starbucks Coffee Korea</title>
<style>
div.drink{
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
div.class span{
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
#theme_class img:hover{
	cursor: pointer;
}
/* 상세분류 */
div.content>div>div.show{
	text-align: left;
	padding:20px 0;
	position: relative;
}
div.show>p>img{
	margin-right: 3px;
}
div.show>p{
	font-size: 12px;
}
div.content>div>div>p{
	border:1px solid #666;
	background-color: #666;
	color:white;
	font-size: 13px;
	padding: 5px;
	border-radius: 3px;
	display: inline-block;
	text-decoration: none;
	margin-right: 10px;
}
div.content>div>div>p:nth-child(2) {
	border: 1px solid lightgray;
	background-color: white;
	color:#333;
}
div.content>div>div>p:hover{
	text-decoration: underline;
	cursor: pointer;
}
/* 상세분류 드롭다운*/
.multiselect {
	width: 250px;
	position: absolute;
	right: 0;
	top:20px;
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
	border-top-style: none;
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
	padding: 10px 0;
	vertical-align: middle;
	text-align: left;
}
span.list_label{
	font-size: 17px;
	font-weight: bold;
	padding: 0 10px 0 20px;
}
span.list_label2{
	font-size: 11px;
}
div.list>div:nth-child(even){
	margin-bottom: 60px;
}
div.list>div>img {
	width: 45px;
	height: 36px;
	vertical-align: middle;
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
	margin:20px 0 20px 20px; 
	padding:0;
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
table.tb{
	width:100%;
	border-collapse: collapse;
	display: none;
	margin: 20px 0 60px 0;
}
table th:first-child, table td:first-child{
	width:17%;
}
table th{
	border-top: 1px solid #333;
	border-bottom: 1px solid #333;
	padding: 16px 0;
	width: 14%;
	font-size: 14px;
}
table td{
	color: #666;
	padding: 16px 0;
	border-bottom: 1px solid lightgray;
	width: 14%;
	font-size: 14px;
	text-align: center;
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
        $("#list_cate *").show();
        $("#list_cate ul").hide();
        $("#list_cate table").hide();
    }
    else if (!$("#all").is(':checked')) {
    	$("#list_cate *").hide();
    }
    if($("#show_inform").data('clicked')){
		$("#list_cate table").show();
	}else if(!$("#show_inform").data('clicked')){
		$("#list_cate ul").show();
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
	$("#show_inform").data('clicked',false);
	$("#show_img").click(function(){
		$(".show form").show();
		$("#list_cate ul").show();
		$("table").hide();
		$("#show_inform").data('clicked',false);
		$("#show_img").css("background","#666").css("border-color","#666").css("color","white");
		$("#show_inform").css("background","white").css("border-color","lightgray").css("color","#333");
		$("#show_img img").attr("src","http://localhost:9000/starbucks/images/icon_pic_on.png");
		$("#show_inform img").attr("src","http://localhost:9000/starbucks/images/icon_ante.png");
	});
	$("#show_inform").click(function(){
		$(".show form").hide();
		$("#list_cate ul").hide();
		$("table").show();
		$(this).data('clicked',true);
		$("#show_inform").css("background","#666").css("border-color","#666").css("color","white");
		$("#show_img").css("background","white").css("border-color","lightgray").css("color","#333");
		$("#show_img img").attr("src","http://localhost:9000/starbucks/images/icon_pic.png");
		$("#show_inform img").attr("src","http://localhost:9000/starbucks/images/icon_ante_on.png");
	});
	$("#menu_th01").click(function(){
		$("#menu_th01").css('border','2px solid #006633').css('margin','-2px');
		$("#th_img_list>ul>li").hide();
		$("#th_img_list>ul>li").each(function(idx, item){
			if($(item).attr("id")=="th01"){
				$(item).show();
			}
		});
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
		if($("#coldbrew").is(':checked')){
			$("#coldbrew_label").show();
		}else if(!$("#coldbrew").is(':checked')){
			$("#coldbrew_label").hide();
			$("#coldbrew_list").hide();
		}
		if($("#brood").is(':checked')){
			$("#brood_label").show();
		}else if(!$("#brood").is(':checked')){
			$("#brood_label").hide();
			$("#brood_list").hide();
		}
		if($("#esp").is(':checked')){
			$("#esp_label").show();
		}else if(!$("#esp").is(':checked')){
			$("#esp_label").hide();
			$("#esp_list").hide();
		}
		if($("#fra").is(':checked')){
			$("#fra_label").show();
		}else if(!$("#fra").is(':checked')){
			$("#fra_label").hide();
			$("#fra_list").hide();
		}
		if($("#blended").is(':checked')){
			$("#blended_label").show();
		}else if(!$("#blended").is(':checked')){
			$("#blended_label").hide();
			$("#blended_list").hide();
		}
		if($("#fizzo").is(':checked')){
			$("#fizzo_label").show();
		}else if(!$("#fizzo").is(':checked')){
			$("#fizzo_label").hide();
			$("#fizzo_list").hide();
		}
		if($("#tea").is(':checked')){
			$("#tea_label").show();
		}else if(!$("#tea").is(':checked')){
			$("#tea_label").hide();
			$("#tea_list").hide();
		}
		if($("#etc").is(':checked')){
			$("#etc_label").show();
		}else if(!$("#etc").is(':checked')){
			$("#etc_label").hide();
			$("#etc_list").hide();
		}
		if($("#juice").is(':checked')){
			$("#juice_label").show();
		}else if(!$("#juice").is(':checked')){
			$("#juice_label").hide();
			$("#juice_list").hide();
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
	
	if($.urlParam('chk') == "coldbrew"){
		$("#coldbrew").prop("checked", true);
	}else if($.urlParam('chk') == "brood"){
		$("#brood").prop("checked", true);
	}else if($.urlParam('chk') == "esp"){
		$("#esp").prop("checked", true);
	}else if($.urlParam('chk') == "fra"){
		$("#fra").prop("checked", true);
	}else if($.urlParam('chk') == "blended"){
		$("#blended").prop("checked", true);
	}else if($.urlParam('chk') == "fizzo"){
		$("#fizzo").prop("checked", true);
	}else if($.urlParam('chk') == "tea"){
		$("#tea").prop("checked", true);
	}else if($.urlParam('chk') == "etc"){
		$("#etc").prop("checked", true);
	}else if($.urlParam('chk') == "juice"){
		$("#juice").prop("checked", true);
	}
	if($("#show_inform").data('clicked')){
		$("#list_cate table").show();
	}else if(!$("#show_inform").data('clicked')){
		$("#list_cate ul").show();
	}
	if($("#coldbrew").is(':checked')){
		$("#coldbrew_label").show();
	}else if(!$("#coldbrew").is(':checked')){
		$("#coldbrew_label").hide();
		$("#coldbrew_list").hide();
	}
	if($("#brood").is(':checked')){
		$("#brood_label").show();
	}else if(!$("#brood").is(':checked')){
		$("#brood_label").hide();
		$("#brood_list").hide();
	}
	if($("#esp").is(':checked')){
		$("#esp_label").show();
	}else if(!$("#esp").is(':checked')){
		$("#esp_label").hide();
		$("#esp_list").hide();
	}
	if($("#fra").is(':checked')){
		$("#fra_label").show();
	}else if(!$("#fra").is(':checked')){
		$("#fra_label").hide();
		$("#fra_list").hide();
	}
	if($("#blended").is(':checked')){
		$("#blended_label").show();
	}else if(!$("#blended").is(':checked')){
		$("#blended_label").hide();
		$("#blended_list").hide();
	}
	if($("#fizzo").is(':checked')){
		$("#fizzo_label").show();
	}else if(!$("#fizzo").is(':checked')){
		$("#fizzo_label").hide();
		$("#fizzo_list").hide();
	}
	if($("#tea").is(':checked')){
		$("#tea_label").show();
	}else if(!$("#tea").is(':checked')){
		$("#tea_label").hide();
		$("#tea_list").hide();
	}
	if($("#etc").is(':checked')){
		$("#etc_label").show();
	}else if(!$("#etc").is(':checked')){
		$("#etc_label").hide();
		$("#etc_list").hide();
	}
	if($("#juice").is(':checked')){
		$("#juice_label").show();
	}else if(!$("#juice").is(':checked')){
		$("#juice_label").hide();
		$("#juice_list").hide();
	}
	
});
</script>
</head>
<body>
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	<div class="drink">
		<!-- 음료 -->
		<div>
			<div>
				<h2>
					<img src="http://localhost:9000/starbucks/images/menu_tit1.jpg">
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
						<a href="#">음료</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="content">
			<!-- 분류 -->
			<div class="class">
				<div class="btn_class">
					<span>분류 보기</span>
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
									<input type="checkbox" id="coldbrew" class="chk">
									<label for="coldbrew">콜드 브루 커피</label>
								</li>
								<li>
									<input type="checkbox" id="brood" class="chk">
									<label for="brood">브루드 커피</label>
								</li>
								<li>
									<input type="checkbox" id="esp" class="chk">
									<label for="esp">에스프레소</label>
								</li>
								<li>
									<input type="checkbox" id="fra" class="chk">
									<label for="fra">프라푸치노</label>
								</li>
								<li>
									<input type="checkbox" id="blended" class="chk">
									<label for="blended">블렌디드</label>
								</li>
								<li>
									<input type="checkbox" id="fizzo" class="chk">
									<label for="fizzo">스타벅스 피지오</label>
								</li>
								<li>
									<input type="checkbox" id="tea" class="chk">
									<label for="tea">티(티바나)</label>
								</li>
								<li>
									<input type="checkbox" id="etc" class="chk">
									<label for="etc">기타 제조 음료</label>
								</li>
								<li>
									<input type="checkbox" id="juice" class="chk">
									<label for="juice">스타벅스 주스(병음료)</label>
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
					<p id="show_img"><img src="http://localhost:9000/starbucks/images/icon_pic_on.png"><span>사진으로 보기</span></p>
					<p id="show_inform"><img src="http://localhost:9000/starbucks/images/icon_ante.png"><span>영양정보로 보기</span></p>
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
					        <input type="checkbox" id="one"/><label for="one"><img src="http://localhost:9000/starbucks/images/mark01.png" width="21px" height="21px"><span>신규 출시된 메뉴</span></label></label>
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
						<img src="http://localhost:9000/starbucks/images/logo_decaf.png">
					<% if(l_list[i].equals("에스프레소")){ %>
						<span class="list_label2">디카페인 에스프레소 샷 선택 가능 (일부 음료 제외)</span>
					<% }else{ %>
						<span class="list_label2">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span>
					<% } %>
					</div>
					<!-- 이미지 -->
					<div id="<%= e_list[i] %>_list">
						<ul>
							<% for(menuVO vo : list){ %>
							<% if(vo.getP_type().equals(l_list[i])){ %>
							<li>
								<ul>
									<li><a href="menu_detail.jsp?mid=<%=vo.getMid()%>"><img src="http://localhost:9000/starbucks/images/<%= vo.getImg() %>.jpg"></a></li>
									<% if(vo.getM_new()!=null){ %>
										<li><img src="http://localhost:9000/starbucks/images/mark01.png" id="mark01"></li>
										<% } %>
										<% if(vo.getLimit()!=null){  %>
										<li><img src="http://localhost:9000/starbucks/images/mark02.png" id="mark02"></li>
										<% } %>
									<li><label><%=vo.getK_name() %></label></li>
								</ul>
							</li>
							<% } %>
							<% } %>
						</ul>
						<table border=1 class="tb">
							<tr>
								<th>메뉴</th>
								<th>칼로리(Kcal)</th>
								<th>당류(g)</th>
								<th>단백질(g)</th>
								<th>나트륨(mg)</th>
								<th>포화지방(g)</th>
								<th>카페인(mg)</th>
							</tr>
							<% for(menuVO vo : list){ %>
							<% if(vo.getP_type().equals(l_list[i])){ %>
							<tr>
								<td><%=vo.getK_name() %></td>
								<td><%=vo.getKcal() %></td>
								<td><%=vo.getSugar() %></td>
								<td><%=vo.getProtein() %></td>
								<td><%=vo.getNa() %></td>
								<td><%=vo.getFat() %></td>
								<td><%=vo.getCaffeine() %></td>
							</tr>
							<% } %>
							<% } %>
						</table>
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