<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.noticeDAO, com.starbucks.vo.noticeVO, java.io.*"
%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
<%
	//파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용하자.
	String savePath = request.getServletContext().getRealPath("/upload");
	System.out.println(savePath);
	//파일 크기 15MB로 제한
	int sizeLimit = 1024*1024*15;
	                                                      
	//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
	//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
	//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	//파일명 확인
	System.out.println("화면UI이름=" + multi.getOriginalFileName("nfile") );
	System.out.println("폴더저장이름=" + multi.getFilesystemName("nfile")  );
	
	noticeVO vo = new noticeVO();
	noticeDAO ndao = new noticeDAO();
	boolean result = false;
	
	if (multi.getOriginalFileName("nfile") != null) { //파일이 널이 아닐 경우 파일포함 업데이트 
		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getParameter("content"));
		vo.setNid(request.getParameter("nid"));
		vo.setNfile(multi.getOriginalFileName("nfile"));
		vo.setSfile(multi.getFilesystemName("nfile"));
		result = ndao.getUpdateFileResult(vo);
		
		if (result) {			
			String old_file_path = savePath+"/"+multi.getParameter("nsfile_old");
			File old_file = new File(old_file_path);
			
			if (old_file.exists()) {
				if(old_file.delete()) { //기존에 등록되있던 파일 폴더에서 삭제
					System.out.println("파일삭제완료!");
				}
			}
		}		
		
	} else { // 파일이 널이면 파일제외 업데이트
		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getParameter("content"));
		vo.setNid(request.getParameter("nid"));
		result = ndao.getUpdateResult(vo);
	}	
	
	if ( result ) {
		response.sendRedirect("admin_notice_content.jsp?nid="+request.getParameter("nid"));
	} else {
		out.print("<script>alert('글수정 실패');</script>");
		out.print("<script>location.replace('http://localhost:9000/starbucks/admin/notice/admin_notice.jsp');</script>");
	}
	
	ndao.close();
%>