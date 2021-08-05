<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.starbucks.dao.coffeeDAO,com.starbucks.vo.CoffeeVO,java.sql.*,java.util.*"
%>
<%
	coffeeDAO dao = new coffeeDAO();
	String cname[] = request.getParameterValues("select");
	ArrayList<String> clist = new ArrayList<String>();	
	for ( int i=0; i<cname.length; i++) {
		clist.add(i, cname[i]);		
		System.out.println(cname[i]);
	}
	
	if ( dao.getDeleteResult(clist) && dao.getListDeleteResult(clist) ) {
		response.sendRedirect("admin_coffee_main.jsp");
	} else {
		out.print("<script>alert('글삭제 실패');</script>");
		out.print("<script>location.replace('http://localhost:9000/starbucks/admin/coffee/admin_coffee_main.jsp');</script>");
	}
	dao.close();
	
%>