<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.*, com.starbucks.vo.*, java.util.*"
%>
<%
	serviceDAO dao = new serviceDAO();
	ArrayList<serviceVO> list = dao.getSelectResult();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의관리 | 관리자 페이지</title>
<style>
	.table { text-align:center; margin:15px; width:1150px; font-size:13px; }
	.table, .table th, .table td { 
		border:1px solid lightgray;
 		border-collapse:collapse;
 	 }
 	 .table thead tr:first-child { background-color:rgb(237,237,237); }
 	 .table tr th { padding:5px 0 5px 0; }
 	 
 	 button.btn_style { font-size:10px; }
 	 
 	 .content_question div.search { text-align:left; padding: 10px; border:1px solid lightgray; }
	.content_question div.search input { width:150px; height:12px; }
	.content_question div.search button { background-color:rgb(56,57,78); color:white; border:1px solid lightgray; cursor:pointer; }
	
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	  function addRemoveClass(theRows){
	         theRows.removeClass("odd even");
	         theRows.filter(":odd").addClass("add");
	         theRows.filter(":even").addClass("even");
	     }
	 var rows = $(".table tr:not(:first)");
	  addRemoveClass(rows);
	
	$(".choice").on("change",function(){
	    var selected = $('.choice').val();
	    if(selected != "all"){
	        rows.filter(":has(td:nth-child(2):contains("+selected+"))").show();
	        rows.not(":has(td:nth-child(2):contains("+selected+"))").hide();
	    }else{
	        rows.show();
	        addRemoveClass(rows);
	    }  
 	 });
	
	/**$("#com_btn").click(function() {
		
		var sid = $(this).val();
	
		location.href = "http://localhost:9000/starbucks/admin/question/admin_question_comment.jsp?sid="+sid;
		
	});**/
	
	$("span").click(function() {
		location.replace("http://localhost:9000/starbucks/admin/question/admin_question.jsp");
	});
	
	$("#search").click (function() {
        var value = $("#search_input").val().toLowerCase();
        $(".tbody tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
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
		<div class="text">Home > <span>문의사항 관리</span></div>
		<div class="search">
			<select>
				<option value="id">작성자</option>
			</select>
			<input type="text" id="search_input">
			<button id="search">검색</button>
		</div>
		<div class="center" style="overflow:scroll">
		<form name="comment" action="admin_question_comment.jsp" method="post">
			<table border=1 class="table" >
			<thead>
				<tr>
					<th>NO</th>
					<th>
					<select class="choice">
						<option value="all">전체
						<option value="문의">문의
						<option value="칭찬">칭찬
						<option value="제안">제안
						<option value="불만">불만
					</select>
					</th>
					<th>작성자</th>
					<th>제목</th>
					<th>날짜</th>
					<th>답변여부</th>
				</tr>
			</thead>
			<tbody class="tbody">
			<% for( serviceVO vo : list ) { %>				
				<tr>
					<td><%= vo.getRno() %></td>
					<td><%= vo.getCategory() %></td>
					<td><%= vo.getId() %></td>
					<td><%= vo.getTitle() %></td>
					<td><%= vo.getSdate() %></td>
					<td>
					<% if( vo.getReply() == 0) {  %>
						<button type="submit" class="btn_style" value="<%=vo.getSid() %>&no" name="sid" style="background-color:#777; color:white; cursor:pointer; border:1px solid lightgray; " >답변하기</button>
					<% } else { %>
						<button type="submit" class="btn_style" value="<%=vo.getSid() %>&yes"  name="sid" style="background-color:white; color:black; border:1px solid lightgray; cursor:pointer;" >답변완료</button>
					<% } %>
					</td>
				</tr>				
			<% } %>			
			</tbody>
		</table>
		</form>
		</div>
	</section>	
	</div>
</body>
</html>