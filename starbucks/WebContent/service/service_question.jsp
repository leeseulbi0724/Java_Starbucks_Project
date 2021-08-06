<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="http://localhost:9000/starbucks/images/logo.png">
<title>Starbucks Coffee Korea</title>
<style>
	body { overflow-x:hidden; overflow-y:auto; }
	section {
		text-align:center;
	}
	div.header {
		width: 100%;
		height: 178px;
		background: url(http://localhost:9000/starbucks/images/ms_sub_ttl_bg.jpg);
	}
	div.header h1 {
		font: bold 36px Avenir, Arial, georgia;
		color: #ffffff;
		padding-top: 30px;
		position:relative;
		top:60px;
	}
	div.icon_home {
		position:relative; bottom:50px; left:510px; color:white; font-size:12px;
	}
	div.icon_home a {
		text-decoration:none; color:white;
	}
	div.icon_home a:hover { text-decoration:underline; }
	
	section.center>img { margin-right:280px; margin-top:-30px;  }
	section.center>p { position:relative; font-weight:bold; right:450px; top:15px; font-size:20px; color:#444; }
	
	div.button { position:relative; left:480px; top:60px; display:inline-block; text-align:left; }
	div.button>div { border-top:2px solid black; width:220px;  }
	div.button a { text-decoration:none; color:#444; font-weight:bold; font-size:14px;  }
	div.button a:hover { text-decoration:underline; color:green; }
	div.button p { padding:10px; margin:0; }
	div.button>div.line { border-top:1px solid lightgray; width:220px; }
	
	section.box { display:inline-block; margin-bottom:50px;
					width:830px; height:500px; position:relative; right:140px; color:black;
	}
	
	div.first { margin-top:30px; }
	div.first div.box_btn { border:1px solid lightgray; width:49%; float:left; height:170px; }
	div.first a:last-child div, div.second a:nth-child(2)>div, div.second a:nth-child(3)>div,
	div.second a:last-child>div, div.third a:nth-child(2)>div, div.third a:nth-child(3)>div,
	div.third a:last-child>div { border-left:none; }
	
	div.second div, div.third div { border:1px solid lightgray; border-top:none; width:24.45%; float:left; height:170px; }
	
	div.box_btn:hover { background-color:rgb(0,112,66); cursor:pointer; }
	div.box_btn:hover p { color:white; }
	div.box_btn p { position:relative; top:30px; }
	p.num { text-align:left; font-weight:bold; color:green; margin-left:10px; }	
	p.title { color:rgb(144,124,99); font-weight:bold; font-size:14px; }
	p.content { font-size:13px; color:#555; margin:1px; margin-bottom:25px; }
	
	#layer { border:3px solid rgb(0,112,66); background-color:white; 
				   	position:absolute; left:0; z-index:1;display:none; width:810px; height:510px; cursor:default;
				   	background-image:url("http://localhost:9000/starbucks/images/bg_starbucks_pop.gif");
					background-repeat: no-repeat;
					background-position: center;
	}
	#layer>a { 
		color:white; background-color:rgb(0,112,66); width:40px; height:40px;
		font-size:30px; float:right; cursor:pointer; margin-right:-1px; position:relative; bottom:1px;
	}
	#layer div.a { border-bottom:1px solid lightgray; width:100%; height:1px; }
	div.number { font-size:25px; color:green; font-weight:bold; margin-left:50px; margin-top:10px; }
	div.category {  color:rgb(144,124,99); font-size:14px; }
	div.title { color:#333; font-weight:bold; font-size:20px; margin-bottom:10px; }
	div.cn { 
		border:none; text-align:left; margin:15px 10px 0 20px; padding:0 10px 0 10px; height:300px; font-size:13px; overflow:auto; 
		width:750px;
	}
	
	section.bottom>div { background-color:rgb(244,244,242); display:inline-block; position:relative; bottom:40px; right:150px; width:800px; text-align:left; margin-top:50px; }
	section.bottom>div p { margin: 20px 0 0 25px; font-size:14px; color:#333; }
	section.bottom>div>a { 
			text-decoration:none; background-color:black; color:white; 
			border-radius:4px; font-size:13px; padding:5px 10px 5px 10px; font-weight:bold; 
			float:right; position:relative; bottom:30px; right:20px; 
	}
	section.bottom>div a:hover { text-decoration:underline; }
</style>
<script>
	function id_select(num) {
		var q_list = 
			{"Qlist":
				[{"num":"Q1.","category":"#프로모션/이벤트","title":"[e-프리퀀시] 모바일 앱을 통해서 언제든 예약이 가능한가요?","content":"매장 재고 상황에 따라 예약이 불가할 수 있으며, 2021년 7월 20일 이후부터 사용하지 않은 e-프리퀀시, e-프리퀀시 증정품 교환 e-쿠폰 및 e-스티커, 예약 확인증은 모두 소멸됩니다. 반드시 증정 기간 내 증정품 예약 후 매장에서 수령하시기 바랍니다." },
					{"num":"Q2.","category":"#프로모션/이벤트","title":"[e-프리퀀시] 모바일 앱으로 증정품 예약을 완료했습니다.<br>증정품은 언제까지 찾아가야 하나요?","content":"모든 증정품은 예약하신 수령 매장의 운영 시간을 기준으로 증정됩니다. 매장별 운영 시간이 상이하니, 수령 당일 스타벅스 모바일 앱에서 매장 운영 시간을 반드시 확인해주시기 바랍니다." },
					{"num":"Q3.","category":"#프로모션/이벤트","title":"[e-프리퀀시] 예약한 증정품은 반드시 본인일 경우에만 교환 가능한가요?","content":"예약 확인 바코드는 저장 후 자유롭게 양도 가능하며, 바코드 확인 시 예약된 증정품의 대리 수령 또한 가능합니다. 예약증 관리에 대해 당사는 책임지지 않으며, 관리 부주의로 인한 도난 및 분실 시 적립된 e-스티커는 보호되지 않습니다." },
					{"num":"Q4.","category":"#프로모션/이벤트","title":"[e-프리퀀시] 모든 매장에서 e-프리퀀시 증정품을 예약 수령할 수 있나요?","content":"에버랜드, 딜리버스 전용 매장 등 일부 매장에서는 예약이 불가할 수 있습니다." },
					{"num":"Q5.","category":"#프로모션/이벤트","title":"[e-프리퀀시] 딜리버스 매장을 통해 증정품 배송이 가능한가요?","content":"아니오. 증정품은 배송이 불가합니다." },
					{"num":"Q6.","category":"#스타벅스 딜리버스","title":"[스타벅스 딜리버스] 서비스 이용 가능한 지역은 어디인가요?",
							"content":"현재는 시범 운영단계로 일부 지역에서 서비스 이용이 가능합니다. (21년 1월 27일 기준) 안내된 해당 지역 중 일부 상세 주소지에 따라 서비스 가능 여부가 상이할 수 있으며, 정확한 서비스 가능 지역 여부는 모바일 APP에서 주소입력 후 확인할 수 있습니다.<br><br>※역삼이마트 : 역삼동, 도곡동, 논현동, 삼성동<br>※스탈릿대치B1 : 대치동, 개포동<br>※여의도화재보험 : 여의도동<br>※당산대로 : 양평동 1~6가,  당산동, 당산동 1가~6가, 영등포동 1~2가, 영등포동 4가~8가, 문래동 3가, 문래동 6가<br>※마포아크로 : 현석동, 신수동, 대흥동, 염리동, 용강동, 토정동, 아현동, 구수동, 마포동, 도화동, 공덕동, 신공덕동, 효창동, 용문동, 도원동, 신창동, 산천동, 청암동, 원효로 4가, 원효로 3가" },
					{"num":"Q7.","category":"#스타벅스 딜리버스","title":"[스타벅스 딜리버스] 교환/환불 신청을 어떻게 하나요?",
							"content":"스타벅스 딜리버스로 주문 하신 상품의 교환/환불에 대한 접수는 스타벅스 모바일 앱, 웹사이트(www.starbucks.co.kr)의 Customer Service(고객센터, 1522-3232)를 통해 신청 가능합니다.<br>딜리버스 전용 MD는 고객센터를 통해서만 교환/환불 신청이 가능하며, 일반 매장과 병행하여 판매되는 MD의 경우 외관 및 라벨스티커에 이상이 없는 경우 교환증 지참 시 일반 매장에서도 교환이 가능합니다. (환불은 구매 매장에서만 가능)<br>단순 변심 또는 착오 구매의 경우, 상품 수령일로부터 7일 이내에 가능합니다. 단, 상품의 하자, 오배송 또는 상품이 계약내용 및 표시광고와 다른 상품을 공급받은 경우 관련 법 및 소비자 분쟁 해결 규정에 따라 처리됩니다.<br>또한 교환 시 최초 배송 받으신 주소로만 재배송 가능합니다. 자세한 내용은 스타벅스 모바일 앱> Delivers 서비스를 확인해 주세요. " },
					{"num":"Q8.","category":"#제품/상품","title":"[음료] 블론드 운영 매장을 알고싶어요.","content":"매장별 사정에 따라 일부 매장에 한하여 블론드 음료가 미판매 중입니다. 이에 매장 리스트를 공지 합니다.<br>블론드가 일부 매장에서만 판매되는 점 양해 부탁드리며, 앞으로 더 나은 서비스를 제공하기 위해 노력하겠습니다.<br><br><br>■ 블론드 미운영 매장 리스트 (20년 7월 14일 기준)<br><br><br>[서울]<br>강남대로신사 / 강동구청DT / 강동암사DT / 방화DT / 송파나루역DT / 송파방이DT / 신림DT / 신월IC DT / 신정DT / 영등포신길DT / 화곡DT / 공릉DT / 구의DT / 신세계본점5F / 이대R / 종암DT<br><br>[인천]<br>경인교대입구역DT / 부평삼거리역DT / 인천간석DT / 인천당하DT / 인천동춘DT / 인천서구청DT / 인천송도DT / 인천용현DT / 인천학익DT<br><br>[경기]<br>경기광주송정DT / 경기광주신현DT / 과천DT / 광명소하DT / 김포감정DT / 동탄능동DT / 부천심곡DT / 부천중동DT / 북수원IC DT / 북오산IC DT / 수원IC DT / 수원KBS DT / 수원권선DT / 수원인계DT / 수지성복DT / 스타필드고양1F고메스트리트 / 신세계하남2F / 신영통DT / 안성공도DT / 안성석정DT / 안양석수DT / 안양운동장사거리DT / 안양호계DT / 여주DT / 오산갈곶DT / 용인김량장DT / 용인동백DT / 용인마북DT / 용인보라DT / 용인상하DT / 용인시청DT / 이천사음DT / 이천증포DT / 평택서정DT / 평택안중DT / 하남미사DT / 화성병점DT / 고양DT / 김포풍무DT / 남양주연평DT / 남양주진접DT / 동두천DT / 리버사이드팔당DTR / 백석역DT / 양주광사DT / 양주덕정역DT / 양주송추DT / 원당DT / 의정부녹양DT / 의정부신곡DT / 의정부예술의전당DT / 의정부용현DT / 의정부회룡역DT / 인천강화DT / 일산덕이DT / 일산애니골DT / 일산풍동DT / 평내DT / 포천DT / 풍무역DT<br><br>[경상]<br>경산중방DT / 경주보문로DT / 경주터미널DT / 구미도량DT / 구미상모DT / 구미시청DT / 김천시청DT / 대구공평DT / 대구도원DT / 대구만촌DT / 대구상동DT / 대구성서IC DT / 대구수성네거리DT / 대구수성도서관DT / 대구영대병원역DT / 대구월곡DT / 대구중동DT / 대구중동네거리DT / 대구칠곡대로DT / 대구칠성DT / 대구침산DT / 대구평리DT / 대구황금DT / 동대구로DT / 포항쌍용DT / 포항장성DT / 포항죽도DT / 경남사천DT / 금정구청DT / 기장역DT / 김해구산DT / 남양산IC DT / 다대포DT / 동명대DT / 동부산DT / 동서대DT / 마산역DT / 마산해안대로DT / 마산회원DT / 밀양DT / 부산안락DT / 부산재송DT / 사상주례DT / 수영강변DT / 수영망미DT / 양산덕계DT / 온천장역DT / 을숙도강변DT / 진주칠암DT / 진해자은DT / 창원역DT / 창원호계DT / 울산MBC DT / 울산남구청DT / 울산도산사거리DT / 울산북구청DT / 울산시청사거리DT / 울산정자비치DT / 울산중리사거리DT<br><br>[전라]<br>광주매곡DT / 광주방림DT / 광주산정DT / 광주상무DT / 광주수완DT / 광주신가DT / 광주신세계DT / 광주신안DT / 광주운남DT / 광주운암DT / 광주월산DT / 광주주월DT / 광주지산DT / 광주화정DT / 광주효천DT / 광주흑석DT / 목포북항DT / 목포터미널DT / 여수둔덕DT / 전남광양DT / 군산나운DT / 익산영등DT / 전북대병원DT / 전북정읍DT / 전주덕진광장DT / 전주백제대로DT / 전주송천DT / 전주평화DT / 전주효자DT<br><br>[충청]<br>계룡대로DT / 공주동학사DT / 당진시곡DT / 서산예천DT / 세종다정DT / 제천DT / 천안IC DT / 천안두정역DT / 천안불당DT / 천안서부대로DT / 청주봉명DT / 청주사직DT / 청주용담DT / 청주용암DT / 충남보령DT / 충주시청DT / 충주호암DT / 대전가수원DT / 대전대사DT / 대전도안DT / 대전신탄진DT / 대전유천DT / 대전판암DT / 대전한남대DT<br><br>[강원]<br>강릉송정DT / 동해DT / 속초DT / 원주반곡DT / 춘천석사DT / 춘천후평DT<br><br>[제주]<br>제주도남DT / 제주삼화DT / 제주성산DT / 제주애월DT / 제주외도DT / 제주용담DT" },
					{"num":"Q9.","category":"#제품/상품","title":"[음료] 피지오 운영 매장을 알고싶어요.","content":"매장별 사정에 따라 일부 매장에 한하여 피지오 음료가 미판매 중입니다. 이에 매장 리스트를 공지 합니다.<br>피지오가 일부 매장에서만 판매되는 점 양해 부탁드리며, 앞으로 더 나은 서비스를 제공하기 위해 노력하겠습니다.<br><br><br>■피지오 미운영 매장 리스트 (20년 7월 기준)<br><br><br>[서울]<br>가양이마트 / 강동구청DT / 공릉DT / 광운대 / 광장 / 굽은다리역 / 길동사거리 / 남가좌사거리 / 노원KT / 독산사거리 / 동부이촌동 / 동숭길입구 / 마곡역 / 마포아크로 / 명지대 / 목동 / 목동8단지 / 목동트라팰리스 / 몽촌토성역 / 묵동 / 묵동이마트 / 미아뉴타운 / 봉은사역 / 서울극장 / 서울여대 / 서울역서부 / 송파방이DT / 송파헬리오시티 / 신세계영등포B2 / 압구정윤성빌딩 / 엔터식스한양대 / 연합뉴스 / 영동2교 / 올림픽평화의문 / 용산리첸시아 / 종로평창동 / 천호사거리 / 코엑스별마당 / 포스코 / 현대미아<br><br>[인천]<br>경인교대입구역DT / 부평삼거리역DT<br><br>[경기]<br>강남대 / 경기광주송정DT / 경기광주쌍령DT / 고양DT / 과천DT / 광교갤러리아9F / 광명소하 / 구성트레이더스 / 금천구청역 / 김포감정DT / 김포운양 / 김포풍무DT / 다산지금 / 동탄 / 동탄영천 / 동탄카림R / 리버사이드팔당DTR / 명학역 / 부천상동역 / 부천옥길 /  북오산IC DT / 분당이매 / 삼송역 / 송도현대아울렛 / 수내 / 수원KBS DT / 수원경수인계DT / 수원권선 / 수원세류DT / 수원연무DT / 수지성복DT / 시흥대야DT / 시흥대야동 / 신흥역 / 안산한대앞역 / 안성공도DT / 안양범계 / 안양석수DT / 안양호계DT / 양주고읍DT / 양주송추DT / 오산세교 / 용인고매동 / 용인김량장DT / 용인마북DT / 용인보정DT /  용인세브란스병원 / 용인언남 / 원당DT / 의왕청계DT / 의정부신곡DT / 인천강화DT / 인천청라한신 / 제물포역DT / 주엽사거리 / 죽전 / 판교봇들마을 / 평촌역DT / 평택서정DT / 평택안중DT / 평택죽백DT / 풍무사거리DT / 풍무역DT / 하남미사DT / 하남황산사거리 / 현대킨텍스 / 호계지식산업센터 / 화성반월DT<br><br>[강원]<br>강릉송정DT / 설악쏘라노 / 소노델피노 / 원주단구 / 춘천석사DT<br><br>[대전]<br>대전IC DT/ 대전도안DT / 대전터미널DT  / 대전현대아울렛	<br><br>[충남]<br>계롱대로DT / 공주동학사DT / 당진시곡DT / 아산방축DT / 아산터미널 / 천안두정역DT / 천안불당DT / 천안신부동 / 충남보령DT<br><br>[충북]<br>청주비하DT / 청주이마트 / 충주호암DT<br><br>[세종]<br>세종다정DT / 세종첫마을<br><br>[전남]<br>목포터미널DT / 여수학동DT<br><br>[전북]<br>군산나운DT / 군산대 / 전북대병원DT / 전주중화산<br><br>[광주]<br>광주산정DT / 광주상무 / 광주상무DT / 광주선운DT / 광주연제DT / 광주오치 / 광주월산DT / 광주장덕 / 광주주월DT / 광주지산DT / 광주지원DT / 광주효천DT<br><br>[부산]<br>거제대로DT / 금정남산동DT / 기장역DT / 김해구산DT / 김해진영DT / 명지강변DT / 부산교대역DT / 부산동아대 / 부산정관 / 사상주례DT / 서면문화로 / 서면센트럴스퀘어 / 수영망미DT / 을숙도강변DT / 해운대중동역 / 화명강변DT<br><br>[대구]<br>경산임당역DT / 국립대구박물관DT / 대구앞산DT / 대구영대병원역DT / 대구이곡<br><br>[경남]<br>경남사천DT / 남양산IC DT / 마산회원DT / 밀양DT / 소노캄거제 / 양산범어<br><br>[경북]<br>안동이마트 / 포항죽도DT<br><br>[울산]<br>울산신정DT / 울산호계DT<br><br>[제주]<br>서귀포DT / 제주도남DT / 제주삼화DT / 제주성산DT / 제주애월DT / 제주외도DT / 제주용담DT / 주중문DT" },
					{"num":"Q10.","category":"#SR(별,레벨혜택 등)","title":"[별] 별 적립 기준은 무엇인가요?","content":"방문에 감사 드리는 의미로, 스타벅스 리워드 회원이 본인 계정에 등록된 스타벅스 카드로 1,000원 이상 결제 시 영수증당 방문별 1개가 즉시 적립됩니다. (단, 영수증간 금액 합산 적용은 불가하며, 스타벅스 카드 충전 금액은 별 적립 대상이 아닙니다. Extra 또는 Size Upgrade 금액만 결제하는 경우, 방문별 적립 기준 금액 충족 시 별 적립 가능합니다.)<br><br>사이렌 오더를 통해 주문하신 경우, 별 적립 시점은 아래와 같습니다.<br>-	음료/푸드/원두 주문의 경우, 매장에서 해당 주문을 승인한 시점<br>-	홀케이크 선물/예약의 경우 홀케이크 수령 시점<br><br>스타벅스 카드로 결제 후 고객님께 최상의 서비스를 제공하는 시간은 약 3분이 소요됩니다. 따라서 이 시간 동안 추가 결제 시 방문당 별은 적립되지 않고, 이벤트가 있을 경우 이벤트 별만 적립됩니다." }					
				]		
			}		
			document.getElementById("number").innerHTML = q_list.Qlist[num-1].num;
			document.getElementById("category").innerHTML = q_list.Qlist[num-1].category;
			document.getElementById("title").innerHTML = q_list.Qlist[num-1].title;
			document.getElementById("content").innerHTML = q_list.Qlist[num-1].content;			
	}
</script>
</head>
<body>		
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	
	<!--  content -->
	<section>
		<div class="header">
			<h1>홈페이지 이용 팁</h1></div>
			<div class="icon_home">
				<a href="http://localhost:9000/starbucks/index.jsp"><img src="http://localhost:9000/starbucks/images/icon_home_white.png" ></a>
				<img src="http://localhost:9000/starbucks/images/icon_arrow_w.png" >
				<a href="http://localhost:9000/starbucks/service/service_main.jsp">Customer Service & Ideas</a>
				<img src="http://localhost:9000/starbucks/images/icon_arrow_w.png" >
				<a href="http://localhost:9000/starbucks/service/service_question.jsp">자주하는 질문</a>
			</div>
	</section>
	<section>
	<div class="button">
		<div></div>
		<p><a href="http://localhost:9000/starbucks/service/service_question.jsp">자주하는 질문</a></p>
		<div class="line"></div>
		<p><a href="http://localhost:9000/starbucks/service/service_sound.jsp">고객의 소리</a></p>
		<div class="line"></div>
	</div>	
	</section>
	<section class="center">
		<img src="http://localhost:9000/starbucks/images/faq_vis.png">
		<p>자주하는 질문 Best 10</p>
		<section class="box">	
			<div class="first">
					<a id=1 onclick="layer.style.display='inline'; id_select(this.id);" >
					<div class="box_btn">
						<p class="num">Q1.</p>
						<p class="title">#프로모션/이벤트</p>
						<p class="content">[e-프리퀀시] 모바일 앱을 통해서 언제든 예약이 가능한가요?</p></div></a>
					<div id="layer">
						<a onclick="layer.style.display='none'">X</a>
						<p><div class="number" id="number"></div><br>
						<div class="category" id="category"></div><br>
						<div class="title" id="title"></div></p>
						<div class="a"></div>
						<div class="cn" id="content"></div>
					</div>	
				<a id=2 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q2.</p>
					<p class="title">#프로모션/이벤트</p>
					<p class="content">[e-프리퀀시] 모바일 앱으로 증정품 예약을 완료했습니다.<br>증정품은 언제까지 찾아가야 하나요?</p>
				</div>
				</a>
			</div>
			<div class="second">
				<a id=3 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q3.</p>
					<p class="title">#프로모션/이벤트</p>
					<p class="content">[e-프리퀀시] 예약한 증정품은 반드시 본인일 경우에만 교환 가능한가요?</p>
				</div>
				</a>
				<a id=4 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q4.</p>
					<p class="title">#프로모션/이벤트</p>
					<p class="content">[e-프리퀀시] 모든 매장에서 e-프리퀀시 증정품을 예약 수령할 수 있나요?</p>
				</div>
				</a>
				<a id=5 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q5.</p>
					<p class="title">#프로모션/이벤트</p>
					<p class="content">[e-프리퀀시] 딜리버스 매장을 통해 증정품 배송이 가능한가요?</p>
				</div>
				</a>
				<a id=6 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q6.</p>
					<p class="title">#스타벅스 딜리버스</p>
					<p class="content">[스타벅스 딜리버스] 서비스 이용가능한 지역은 어디인가요?</p>
				</div>
				</a>
			</div>
			<div class="third">
				<a id=7 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q7.</p>
					<p class="title">#스타벅스 딜리버스</p>
					<p class="content">[스타벅스 딜리버스] 교환/환불 신청을 어떻게 하나요?</p>
				</div>
				</a>
				<a id=8 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q8.</p>
					<p class="title">#제품/상품</p>
					<p class="content">[음료] 블론드 운영 매장을 알고 싶어요.</p>
				</div>
				</a>
				<a id=9 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q9.</p>
					<p class="title">#제품/상품</p>
					<p class="content">[음료] 피지오 운영 매장을 알고 싶어요.</p>
				</div>
				</a>
				<a id=10 onclick="layer.style.display='inline'; id_select(this.id);">
				<div class="box_btn">
					<p class="num">Q10.</p>
					<p class="title">#SR(별,레벨혜택 등)</p>
					<p class="content">[별] 별 적립 기준은 무엇인가요?</p>
				</div>
				</a>
			</div>
		</section>
		<section class="bottom">
			<div>
				<p><strong>원하는 답변을 찾지 못하셨나요?</strong><br>
				고객의 소리를 통해 질문을 해 주시면 빠른 시간안에 답변을 드리도록 하겠습니다.</p>
				<a href="http://localhost:9000/starbucks/service/service_sound.jsp">고객의 소리 문의하기</a>
			</div>
		</section>
	</section>			
	<!--  footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>