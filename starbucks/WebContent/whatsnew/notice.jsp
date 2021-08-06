<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
			 import="com.starbucks.dao.noticeDAO, com.starbucks.vo.noticeVO, java.util.*" %>
			 
 <% 
 	String rpage = request.getParameter("page"); //최초 호출시에는 rpage=null
	noticeDAO dao = new noticeDAO();	
	
	//페이징 처리 - startCount, endCount 구하기
	int startCount = 0;
	int endCount = 0;
	int pageSize = 10;	//한페이지당 게시물 수
	int reqPage = 1;	//요청페이지	
	int pageCount = 1;	//전체 페이지 수
	int dbCount = dao.execTotalCount();	//DB에서 가져온 전체 행수
	
	//총 페이지 수 계산
	if(dbCount % pageSize == 0){
		pageCount = dbCount/pageSize;
	} else {
		pageCount = dbCount/pageSize+1;
	}
	
	//요청 페이지 계산
	if(rpage != null){
		reqPage = Integer.parseInt(rpage);
		startCount = dbCount- ((reqPage *pageSize)-1);
		endCount = dbCount - (reqPage-1) * pageSize;
	} else {
		startCount = dbCount-9;
		endCount = dbCount;
	}
	
	ArrayList<noticeVO> list = dao.getList(startCount, endCount);
	
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

.sub_inner_title{
	width: 1100px;
	height: 91px;
	margin: 0 auto;
	position: relative;
}
ul.smap{
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
.container{
	width: 100%;
}
.notice_wrap{
	width: 1100px;
	padding-bottom: 80px;
	margin: 0 auto;
}
.search_notice {
	padding: 25px 30px;
	height: 38px;
	background: #f4f4f2;
	border-radius: 3px;
	margin-bottom: 30px;
	position: relative;
}
.search_notice p {
	position: absolute;
	right: 30px;
	
}
.search_notice p label{
	width: 1px;
	height: 1px;
	margin: -1px;
	overflow: hidden;
	position: absolute;
}
.search_notice p input{
	width: 321px;
	height: 36px;
	line-height: 36px;
	border: 1px solid #ddd;
	border-radius: 3px;
	text-indent: 10px;
	color: #666;
}
.search_notice p a{
	display: inline-block;
	width: 54px;
	height: 38px;
	line-height: 38px;
	background: #777;
	border-radius: 3px;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	text-align: center;
}
.notice_tb {
	width: 1100px;
	border-collapse: collapse;
	border-spacing:0;
	font-family:나눔바른고딕;
}
colgroup{
	display: table-column-group;
}
.notice_tb th{
	font-size: 14px;
	font-weight: bold;
	color: #222222;
	text-align: center;
	padding: 17px 0;
	border-top: 1px solid #333333;
	border-bottom: 1px solid #333333;
}
.notice tr td.left{
	text-align: left;
	padding-left: 20px;
}
.notice tr td{
	font-size: 14px;
	color: 	#666666;
	text-align: center;
	padding: 17px 0;
	border-bottom: 1px solid #dddddd;
	line-height: 1.8;
}
.notice td:nth-child(2)>a:hover { text-decoration:underline; }
.page_btn {
	width: 100%;
	height: 27px;
	margin-top: 50px;
	text-align:center;
}
.paper{
	text-align: center;
}
.paper li{
	display: inline-block;
	margin:  0 10px;
	vertical-align: middle;
	list-style: none;
}
.paper li a{
	color: #555555;
	font-size: 14px;
}
.paper li a img{
	margin-top: 5px;
}
	
</style>
<link rel="stylesheet" href="http://localhost:9000/starbucks/css/am-pagination.css">
<script src="http://localhost:9000/starbucks/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/starbucks/js/am-pagination.js"></script>
<script>

	$(document).ready(function(){
		
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: <%=dbCount%>,	// total pages	
		    page: <%=rpage%>,		// initial page		
		    pageSize: 10,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/starbucks/whatsnew/notice.jsp?page="+e.page);         
	    });
		
		$("#search").click (function() { //검색 기능
	        var value = $("#search_input").val().toLowerCase(); //호출 문자열을 소문자로 변환해 반환
	        $(".notice tr").filter(function() { //새로운 배열로 반환
	            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	        });
	    });
		
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
			<li><a href="http://localhost:9000/starbucks/index.jsp"><img class="home_icon" src="http://localhost:9000/starbucks/images/icon_home.png"></a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/whatsnew/whatsnew.jsp" >WHAT'S NEW</a></li>
			<li><img class=arrow_icon src="http://localhost:9000/starbucks/images/icon_arrow.png"></li>
			<li><a class= "this" href="http://localhost:9000/starbucks/whatsnew/notice.jsp">공지사항</a></li>
		</ul>
	</div>
</div>	

	<!-- 공지사항 검색-->
	<div class= "container">
		<div class= "notice_wrap">
			<div class="search_notice"> 
				<p><label>검색어</label><input id="search_input" type="text" placeholder="검색어를 입력해 주세요.">
				   <a style="cursor:pointer" id="search">검색</a>
				</p>
			</div> <!-- search_notice -->
			<!-- 공지사항 Table -->
			<table class="notice_tb">
			<colgroup>
				<col width="5.45454%">
				<col width="74.5454%">
				<col width="10.90909%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th scope= "col">NO</th>
					<th scope= "col">제목</th>
					<th scope= "col">날짜</th>
					<th scope= "col">조회수</th>
				</tr>				
			</thead>
				<tbody class= "notice">
				<% for ( noticeVO vo : list) { %>
					<tr>
						<td><%= vo.getNo() %></td>						
						<td class="left"><a href= "notice_content.jsp?nid=<%= vo.getNid() %>&no=<%= vo.getNo()%>"><%= vo.getTitle() %></a></td>
						<td><%= vo.getDate() %></td>
						<td><%= vo.getCount() %></td>
					</tr>	
				<% } %>
				</tbody>
			</table>
			<div class= "page_btn">
				<div id="ampaginationsm"></div>
			</div>
		</div> <!-- notice_wrap -->
	</div>  <!-- container -->

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>