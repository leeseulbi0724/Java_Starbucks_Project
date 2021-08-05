<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
		    margin: 0;
		    padding: 0;
		    border: 0;
		    font-size: 100%;
		    vertical-align: baseline;
		    background: transparent;
		}
		.title { width:100%; height:50px; color:white; font-size:22px; background-color:rgb(28,27,32); font-weight:bold; line-height:50px; }
		.title button { 
			font-size:13px; text-decoration:none; color:rgb(146,42,70); 
			float:right; position:relative; right:20px; top:15px;
			background-color:rgb(28,27,32); border:1px solid rgb(28,27,32);
			cursor:pointer;
		}
		.title button:hover { text-decoration:underline; }
		.menu { list-style-type:none; background-color:rgb(57,58,63); text-align:left; padding:10px; margin:0; clear:left; }
		.menu li { display:inline-block; }
		.menu li button { display:inline-block; background-color:rgb(57,58,63); color:white; font-size:14px; cursor:pointer; margin:0; }
		.menu li button:hover { color:rgb(223,91,89); text-decoration:underline; }
		
		span { cursor:pointer; }
		span:hover { text-decoration:underline; }
</style>
<script src="http://localhost:9000/starbucks/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#logoutBtn").click(function() {
			var result = confirm('정말 로그아웃하시겠습니까?');
			if (result) {
				location.replace("http://localhost:9000/starbucks/admin/admin_login.jsp");
			}
		});
		
		$(".menu li").click(function() {		
			var name = $(this).attr("name");
			if (name == "user") {
				location.replace("http://localhost:9000/starbucks/admin/user/admin_user.jsp");
			} else if (name == "notice") {
				location.replace("http://localhost:9000/starbucks/admin/notice/admin_notice.jsp");
			} else if (name == "question") {
				location.replace("http://localhost:9000/starbucks/admin/question/admin_question.jsp");
			} else if (name == "menu") {
				location.replace("http://localhost:9000/starbucks/admin/menu/admin_menu_main.jsp");
			} else if (name=="coffee") {
				location.replace("http://localhost:9000/starbucks/admin/coffee/admin_coffee_main.jsp");
			}
		});
	});
</script>
</head>
<body>
<div class="title">　관리자 페이지<button type="button" id="logoutBtn">로그아웃</button></div>
<ul class="menu">
	<li id="li" name="user"><button type="button" class="user">회원 관리</button></li>
	<li id="li" name="notice"><button type="button" class="notice">공지사항 관리</button></li>
	<li id="li" name="question"><button type="button" class="question">문의 관리</button></li>
	<li id="li" name="menu"><button type="button" class="menu2">메뉴 관리</button></li>
	<li id="li" name="coffee"><button type="button" class="menu2">커피 관리</button></li>
</ul>
</body>
</html>