<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import = "com.starbucks.dao.menuDAO,com.starbucks.vo.menuVO,java.sql.*,java.util.*"
%>
<%
	menuDAO dao = new menuDAO();
	String mid[] = request.getParameterValues("select");
	ArrayList<String> mlist = new ArrayList<String>();	
	for ( int i=0; i<mid.length; i++) {
		mlist.add(i, mid[i]);		
	}
	
	if ( dao.getMenuDelete(mlist) ) {
		response.sendRedirect("admin_menu_main.jsp");
	} else {
		out.print("<script>alert('삭제 실패');</script>");
		out.print("<script>location.replace('http://localhost:9000/starbucks/admin/menu/admin_menu_main.jsp');</script>");
	}
	dao.close();
	
%>
