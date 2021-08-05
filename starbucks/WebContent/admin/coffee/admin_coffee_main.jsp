<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.starbucks.dao.coffeeDAO, com.starbucks.vo.CoffeeVO, java.util.*" %>
 <%
	coffeeDAO dao = new coffeeDAO();
	ArrayList<CoffeeVO> list = dao.getMenuList();
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
 	 
 	 .table td { vertical-align:middle; }
 	  	 
 	 button.btn_style { font-size:10px; }
 	 
 	 .content_coffee div.search { text-align:left; padding: 10px; border:1px solid lightgray; }
	.content_coffee div.search input { width:150px; height:12px; }
	.content_coffee div.search button { background-color:rgb(56,57,78); color:white; border:1px solid lightgray; cursor:pointer; }
	
	#update, #delete { float:right; }
	
		/* 미리보기 스타일 셋팅 */
	#preview{
		position:absolute;
		border:0px solid #ccc;
		padding:1px;
		background:#333;
		display:none;
		color:#fff;
		height:300px;
	}
	
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {	
	//등록
	$("#update").click(function() {
		location.replace("http://localhost:9000/starbucks/admin/coffee/admin_coffee_write.jsp");
	});
	//이미지 줌
	
	var xOffset = 10;
    var yOffset = 30;

    $(document).on("mouseover",".img",function(e){ //마우스 오버시
		
		$("body").append("<p id='preview'><img src='"+ $(this).children("img").attr("src") +"' width='300px' height='300px' /></p>");						 
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("fast"); //미리보기 화면 설정 셋팅
	});

	$(document).on("mouseout",".img",function(){ //마우스 아웃시
		$("#preview").remove();
	});
	
	// 검색
	$("#search").click (function() {	
		var value = $("#search_input").val().toLowerCase();
		$(".tbody tr").hide();
		var select = $(".select").val();
		if(select =="id"){
			var value = $(".tbody td:nth-child(8n+3):contains('" + value + "') ");
		 	$(value).parent().show();
		}else if(select =="type") {
			var value = $(".tbody td:nth-child(8n+4):contains('" + value + "') ");
		 	$(value).parent().show();
		}else if(select =="name"){
			var value = $(".tbody td:nth-child(8n+5):contains('" + value + "') ");
		 	$(value).parent().show();
		}else {
			var value = $(".tbody td:contains('" + value + "') ");
		 	$(value).parent().show();
		}
	});
	
	//삭제
	$("#delete").click(function() {
		if ( $("input[type='checkbox']:checked").length == 0 ) {
			alert("삭제하실 메뉴를 선택해주세요");
		} else {
			
			if (confirm("정말 삭제하시겠습니까?") == true ) {
				console.log('삭제');
				alert("삭제 되었습니다");
				
				$("form").attr("action","admin_coffee_delete_process.jsp");
				
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

	<!-- 문의 관리 -->
	<div class="content_coffee" id="content">
		<jsp:include page = "admin_coffee_menu.jsp"></jsp:include>
	<form name="coffee" action="" method="post">
	<section>
		<div class="text">Home > <span>커피 관리</span></div>
		<div class="search">
			<select class="select">
				<option value="">전체</option>
				<option value="id">종류</option>
				<option value="type">타입</option>
				<option value="name">이름</option>
			</select>
			<input type="text" id="search_input">
			<button id="search" type="button">검색</button>
			<button id="delete" type="submit">커피삭제</button>
			<button id="update" type="button">커피등록</button>
		</div>
		<div class="center" style="overflow:scroll">
			<table border=1 class="table" >
			<thead>
				<tr>
					<th><input type="checkbox" name="select_all"></th>
					<th>이미지</th>
					<th>종류</th>
					<th>타입</th>
					<th>이름</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<% for(CoffeeVO vo : list){ %>
			<tr>
				<td><input type="checkbox" name="select" value="<%= vo.getDproduct_name() %>"></td>
				<td class="img"><img src="http://localhost:9000/starbucks/images/<%= vo.getCimg_file() %>" width=50 height=50></td>
				<td>
					<%if(vo.getCid().equals("bean1")){ %>스타벅스 원두<% }%>
					<%if(vo.getCid().equals("bean2")){ %>스타벅스 비아<% }%>
					<%if(vo.getCid().equals("bean3")){ %>스타벅스 오리가미<% }%>
				</td>
				<td><%= vo.getCtype_id() %></td>
				<td><%= vo.getDproduct_name() %></td>
			</tr>
			<% } %>
			</tbody>
		</table>
		</div>
	</section>	
	</form>
	</div>
</body>
</html>