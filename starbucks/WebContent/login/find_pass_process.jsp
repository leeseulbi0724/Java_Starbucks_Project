<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.dao.UserDAO, com.starbucks.vo.UserVO" %>

    <%
	UserVO vo = new UserVO();
    vo.setName(request.getParameter("name"));
    vo.setId(request.getParameter("id"));
	vo.setHp(request.getParameter("phone"));	

	
	String name = request.getParameter("name");
	String hp = request.getParameter("phone");
	UserDAO dao = new UserDAO();
	
	boolean result = dao.getPass(vo);
	
	if (result == false) {
		response.sendRedirect("http://localhost:9000/starbucks/login/info_error.jsp");
	}

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section.pass {
	padding-bottom: 50px;
}
section.pass .title{
	text-align: center;
	margin: 61px 0 30px 0;
	font-size: 28px;
	font-weight: bold;
}
section.pass .content_layout{
	background-color:white;
	width: 570px;
	text-align: center;
	margin:auto;
}
section.pass img{
	margin: 30px 0 22px 0;
	width: 205px;
	height: auto;
}
section.pass ul{
	width: 100%;
	list-style-type: none;
	margin: 0;
	padding: 0;
}
section.pass div:first-child{
	border: 1px solid lightgray;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	padding-bottom: 31px;
}
section.pass div:nth-child(2), section.pass div:nth-child(3), section.pass div:nth-child(4){
	padding: 25px 0 20px 0;
	border: 1px solid lightgray;
	border-top: none;
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
}
section.pass ul>li>span.span1 {
	font-size: 17px;
	display: inline-block;
}
section.pass div:nth-child(2)>ul>li{
	font-size: 12px;
}
section.pass span.span2 {
	margin: 0 20px;
	text-align:left;
	width: 86%;
	display: inline-block;
	font-size: 18px;
	font-weight: bold;
	float:left;
}
section.pass div:nth-child(2) input,
section.pass div:nth-child(3) input,
section.pass div:nth-child(4) input
{
	width: 84.5%;
	height: 57px;
	border: 1px solid lightgray;
	border-radius: 3px;
	padding: 0 18px;
	margin: 19px 10px 25px 2px;
	font-size: 14px;
}
section.pass div:nth-child(4) input:last-child { margin-top:0; margin-bottom:5px; }

#btn { 
	background-color: #2a6438;
	border:1px solid #2a6438;
	border-radius:3px;
	font-size: 23px;
	color:white;
	width: 93%;
	padding: 16.5px 0;
	text-align: center;
	margin:20px 0 8px 0;
	cursor:pointer;
}
#btn:hover { text-decoration:underline; }
</style> 
<script>
function form_check(){
		if(!document.pass_form.cpass.value){
			alert("새로운 비밀번호를 입력해 주세요.");
			document.pass_form.cpass.focus();
		 }	
		
		else if(!document.pass_form.cpass2.value){
			alert("새로운 비밀번호 확인을 입력해 주세요")
			document.pass_form_cpass2.focus();
		}
		else if(document.pass_form.cpass.value != document.pass_form.cpass2.value){
			alert("새로운 비밀번호가 일치하지 않습니다.");
			return;
		}
		document.pass_form.submit();
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<!-- 비밀번호 변경 -->
<div>
<section class="pass">
		<h1 class="title">새로운 비밀번호</h1>
		<form class="content_layout" name="pass_form" action="find_pass_update_process.jsp?id=<%= vo.getId() %>" method="post">
			<div>
				<ul>
					<li>
						<img src="http://localhost:9000/starbucks/images/icon_find_sally.png" width="245px" height="auto">
					</li>
					<li>
						<span class="span1">새로운 비밀번호로 변경하실 수 있습니다</span>
					</li>
				</ul>
			</div>		
			<div>
				<ul>
					<li>
						<span class="span2">새 비밀번호</span>
					</li>
					<li>
         				<input type="password" name="cpass" placeholder="영문, 숫자 혼합하여 10~20자리 이내로 입력하세요." title="새로운 비밀번호">
         				<input type="password" name="cpass2" placeholder="비밀번호를 다시 한번 입력해 주세요." title="새로운 비밀번호2">
					</li>
				</ul>
			</div>
			<div>
      			<a><button type="button" id="btn" onclick="form_check()">확인</button></a>
			</div>
		</form>
	</section>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>