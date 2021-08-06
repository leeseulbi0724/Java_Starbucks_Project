<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  날짜 Import -->    
<%@ page import = "java.util.Calendar" %>
<!-- 오늘 날짜  -->
<%
Calendar cal = Calendar.getInstance();


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>Starbucks Coffee Korea</title>
<script src="http://localhost:9000/starbucks/js/jquery-3.6.0.min.js"></script>
<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd,
	q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr,
	th, td, article, aside, canvas, details, figcaption, figure, footer,
	header, hgroup, menu, nav, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
}

.sub_title {
	width: 100%;
	height: 178px;
	background:
		url(http://localhost:9000/starbucks/images/ms_sub_ttl_bg.jpg);
	font-size:13px;
}

.sub_inner_title {
	width: 1100px;
	height: 91px;
	margin: 0 auto;
	position: relative;
}

.smap a:link {
	text-decoration: none;
	color: #ffffff;
}

.smap a:visited {
	text-decoration: none;
	color: #ffffff;
}

ul.smap {
	position: absolute;
	right: 0;
	top: 116px;
	list-style: none;
	display: inline-block;
}

ul.smap li {
	display: inline-block;
	margin-right: 2px;
	color: #ffffff;
}

.sub_title h1 {
	font: bold 36px Avenir, Arial, georgia;
	color: #ffffff;
	padding-top: 30px;
	position: relative;
	top: 60px;
}
.wrap{
	position: relative;
	width: 100%;
	height: 949px;
}
.container{
	width: 100%;
}
.ms_cont_wrap{
	left: 50%;
	margin: 50px 0 0 -550px;
	position: relative;
	width: 1100px;
	height: 1000px;
}
.ms_cont{
	float: left;
	width: 830px;
	margin-bottom: 90px;
}
.ms.nav{
	float: right;
	font-weight: bold;
	width: 220px;
	margin-bottom: 90px;
	border: 2px solid red;
}

nav ul, li {
	list-style: none;
}

.hide {
	display: none;
}
.hide li { height:20px; margin-top:-5px; }
.hide li:last-child { margin-bottom:15px;  }
.hide li:hover { text-decoration:underline; color:green; }
.ms_nav>ul {
	border-top: 2px solid #222;
}

.ms_nav {
	float: right;
	font-weight: bold;
	width: 220px;
	margin-bottom: 90px;
}

.ms_nav>ul>li {
	border-bottom: 1px solid #ddd;
	width: 220px;
	margin:0; padding:0;
}
.ms_nav>ul>li>a:hover { text-decoration:underline; color:green; }

.ms_nav>ul>li>a {
	color: #444;
	display: block;
	font-size: 14px;
	padding: 10px 30px 10px 15px;
	position: relative;
	width: 175px;
}

.ms_nav a:link {
	text-decoration: none;
	color: #444;
}

.ms_nav a:visited {
	text-decoration: none;
	color: #444;
}

.sbox_arrow_down {
	height: 7px;
	margin-top:3px;
	position: absolute;
	right: 15px;
	width: 12px;
}

.ms_nav>ul>lu>ul>li {
	width: 220px;
}

.ms_nav a {
	cursor: pointer;
}
.font{
	color: #444;
	display: block;
	font-size: 12px;
	padding: 6px 0 6px 15px;
	width: 205px;
}
.container{
	top: 1px;
}
.ms-cont{
	float: left;
	width: 100%;
	margin-bottom: 90px;
}
.my_info_wrap{
	padding-bottom: 40px;
	margin-bottom: 40px;
	position: relative;
}
.my_info_f{
	width: 830px;
	height: 170px;
	background: url(http://localhost:9000/starbucks/images/mem_bg.jpg) 0 0 no-repeat;
	position: relative;
	margin-bottom: 50px;
}
.last_txt{
	font-size: 14px;
	font_weight: normal;
	color: #666666;
}
.my_info_f_txt p{
	color: #444;
	font-size: 18px;
	font-weight: bold;
	line-height: 1.2;
	margin-bottom: 15px;
	width: 600px;
}
.my_info_f_txt{
	padding: 45px 0 0 75px;
}
.my_info_f_txt span{
	margin-bottom: 15px;
	margin-right: 3px;
}
.mem_level{
	width: 480px;
}
.mem_level li{
	float: left;
	padding: 0 10px;
}
.li2{font-size: 14px; color: #444;} .li2 span{font-size: 18px; font-weight: bold; margin-left: 3px;}
.mem_tit{
	font-size: 18px;
    font-weight: bold;
    color: #222;
    margin-bottom: 20px;
    line-height: 1.3;
}
.mem_my_card{
	position: absolute;
    right: 0;
    top: 225px;
    font-size: 12px;
    color: #666;
}
table.myCardInfo thead tr th {
    border-bottom: 1px solid #333;
    border-top: 1px solid #333;
    border-collapse: separate;
    color: #222;
    height: 46px;
    vertical-align: middle;
}
table {
    text-indent: initial;
    border-spacing: 2px;
    vertical-align: inherit;
    border-collapse:collapse;
}
table.myCardInfo tbody tr td {
    border-bottom: 1px solid #dbdbdb;
    text-align: center;
    font-size: 13px;
    color: #666;
    height: 46px;
    padding: 7px 0;
    vertical-align: middle;
    margin-bottom: 40px;
}
.ms_warning{
	margin-top: 50px;
}
.myinfo_tit{
	font-size: 18px;
    font-weight: bold;
    color: #222;
    margin-bottom: 20px;
    line-height: 1.3;
}
.ms_warning .warning {
    border: 1px solid #ddd;
    border-radius: 3px;
    padding: 20px;
    margin-bottom: 10px;
}
.ms_warning p.agree_txt {
    font-size: 14px;
    color: #222;
}
.ms_warning .warning li {
    font-size: 14px;
    color: #666;
    padding-left: 9px;
    background: url(../img/util/ec/dot.jpg) 1px 6px no-repeat;
    line-height: 1.4;
    margin-bottom: 5px;
}
.ms_warning p.agree_txt {
    font-size: 14px;
    color: #222;
}
input[type="checkbox"] {
    height: 12px;
    width: 12px;
}
.ms_btn{
	position: relative;
	margin-top: 40px;
}
.ms_btn p {
    margin: 0 auto;
    width: 491px;
}
.ms_btn p button {
    border-radius: 3px;
    display: block;
    width: 489px;
    height: 38px;
    line-height: 38px;
    background: #e2c383;
    border: 1px solid #bb9f65;
    font-size: 14px;
    font-weight: bold;
    color: #222;
    text-align: center;
    cursor: pointer;
}
.ms_btn p button:hover { text-decoration:underline; }
.li2{
	maring: 0px;
}
.isis{
	width: 100%;
	height: 80px;
}


</style>

<script>
$(document).ready(function(){    
	
    $(".user_if>a").click(function(){
		if ($(this).attr("id") == "down") {
			$(".hide").slideDown();
			$(".sbox_arrow_down").attr("src","http://localhost:9000/starbucks/images/sbox_arrow_up.png")
			$(this).attr("id","up");				
		} else {
			$(".hide").slideUp();
			$(".sbox_arrow_down").attr("src","http://localhost:9000/starbucks/images/sbox_arrow_down.png")
			$(this).attr("id","down");
			
		}
    });
    
    
});
function delete_check(){   
	
    if($("#agree1").is(":checked") == false){
        alert("유의사항에 동의하여 주세요.")
    }else{
    	
    	location.href="myinfo_out_process.jsp"
    }
    }
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- 서브타이틀 -->
	<div class= "sub_title"> 
		<div class= "sub_inner_title">
			<h1>회원탈퇴</h1>
	
			<ul class="smap">
				<li><a href="http://localhost:9000/starbucks/index.jsp"><img class="home_icon" src="http://localhost:9000/starbucks/images/icon_home_white.png"></a></li>
				<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow_w.png"></li>
				<li><a class= "this" href="http://localhost:9000/starbucks/mystarbucks/mystarbucks_main.jsp" style="text-decoration-line: none;">My StarBucks</a></li>
			</ul>
		</div>
	 </div>	
	 <!-- 메인 Wrap -->
	<div class ="wrap">
		<div class ="container">
			<div class="ms_cont_wrap">
				<div class="ms_cont">
					<section class="my_info">
		 				<div class="my_info_wrap">
		 					<div class="my_info_f">
		 						<div class="my_info_f_txt">
		 							<p>
		 								<span><%= session.getAttribute("signedUser") %></span>님의 <span><%= cal.get(Calendar.YEAR) %>년</span><span><%= cal.get(Calendar.MONTH)+1 %>월</span><span><%= cal.get(Calendar.DATE) %>일</span>현재 스타벅스 서비스 현황입니다.<br><span class="last_txt">아래 사항들을 확인하시고, 회원탈퇴에 대해 다시 한번 신중히 결정해주세요.</span>
		 							</p>
		 							<ul class= "mem_level">
		 								<li class= "li1"><img src="http://localhost:9000/starbucks/images/mem_line.jpg"></li>
		 								<li class= "li2">유효한 스타벅스 별 :<span>0개</span></li>
		 								<li class= "li1"><img src="http://localhost:9000/starbucks/images/mem_line.jpg"></li>
		 								<li class= "li2">사용 가능한 쿠폰 :<span>0장</span></li>
		 							</ul>
		 						</div>
		 					</div>
		 					<div>
		 						<p class= "mem_tit"><span><%= session.getAttribute("signedUser") %></span>님의 등록된 스타벅스 카드</p>
			 					<p class= "mem_my_card">총 보유카드 : 0장</p>
		 					</div>
		 					<table summary="나의 스타벅스 카드 웹 버전" class="myCardInfo mb50">
									<caption class="hid"></caption>
									<colgroup>
										<col width="165">
										<col width="121">
										<col width="179">
										<col width="159">
										<col width="117">
										<col width="89">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">카드</th>
											<th scope="col">카드명</th>
											<th scope="col">카드번호</th>
											<th scope="col">최종 사용일</th>
											<th scope="col">카드 등록일</th>
											<th scope="col">잔액</th>
										</tr>
									</thead>
									<tbody><tr><td colspan="6">등록 된 카드가 없습니다.</td></tr></tbody>
								</table>
								
								<div class="ms_warning">
								<p class="myinfo_tit">스타벅스 리워드 서비스 해지 시 유의사항</p> 
								<div class="warning">
									<ul>
										<li>회원 탈퇴 시에는 고객님의 개인정보 및 등록하신 스타벅스 카드의 정보가 모두 삭제되어, 더 이상 스타벅스 리워드 혜택을 받으실 수 없습니다.</li> 
										<li>회원탈퇴에 의해 등록 해지된 일반 스타벅스 카드는 재등록을 하지 않은 상태에서도 스타벅스에서 정상적으로 이용이 가능하지만, 별의 지급, 분실, 분실신고 시 잔액보장 등의 다양한 스타벅스 리워드 혜택은 더 이상 누리실 수 없게 됩니다.</li> 
										<li>정상 이용하셨던 일반 스타벅스 카드는 탈퇴와 함께 자동 해지되어 회원 재가입 후 본인 또는 다른 사용자에 의해 다시 등록될 수 있지만 이전에 사용하셨던 거래정보는 확인하실 수 없습니다.</li>
										<li>중지된 카드에 잔액이 남아있는 경우, 잔액이전이나 잔액환불을 통해 잔액이 0원이 되어야 회원탈퇴가 가능하며, 중지된 카드는 재사용 또는 재등록이 불가합니다.</li>
										<li>골드카드는 수령등록이 완료된 경우에만 회원 탈퇴가 가능합니다.</li>
										<li>등록된 골드카드 및 특정카드에 잔액이 남아있는 경우, 잔액 소진, 잔액 이전 또는 잔액 환불을 통해 잔액이 0원이 되어야 회원탈퇴가 가능합니다. (특정카드 : 스타벅스 현대카드 신청 후 발급받은 스타벅스 e카드 등)</li> 
										<li class="last">잔액이 남아있지 않은 골드 카드는 탈퇴와 함께 자동 중지되어 재사용 또는 재등록이 불가합니다.</li>
									</ul>
								</div>
								<p class= "agree_txt mb40">
									<div class="ez-checkbox">
										<input type="checkbox" name="agree1" id="agree1" class="ez-hide">
									<label for="agree1">회원탈퇴 후 스타벅스 리워드 혜택 및 등록한 스타벅스 카드의 소유권 상실에 대해 동의합니다.</label>
									</div> 
								</p>
								<div class="ms_btn">
								<p  onclick="delete_check()"><button>회원탈퇴</button></p>
								</div>
								
							</div>
		 				</div>
		 			</section>
				</div>
				
				<nav class= "ms_nav">
					<ul>
						<li><a href="mystarbucks_sound.jsp">My 고객의 소리</a></li>
						<li class="user_if">
						<a>개인정보관리<img id="down" class="sbox_arrow_down" src="http://localhost:9000/starbucks/images/sbox_arrow_down.png"></a>
						<ul class="hide">
						<li><a class="font" href="mystarbucks_out.jsp">. 개인정보확인 및 수정</a></li>
						<li><a class="font"href="http://localhost:9000/starbucks/mystarbucks/myinfo_out.jsp">. 회원 탈퇴</a></li>
						<li><a class="font"href="http://localhost:9000/starbucks/mystarbucks/mystarbucks_pass.jsp">. 비밀번호 변경</a></li>
						</ul>
						</li>
					</ul>	
				</nav>
				
			</div>
		</div>
	</div>
	 
	 
<div class="isis"></div>
	 

	 
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>