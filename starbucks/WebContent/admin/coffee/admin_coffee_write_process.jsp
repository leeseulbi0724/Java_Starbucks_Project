<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import = "com.starbucks.dao.coffeeDAO,com.starbucks.vo.CoffeeVO, java.sql.*,java.util.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
	<%
		//파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용하자.
		String savePath = request.getServletContext().getRealPath("/images");
		System.out.println(savePath);
		//파일 크기 15MB로 제한
		int sizeLimit = 1024*1024*15;
		                                                      
		//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
		//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
		//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		//파일명 확인
		System.out.println("화면UI이름=" + multi.getOriginalFileName("cimg_file"));
		System.out.println("화면UI이름=" + multi.getOriginalFileName("cimg_bfile"));
		System.out.println("폴더저장이름=" + multi.getFilesystemName("cimg_file"));
		System.out.println("폴더저장이름=" + multi.getFilesystemName("cimg_bfile"));
	
    	CoffeeVO vo = new CoffeeVO();  
    	
    	vo.setCid(multi.getParameter("cid"));
    	vo.setCtype_id(multi.getParameter("ctype_id"));
    	vo.setProduct_name(multi.getParameter("product_name"));
    	vo.setM_new(multi.getParameter("new"));
    	vo.setLimit(multi.getParameter("limit"));
    	vo.setSoldout(multi.getParameter("soldout"));
    	vo.setDproduct_name(multi.getParameter("dproduct_name"));
    	vo.setDproduct_ename(multi.getParameter("dproduct_ename"));
    	vo.setDproduct_text(multi.getParameter("dproduct_text"));
    	vo.setDproduct_content(multi.getParameter("dproduct_content"));
    	vo.setDproduct_note(multi.getParameter("dproduct_note"));
    	vo.setDproduct_enjoy(multi.getParameter("dproduct_enjoy"));
    	vo.setM_new(multi.getParameter("m_new"));
    	vo.setLimit(multi.getParameter("limit"));
    	vo.setDproduct_story(multi.getParameter("dproduct_story"));
    	vo.setDproduct_tasting (multi.getParameter("dproduct_tasting"));
    	vo.setCimg_file_org(multi.getOriginalFileName("cimg_file"));
    	vo.setCimg_file(multi.getFilesystemName("cimg_file"));
    	vo.setCimg_bfile_org(multi.getOriginalFileName("cimg_bfile"));
    	vo.setCimg_bfile(multi.getFilesystemName("cimg_bfile"));
    	
    	
    	coffeeDAO mdao = new coffeeDAO();
    	if (mdao.getMenuInsert(vo) && mdao.getMenuListInsert(vo)) {
    		response.sendRedirect("admin_coffee_main.jsp");
    	} else {
    		out.print("<script>alert('글쓰기 실패');</script>");
    		out.print("<script>location.replace('http://localhost:9000/starbucks/admin/coffee/admin_coffee_main.jsp');</script>");
    	}
    	
  	%>