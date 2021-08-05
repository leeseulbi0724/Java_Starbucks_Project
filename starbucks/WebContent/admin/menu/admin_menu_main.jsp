<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.starbucks.vo.*, com.starbucks.dao.*, java.util.*" %>
<%
	menuDAO dao = new menuDAO();
	ArrayList<menuVO> list = dao.getMenuList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴관리 | 관리자 페이지</title>
<style>
	.table { text-align:center; margin:15px; width:1150px; font-size:13px; }
	.table, .table th, .table td { 
		border:1px solid lightgray;
 		border-collapse:collapse;
 	 }
 	 .table tr th { 
 	 	padding:5px 0 5px 0;
 	 	position: sticky;
   		top: 0px;
   		background-color:rgb(237,237,237) !important;
 	 }
 	 
 	 .table td { vertical-align:middle; }
 	  	 
 	 button.btn_style { font-size:10px; }
 	 
 	 .content_menu div.search { text-align:left; padding: 10px; border:1px solid lightgray; }
	.content_menu div.search input { width:150px; height:12px; }
	.content_menu div.search button { background-color:rgb(56,57,78); color:white; border:1px solid lightgray; cursor:pointer; }
	
	#update, #delete { float:right; }
	
	tr td:nth-child(2){
		width: 126px;
	}
	tr td:nth-child(3){
		width: 67px;
	}
	tr td:last-child {
		width: 633px;
	}
	
	/* 미리보기 스타일 셋팅 */
	#preview{
		position:absolute;
		border:0px solid #ccc;
		background:#333;
		padding:1px;
		display:none;
		color:#fff;
		height:300px;
		width:300px;
	}
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.elevatezoom.js"></script>
<script>
$(document).ready(function() {	
	$("#update").click(function() {
		location.replace("http://localhost:9000/starbucks/admin/menu/admin_menu_write.jsp");
	});
	
	$("#search").click (function() {	
        var value = $("#search_input").val().toLowerCase();
        $(".tbody tr").hide();
        var select = $(".select").val();
		if( select == "id") {
			var value = $(".tbody td:nth-child(8n+5):contains('" + value + "') ");
		 	$(value).parent().show();
		}
        
    });
	
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
	
	$("#delete").click(function() {
		if ( $("input[type='checkbox']:checked").length == 0 ) {
			alert("삭제하실 메뉴를 선택해주세요");
		} else {
			
			if (confirm("정말 삭제하시겠습니까?") == true ) {
				console.log('삭제');
				alert("삭제 되었습니다");
				
				$("form").attr("action","admin_menu_delete_process.jsp");
				
			} else {
				return; 
			}
		}
	});
	
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
	        rows.filter(":has(td:nth-child(3):contains("+selected+"))").show();
	        rows.not(":has(td:nth-child(3):contains("+selected+"))").hide();
	    }else{
	        rows.show();
	        addRemoveClass(rows);
	    }  
	 });
	$("#select_all").click(function(){
		if ($("#select_all").is(':checked')) {
			 $("input[type=checkbox]").prop("checked", true);
		}else{
			 $("input[type=checkbox]").prop("checked", false);
		}
	});
	
});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../admin_header.jsp"></jsp:include>

	<!-- 문의 관리 -->
	<div class="content_menu" id="content">
		<jsp:include page = "admin_menu_menu.jsp"></jsp:include>
	<form name="menu" action="#" method="post">
		<section>
			<div class="text">Home > <span>메뉴 관리</span></div>
			<div class="search">
				<select class="select">
					<option value="id">이름</option>
				</select>
				<input type="text" id="search_input">
				<button id="search" type="button">검색</button>
				<button id="delete" type="submit">메뉴삭제</button>
				<button id="update" type="button">메뉴등록</button>
			</div>
			<div class="center" style="overflow:scroll">
				<table border=1 class="table" >
				<thead>
					<tr>
						<th><input type="checkbox" name="select_all" id="select_all"></th>
						<th>이미지</th>
						<th>
						<select class="choice">
							<option value="all">전체
							<option value="음료">음료
							<option value="푸드">푸드
							<option value="상품">상품
						</select>
						</th>
						<th>분류</th>
						<th>이름</th>
					</tr>
				</thead>
				<tbody class="tbody">
				<% for(menuVO vo : list){ %>
				<tr>
					<td><input type="checkbox" name="select" value="<%= vo.getMid() %>"></td>
					<td class="img"><img src="http://localhost:9000/starbucks/images/<%=vo.getImg() %>.jpg" width=50 height=50></td>
					<td><%=vo.getM_type() %></td>
					<td><%=vo.getP_type() %></td>
					<td><%=vo.getK_name() %></td>
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