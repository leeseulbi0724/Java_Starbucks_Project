<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.noticeDAO, com.starbucks.vo.noticeVO, java.util.*"
%>
<%
	String nid = request.getParameter("nid");
	String no = request.getParameter("no");
	String before = "";
	String after = "";
	
	noticeDAO ndao = new noticeDAO();	
	noticeVO vo = ndao.getContentResult(nid);	
	ArrayList<noticeVO> list = ndao.getSelectResult();			

	int before_count = Integer.parseInt(no)-1;
	int after_count = Integer.parseInt(no)+1;
	
	noticeVO before_vo = ndao.getNext(before_count);
	noticeVO after_vo = ndao.getNext(after_count);
	
	ndao.getCountUp(nid);
	
	/**
	if (Integer.parseInt(no) == list.size()) {
		before = list.get(1).getTitle();
		after = "해당 글이 없습니다.";
	 } else if (Integer.parseInt(no) < list.size() && Integer.parseInt(no) != 1) { 
		//before = list.get(list.indexOf()).getTitle();
	 } else {
		 before ="해당글이 없습니다.";
		after = list.get(list.size()-2).getTitle();
	 }
	**/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>공지사항 | Starbucks Coffee Korea</title>
<style>
	.sub_title{
	width: 100%;
	height: 98px;
	background: #ffffff;
	margin-top: 30px;
	padding-top: 30px;
	}
	ul.smap li{
		float: left;
		margin: 0 2.5px;
		text-decoration: none;
		display: inline-block;
		margin-right: 2px;
		color: #ffffff;
	}
	.this{
		color: #777777;
	}
	a:link {text-decoration: none; color: #333333;}
	a:visited {text-decoration: none; color: #333333;}
	.sub_inner_title {
	width: 1100px;
	height: 91px;
	margin: 0 auto;
	position: relative;
	}
	ul.smap {
		position: absolute;
		right: 0;
		top: 60px;
		list-style: none;
		display: inline-block;
		font-size:13px;
	}
	.span a { text-decoration:none; }
	.smap a:hover { text-decoration:underline; }
	.sub_title h1{
		font: bold 36px Avenir, Arial, georgia;
		color: #222222;
		padding-top: 30px;
		position: relative;
	}
	.container {
		width: 100%;
	}
	.notice_wrap {
		width: 1100px;
		padding-bottom: 80px;
		margin: 0 auto;
	}
	.notice_wrap #list { 
		background-color:rgb(102,102,102);
		color:white;
		font-weight:bold;
		padding:10px 30px;
		border-radius:4px;
		float:right;
		margin-top:15px;
		margin-bottom:20px;
	}
	.notice_wrap a:hover { text-decoration:underline; }
	.notice_tb, .notice_nx {
		width: 1100px;
		border-collapse: collapse;
		border-spacing: 0;		
		font-family:나눔바른고딕;
	}
	.notice_tb th {
		font-size: 14px;
		font-weight: bold;
		color: #222222;
		text-align: left;
		padding: 17px 20px;
		border-top: 1px solid #333;
		border-bottom: 1px solid #999;
		width:100%;
	}	
	.notice_nx th {
		font-size: 14px;		
		color: #222222;
		text-align: left;
		padding: 12px 20px;
		border-top: 1px solid #333;
		border-bottom: 1px solid #999;
		width:100%;
	}		
	.notice_nx tr:first-child th {
		border-top:1px solid #999;
		border-bottom:1px solid rgb(240,240,240);
	}
	.notice_nx th:first-child { 
		color:black;
		font-weight: bold;
		background-color:rgb(244,244,242);
		width:30%;
	}
	.notice_nx a { 
		color:#666;
		font-weight:normal;
	}
	.notice_tb tr td {
		font-size: 13px;
		color: 	#666666;
		text-align: left;
		padding: 17px 10px;
		border-bottom: 1px solid #dddddd;	
		line-height: 1.8;		
	}
	td textarea { 
		width:100%; border:none; margin-top:10px; 
		background-color:white;
		font-family:나눔바른고딕;
		resize:none;
	}
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="http://rawgit.com/jackmoored/autosize/master/dist/autosize.min.js"></script>
<script>
$(document).ready(function() {		
	$("textarea").css("height", $("textarea").prop('scrollHeight'));
});
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<!-- 서브 타이틀  -->
	<div class="sub_title">
		<div class="sub_inner_title">
			<img class="event_txt"src="http://localhost:9000/starbucks/images/notice_tit.jpg">
		<ul class="smap">
			<li><a href=""><img class="home_icon" src="http://localhost:9000/starbucks/images/icon_home.png"></a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/whatsnew/whatsnew.jsp" >WHAT'S NEW</a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/whatsnew/notice.jsp">공지사항</a></li>
		</ul>
	</div>
</div>	
	<div class= "container">
		<div class= "notice_wrap">			
			<!-- 공지사항 Table -->
			<table class="notice_tb">			
			<thead>
				<tr>
					<th><%= vo.getTitle() %></th>
				</tr>				
			</thead>
			<tbody class= "notice">
				<tr>
					<td>
						<% if(vo.getContent() != null) { %>
							<textarea disabled style="resize: none;"><%= vo.getContent() %></textarea>
						<% } %>
						<% if(vo.getSfile() != null) { %>
						<img src="http://localhost:9000/starbucks/upload/<%= vo.getSfile() %>">
						<% } %>
					</td>
				</tr>	
			</tbody>
			</table>
		<a href="notice.jsp" id="list">목록</a>
		<div class="notice_next">
			<table class="notice_nx">
				<tr>
					<th>윗글</th>
					<th>
					<% if(after_vo.getTitle() == null ) { %>
					 <a style="cursor:default">해당 글이 없습니다</a>
					 <% } else { %>
					 <a href="http://localhost:9000/starbucks/whatsnew/notice_content.jsp?nid=<%= after_vo.getNid()%>&no=<%=after_vo.getNo()%>">
					 	<%= after_vo.getTitle() %>
					 </a>
					 <% } %>
					</th>
				</tr>
				<tr>
					<th>아랫글</th>
					<th>
					<% if(before_vo.getTitle() == null ) { %>
					 <a style="cursor:default">해당 글이 없습니다</a>
					 <% } else { %>
					 <a href="http://localhost:9000/starbucks/whatsnew/notice_content.jsp?nid=<%= before_vo.getNid()%>&no=<%=before_vo.getNo()%>">
					 	<%= before_vo.getTitle() %>
					 </a>
					 <% } %>
					</th>
				</tr>				
			</table>
		</div>
		</div> <!-- notice_wrap -->
	</div>  <!-- container -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>