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
 	 #one td{
 	 	padding:10px 0;
 	 }
 	 
 	 #two td { padding:10px 20px; text-align:left; }
 	 .table textarea, table #ccategory { border:1px solid lightgray; }
 	 .table th { background-color:rgb(237,237,237); }
 	 .table textarea.content { width:100%; height:150px; }
 	 .table tr th { padding:5px 0 5px 0; text-align:center; vertical-align:middle;}
 	 
 	 #one input { text-align:center; }
 	 
 	 button.btn_style { background-color:rgb(56,57,78); color:white; border:1px solid lightgray; cursor:pointer; margin-bottom:10px; }
 	 
 	 #one { width:1150px; margin-bottom:0; }
	
	#two th { width:128px; }	
	#two tr:first-child input { width:100%;	border:1px solid lightgray; }
	#two { margin-top:0; }

	td.select>select {
		width: 50px;
		border:1px solid lightgray;
	}
	td.select2>select {
		width: 170px;
		border:1px solid lightgray;
	}
	td.text>input{
		width: 90%;
		border:1px solid lightgray;
	}
	.num{
		width:70px;
	}
	.num>input{
		width: 80%;
		border:1px solid lightgray;
	}
	#p_type option{
		display: none;
	}
</style>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	console.log('2');

	$("#m_type").click(function(){
		if($("#m_type option:selected").val()=="음료"){
			console.log('음료 선택');
			console.log($("#p_type option").eq(0).val());
			$("#p_type option").hide();
			for(var i=1;i<10;i++){
				$("#p_type option").eq(i).show();
			}
		}else if($("#m_type option:selected").val()=="푸드"){
			console.log('푸드 선택');
			$("#p_type option").hide();
			for(var i=10;i<17;i++){
				$("#p_type option").eq(i).show();
			}
		}else if($("#m_type option:selected").val()=="상품"){
			console.log('상품 선택');
			$("#p_type option").hide();
			for(var i=17;i<25;i++){
				$("#p_type option").eq(i).show();
			}
		}else if($("#m_type option:selected").val()==""){
			console.log('선택');
			$("#p_type option").hide();
			$("#p_type option").eq(0).prop("selected", true);
		}
	});
	
	
	$(".span1").click(function() {
		location.replace("http://localhost:9000/starbucks/admin/menu/admin_menu_main.jsp");
	});				

	$("#commit").click(function() {
		if ($("#m_type").val() == "") {
			alert("메뉴분류를 선택해주세요");
			$("#m_type").focus();
			return false;
		} else if ($("#p_type").val() == "") {
			alert("상품분류를 선택해주세요");
			$("#p_type").focus();
			return false;
		} else if ($("#k_name").val() == "") {
			alert("이름(한글)을 입력해주세요");
			$("#k_name").focus();
			return false;
		} else if ($("#e_name").val() == "") {
			alert("이름(영어)을 입력해주세요");
			$("#e_name").focus();
			return false;
		} else if ($("#intro_t").val() == "") {
			alert("상단설명을 입력해주세요");
			$("#intro_t").focus();
			return false;
		} else if ($("#mfile").val() == "") {
			alert("이미지를 첨부해주세요");
			$("#mfile").focus();
			return false;
		} else {
			menu_write.submit();
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
		<section>
			<div class="text">Home > <span class="span1">메뉴 관리</span> > <span class="span2">메뉴 등록</span></div>
			<div class="center" style="overflow:scroll">
			<form name="menu_write" action="admin_menu_write_process.jsp" method="post" enctype="multipart/form-data">
				<table class="table" id="one">
					<tr>
						<th>메뉴분류</th>
						<th>상품분류</th>						
						<th>영양정보</th>						
						<th>칼로리</th>						
						<th>지방</th>						
						<th>단백질</th>						
						<th>나트륨</th>						
						<th>당류</th>						
						<th>카페인</th>						
						<th>알레르기</th>						
						<th>신상</th>						
						<th>시즌</th>						
						<th>테마</th>						
					</tr>
					<tr>						
						<td class="select">
							<select name="m_type" id="m_type">
								<option value="">메뉴
								<option value="음료">음료
								<option value="푸드">푸드
								<option value="상품">상품
							</select>
						</td>
						<td class="select2">
							<select name="p_type" id="p_type">
								<option value="">상품분류
								<option value="콜드 브루 커피">콜드 브루 커피
								<option value="브루드 커피">브루드 커피
								<option value="에스프레소">에스프레소
								<option value="프라푸치노">프라푸치노
								<option value="블렌디드">블렌디드
								<option value="스타벅스 피지오">스타벅스 피지오
								<option value="티(티바나)">티(티바나)
								<option value="기타 제조 음료">기타 제조 음료
								<option value="스타벅스 주스(병음료)">스타벅스 주스(병음료)
								<option value="브레드">브레드
								<option value="케이크">케이크
								<option value="샌드위치 & 샐러드">샌드위치 &amp; 샐러드
								<option value="따뜻한 푸드">따뜻한 푸드
								<option value="과일 & 요거트">과일 &amp; 요거트
								<option value="스낵 & 미니 디저트">스낵 &amp; 미니 디저트
								<option value="아이스크림">아이스크림
								<option value="머그">머그
								<option value="글라스">글라스
								<option value="플라스틱 텀블러">플라스틱 텀블러
								<option value="스테인리스 텀블러">스테인리스 텀블러
								<option value="보온병">보온병
								<option value="액세서리">액세서리
								<option value="커피 용품">커피 용품
								<option value="패키지 티(티바나)">패키지 티(티바나)
							</select>
						</td>
						<td class="num">
							<input type="text" name ="nutri" id="nutri">
						</td>
						<td class="num">
							<input type="text" name ="kcal" id="kcal">
						</td>
						<td class="num">
							<input type="text" name ="fat" id="fat">
						</td>
						<td class="num">
							<input type="text" name ="protein" id="protein">
						</td>
						<td class="num">
							<input type="text" name ="na" id="na">
						</td>
						<td class="num">
							<input type="text" name ="sugar" id="sugar">
						</td>
						<td class="num">
							<input type="text" name ="caffeine" id="caffeine">
						</td>
						<td class="text">
							<input type="text" name ="allergy" id="allergy">
						</td>
						<td class="select">
							<select name="m_new" id="m_new">
								<option value="">X
								<option value="new">O
							</select>
						</td>
						<td class="select">
							<select name="limit" id="limit">
								<option value="">X
								<option value="limit">O
							</select>
						</td>
						<td class="select">
							<select name="theme" id="theme">
								<option value="">테마
								<option value="th01">th01
								<option value="th02">th02
								<option value="th03">th03
								<option value="th04">th04
								<option value="th05">th05
								<option value="th06">th06
								<option value="th07">th07
								<option value="th08">th08
							</select>
						</td>
					</tr>
				</table>
				<table border=1 class="table"  id="two">
					<tr>
						<th colspan="1">이름(한글)</th>
						<td colspan="1"><input type="text" id ="k_name" name="k_name"></td>
						<th colspan="1">이름(영어)</th>
						<td colspan="1"><input type="text" id ="e_name" name="e_name"></td>
					</tr>
					<tr>
						<th>상단설명</th>
						<td colspan="4">
							<textarea class="content" name="intro_t" id="intro_t"></textarea>											
						</td>
					</tr>
					<tr>
						<th>하단설명</th>
						<td colspan="4">
							<textarea class="content" name="intro_b" id="intro_b"></textarea>											
						</td>
					</tr>
					<tr>						
						<th>이미지</th>
						<td colspan="4"><input type="file" name="mfile" id="mfile"></td>
					</tr>
				</table>
				<button type="button"  class="btn_style" id="commit">등록</button>
				</form>
			</div>
		</section>
	</div>
</body>
</html>