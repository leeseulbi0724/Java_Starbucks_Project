<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>Starbucks Coffee Korea</title>
<style>
/* 로그인 */
section.login {
	background-image: url("http://localhost:9000/starbucks/images/login_bg.jpg");
	background-size: 100%;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover; /* 요소를 비율에 맞게 커버 */
	height: 720px;
}
section.login .content_layout{
	border:1.3px solid lightgray; 
	border-radius:3px;
	background-color:white;
	width: 567px;
	height: 495px;
	text-align: center;
	margin:auto;
}
section.login .title{
	text-align: center;
	color:white;
	padding-top:60px;
	margin: 0 0 31px 0;
	font-size: 28px;
}
section.login .welcome{
	border-bottom: 1px solid lightgray;
}
section.login .welcome1{
	text-align: center;
	font-size: 18.5px;
	color: #2a6438;
	padding: 23px 0 32px 0;
	display: inline-block;
}
section.login .welcome2{
	text-align: center;
	font-size: 16.5px;
	color: gray;
	display: inline-block;
}
section.login ul{
	width: 100%;
	list-style-type: none;
	margin: 0;
	padding: 0;
}
section.login ul>li {
	padding: 4px 0;
}
section.login ul>li.save_id {
	text-align: left;
	margin: 2px 5.5px 0 20px;
}
section.login ul>li.save_id>div>img{
	text-align: left;
	vertical-align: middle;
	width: 26px;
	height: auto;
}
section.login ul>li.save_id>div>span {
	font-size: 15px;
	margin: 20px 0 20px 3px;
}
section.login ul>li.save_id>div{
	display: inline;
}
section.login ul>li.save_id>div:hover {
	cursor: pointer;
}
section.login ul input{
	border: 1px solid lightgray;
	border-radius: 3px;
	width: 88%;
	height: 41px;
	padding: 2px 13.5px;
	margin-top: 2px;
	font-size: 13px;
}
section.login .id{
	margin-top: 12px;
}
section.login button:hover{
	text-decoration: underline;
	cursor: pointer;
}
section.login button{
	background-color: #2a6438;
	border:1px solid #2a6438;
	border-radius:3px;
	font-size: 23px;
	color:white;
	width: 93%;
	padding: 16.5px 0;
	text-align: center;
	margin: 12px 0 8px 0;
}
section.login ul>li:last-child span {
	display: inline-block;
	text-align: left;
	font-size: 14px;
	margin: 0 23px 0 20px;
	color: #2a6438;
}
section.login form>div{
	padding: 0 25px 0 40px;
}
section.login nav>ul{
	list-style-type: none;
	padding:0;
	text-align: center; 
	margin-top: 25px;
	display:flex;
	justify-content: space-around;
}
section.login nav>ul>li{
	/* float:left; */
	display: inline-block;
	vertical-align: middle;
}
section.login nav>ul>li>a{
	text-decoration: none;
	font-size: 15px;;
	color: #494949;	
}
section.login nav a:hover{
	text-decoration: underline;
}
section.login nav>ul>li>div{
	background-color: lightgray;
	width: 1px;
	height: 20px;	
	display: inline-block;
	vertical-align: middle;
}
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	
	
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    if (userInputId == "undefined") {
    	$("input[name='id']").val(""); 
    } else {
	    $("input[name='id']").val(userInputId);     	
    }
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        $("#save").attr("src","http://localhost:9000/starbucks/images/mem_check_on.png");
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
    
    
    
    
});

	function saveEvent(){
		var saveon = "http://localhost:9000/starbucks/images/mem_check_on.png";
		var saveoff = "http://localhost:9000/starbucks/images/mem_check_off.png";
		
		var imgElement = document.getElementById('save');
		
		imgElement.src = (imgElement.src === saveoff) ? saveon : saveoff;
		
		if (imgElement.src == saveoff) {
			imgElement.name = "checkoff";
			document.getElementById('idSaveCheck').checked = false;
		} else if (imgElement.src == saveon) {
			imgElement.name = "checkon";
			document.getElementById('idSaveCheck').checked = true;
		}
	}
	
	function login_check(){
		if(!document.login_form.id.value){
			alert("아이디를 입력해 주세요.");
			return;
		}
		else if(!document.login_form.pass.value){
			alert("비밀번호를 입력해 주세요.");
			document.login_form.pass.focus();
			return;
		}
		document.login_form.submit();
	}
	
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<!-- 로그인 -->
<div>
	<section class="login">
		<h1 class="title">로그인</h1>
		<form class="content_layout" name="login_form" action="loginprocess.jsp" method="post">
         	<ul>
         		<li>
         			<div class="welcome"><span class="welcome1">Welcome!&nbsp;</span><span class="welcome2">스타벅스커피 코리아에 오신 것을 환영합니다.</span></div>
         		</li>
         		<li>
         			<input type="text" name="id" class="id" placeholder="아이디를 입력해 주세요." autofocus title="이 입력란을 작성하세요.">
         		</li>
         		<li>
         			<input type="password" name="pass" placeholder="비밀번호를 입력해 주세요." title="이 입력란을 작성하세요.">
         		</li>
         		<li class="save_id">
         			<div onclick="saveEvent()">
	         			<input type="checkbox" id="idSaveCheck" style="display:none"><img src="http://localhost:9000/starbucks/images/mem_check_off.png" id="save" name="checkoff">
	         			<span>아이디 저장</span>
	         		</div>
         		</li>
         		<li>
         			<button type="button" class="btn_style" onclick="login_check()">로그인</button>
         		</li>
         		<li>
         			<span>* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길 바랍니다.</span><br>
         			<span>* 스타벅스 커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.</span>
         		</li>
         	</ul>
         	<div>
	         	<nav>
					<ul>
						<li><a href="http://localhost:9000/starbucks/join/join.jsp">회원가입</a></li>
						<li><div></div></li>
						<li><a href="http://localhost:9000/starbucks/login/find_id.jsp">아이디 찾기</a></li>
						<li><div></div></li>
						<li><a href="http://localhost:9000/starbucks/login/find_pass.jsp">비밀번호 찾기</a></li>
						</ul>
					</nav>
				</div>
</form>
		</section>
	</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>