<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import = "com.starbucks.dao.noticeDAO,com.starbucks.vo.noticeVO,java.sql.*,java.util.*, java.io.*"
%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
<%
	String savePath = request.getServletContext().getRealPath("/upload");
	System.out.println(savePath);
	int sizeLimit = 1024*1024*15;
	                                                      
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

	noticeDAO ndao = new noticeDAO();
	String nid[] = multi.getParameterValues("select");
	ArrayList<String> nlist = new ArrayList<String>();	
	for ( int i=0; i<nid.length; i++) {
		nlist.add(i, nid[i]);		
	}	
	
	boolean result = ndao.getDeleteResult(nlist);
	if ( result ) {			
		String old_file_path = savePath+"/"+multi.getParameter("nsfile_old");
		File old_file = new File(old_file_path);
		
		if (old_file.exists()) {
			if(old_file.delete()) {
				System.out.println("파일삭제완료!");
			}
		}
	}		
	
	if ( result ) {
		out.print("<script>alert('삭제되었습니다');</script>");
		out.print("<script>location.replace('http://localhost:9000/starbucks/admin/notice/admin_notice.jsp');</script>");
	}
	
%>