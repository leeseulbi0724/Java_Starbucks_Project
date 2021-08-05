<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.starbucks.dao.*,com.starbucks.vo.UserVO" %> 


<%
	 UserVO vo = new UserVO();
   	UserDAO dao = new UserDAO();

   	vo.setId(request.getParameter("id"));
   	vo.setPass(request.getParameter("pass"));
   	vo.setName(request.getParameter("name"));
   	vo.setEmail(request.getParameter("email"));
   	vo.setHp(request.getParameter("hp"));
   	vo.setBirth_year(request.getParameter("birth_year"));
   	vo.setBirth_month(request.getParameter("birth_month"));
   	vo.setBirth_day(request.getParameter("birth_day"));
   	vo.setBirth_flag(request.getParameter("birth_flag"));
   	vo.setNick(request.getParameter("nick"));
   	String pass2 = request.getParameter("pass2");
   	
   	
   	
   	
   	boolean join_result = dao.getInsertResult(vo);
   	
   	if(join_result == true){
   		response.sendRedirect("join_success.jsp");
   	}else{
   		response.sendRedirect("join_error.jsp");
   		
   	}
 %>
