<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.starbucks.vo.*, com.starbucks.dao.*" %>
<%
	UserVO vo = new UserVO();
	
	

	vo.setId((String)session.getAttribute("signedUser"));
	vo.setName((String)session.getAttribute("sigenedUsername"));
	vo.setEmail(request.getParameter("email"));
	vo.setHp(request.getParameter("phone"));
	vo.setBirth_year(request.getParameter("birth_year"));
	vo.setBirth_month(request.getParameter("birth_month"));
	vo.setBirth_day(request.getParameter("birth_day"));
	vo.setBirth_flag(request.getParameter("birth_flag"));
	vo.setNick(request.getParameter("nick"));
	
	System.out.println("아이디 + " + vo.getId());
	System.out.println("이름 + " + vo.getName());
	System.out.println(vo.getBirth_year());
	System.out.println(vo.getBirth_month());
	System.out.println(vo.getBirth_day());
	System.out.println(vo.getBirth_flag());
	System.out.println(vo.getHp());
	System.out.println(vo.getEmail());
	System.out.println(vo.getNick());
	
	UserDAO dao = new UserDAO();
	
	boolean update_result = dao.getUpdateResult(vo);
	
	if(update_result == true){
		session.invalidate();
	}else{
		response.sendRedirect("http://localhost:9000/starbucks/no_login.jsp");
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
	section { text-align:center; padding:200px; }
	section div { display:inline-block; }
	section div:nth-child(2) { border-left:1px solid lightgray; width:1px; height:130px; margin:0 30px 0 30px; }
	section div:last-child { text-align:left; padding:5px; }
	section div:last-child>p:first-child { font-weight:bold; font-size:23px; position:relative; bottom:15px; }
	section div:last-child>p:nth-child(2) { font-size:14px; position:relative; bottom:20px; margin-top:10px; }
	section div:last-child a {  color:white; text-decoration:none; padding:7px 15px 7px 15px; font-size:12px; font-weight:bold; border-radius:4px; }
	section div:last-child a:nth-child(3) { background-color:rgb(102,102,102); }
	section div:last-child a:last-child { background-color:rgb(34,34,34); }
	section div:last-child a:hover { text-decoration:underline; }
	.didi{margin-right: 5px;}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	
	<section>
		<div style="margin-top:150px;"><img src="http://localhost:9000/starbucks/images/icon_com_lock.png"></div>
		<div></div>
		<div style="margin-bottom:150px;"><p><span class="didi" style="color:green">개인정보</span>수정이 완료되었습니다.</p>
		<p> <strong>재 로그인</strong>하시기 바랍니다.</p>
		<a href="http://localhost:9000/starbucks/login/login.jsp">로그인</a>
		<a href="http://localhost:9000/starbucks/join/join.jsp">회원가입</a></div>
	</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>