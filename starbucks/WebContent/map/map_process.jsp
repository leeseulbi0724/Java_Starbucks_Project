<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.*, com.starbucks.vo.*, java.util.*"
%>
<%
	String name = request.getParameter("name");
	mapDAO dao = new mapDAO();
	ArrayList<mapVO> list = dao.getData(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% for(mapVO vo : list) { %>
		<li><a onclick="zoomIn(this.innerText)" id="area"><%= vo.getCounty() %></a></li>
	<% } %>
</body>
</html>