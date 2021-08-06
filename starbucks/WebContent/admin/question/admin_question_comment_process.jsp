
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="com.starbucks.dao.*, com.starbucks.vo.*"
	%>
	<%
		String comment = request.getParameter("comment"); //답변 내용
		String sid = request.getParameter("sid"); //답변할 게시글 시퀀스
		
		serviceDAO dao = new serviceDAO();
		
		boolean result = dao.getCommentInsert(comment, sid); // DAO에 전달하여 결과를 result 값으로 받음
		
		if ( result ) {
			dao.getReplyResult(sid);
			response.sendRedirect("admin_question.jsp");
		}
		
	%>




