<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.*, com.starbucks.vo.*"
%>
<%
	String value = request.getParameter("sid");

	String name[] = value.split("&");
	String sid = name[0];
	String yn = name[1];

	serviceVO cvo = new serviceVO();
	serviceDAO dao = new serviceDAO();
	serviceVO vo = dao.getContentResult(sid);
	
	if (yn.equals("yes")) {
		cvo = dao.getCommentResult(sid);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	.table { text-align:center; margin:20px 15px; width:1150px; font-size:13px; }	
	
	#two, #two th, #two td { 
		border:1px solid lightgray;
 		border-collapse:collapse;
 	 }
 	 #one { border-top:1px solid lightgray; border-left:1px solid lightgray; border-right:1px solid lightgray; border-collapse:collapse; }
 	 #one th, #one td { border-right:1px solid lightgray; }
 	 
 	 #two td { padding:10px 0 10px 20px; text-align:left; }
 	 .table #ctitle, .table textarea, table #ccategory { border:1px solid lightgray; }
 	 .table th { background-color:rgb(237,237,237); }
 	 .table textarea.content { width:90%; height:300px; }
 	 .table textarea.comment { width:90%; height:200px; }
 	 .table tr th { padding:5px 0 5px 0; text-align:center; vertical-align:middle;}
 	 
 	 #one input { text-align:center; }
 	 
 	 button.btn_style { background-color:rgb(56,57,78); color:white; border:1px solid lightgray; cursor:pointer; margin-bottom:10px; }
 	 
 	 #one { width:400px; margin-bottom:0; }
	#one input { margin:10px 10px; }
	#one td:first-child input { width:100px; }
	#one td:nth-child(2) input { width:40px; }
	#one td:nth-child(6) input { width:80px; }
	#one th:last-child { width:200px; }
	
	#two th { width:128px; }	
	#two tr:first-child input { width:900px; }
	#two { margin-top:0; }
	
	div.sfile { 
		width:400px; height:400px; background-color:white; border:1px solid lightgray; position:absolute; 
		line-height:400px; margin-left:400px; display:none;
	}
	div.sfile button { float:right; background-color:white; border:none; position:absolute; margin-left:220px; font-size:20px; cursor:pointer; }
	
	#open { }
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
		$(".span1").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/question/admin_question.jsp");
		});		
		
		$("#comment").click(function() {
			if ($(".comment").val() == "") {
				alert("답변을 입력해주세요");
				$(".comment").focus();
				return false;
			} else {
				question_comment.submit();
			}
		});
		
		$("#ok").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/question/admin_question.jsp");
		});
		
		$("#open").click(function() {
			$(".sfile").css("display","block");
		});
		
		$("#X").click(function() {
			$(".sfile").css("display","none");
		});
	});
</script>
</head>
<body>
<!-- header -->
	<jsp:include page = "../admin_header.jsp"></jsp:include>

	<!-- 문의 관리 -->
	<div class="content_question" id="content">
		<jsp:include page = "admin_question_menu.jsp"></jsp:include>
		<section>
			<div class="text">Home > <span class="span1">문의사항 관리</span> > <span class="span2">답변</span></div>
			<div class="center" style="overflow:scroll">
			<form name = "question_comment" action="admin_question_comment_process.jsp?sid=<%= sid %>" method="post">
				<table class="table" id="one">
					<tr>
						<th>ID</th>
						<th>유형</th>
						<th>메일</th>
						<th>연락처</th>
						<th>장소</th>
						<th colspan="2">첨부파일</th>
					</tr>
					<tr>						
						<td><input type="text" id ="cid" value="<%= vo.getId() %>" disabled ></td>
						<td><input type="text" id ="ccategory" value="<%= vo.getCategory() %>" disabled ></td>
						<td><input type="text" id ="cmail" value="<%= vo.getEmail() %>" disabled ></td>
						<td><input type="text" id ="chp" value="<%= vo.getHp() %>" disabled ></td>
						<td><input type="text" id ="cplace" value="<%=vo.getPlace() %>" disabled ></td>
						<% if (vo.getEfile() != null) { %>
							<td><input type="text" id="cfile" value="<%=vo.getEfile() %>" disabled></td>
							<td><button type="button" id="open" class="btn_style" style="width:50px">열기</button></td>
						<% } else { %>
							<td><input type="text" id="cfile" value="파일없음" disabled></td>
						<% } %>
						<div class="sfile">
							<button type="button" id="X">X</button>
							<img src="http://localhost:9000/starbucks/upload/<%= vo.getSfile() %>" width=100px height=100px>
						</div>
					</tr>
				</table>
				<table border=1 class="table"  id="two">
					<tr>
						<th>제목</th>
						<td colspan="4"><input type="text" id ="ctitle" value="<%=vo.getTitle() %>" disabled ></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="4">
							<textarea class="content" disabled><%= vo.getContent() %></textarea>											
						</td>
					</tr>
					<tr>
						<th>답변</th>
						<% if (yn.equals("no")) { %>
						<td colspan="4"><textarea  class="comment" name="comment"></textarea></td>
						<% } else { %>
						<td colspan="4"><textarea  class="comment" name="comment" disabled><%= cvo.getComment() %></textarea></td>
						<% } %>		
					</tr>
				</table>
				<% if (yn.equals("no")) { %>
				<button type="button"  class="btn_style" id="comment">답변완료</button>
				<% } else { %>
				<button type="button"  class="btn_style" id="ok">확인</button>
				<% } %>
				</form>
			</div>
		</section>
	</div>
</body>
</html>