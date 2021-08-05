<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"
	import = "com.starbucks.dao.menuDAO,com.starbucks.vo.menuVO,java.sql.*,java.util.*"%>  
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
		System.out.println("화면UI이름=" + multi.getOriginalFileName("mfile"));
		System.out.println("폴더저장이름=" + multi.getOriginalFileName("mfile").split(".jpg")[0]);
	
    	menuVO vo = new menuVO();  
    	
    	vo.setM_type(multi.getParameter("m_type"));
    	vo.setP_type(multi.getParameter("p_type"));
    	vo.setK_name(multi.getParameter("k_name"));
    	vo.setE_name(multi.getParameter("e_name"));
    	vo.setIntro_t(multi.getParameter("intro_t"));
    	vo.setIntro_b(multi.getParameter("intro_b"));
    	vo.setNutri_inform(multi.getParameter("nutri"));
    	vo.setKcal(multi.getParameter("kcal"));
    	vo.setFat(multi.getParameter("fat"));
    	vo.setProtein(multi.getParameter("protein"));
    	vo.setNa(multi.getParameter("na"));
    	vo.setSugar(multi.getParameter("sugar"));
    	vo.setCaffeine(multi.getParameter("caffeine"));
    	vo.setAllergy(multi.getParameter("allergy"));
    	vo.setImg(multi.getOriginalFileName("mfile").split(".jpg")[0]);
    	vo.setM_new(multi.getParameter("m_new"));
    	vo.setLimit(multi.getParameter("limit"));
    	vo.setTheme(multi.getParameter("theme"));
    	vo.setMfile(multi.getOriginalFileName("mfile"));
    	
    	
    	menuDAO mdao = new menuDAO();
    	if (mdao.getMenuInsert(vo)) {
    		response.sendRedirect("admin_menu_main.jsp");
    	} else {
    		out.print("<script>alert('글쓰기 실패');</script>");
    		out.print("<script>location.replace('http://localhost:9000/starbucks/admin/menu/admin_menu_main.jsp');</script>");
    	}
    	
  	%>