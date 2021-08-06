<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>Starbucks Coffee Korea</title>
<script>
function form_check(){
	if(!document.find_form.name.value){
		alert("이름을 입력해 주세요.");
		return;
	}
	else if(!document.find_form.birth.value){
		alert("생년월일을 입력해 주세요.");
		document.find_form.birth.focus();
		return;
	}else if(!document.find_form.gender.value){
		alert("성별을 입력해 주세요")
		document.find_form.gender.focus();
		return;
	}else if(!document.find_form.phone.value){
		alert("핸드폰 번호를 입력해 주세요");
		document.find_form.phone.focus();
		return;
	}
	document.find_form.submit();
}
</script>
<style>
/* 아이디 찾기, 비밀번호 찾기 */
section.find {
	padding-bottom: 50px;
}
section.find .title{
	text-align: center;
	margin: 61px 0 30px 0;
	font-size: 28px;
	font-weight: normal;
	font-weight:bold;
}
section.find .content_layout{
	background-color:white;
	width: 570px;
	text-align: center;
	margin:auto;
}
section.find img{
	margin: 30px 0 22px 0;
	width: 205px;
	height: auto;
}
section.find ul{
	width: 100%;
	list-style-type: none;
	margin: 0;
	padding: 0;
}
section.find div:first-child{
	border: 1px solid lightgray;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	padding-bottom: 31px;
}
section.find div:nth-child(2){
	padding: 25px 0 20px 0;
	border: 1px solid lightgray;
	border-top: none;
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
}
section.find ul>li>span.span1 {
	font-size: 22px;
	display: inline-block;
	margin-bottom: 17px;
}
section.find ul>li>span.span2 {
	font-size: 17px;
	display: inline-block;
}
section.find div:nth-child(2)>ul>li{
	font-size: 12px;
}
section.find span.span3{
	margin: 0 20px;
	text-align:left;
	width: 86%;
	display: inline-block;
	font-size: 18px;
	font-weight: bold;
	float:left;
}
section.find div:nth-child(2)>ul>li:nth-child(2)>input,
section.find div:nth-child(2)>ul>li:nth-child(6)>input
{
	width: 84.5%;
	height: 57px;
	text-align: left;
	border: 1px solid lightgray;
	border-radius: 3px;
	padding: 0 18px;
	margin: 19px 10px 25px 2px;
	font-size: 14px;
}
section.find div:nth-child(2)>ul>li:nth-child(4)>input:first-child {
	width: 54%;
	height: 57px;
	text-align: left;
	border: 1px solid lightgray;
	border-radius: 3px;
	padding: 3px 18px;
	margin: 20px 0;
	font-size: 14px;
}
section.find div:nth-child(2)>ul>li:nth-child(4)>input:last-child{
	text-align: center;
	border: 1px solid lightgray;
	border-radius: 3px;
	width: 1%;
	height: 57px;
	padding: 3px 18px;
	margin: 20px 0;
	font-size: 14px;
}
section.find span.span4{
	background:#333;
	display: inline-block;
	font-size: 15px;
	margin: 0 5px 0 10px;
	height: 1px;
	line-height: 0;
	padding: 0;
	width:20px;
}

section.find .btn_style{
	border-radius:3px;
	font-size: 22px;
	color:white;
	width: 47.92%;
	padding:22px 0;
	background-color: #656565;
	border:1px solid #656565;
}
section.find div:last-child>button {
	background-color: #161616;
	border:1px solid #161616;
	margin-left: 18px;
}
section.find div:last-child{
	margin-top: 30px;
}
section.find button:hover{
	cursor: pointer;
	text-decoration: underline;
}
</script>
</style>
 
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<!-- 아이디 찾기 -->
<div>
	<section class="find">
		<h1 class="title">아이디 찾기</h1>
		<form class="content_layout" name="find_form" action="find_id_process.jsp" method="post">
			<div>
				<ul>
					<li>
						<img src="http://localhost:9000/starbucks/images/icon_find_sally.png" width="245px" height="auto">
					</li>
					<li>
						<span class="span1">아이디가 기억나지 않으세요?</span>
					</li>
					<li>
						<span class="span2">아래 인증을 통해 아이디를 확인 하실 수 있습니다.</span>
					</li>
				</ul>
			</div>
			<div>
				<ul>
					<li>
						<span class="span3">이름</span>
					</li>
					<li>
         				<input type="text" name="name" placeholder="이름" title="이름" autofocus>
					</li>
					<li>
						<span class="span3">생년월일/성별</span>
					</li>
					<li>
         				<input type="text" name="birth" placeholder="* * * * * *" title="생년월일입력" maxlength="6"><span class="span4"></span>
         				<input type="text" name="gender" placeholder="*" title="주민등록번호 7번째 자리" maxlength="1"> ● ● ● ● ● ●
					</li>
					<li>
						<span class="span3">휴대폰번호</span>
					</li>
					<li>
         				<input type="text" name="phone" title="휴대폰번호 '-' 없이  숫자만 입력" placeholder="'-' 없이 숫자만 입력" maxlength="11">
					</li>
				</ul>
			</div>
			<div>
      			<a href="login.jsp"><button type="button" class="btn_style">취소</button></a>
				<button type="button" class="btn_style" onclick="form_check()">확인</button>
			</div>
		</form>
	</section>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>