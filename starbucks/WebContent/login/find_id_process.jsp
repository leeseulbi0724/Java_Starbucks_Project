<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.dao.UserDAO, com.starbucks.vo.UserVO" %>

    <%
	UserVO vo = new UserVO();
    vo.setName(request.getParameter("name"));
	vo.setHp(request.getParameter("phone"));	
	
	String name = request.getParameter("name");
	String hp = request.getParameter("phone");
	UserDAO dao = new UserDAO();
	
	String user_id = dao.getId(vo);
	
	if (user_id != null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee korea</title>
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
section.find ul>li>span.span1 {
	font-size: 22px;
	display: inline-block;
	margin-bottom: 17px;
}

section.find div:nth-child(2)>ul>li{
	font-size: 12px;
}


section.find .btn_style{
	border-radius:3px;
	font-size: 20px;
	color:white;
	width: 20.92%;
	padding:22px 0;
	background-color: #656565;
	border:1px solid #656565;
}
section.find .btn_style2{
	border-radius:3px;
	font-size: 20px;
	color:white;
	width: 25%;
	margin-left: 30px;
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
.user_id{
	display: inline-block;
	color: green;
	margin: 0 7px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
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
						<span class="span1">회원님의 아이디는    <span class= "user_id"><%= user_id%></span>         입니다. </span>
					</li>
					
				</ul>
			</div>
			<div>
				
			</div>
			<div>
      			<a href="login.jsp"><button type="button" class="btn_style">로그인</button></a>
      			<a href="find_pass.jsp"><button type="button" class="btn_style2">비밀번호 찾기</button></a>
			</div>
		</form>
	</section>
</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
<% } else {
	response.sendRedirect("http://localhost:9000/starbucks/login/info_error.jsp");
	}
	%>
