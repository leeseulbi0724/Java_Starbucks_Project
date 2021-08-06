<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>Starbucks Coffee Korea</title>
<style>
/* 비밀번호 찾기 - 비밀번호 변경 */
section.reset_pass {
	padding-bottom: 50px;
}
section.reset_pass .title{
	text-align: center;
	margin: 61px 0 30px 0;
	font-size: 28px;
	font-weight: normal;
}
section.reset_pass .content_layout{
	background-color:white;
	width: 570px;
	text-align: center;
	margin:auto;
}
section.reset_pass img{
	margin: 30px 0 22px 0;
	width: 205px;
	height: auto;
}
section.reset_pass div:first-child {
	border: 1px solid lightgray;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	padding-bottom: 31px;
}
section.reset_pass ul>li>span.span1 {
	font-size: 22px;
	display: inline-block;
	margin-bottom: 17px;
}
section.reset_pass ul>li>span.span2 {
	font-size: 17px;
	display: inline-block;
}
section.reset_pass .btn_style{
	border-radius:3px;
	font-size: 22px;
	color:white;
	width: 47.92%;
	padding:22px 0;
	background-color: #656565;
	border:1px solid #656565;
}
section.reset_pass div:last-child>button {
	background-color: #161616;
	border:1px solid #161616;
	margin-left: 18px;
}
section.reset_pass div:last-child{
	margin-top: 30px;
}
section.reset_pass ul{
	width: 100%;
	list-style-type: none;
	margin: 0;
	padding: 0;
}
section.reset_pass div:nth-child(2)>ul>li{
	font-size: 13px;
}
section.reset_pass span.span3{
	margin: 0 20px;
	text-align:left;
	width: 86%;
	display: inline-block;
	font-size: 18px;
	font-weight: bold;
	float:left;
}
section.reset_pass span.vali{
	display: inline-block;
	font-size: 14px;
	text-align: left;
	margin: 13.5px 20px 3px 20px;
	color:red;
	width: 93%;
}
section.reset_pass input{
	width: 84.5%;
	height: 57px;
	text-align: left;
	border: 1px solid lightgray;
	border-radius: 3px;
	padding: 0 20px;
	margin: 18px 10px 0.5px 2px;
	font-size: 14px;
}
section.reset_pass input#pass{
	border: 1px solid red;
}
section.reset_pass div:nth-child(2)>ul>li:nth-child(3)>span{
	margin-top: 49px;
}
section.reset_pass div:nth-child(2) {
	padding: 26px 0 24px 0;
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
section.reset_pass div:nth-child(3) {
	clear:left;
	padding: 25px 0 30px 0;
	border: 1px solid lightgray;
	border-top: none;
	border-bottom-left-radius: 4px;
	border-bottom-right-radius: 4px;
	background-color: #f4f4f2;
}
section.reset_pass div:nth-child(3)>ul>li:first-child{
	font-size: 15px;
	font-weight: bold;
	margin: 0 45px 20px 20px;
}
section.reset_pass div:nth-child(3)>ul>li{
	width: 88%;
	padding: 0;
	text-align: left;
}
section.reset_pass div:nth-child(3)>ul>li.guide{
	list-style-type: square;
	margin: 0 40px;
	line-height: 24px;
	color: gray;
	font-size: 14px;
}
section.reset_pass button:hover{
	cursor: pointer;
	text-decoration: underline;
}
section.reset_pass input#pass:nth-child(1){
	border:1px solid red;
}

</style> 

<script>
	function form_check(){
		var pass = document.getElementById('pass');
		var pass_valid = document.getElementById('pwd');
		var chk_pass = document.getElementById('chk_pass');
		var chk_pass_valid = document.getElementById('pwd_check');
		
		if(chk_pass.value){
			if(chk_pass.value != pass.value){
				chk_pass_valid.innerHTML='일치하지 않습니다.';
				return;
			}
			else{
				chk_pass_valid.innerHTML='';
			}
		}
		else if(!chk_pass.value){
			chk_pass_valid.innerHTML='';
		}
		if(!pass.value){//1
			pass_valid.innerHTML='비밀번호를 입력하세요.';
            return;
		}//if//1
		else if(pass.value){//2
			pass.style.borderColor='lightgray';
			if(!(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/.test(pass.value))){ //3
				if(!/[0-9]/.test(pass.value) || !/[a-zA-Z]/.test(pass.value) || (pass.value.length<10)){//4
					pass_valid.innerHTML='영문/숫자/특수기호를 혼합하여 8자 이상 입력하거나, 영문/숫자를 혼합하여 10자 이상 입력하세요.';
		            return;
				}//else if - if - if//4
				else {//5
					pass_valid.innerHTML='';
		            return;
				}//else if - if - else //5
			}//else if - if //3
			else{//6
				if(!/[0-9]/.test(pass.value) || !/[a-zA-Z]/.test(pass.value) || (pass.value.length<8)){//7
					pass_valid.innerHTML='영문/숫자/특수기호를 혼합하여 8자 이상 입력하거나, 영문/숫자를 혼합하여 10자 이상 입력하세요.';
		            return;
				}//else if - if - if//7
				else {//8
					pass_valid.innerHTML='';
		            return;
				}//else if - if - else //8
			}//else if - else//6
		}//else if//2
		
		
		/* else if(!chk_pass.value){
			chk_pass_valid.innerHTML='';
			return;
		} */
		document.reset_pass_form.submit();
	}//function 
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<!-- 아이디 찾기 -->
<div>
	<section class="reset_pass">
		<h1 class="title">비밀번호 찾기</h1>
		<form class="content_layout" name="reset_pass_form" action="#" method="post">
			<div>
				<ul>
					<li>
						<img src="http://localhost:9000/starbucks/images/icon_find_sally.png" width="245px" height="auto">
					</li>
					<li>
						<span class="span1">회원님의 비밀번호를 변경합니다.</span>
					</li>
					<li>
						<span class="span2">새로 사용할 비밀번호를 등록해주세요.</span>
					</li>
				</ul>
			</div>
			<div>
				<ul>
					<li>
						<span class="span3">새 비밀번호</span>
					</li>
					<li>
         				<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해 주세요." onblur="form_check()" maxlength="20">
         				<span id="pwd" class="vali"></span>
					</li>
					<li>
						<span class="span3">새 비밀번호 확인</span>
					</li>
					<li>
         				<input type="password" name="chk_pass" id="chk_pass" placeholder="비밀번호를 다시 한번 입력해 주세요." onblur="form_check()" maxlength="20">
         				<span id="pwd_check" class="vali"></span>
					</li>
				</ul>
			</div>
			<div>
				<ul>
					<li>
						<span>안전한 비밀번호 만들기</span>
					</li>
					<li class="guide">
         				<span>영문, 숫자 혼합하여 10 ~ 20자리 이내로 입력하세요.</span>
					</li>
					<li class="guide">
         				<span>아이디와 같은 비밀번호, 생일, 학번, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자, 동일하게 반복된 숫자 등 다른 사람이 쉽게 알아낼 수 있는 비밀번호는 유출 위험이 높아 사용하지 않는 것이 좋습니다.</span>
					</li>
					<li class="guide">
         				<span>이전에 사용하셨던 비밀번호를 재사용할 경우 도용의 우려가 있으니, 가급적 새로운 비밀번호를 사용해 주세요.</span>
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