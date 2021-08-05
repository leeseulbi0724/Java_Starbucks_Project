<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.*, com.starbucks.vo.*"
%>
<%
	String comment = request.getParameter("comment");
	String sid = request.getParameter("sid");
	
	serviceDAO dao = new serviceDAO();
	
	boolean result = dao.getCommentInsert(comment, sid);
	
	if ( result ) {
		dao.getReplyResult(sid);
		response.sendRedirect("admin_question.jsp");
	}
	
%>