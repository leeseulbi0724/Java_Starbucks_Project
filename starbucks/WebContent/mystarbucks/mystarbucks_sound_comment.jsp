<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.*, com.starbucks.vo.*"%>
<% 
	String sid = request.getParameter("sid"); 
    serviceDAO dao = new serviceDAO();   
    
    serviceVO vo = dao.getCommentResult(sid);
    serviceVO vo_con = dao.getContentResult(sid);
    
    String comment = vo.getComment().replace("\r\n", "<br>");
    String content = vo_con.getContent().replace("\r\n", "<br>");
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객의 소리 | Starbucks Coffee Korea</title>
<style>
	body { overflow-x:hidden; overflow-y:auto; }
	section {
		text-align:center;
	}
	div.title {
		width: 100%;
		height: 178px;
		background: url(http://localhost:9000/starbucks/images/ms_sub_ttl_bg.jpg);
	}
	div.title h1 {
		font: bold 36px Avenir, Arial, georgia;
		color: #ffffff;
		padding-top: 30px;
		position:relative;
		top:60px; right:430px;
	}
	div.icon_home {
		position:relative; bottom:50px; left:450px; color:white; font-size:13px; font-weight:normal;
	}
	div.icon_home a {
		text-decoration:none; color:white;
	}
	div.icon_home a:hover { text-decoration:underline; }
	
	div.text { 
		display:inline-block; text-align:left; 
		background-color:rgb(244,244,242);
		width:830px; height:180px; margin-right:250px; margin-top:-50px;
		padding:10px 0 0 0; 
	}
	div.text p, div.text li { padding-left:30px; padding-top:10px; }
	div.text p:first-child { font-weight:bold; font-size:15px; }
	div.text p:nth-child(2) { font-size:13px; }
	div.text li { font-size:12px; margin-bottom:20px; color:gray; list-style-type:square; }
	div.text a { 
		background-color:rgb(226,195,131); text-decoration:none; color:black; border:1px solid gray;
		margin:0 30px; font-size:12px; border-radius:4px; padding:5px 10px 5px 10px; font-weight:bold;
		cursor:pointer; position:relative; bottom:20px;
	}
	div.text a:hover { text-decoration:underline; }
	div.text img { margin-left:400px; margin-top:-140px; }
	
	section.btn { height:100px; }
	div.button { 
			display:inline-block; 
			position:relative; 
			left:470px; top:50px;
			text-align:left; 
			border-bottom:1px solid lightgray; 
		}
	div.button>div:first-child { border-top:2px solid black; width:220px;  }
	div.button a { text-decoration:none; color:#444; font-weight:bold; }
	div.button p { font-size:14px; }
	div.button a:hover { text-decoration:underline; color:green; }
	div.button p { padding:10px; margin:0; }
	div.button>div.line { border-top:1px solid lightgray; width:220px; position:absolute; }
	div.button li {
		list-style: none; 		
	}
	div.button li:last-child { margin-bottom:10px; }
	.hide { display:none; margin-left:10px; font-size:12px; }
	.down_menu {
		cursor:pointer;		
	}	
	.down_menu img { margin-left:100px; }
	
	.table { text-align:center; margin-bottom:50px; }
	.table div { display:inline-block; }
	.table table { 
		border-collapse: collapse;
		border-spacing: 0; 
		font-size:14px;
		margin:50px 255px 25px 0;
		width:820px;
		font-family:나눔바른고딕;
	}
	.table th, .table td { padding:15px 0 15px 15px; text-align:left; }
	.table tr:first-child { 
		border-top:1px solid lightgray; 
		border-bottom:1px solid lightgray; 
		background-color:rgb(247,247,247); 
	}
	.table tr:nth-child(2), .table tr:nth-child(3), .table tr:last-child { 
		border-bottom:1px solid lightgray; 	
	}
	.table a { 
		text-decoration:none; 
		background-color:rgb(226,195,131); 
		color:black; 
		border:1px solid gray;
		border-radius:4px; 
		padding:5px 20px;
		margin-left:450px;
		font-size:13px;
	} 
	.table a:hover { text-decoration:underline; }


	
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$(".down_menu").click(function() {
			
			if ($(this).attr("id") == "down") {
				$(".hide").slideDown();
				$(".sbox_arrow_down").attr("src","http://localhost:9000/starbucks/images/sbox_arrow_up.png")
				$(this).attr("id","up");				
			} else {
				$(".hide").slideUp();
				$(".sbox_arrow_down").attr("src","http://localhost:9000/starbucks/images/sbox_arrow_down.png")
				$(this).attr("id","down");
				
			}
		});		
	});
</script>
</head>
<body>
<!--  header -->
<jsp:include page ="../header.jsp"></jsp:include>
	
	<!--  content -->
	<section>
		<div class="title">
		<h1>고객의 소리</h1></div>
		<div class="icon_home">
			<a href="http://localhost:9000/starbucks/index.jsp"><img src="http://localhost:9000/starbucks/images/icon_home_white.png" ></a>
			<img src="http://localhost:9000/starbucks/images/icon_arrow_w.png" >
			<a href="http://localhost:9000/starbucks/mystarbucks/mystarbucks_main.jsp">My Starbucks</a>
			<img src="http://localhost:9000/starbucks/images/icon_arrow_w.png" >
			<a href="http://localhost:9000/starbucks/mystarbucks/mystarbucks_sound.jsp">참여 현황</a>
			<img src="http://localhost:9000/starbucks/images/icon_arrow_w.png" >
			<a href="http://localhost:9000/starbucks/mystarbucks/mystarbucks_sound.jsp">고객의 소리</a>
		</div>
	</section>	
	<section class="btn">
		<div class="button">
			<div></div>
			<p><a href="http://localhost:9000/starbucks/mystarbucks/mystarbucks_sound.jsp">My 고객의 소리</a></p>
			<div class="line"></div>
			<p><a class="down_menu" id="down">개인정보관리<img class="sbox_arrow_down" src="http://localhost:9000/starbucks/images/sbox_arrow_down.png"></a></p>
			<ul class="hide">
				<li><a class="font" href="">. 개인정보확인 및 수정</a></li>
				<li><a class="font"href="">. 회원 탈퇴</a></li>
				<li><a class="font"href="http://localhost:9000/starbucks/mystarbucks/mystarbucks_pass.jsp">. 비밀번호 변경</a></li>
			</ul>
		</div>
	</section>
	<section>
		<div class="text">
			<p>귀한 말씀 들려 주십시오. 작은 소리도 듣겠습니다.</p>
			<p>스타벅스에서는 고객 여러분의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다.<br>
			만족스러운 서비스였는지, 불만스러운 점은 없으셨는지 귀한 의견을 들려주시기 바랍니다.<br>보다 나은 서비스로 보답하겠습니다.</p>
			<li>고객의 소리 운영시간 : 09:00~18:00 (연중무휴)</li>
			<a href="http://localhost:9000/starbucks/service/service_sound.jsp">고객의 소리 문의하기</a>
			<img src="http://localhost:9000/starbucks/images/my_suggestion_inquiry_bg.png">
		</div>
	</section>
	<section class="table">
	<div>
		<table>
			<tr>
				<th>[<%= vo_con.getCategory() %>] <%= vo_con.getTitle() %></th>
			</tr>
			<tr>
				<td>
					<span style="font-size:23px; font-weight:bold">Q.</span>
					<span style="font-size:13px; color:gray; margin-left:20px;"><%= vo_con.getSdate() %></span>
					<p style="margin-left:45px; margin-top:5px"><%= content %></p>
					<% if (vo_con.getSfile() != null ) { %>
					<img style="margin-left:45px; margin-top:5px;" src="http://localhost:9000/starbucks/upload/<%= vo_con.getSfile() %>">
					<% } %>
				</td>
			</tr>
			<tr>
				<td>
					<span style="font-size:23px; font-weight:bold">A.</span>
					<span style="font-size:13px; color:gray; margin-left:20px; "><%= vo.getCdate() %></span><br>
					 <p style="margin-left:45px; margin-top:5px;"><%= comment %>
				</td>
			</tr>
		</table>
	<a href="mystarbucks_sound.jsp">목록</a>
	</div>
	</section>	
	
	
	
<!--  footer -->
<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>