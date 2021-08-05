<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.starbucks.dao.UserDAO" %>
    
    <%
    	String id = request.getParameter("id");
    	String pass = request.getParameter("cpass");
    	
    	
    	UserDAO dao = new UserDAO();
    	
    	boolean result = dao.ChangePass(id, pass);
    	
    	if(result == true){
    		session.invalidate();
    		response.sendRedirect("http://localhost:9000/starbucks/mystarbucks/mystarbucks_pass_call.jsp");
    	}
   %>    	
    		
    