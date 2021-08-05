<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.dao.*, com.starbucks.vo.*" %>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	UserDAO dao = new UserDAO();
	
	
	boolean result = dao.getLoginResult(id, pass);
	
	UserVO vo = dao.getMember(id);
	UserVO vobir = dao.getMembertwo(id);
	
	
	String user_name = vo.getName();
	String user_nick = vo.getNick();
	String user_hp = vo.getHp();
	String user_email = vo.getEmail();
	String user_birth = vo.getBirth();
	String dis = "";
	
	String birth_year = vobir.getBirth_year();
	String birth_month = vobir.getBirth_month();
	String birth_day =vobir.getBirth_day();
	String birth_flag = vobir.getBirth_flag();
	
	
	if(result == true){
		session.setAttribute("sigenedUsername", user_name);
		if(user_nick != null){
			session.setAttribute("sigenedUsernick", user_nick);
		}else{
			session.setAttribute("sigenedUsernick", dis);
		}
		
		session.setAttribute("sigenedUserhp", user_hp);
		session.setAttribute("sigenedUseremail", user_email);
		session.setAttribute("signedUser", id); // 인증되었음 세션에 남김
		session.setAttribute("user_year", birth_year);
		session.setAttribute("user_month", birth_month);
		session.setAttribute("user_day", birth_day);
		session.setAttribute("user_flag", birth_flag);
		response.sendRedirect("http://localhost:9000/starbucks/index.jsp");
		
		
	}else{
		response.sendRedirect("http://localhost:9000/starbucks/login/login_error.jsp");	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>