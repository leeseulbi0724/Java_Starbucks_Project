<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	footer {
		background-color:rgb(44,42,41);
	}
	footer>div.f1, footer>div.f2 {
		width:1200px;
		margin:auto;
	}
	footer>div.f1>nav>ul {
	 	display:inline-block;
	 	padding:0 20px;
	 	margin:10px 85px 10px 0;
	 	vertical-align: top;
		list-style-type:none;
	}
	footer>div.f1>nav>ul>li {
		padding:2px 0;
	}
	footer>div.f1>nav>ul>li>a {
		color:white;
		font-size:13px;
		text-decoration:none;
	}
	footer>div.f1>nav>div {
	 	display:inline-block;
	}
	footer>div.f1> div.d2 {
	 	padding:30px 0;
	
	}
	footer>div.f2>nav>ul.copyright {
		text-align:center;
	}
	footer>div.f2>nav>ul.copyright>li {
		display:inline-block;
		font-size:13px;
		padding:0px 3px;
	}
	footer>div.f2>nav>ul.copyright>li>a {
		text-decoration:none;
		color:lightgray;
		padding:0 5px;
	}
	footer>div.f2>nav>ul.copyright>li.prv>a {
		color:green;
		font-weight:bold;
	}
	footer>div.f2>nav>ul.copyright>li div {
		background-color:gray;
		width:1px; height:10px;
		display:inline-block;
	}
	footer>div.f2>nav div{
		text-align:center;
		color:lightgray;
	}
	footer>div.f2>nav ul.button {
		text-align:center;
	}
	footer>div.f2>nav ul.button>li {
		list-style-type:none;
		border:1px solid white;
		border-radius:2px;
		display:inline-block;
		background-color:rgb(44,42,41);
		padding:5px 10px;
	}
	footer>div.f2>nav ul.button>li>a {
		color:white;
		text-decoration:none;
		font-size:12px;
	}
	footer>div.f2>nav div.comp_info {
		padding-bottom:30px;
	}
	footer>div.f2>nav div.comp_info>span {
		font-size:12px;
		color:gray;
	}
</style>
</head>
<body>
	<!--  footer -->
	<footer>
		<div class="f1">
			<nav>
				<ul>
					<li><a href="#">COMPANY</a></li><br>
					<li><a href="#">한눈에 보기</a></li>
					<li><a href="#">스타벅스 사명</a></li>
					<li><a href="#">스타벅스 소개</a></li>
					<li><a href="#">국내 뉴스룸</a></li>
					<li><a href="#">세계의 스타벅스</a></li>
					<li><a href="#">글로벌 뉴스룸</a></li>
				</ul>
				<ul>
					<li><a href="#">CORPORATE SALES</a></li><br>
					<li><a href="#">단체 및 기업 구매 안내</a></li>
				</ul>
				<ul>
					<li><a href="#">PARTNERSHIP</a></li><br>
					<li><a href="#">신규 입점 제의</a></li>
				</ul>
				<ul>
					<li><a href="#">COMMUNITY</a></li><br>
					<li><a href="https://www.facebook.com/starbuckskorea">페이스북</a></li>
					<li><a href="https://twitter.com/StarbucksKorea">트위터</a></li>
					<li><a href="https://www.youtube.com/user/starbuckskorea">유튜브</a></li>
					<li><a href="https://www.instagram.com/starbuckskorea">인스타그램</a></li>
				</ul>
				<ul>
					<li><a href="#">RECRUIT</a></li><br>
					<li><a href="#">채용 소개</a></li>
					<li><a href="#">채용 지원하기</a></li>
				</ul>
				<div>
				<img src="http://localhost:9000/starbucks/images/starbucks_footer_logo.png">
				</div>
			</nav>
			<div class="d2">
				<img src="http://localhost:9000/starbucks/images/footer_award17_01.jpg">
				<img src="http://localhost:9000/starbucks/images/footer_award17_02.jpg">
				<img src="http://localhost:9000/starbucks/images/footer_award17_03.jpg">
				<img src="http://localhost:9000/starbucks/images/footer_award17_04.jpg">
				<img src="http://localhost:9000/starbucks/images/footer_award17_05.jpg">
				<img src="http://localhost:9000/starbucks/images/footer_award17_06.jpg">
				
			</div>
		</div>
		<div class="f2">
			<nav>
				<ul class="copyright">
					<li class="prv"><a href="#">개인정보 처리방침</a><div></div></li>
					<li><a href="#">영상정보처리기기 운영관리 방침</a><div></div></li>
					<li><a href="#">홈페이지 이용약관</a><div></div></li>
					<li><a href="#">위치정보 이용약관</a><div></div></li>
					<li><a href="#">스타벅스 카드 이용약관</a><div></div></li>
					<li><a href="#">비회원 이용약관</a><div></div></li>
					<li><a href="#">My DT Pass서비스 이용약관</a></li>
				</ul>
				<ul class="button">
					<li><a href="#">찾아오시는 길</a></li>
					<li><a href="#">신규입점제의</a></li>
					<li><a href="#">사이트 맵</a></li>
				</ul>
				<div class="comp_info">
				<span>사업자등록번호 : 201-81-21515   (주)스타벅스커피 코리아 대표이사 : 송 데이비드 호섭    TEL : 1522-3232    개인정보 책임자 : 하익성 </span><br><br>
				<span>2021 Starbucks Coffee Company.All Rights Reserved.</span>
				</div>
			</nav>
		</div>
	</footer>
	
	
</body>
</html>