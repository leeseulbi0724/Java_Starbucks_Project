<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.starbucks.dao.*"
%>
<%
	serviceDAO dao = new serviceDAO();
	
	int before_count = dao.getBeforeCount((String)session.getAttribute("signedUser"));
	int after_count = dao.getAfterCount((String)session.getAttribute("signedUser"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
	body { overflow-x:hidden; overflow-y:auto; }
	section {
		text-align:center;
	}
	div.title {
		width: 100%;
		height: 178px;
		background: url(http://localhost:9000/starbucks/images/ms_sub_ttl_bg.jpg);
	}
	div.title h1 {
		font: bold 36px Avenir, Arial, georgia;
		color: #ffffff;
		padding-top: 30px;
		position:relative;
		top:60px; right:320px;
	}
	div.icon_home {
		position:relative; bottom:50px; left:510px; color:white; font-size:13px; font-weight:normal;
	}
	div.icon_home a {
		text-decoration:none; color:white;
	}
	div.icon_home a:hover { text-decoration:underline; }
	
	div.center { border:1px solid lightgray; display:inline-block; margin-bottom:100px; text-align:left; 
						position:relative; right:100px; bottom:25px; padding-top:20px; padding-bottom:30px; padding-right:320px;
						margin-bottom:-50px;
	}	
	div.center h3.h3_1 { margin-left:20px; margin-bottom:10px; }
	div.center p.p_1 { font-size:14px; margin-left:20px; margin-bottom:10px; }
	div.center li { font-size:12px; color:gray; margin:5px 0 5px 0; margin-left:20px; font-size:12px; }
	div.center a { color:gray; text-decoration:none; display:inline-block; }
	div.center a:hover { text-decoration:underline;  }
	
	div.center-right { position:relative; left:175px; bottom:190px; margin:0; padding-left:15px; display:inline-block; border-left:1px solid lightgray; }
	div.center-right h3.h3_2 { margin:0 0 0 0; }
	div.center-right p.p_2 { font-size:13px;  }
	div.center-right img { margin-top:10px; }
	div.center-right p.p_3 { font-size:13px; color:gray; clear:left; display:inline-block; margin-bottom:20px; position:relative; bottom:20px; }
	div.center-right a { 
		margin-left:10px; text-decoration:none; background-color:rgb(226,195,131); font-size:12px; font-weight:bold;
		padding:5px 100px 5px 100px;
		border-radius:4px; color:black;
	 }
	 div.center-right a:hover { text-decoration:underline; }
	 
	div.button { position:relative; left:480px; top:60px; display:inline-block; text-align:left; }
	div.button>div { border-top:2px solid black; width:220px;  }
	div.button a { text-decoration:none; color:#444; font-weight:bold; font-size:14px;  }
	div.button a:hover { text-decoration:underline; color:green; }
	div.button p { padding:10px; margin:0; }
	div.button>div.line { border-top:1px solid lightgray; width:220px; }
	
	div.login_div { display:inline-block; margin:20px 0; padding-right:15px; font-size:16px; font-weight:bold; }	
	div.login_div:last-child { padding-left:15px; border-left:1px solid lightgray; }
	div.login_div p { margin-top:10px; margin-left:10px; font-size:25px; }
</style>
</head>
<body>
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	
	<!--  content -->
	<section>
		<div class="title">
		<h1>Customer Service & Ideas</h1></div>
		<div class="icon_home">
			<a href="http://localhost:9000/starbucks/index.jsp"><img src="http://localhost:9000/starbucks/images/icon_home_white.png" ></a>
			<img src="http://localhost:9000/starbucks/images/icon_arrow_w.png" >
			<a href="http://localhost:9000/starbucks/service/service_main.jsp">Customer Service & Ideas</a>
		</div>
	</section>
	<section>
		<div class="button">
			<div></div>
			<p><a href="http://localhost:9000/starbucks/service/service_question.jsp">자주하는 질문</a></p>
			<div class="line"></div>
			<p><a href="http://localhost:9000/starbucks/service/service_sound.jsp">고객의 소리</a></p>
			<div class="line"></div>
		</div>
	</section>
	<section>	
	<div class="center">
		<h3 class="h3_1">FAQ</h3>
		<p class="p_1">자주하는 질문을 모아놓았습니다. 궁금하신 내용을 검색해 주세요.</p>
		<a href="http://localhost:9000/starbucks/service/service_question.jsp"><li>[e-프리퀀시] 모바일 앱을 통해서 언제든 예약이 가능한가요?</li></a><br>
		<a href="http://localhost:9000/starbucks/service/service_question.jsp"><li>[e-프리퀀시] 모바일 앱으로 증정품 예약을 완료했습니다. 증정품은 언제까지 찾아가야 하나요?</li></a><br>
		<a href="http://localhost:9000/starbucks/service/service_question.jsp"><li>[e-프리퀀시] 예약한 증정품은 반드시 본인일 경우에만 교환 가능한가요?</li></a><br>
		<a href="http://localhost:9000/starbucks/service/service_question.jsp"><li>[e-프리퀀시] 모든 매장에서 e-프리퀀시 증정품을 예약 수령할 수 있나요?</li></a><br>
		<a href="http://localhost:9000/starbucks/service/service_question.jsp"><li>[e-프리퀀시] 딜리버리 매장을 통해 증정품 배송이 가능한가요?</li></a>
	</div>
	</section>
	<section>
	<div class="center-right">
		<h3 class="h3_2">고객의 소리</h3>
		<p class="p_2">문의에 대한 처리현황을 확인할 수 있습니다.</p>
		<% if(session.getAttribute("signedUser") == null ) { %>
			<img src="http://localhost:9000/starbucks/images/voc_login_pic.png">
			<p class="p_3">로그인이 필요한<br>서비스입니다.</p><br>
			<a href="http://localhost:9000/starbucks/login/login.jsp">로그인</a>
		<% } else { %>
			<div class="login_div">
				<img src="http://localhost:9000/starbucks/images/icon_voc01.png"> 접수완료
				<p><%= before_count %>
			</div>
			<div class="login_div">
				<img src="http://localhost:9000/starbucks/images/icon_voc02.png"> 답변완료
				<p><%= after_count %>
			</div>
		<% } %>
	</div>	
	</section>
	<!-- footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>