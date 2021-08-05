<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.starbucks.dao.UserDAO" %>
    
    <%
    	String id = (String)session.getAttribute("signedUser");
    	String pass = request.getParameter("pass");
    	String cpass = request.getParameter("cpass");
    	
    	
    	UserDAO dao = new UserDAO();
    	
    	boolean result = dao.ChangePass(id, pass, cpass);
    	
    	if(result == true){
    		session.invalidate();
    		response.sendRedirect("http://localhost:9000/starbucks/mystarbucks/mystarbucks_pass_call.jsp");
    	}else { %>
    		<script>
    		alert('현재 비밀번호가 일치하지 않습니다.')
    		history.go(-1);		
    		</script>
    		
    		<% 	}%>	
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


</body>
</html>