<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>	
	.table { text-align:center; margin:20px 15px; width:1150px; font-size:13px; }
	.table, .table th, .table td { 
		border:1px solid lightgray;
 		border-collapse:collapse;
 	 }
 	 .table td { padding:10px 0 10px 20px; text-align:left; }
 	 .table input { width:500px; }
 	 .table #ntitle, .table textarea { border:1px solid lightgray; }
 	 .table th { background-color:rgb(237,237,237); }
 	 .table textarea { width:90%; height:300px; }
 	 .table tr th { padding:5px 0 5px 0; }
 	 button.btn_style { background-color:rgb(56,57,78); color:white; border:1px solid lightgray; cursor:pointer; }
</style>
<script src="http://localhost:9000/starbucks/js/jquery-3.6.0.min.js"></script>
<script>
 	$(document).ready(function() {
 		
		$(".span1").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/notice/admin_notice.jsp");
		});
		
		$(".span2").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/notice/admin_notice_write.jsp");
		}); 		
		
		$("#commit").click(function() {
			if ($("#ntitle").val() == "") {
				alert("제목을 입력해주세요");
				$("#ntitle").focus();
				return false;
			} else {
				notice_write.submit();
			}
		});
 	});
</script>
</head>
<body>
<!-- header -->
<jsp:include page = "../admin_header.jsp"></jsp:include>

<!--  -->
	<div class="content_notice" id="content">
		<jsp:include page = "admin_notice_menu.jsp"></jsp:include>
		<section>
			<div class="text">Home > <span class="span1">공지사항 관리</span> > <span class="span2">글쓰기</span></div>
			<div class="center">
			<form name="notice_write" action="admin_notice_write_process.jsp" method="post"  enctype="multipart/form-data">
				<table border=1 class="table" >
					<tr>
						<th>제목</th>
						<td><input type="text" name="ntitle" id ="ntitle"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea  name="ncontent"  overflow="auto"  id="ncontent"></textarea></td>
					</tr>
					<tr>
						<th>파일</th>
						<td><input type="file" name="nfile" ></td>
					</tr>					
				</table>
				<button type="button"  class="btn_style" id="commit">작성완료</button>
				<button type="reset" class="btn_style">작성취소</button>
			</form>
			</div>
		</section>
	</div>
</body>
</html>