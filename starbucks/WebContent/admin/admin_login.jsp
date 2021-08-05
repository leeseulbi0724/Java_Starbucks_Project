<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
 body { overflow: hidden; text-align:center; background-color:black; position:relative; top:300px; }
 div.title {
 	border-left:7px solid white;
 	display:inline-block; font-size:30px; padding-left:10px; color:white;
 }
 li { list-style-type:none; color:white; }
 input { width:200px; text-align:center; margin-left:-40px; border-radius:3px; }
 button { 
 text-decoration:none; background-color:white; margin:20px 35px 0 0; display:inline-block; padding:2px 20px 2px 20px; color:black;
 border-radius:5px; font-size:13px; font-weight:bold; cursor:pointer;
 } 
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
	 $(document).ready(function() {
		 $("#loginBtn").click(function() {
			 if ( $("#id").val() == "") {
				 alert("아이디를 입력해주세요");
				 $("#id").focus();
				 return false;
			 } else if ( $("#pass").val() == "") {
				 alert("패스워드를 입력해주세요");
				 $("#pass").focus();
				 return false;
			 } else if ( $("#id").val() != "admin" || $("#pass").val() != "1234") {
				 alert("로그인 실패하셨습니다!");
				 $("#id").val("").focus(); $("#pass").val("");				 
				 return false;
			 } else {
				 alert("로그인 성공하셨습니다!");
				 location.replace("http://localhost:9000/starbucks/admin/user/admin_user.jsp");
			 }
		 });
	 });
</script>
</head>
<body>
		<div><a href="http://localhost:9000/starbucks/index.jsp"><img src="http://localhost:9000/starbucks/images/icon_home_white.png"></a></div>
		<div class="title">관리자 로그인</div>
		<ul>
			<li>
				<input type="text" name="id" placeholder="아이디를 입력해 주세요."  id="id">
			</li>
			<li>
				<input type="password" name="pass" placeholder="패스워드를 입력해 주세요."  id="pass">
			</li>
			<li><button type="button" id="loginBtn">로그인</button></li>
		</ul>
</body>
</html>