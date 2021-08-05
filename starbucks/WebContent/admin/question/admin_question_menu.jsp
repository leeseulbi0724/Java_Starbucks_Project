<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content_question ul { border:1px solid lightgray; display:inline-block; font-size:13px; float:left; padding:5px; width:200px; clear:left; }
	.content_question div.text { 
		text-align:left; font-size:13.5px; font-weight:bold; border:1px solid lightgray;
		padding:5px 0 5px 15px;
	}
	 .content_question section { float:left; }	 
	
	.submenu { background-color:rgb(243,243,243); color:black; display:inline-block; list-style-type:none; padding:0; margin:0; }
	
	.content_question { text-align:center; width:100%; }
	
	 .content_question div.center { 
		border:1px solid lightgray; height:500px; float:left; width:1200px;
	 }
	 .submenu li { cursor:pointer; }
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#before").click(function() {
			  var value = "답변하기";
		        $(".tbody tr").filter(function() {
		            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		        });
		});
		
		$("#after").click(function() {
			var value ="답변완료";
			$(".tbody tr").filter(function() {
	            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	        });			
		});
		
		$("#all").click(function() {
			var value="2021";
			$(".tbody tr").filter(function() {
	            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	        });			
		});
	});
</script>
</head>
<body>
		<section>
		<ul class="submenu">
			<li id="all">전체 문의사항</li>
		</ul>
		<ul class="submenu">
			<li id="before">미답변 문의사항</li>
		</ul>
		<ul class="submenu">
			<li id="after">답변완료 문의사항</li>
		</ul>
	</section>
</body>
</html>