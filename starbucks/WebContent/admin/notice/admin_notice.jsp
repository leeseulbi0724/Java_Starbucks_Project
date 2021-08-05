<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import = "com.starbucks.dao.noticeDAO,com.starbucks.vo.noticeVO,java.sql.*,java.util.*"
%>
 <%
 			noticeDAO ndao = new noticeDAO(); 
     		ArrayList<noticeVO> list = ndao.getSelectResult();
     		ArrayList<String> nid_list = new ArrayList<String>();
     		
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항관리 | 관리자 페이지</title>
<style>
	.content_notice div.search {  text-align:left; padding:13.7px; border:1px solid lightgray; }
	 .content_notice div.search button.write,  .content_notice div.search button.del { 
	 	background-color:rgb(56,57,78); color:white; border:1px solid lightgray; 
		float:right; cursor:pointer; margin-bottom:-8px; position:relative; bottom:10px; margin-left:10px;
	 }
	.table { text-align:center; margin:15px; width:1150px; font-size:13px; }
	.table, .table th, .table td { 
		border:1px solid lightgray;
 		border-collapse:collapse;
 	 }
 	 .table thead tr:first-child { background-color:rgb(237,237,237); }
 	 .table tr th { padding:5px 0 5px 0; }
 	 .table tr { cursor:default; }
 	 .table tr td:nth-child(3) a { cursor:pointer; }
 	 .table a { text-decoration:none; color:black; } 	
    
	
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('input[name=select_all]').on('change', function(){
		  $('input[name=select]').prop('checked', this.checked);
		});
		
		$(".write").click(function() {
			location.href = "http://localhost:9000/starbucks/admin/notice/admin_notice_write.jsp";
		});
		
		$("span").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/notice/admin_notice.jsp");
		});
		
		$("#delete").click(function() {
			if ( $("input[type='checkbox']:checked").length == 0 ) {
				alert("삭제하실 게시물을 선택해주세요");
				$("form").attr("action","admin_notice.jsp");
			} else {
				
				if (confirm("정말 삭제하시겠습니까?") == true ) {
					$("form").attr("action","admin_notice_delete_process.jsp");
					
				} else {
					return; 
				}
			}
		});
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../admin_header.jsp"></jsp:include>

	<!-- 공지사항 관리 -->
	<div class="content_notice" id="content">
		<jsp:include page = "admin_notice_menu.jsp"></jsp:include>
		<form name="notice_list" action="admin_notice_content.jsp" method="post" enctype="multipart/form-data" >
		<section>
			<div class="text">Home > <span>공지사항 관리</span></div>
			<div class="search">
				<button type="button" class="write">글쓰기</button>
				<button type="submit" class="del"  id="delete">삭제</button>
			</div>
			<div class="center" style="overflow:scroll">
					<table border=1 class="table">
					<thead>
						<tr>
							<th><input type="checkbox" name="select_all"></th>
							<th>NO</th>
							<th>제목</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody class="tbody">				
					<% for(noticeVO vo : list) { %>
						<tr>								
								<td><input type="checkbox" name="select" value="<%= vo.getNid() %>"></td>
								<td><%= vo.getNo() %></td>
								<td><a href="admin_notice_content.jsp?nid=<%= vo.getNid() %>" ><%= vo.getTitle() %></a></td>
								<td><%= vo.getDate() %></td>
								<td><%= vo.getCount() %></td>								
						</tr>
						<input type="hidden" name="nsfile_old" value="<%= vo.getSfile() %>">
					<% } %>
					</tbody>
				</table>			
			</div>
		</section>
	</form>						
	</div>	 
</body>
</html>