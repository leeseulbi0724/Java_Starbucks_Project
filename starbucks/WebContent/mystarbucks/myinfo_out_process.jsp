<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import = "com.starbucks.dao.UserDAO" %>
    
    <% 
    
    
    String sid = (String)session.getAttribute("signedUser");
    
    UserDAO dao = new UserDAO();
    
    boolean result = dao.getDelete(sid);
    
    if(result == true){
    	session.invalidate();
    }
    
  
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
</style>
</head>
<body>
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	
	<!--  content -->
	<section>
		<div style="margin-top:150px;"><img src="http://localhost:9000/starbucks/images/icon_com_lock.png"></div>
		<div></div>
		<div style="margin-bottom:150px;"><p><span style="color:green">회원탈퇴</span>가 완료되었습니다.</p>
		<strong>이용해주셔서 감사합니다.</strong>
		<div class= "last">
		<a href="http://localhost:9000/starbucks/index.jsp">메인으로</a>
		</div>
	</section>
	<!--  footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>