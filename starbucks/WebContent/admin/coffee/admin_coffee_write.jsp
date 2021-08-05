<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
	
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
 	 .table textarea.comment { width:90%; height:50px; }
 	 .table tr th { padding:5px 0 5px 0; text-align:center; vertical-align:middle;}
 	 
 	 #one input { text-align:center; }
 	 
 	 button.btn_style { background-color:rgb(56,57,78); color:white; border:1px solid lightgray; cursor:pointer; margin-bottom:10px; }
 	 
 	 #one {width:1150px; margin-bottom:0; }
 	 #one td { width:100px; }
	
	#two th { width:128px; }	
	#two tr:first-child input { width:75%; }
	#two { margin-top:0; }

	
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
		$(".span1").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/coffee/admin_coffee_main.jsp");
		});			

	//입력 사항 체크
		$("#commit").click(function() {
			if ($("#cid").val() == "") {
				alert("메뉴분류를 선택해주세요");
				$("#cid").focus();
				return false;
			} else if ($("#ctype_id").val() == "") {
				alert("상품분류를 선택해주세요");
				$("#ctype_id").focus();
				return false;
			} else if ($("#name").val() == "") {
				alert("이름(한글)을 입력해주세요");
				$("#name").focus();
				return false;
			} else if ($("#ename").val() == "") {
				alert("이름(영어)을 입력해주세요");
				$("#ename").focus();
				return false;
			} else if ($("#exp").val() == "") {
				alert("상단설명을 입력해주세요");
				$("#exp").focus();
				return false;
			} else if ($("#img").val() == "") {
				alert("이미지를 첨부해주세요");
				$("#img").focus();
				return false;
			} else if ($("#bimg").val() == "") {
				alert("이미지를 첨부해주세요");
				$("#img").focus();
				return false;
			} else {
				coffee_write.submit();
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
		<section>
			<div class="text">Home > <span class="span1">커피 관리</span> > <span class="span2">커피 등록</span></div>
			<div class="center" style="overflow:scroll">
			<form name="coffee_write" action="admin_coffee_write_process.jsp" method="post"  enctype="multipart/form-data">
				<table class="table" id="one">
					<tr>
						<th>분류</th>
						<th>원두타입</th>						
						<th>관련상품</th>	
						<th>신상</th>						
						<th>시즌</th>						
						<th>품절</th>							
					</tr>
					<tr>						
						<td>
							<select name="cid" id="cid">
								<option value="">전체
								<option value="bean1">스타벅스 원두
								<option value="bean2">스타벅스 비아
								<option value="bean3">스타벅스 오리가미
							</select>
						</td>
						<td>
						<select name="ctype_id" id="ctype_id">
								<option value="">전체
								<option value="blond">블론드 로스트
								<option value="medium">미디엄 로스트
								<option value="dark">다크 로스트
								<option value="flavor">플레이버
							</select>
						</td>
						<td class="num">
							<input type="text" name ="product" id="product_name">
						</td>
						<td class="select">
							<select name="m_new" id="m_new">
								<option value=""> X 
								<option value="new"> O 
							</select>
						</td>
						<td class="select">
							<select name="limit" id="limit">
								<option value=""> X 
								<option value="limit"> O 
							</select>
						</td>
						<td class="select">
							<select name="soldout" id="soldout">
								<option value=""> X 
								<option value="soldout"> O 
							</select>
						</td>
					</tr>
					
				</table>
				<table border=1 class="table"  id="two">
					<tr>
						<th colspan="1">이름(한글)</th>
						<td colspan="1"><input type="text" name="dproduct_name" id="name"></td>
						<th colspan="1">이름(영어)</th>
						<td colspan="1"><input type="text" name ="dproduct_ename" id="ename"></td>
					</tr>
					<tr>
						<th>설명</th>
						<td colspan="4"><textarea class="comment" name="dproduct_text" id="exp"></textarea></td>
					</tr>

					<tr>
						<th>상세설명</th>
						<td colspan="4">
							<textarea class="content" name="dproduct_content"></textarea>											
						</td>
					</tr>
					<tr>
						<th>노트</th>
						<td colspan="4"><textarea class="comment" name="dproduct_note" id="note"></textarea></td>
					</tr>
					<tr>
						<th>인조이</th>
						<td colspan="4"><textarea class="comment" name="dproduct_enjoy" id="enjoy"></textarea></td>
					</tr>
					<tr>
						<th>디자인 스토리</th>
						<td colspan="4"><textarea class="comment" name="dproduct_story" id="story"></textarea></td>
					</tr>
					<tr>
						<th>커피 테이스팅 노트</th>
						<td colspan="4"><textarea class="comment" name="dproduct_tasting" id="tasting"></textarea></td>
					</tr>
					<tr>						
						<th>작은 이미지</th>
						<td colspan="4"><input type="file" name="cimg_file" id="img"></td>
					</tr>
					<tr>						
						<th>큰 이미지</th>
						<td colspan="4"><input type="file" name="cimg_bfile" id="bimg"></td>
					</tr>
				</table>
				<button type="button"  class="btn_style" id="commit">등록</button>
			</form>
			</div>
		</section>
	</div>
</body>
</html>