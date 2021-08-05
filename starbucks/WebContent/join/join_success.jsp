<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
</head>
<style>
	section { text-align:center; padding:200px; }
	section div { display:inline-block; }
	section div:nth-child(2) { border-left:1px solid lightgray; width:1px; height:130px; margin:0 30px 0 30px; }
	section div:last-child { text-align:left; padding:5px; }
	section div:last-child>p:first-child { font-weight:bold; font-size:23px; position:relative; bottom:57px; }
	section div:last-child>p:nth-child(2) { font-size:14px; position:relative; bottom:20px; margin-top:10px; }
	section div:last-child a {  color:white; text-decoration:none; padding:7px 15px 7px 15px; font-size:12px; font-weight:bold; border-radius:4px; }
	section div:last-child a { background-color:rgb(34,34,34); }
	section div:last-child a:hover { text-decoration:underline; }
	.didi{ margin-right: 5px;}
	
</style>
<body>
<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	
	<!--  content -->
	<section>
		<div style="margin-top:100px;"><img src="http://localhost:9000/starbucks/images/icon_com_lock.png"></div>
		<div></div>
		<div style="margin-bottom:150px;"><p><span class="didi" style="color:green">회원가입</span>이 완료되었습니다.</p>
		<strong></strong>
		<div class= "last">
		<a href="http://localhost:9000/starbucks/login/login.jsp">로그인</a>
		</div>
	</section>
	<!--  footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>