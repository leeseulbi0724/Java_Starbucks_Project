<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.*, com.starbucks.vo.*"
%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
<%
		//파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용
		String savePath = request.getServletContext().getRealPath("/upload");
		System.out.println(savePath);
		//파일 크기 15MB로 제한
		int sizeLimit = 1024*1024*15;
		                                                      
		//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
		//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
		//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		//파일명 확인
		System.out.println("화면UI이름=" + multi.getOriginalFileName("file"));
		System.out.println("폴더저장이름=" + multi.getFilesystemName("file"));
		
		serviceVO vo = new serviceVO();
	
		vo.setId(multi.getParameter("id"));
		vo.setCategory(multi.getParameter("category"));
		vo.setEmail1(multi.getParameter("email1"));
		vo.setEmail2(multi.getParameter("email2"));
		vo.setHp1(multi.getParameter("hp1"));
		vo.setHp2(multi.getParameter("hp2"));
		vo.setHp3(multi.getParameter("hp3"));
		vo.setPlace(multi.getParameter("place"));
		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getParameter("content"));
		vo.setEfile(multi.getOriginalFileName("file"));
		vo.setSfile(multi.getFilesystemName("file"));
		
		serviceDAO dao = new serviceDAO();
		boolean result = dao.getInsertResult(vo);
		
		if (result) {
			response.sendRedirect("http://localhost:9000/starbucks/mystarbucks/mystarbucks_sound.jsp");
		} else {
			out.print("<script>alert('문의등록 실패');</script>");
			out.print("<script>location.replace('http://localhost:9000/starbucks/service/service_main.jsp');</script>");
		}
%>