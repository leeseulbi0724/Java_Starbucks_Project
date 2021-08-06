<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   
    import= "java.sql.*, java.util.*, com.starbucks.dao.*, com.starbucks.vo.*"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>Starbucks Coffee Korea</title>
<style>
#wrapper {
  text-align: center;
}
.join {
  margin-top: 45px;	
  display: block;
  text-align: center;
  font-size: 30px;
  margin-bottom: 30px;
  font-weight: nomal;
}
.id_pass_form {
  border: 3px solid black;
}
strong {
  text-align: center;
}
.first_section {
  border: 1px solid #ddd;
  border-radius: 3px;
  box-sizing: border-box;
  max-width: 570px;
  margin: 0 auto 30px;
  position: relative;
}
.second_section {
  border: 1px solid #ddd;
  border-radius: 3px;
  box-sizing: border-box;
  max-width: 570px;
  margin: 0 auto 30px;
  position: relative;
}

.type_green {
  color: green;
  
  
}

.check_box input {
  border: 1px solid #ddd;
  border-radius: 3px;
  box-sizing: border-box;
  display: inline-block;
  margin-top: 10px; 
  max-width: 530px;
  outline: none; 
  padding: 15px;
  width: 100%;
}
.chenck_box strong {
  margin-bottom: 10px;
}
.check_box {
  background: #fff;
  border-bottom: 1px solid #ddd;
  padding: 20px 20px;
  position: relative;
}
section > p {
  background: #fff;
  border-bottom: 1px solid #ddd;
}
.information {
  font-size: 18px;
  text-align: center;
  color: #777;
  padding-bottom: 25px;
  border-bottom: 1px solid #ddd;
}
.information2{
	color: #777;
	font-size: 16px;
}
.member_sally {
  text-align: center;
  margin: 0 auto;
  width: 205px;
  height: 182px;
  padding-top: 33px;
  padding-bottom: 47px;
}
.name_span {
  text-align: left;
}
.name_box, .gender_box{
	display: inline-block;
}
.gender_girl, .gender_man{
	display: inline-block;
	position: absolute;
	float: left;
}
.birth_box{
	margin-bottom: 18px;
}
.birth_select_year {
  display: inline-block;
  width: 31.161%;
  
}
.birth_select_month {
  display: inline-block;
  width: 24.11%;
}
.birth_select_day {
  display: inline-block;
  width: 24.11%;
}
.birth_select_yny {
  display: inline-block;
  width: 15.3169%;
}
#birth_year, #birth_month, #birth_day, #birth_flag
{
	height: 40px;
	width: 100%;
	border: 1px solid #ddd;
	margin-top: 10px;
}
#birth_flag{
	margin-right: 0;
}
.third_section{
  border: 1px solid #ddd;
  border-radius: 3px;
  box-sizing: border-box;
  max-width: 570px;
  margin: 0 auto ;
  position: relative;
}
.nick_sally{
	width: 570px;
}
.mem_nick_txt{
	background: #edebe7;
	color: #666;
	text-align: center;
	padding: 13px 0;
}
.privacy_cont p, .privacy_cont li {
    font-size: 14px;
    color: #444444;
    line-height: 1.6;
}
.mCustomScrollBox {
    position: relative;
    overflow: hidden;
    height: 100%;
    max-width: 100%;
    outline: none;
    direction: ltr;
}
.renew_joinform_v2 div.mem_purpose_area, .renew_joinform_v2 div.mem_agreement_area {
    background: #f7f7f7;
    box-sizing: border-box;
    color: #666 !important;
    height: 170px;
    width: 100%;
}
.mb15 {
    margin-bottom: 15px;
}
.mb40 {
    margin-bottom: 40px;
}
.privacy_cont ul.pri_con > li {
    margin-bottom: 5px;
}
.privacy_cont{
	overflow:scroll;
	height: 170px;
}
nav ul, li {
    list-style: none;
}
.mem_agreement_wrap {
    margin: 20px;
    margin-bottom: 30px;
    position: relative;
    overflow: hidden;
    padding: 3px 0;
    border: 1px solid #ddd;
}
.renew_input_box input {
    border: 1px solid #ddd;
    border-radius: 3px;
    box-sizing: border-box;
    display: inline-block;
    margin-top: 10px; 
    max-width: 530px;
    outline: none; 
    padding: 15px;
    width: 100%;
}
.modify_txt2 {
    color: #666;
    line-height: 1.4;
    margin-bottom: 15px;
    font-size: 14px;
    margin-top: 15px;
    letter-spacing: -1px;
    text-align: center;
}
.btn_mem_login {
    background: #006633;
    text-align: center;
    border-radius: 3px;
    margin-top: 25px;
    margin: 0 auto;
    max-width: 570px;
    height: 65px;
    margin-bottom: 35px;
    width: 570px;
    font-size: 25px;
    color: #ffffff;
    cursor:pointer;
}
.btn_mem_login a {
    color: #fff;
    font-size: 24px;
    display: block;
    line-height: 65px;
    text-decoration: none;
    
}
.btn_mem_login:hover { text-decoration:underline; }
</style>
<script>
function check_pw(){
   if(document.joinform.pass.value != document.joinform.pass2.value){
	   alert("비밀번호가 일치하지 않습니다.")
	   document.joinform.pass.focus();
	   return;
   }
   document.joinform.submit();
}
</script>
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<strong><span class="join">회원가입</span></strong>

<!--  아이디 및 패스워드 폼  & 첫번째 section-->
<form name= "joinform" action= "joinprocess.jsp" method="post">
<section class= "first_section">
<div id= "wrapper">
   <div><img class="member_sally" src="http://localhost:9000/starbucks/images/join_icon.png"></div> 
<p class="information">회원정보를 입력해 주세요.</p>
<div class = "check_box">
<label></label><input  type="text" placeholder="아이디" maxlength="13" name= "id">
</div>
<div class = "check_box">
<label></label><input type="password" placeholder="비밀번호" maxlength="20" autocomplete="off" name= "pass" id= "pass">
</div>
<div class = "check_box">
<label></label><input type="password" placeholder="비밀번호 확인" maxlength="20" id ="pass2">
</div>
</div>
</section>

<!-- 이름  && 두번째 section-->
<section class= "second_section">
<div class= "check_box">
<strong>이름<span class= "type_green">(필수)</span></strong>
<label></label><input type="text" placeholder="이름을 입력하세요." maxlength="10" name= "name">
</div>
<!-- 
<span class = "gender_box">
<span><input class= "gender_man" type="checkbox" value="남">남</span>
<span><input class ="gender_girl" type="checkbox" value="여">여</span>
</span>
 -->


<!--  생년월일   -->
<div class= "check_box"> 
<strong>생년월일<span class ="type_green">(필수)</span></strong>

<div class= birth_box>
<div class="birth_select_year">
<select id="birth_year" name="birth_year" required="required"><option value="">년도</option><option value="2014">2014년</option><option value="2013">2013년</option><option value="2012">2012년</option><option value="2011">2011년</option><option value="2010">2010년</option><option value="2009">2009년</option><option value="2008">2008년</option><option value="2007">2007년</option><option value="2006">2006년</option><option value="2005">2005년</option><option value="2004">2004년</option><option value="2003">2003년</option><option value="2002">2002년</option><option value="2001">2001년</option><option value="2000">2000년</option><option value="1999">1999년</option><option value="1998">1998년</option><option value="1997">1997년</option><option value="1996">1996년</option><option value="1995">1995년</option><option value="1994">1994년</option><option value="1993">1993년</option><option value="1992">1992년</option><option value="1991">1991년</option><option value="1990">1990년</option><option value="1989">1989년</option><option value="1988">1988년</option><option value="1987">1987년</option><option value="1986">1986년</option><option value="1985">1985년</option><option value="1984">1984년</option><option value="1983">1983년</option><option value="1982">1982년</option><option value="1981">1981년</option><option value="1980">1980년</option><option value="1979">1979년</option><option value="1978">1978년</option><option value="1977">1977년</option><option value="1976">1976년</option><option value="1975">1975년</option><option value="1974">1974년</option><option value="1973">1973년</option><option value="1972">1972년</option><option value="1971">1971년</option><option value="1970">1970년</option><option value="1969">1969년</option><option value="1968">1968년</option><option value="1967">1967년</option><option value="1966">1966년</option><option value="1965">1965년</option><option value="1964">1964년</option><option value="1963">1963년</option><option value="1962">1962년</option><option value="1961">1961년</option><option value="1960">1960년</option><option value="1959">1959년</option><option value="1958">1958년</option><option value="1957">1957년</option><option value="1956">1956년</option><option value="1955">1955년</option><option value="1954">1954년</option><option value="1953">1953년</option><option value="1952">1952년</option><option value="1951">1951년</option><option value="1950">1950년</option><option value="1949">1949년</option><option value="1948">1948년</option><option value="1947">1947년</option><option value="1946">1946년</option><option value="1945">1945년</option><option value="1944">1944년</option><option value="1943">1943년</option><option value="1942">1942년</option><option value="1941">1941년</option><option value="1940">1940년</option><option value="1939">1939년</option><option value="1938">1938년</option><option value="1937">1937년</option><option value="1936">1936년</option><option value="1935">1935년</option><option value="1934">1934년</option><option value="1933">1933년</option><option value="1932">1932년</option><option value="1931">1931년</option><option value="1930">1930년</option><option value="1929">1929년</option><option value="1928">1928년</option><option value="1927">1927년</option><option value="1926">1926년</option><option value="1925">1925년</option><option value="1924">1924년</option><option value="1923">1923년</option><option value="1922">1922년</option><option value="1921">1921년</option><option value="1920">1920년</option><option value="1919">1919년</option><option value="1918">1918년</option><option value="1917">1917년</option><option value="1916">1916년</option><option value="1915">1915년</option><option value="1914">1914년</option><option value="1913">1913년</option><option value="1912">1912년</option><option value="1911">1911년</option><option value="1910">1910년</option><option value="1909">1909년</option><option value="1908">1908년</option><option value="1907">1907년</option></select>
</div>

<div class="birth_select_month">
<select id="birth_month" name="birth_month" required="required"><option value="">월</option><option value="01">1월</option><option value="02">2월</option><option value="03">3월</option><option value="04">4월</option><option value="05">5월</option><option value="06">6월</option><option value="07">7월</option><option value="08">8월</option><option value="09">9월</option><option value="10">10월</option><option value="11">11월</option><option value="12">12월</option></select>
</div>

<div class="birth_select_day">
<select id="birth_day" name="birth_day" required="required"><option  value="">일</option><option value="01">1일</option><option value="02">2일</option><option value="03">3일</option><option value="04">4일</option><option value="05">5일</option><option value="06">6일</option><option value="07">7일</option><option value="08">8일</option><option value="09">9일</option><option value="10">10일</option><option value="11">11일</option><option value="12">12일</option><option value="13">13일</option><option value="14">14일</option><option value="15">15일</option><option value="16">16일</option><option value="17">17일</option><option value="18">18일</option><option value="19">19일</option><option value="20">20일</option><option value="21">21일</option><option value="22">22일</option><option value="23">23일</option><option value="24">24일</option><option value="25">25일</option><option value="26">26일</option><option value="27">27일</option><option value="28">28일</option><option value="29">29일</option><option value="30">30일</option><option value="31">31일</option></select>
</div>

<div class="birth_select_yny">
<select id="birth_flag" name="birth_flag"><option selected="selected" value="양">양</option><option value="음">음</option></select>
</div>
</div>

<p class="information2">회원 가입 완료 후 스타벅스 카드를 등록하시면 생일 무료음료 쿠폰이 발행됩니다.</p>

</div>

<!-- 휴대폰 번호  -->
<div class= "check_box">
<strong>휴대폰<span class= "type_green">(필수)</span></strong>
<label></label><input type="text" placeholder="휴대폰 번호를 입력하세요." maxlength="50" autocomplete="off" name="hp">
</div>
<div class= "check_box">
<strong>메일<span class= "type_green">(필수)</span></strong>
<label></label><input type="text" placeholder="E-mail을 입력하세요." maxlength="50" autocomplete="off" name= "email">

</div>

</section>

<section class= "third_section">

<div><img class= "nick_sally" src="http://localhost:9000/starbucks/images/icon_nick_sally.jpg">
<p class="mem_nick_txt">주문하신 제품을 찾으실 때, <br>
						파트너가 등록하신 닉네임을 불러드립니다.
</p>
</div>

<!--  닉네임 선택  -->
<div class= "check_box">
<strong>닉네임<span class= "type_green">(선택)</span></strong>
</div>
<section class="mem_agreement_wrap">
<h3>선택적 개인정보 수집동의 및 이용약관</h3>
<div class="privacy_cont">
     <p class="mb15">
      본인은 (주)스타벅스커피코리아(이하 “회사”라 합니다)가 제공하는 콜 마이 네임 서비스(이하 “서비스”라 합니다)를 이용하기 위해, 다음과 같이 “회사”가 본인의 개인정보를 수집·이용하는 것에 동의합니다.</p>
     <p class="mb15 fontBold underLine">※ 귀하께서는 개인정보 수집·이용에 대한 동의를 거부하실 수 있으나, 동의를 거부하실 경우 서비스 이용을 하실 수 없습니다.</p>
     <ul class="pri_con mb40">
      <li>
       <span class="fontBold">1. 개인정보 항목·목적·보유기간</span>
       <table class="vod_tb_ag mb20 mt10">
       <caption class="hid">수집하는 개인정보에 대한 항목, 목적, 보유기간 안내 테이블</caption>
        <colgroup>
         <col width="">
         <col width="80%">
        </colgroup>
        <thead>
         <tr>
          <th scope="col">구분</th>
          <th scope="col">내역</th>
         </tr>
        </thead>
        <tbody>
         <tr>
          <th scope="row"><span class="fontBold">항목</span></th>
          <td class="taLeft">닉네임</td>
         </tr>
         <tr>
          <th scope="row"><span class="fontBold">목적</span></th>
          <td>
           콜 마이 네임 서비스</td>
         </tr>
         <tr>
          <th scope="row"><span class="fontBold">보유 및 <br>이용기간</span></th>
          <td class="pointFont"><span class="underLine">회원 탈퇴 시 까지 또는 관계법령에 의한 별도 보존기간 </span> (2. 관계법령에 의한 개인정보 보존기간 참고)</td>
         </tr>
        </tbody>
       </table>
      </li>
      <li>
       <span class="fontBold">2. 관계법령에 의한 개인정보 보존기간</span>
       <ul>
        <li class="pointFont">- 서비스이용기록, 접속로그, 접속IP정보 (통신비밀보호법 : 3개월)</li>
        <li class="pointFont">- 표시/광고에 관한 기록 (전자상거래법 : 6개월)</li>
        <li class="pointFont">- 계약 또는 청약철회 등에 관한 기록 (전자상거래법 : 5년)</li>
        <li class="pointFont">- 대금결제 및 재화 등의 공급에 관한 기록 (전자상거래법 : 5년)</li>
        <li class="pointFont">- 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래법 : 3년)</li>
       </ul>
      </li>
      
      <li class="mt20">
       <span class="fontBold">3. 서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보의 범위 </span>
       <p class="pl20">서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록</p>
       <p class="pl20">* 쿠키의 경우 구체적인 운영 내역과 설정 거부 방법 등은 본 홈페이지 개인정보처리방침 “개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항”에서 확인하실 수 있습니다.</p>
      </li>
     </ul>
    </div>
    </section>
    <div class= "check_box">
    <input type="text" name="nick" id="user_nick_nm" placeholder="한글 6자리 이내로 입력하세요." 
    maxlength="6" class="">
    </div>
    
</section>
<p class="modify_txt2">
<b>
＊ 선택항목은 입력하지 않거나 동의하지 않아도 회원 가입이 가능합니다.
</b>
</p>
<p class="btn_mem_login">
<input class= "btn_mem_login" onclick="check_pw()" value = "가입하기">
</p>
</form>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>