<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import = "com.starbucks.dao.noticeDAO,com.starbucks.vo.noticeVO,java.sql.*,java.util.*" %> 
	<%
 		String nid = request.getParameter("nid");	
		noticeDAO ndao = new noticeDAO();		
		noticeVO vo = ndao.getContentResult(nid);		
		ndao.close();
 	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	.box { margin:20px; height:430px; text-align:center; }
	.c_title { 
		border-top:1px solid black; 
		border-bottom:1px solid black; 
		margin:10px 0; display:inline-block; width:90%;
		font-size:22px; font-weight:bold; padding:5px;
		font-family:나눔스퀘어_ac;
	 }
	 .c_content { display:inline-block; width:95%; margin-top:10px; height:420px; }
	 textarea { width:90%; border:none; margin-top:10px; background-color:white; font-family:나눔바른고딕; resize:none; }
	  a.btn_style { 
	  	margin-top:10px; 
	  	padding:0 5px;
	  	background-color:rgb(56,57,78); 
	  	color:white; 
	  	border:1px solid lightgray; 
	  	cursor:pointer; 
	  	text-decoration:none;
	  	font-size:14px;
	  }
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script src="http://rawgit.com/jackmoored/autosize/master/dist/autosize.min.js"></script>
<script>
	$(document).ready(function() {				
		$("textarea").css("height", $("textarea").prop('scrollHeight'));
		
		$(".span1").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/notice/admin_notice.jsp");
		});
		
		$(".span2").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/notice/admin_notice_content.jsp");
		});
		
	});
</script>
</head>
<body>
<!-- header -->
<jsp:include page = "../admin_header.jsp"></jsp:include>

	<div class="content_notice" id="content">
		<jsp:include page = "admin_notice_menu.jsp"></jsp:include>
		<section>
			<div class="text">Home > <span class="span1">공지사항 관리</span> > <span class="span2">상세보기</span></div>
			<div class="center">
				<div class="box">
					<div class="c_content" style="overflow:scroll">
						<div class="c_title"><%= vo.getTitle() %></div>
							<% if(vo.getContent() != null) { %>
							<textarea disabled style="resize: none;"><%= vo.getContent() %></textarea>
							<% } %>
							<% if(vo.getSfile() != null) { %>
							<img src="http://localhost:9000/starbucks/upload/<%= vo.getSfile() %>">
							<% } %>
					</div>
					<div><a href="admin_notice_update.jsp?nid=<%= nid %>" class="btn_style"  id="update">수정하기</a></div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>