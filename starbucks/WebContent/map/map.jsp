<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.starbucks.dao.mapDAO, com.starbucks.vo.mapVO, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea</title>
<style>
	#map { width:100%; height:650px; position:relative;  }
	div.search { 
		border:1px solid lightgray; width:300px; height:550px; position:absolute;
		margin-left:20px; margin-top:-600px; z-index:1; background-color:white;
	 }
	 div.title { 
	 	background-color:rgb(0,102,51); color:white; font-size:25px; display:inline-block; width:50%; 
	 	height:70px; line-height:70px; text-align:center; font-weight:bold;
	 }
	 div.empty { background-color:rgb(244,244,242); width:100%; height:35px; }
	 
	div.m_search div:first-child { 
		display:inline-block; width:100%; margin:0; padding:0; float:left; 
		padding:10px 0; font-weight:bold; background-color:white; text-align:center; 
	}
	div.m_search div:nth-child(2) { 
		height:80px; font-size:13px; line-height:45px; background-color:rgb(0,102,51); color:white; text-align:center;  
	}
	div.m_search { font-size:13px; }
	div.scroll ul,  .scroll_sub ul { 
		list-style-type:none; 
		display:inline-block; 
		margin-top:10px; 
		border-top:1px solid lightgray; 
		margin-left:5px; 
	}
	div.scroll li { display:inline-block; padding:10px 80px 10px 30px; }
	div.scroll_sub li { padding:10px 0 10px 10px;  width:265px; float:left; }
	div.scroll li:hover,  .scroll_sub li:hover { text-decoration:underline; cursor:pointer; color:green; }
	
	div.scroll { height:370px; }
	div.scroll_sub { height:320px; display:none; width:300px; }
	
	div.scroll_sub a { text-decoration:none; color:black; }
	
	#step2_img { 
		display:none; width:100%; height:50px; background-color:rgb(244,244,242); clear:left; font-size:15px; font-weight:bold; 
		line-height:55px;
	}		
	#step2_img img { margin:0 10px 0 20px; cursor:pointer; }
</style>
<script src="http://localhost:9000/starbucks/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$(".scroll li").click(function() {
		
		var name = $(this).text();
		
		$("#step2_img span").text($(this).text());
		$("#step2_img").css("display","inline-block");
		$(".scroll").css("display","none");
		$("#step_text").text("STEP 2 : 구/군을 선택해 주세요.");		
		$(".scroll_sub").css("display","inline-block");
		$("iframe").attr("src","http://localhost:9000/starbucks/map/map_process.jsp?name="+name)		
		
		$("iframe").on('load', function() {
			$("#ul").html($("iframe").contents().find("body").html());			
		});
		
	});
	
	
	$("#step2_img img").click(function() {
		
		$("#step2_img").css("display","none");
		$("#step_text").text("STEP 1 : 시/도를 선택해 주세요.");
		$(".scroll_sub").css("display", "none");
		$(".scroll").css("display","inline-block");		
		
	});
});

</script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=364315f6128adcd13735d4bb62dc2b88&libraries=services"></script>	
</head>
<body>
	<!--  header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	
	<!-- map -->
	<div>
		<div id="map" ></div>
		<div class="search">
			<div class="title">매장찾기</div>
			<div class="empty"></div>
			<div class="m_search">
				<div>지역 검색</div>
				<div id="step_text"><p>STEP 1 : 시/도를 선택해 주세요.</p></div>
				<div id="step2_img"><img src="http://localhost:9000/starbucks/images/btn_prev.png"><span></span></div>
				<div class="scroll" style="overflow:scroll">
					<ul>
						<li>서울</li>
						<li>경기</li>
					</ul>
					<ul>
						<li>광주</li>
						<li>대구</li>
					</ul>
					<ul>
						<li>대전</li>
						<li>부산</li>
					</ul>
					<ul>
						<li>울산</li>
						<li>인천</li>
					</ul>
					<ul>
						<li>강원</li>
						<li>경남</li>
					</ul>
					<ul>
						<li>경북</li>
						<li>전남</li>
					</ul>
					<ul>
						<li>전북</li>
						<li>충남</li>
					</ul>
					<ul>
						<li>충북</li>
						<li>제주</li>
					</ul>
					<ul>
						<li>세종</li>
					</ul>
				</div>
				<iframe style="display:none"></iframe>
				<div class="scroll_sub" style="overflow:scroll">
					<ul id="ul">
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!--  footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
<script>
	var mapContainer = document.getElementById('map');
	var mapOptions = {
		center: new kakao.maps.LatLng(37.566400, 126.978573),
		level: 3
	};
	var map = new kakao.maps.Map(mapContainer, mapOptions);	
	
	// 마커를 표시할 위치와 title 객체 배열
	/**var positions = [
	    {
	        title: '무교로', 
	        latlng: new kakao.maps.LatLng(37.567265, 126.978946)
	    },
	    {
	        title: '한국프레스센터', 
	        latlng: new kakao.maps.LatLng(37.567418, 126.977859)
	    },
	    {
	        title: '무교동', 
	        latlng: new kakao.maps.LatLng(37.567824, 126.978810)
	    },
	    {
	        title: '시청',
	        latlng: new kakao.maps.LatLng(37.566274, 126.979784)
	    },
	    {
	        title: '시청플러스',
	        latlng: new kakao.maps.LatLng(37.566292, 126.980078)
	    },
	    {
	        title: '을지로국제빌딩',
	        latlng: new kakao.maps.LatLng(37.567059, 126.982104)
	    },
	    {
	        title: '환구단',
	        latlng: new kakao.maps.LatLng(37.564535, 126.979230)
	    },
	    {
	        title: '광화문우체국',
	        latlng: new kakao.maps.LatLng(37.569779, 126.978028)
	    },
	    {
	        title: '소공로북창',
	        latlng: new kakao.maps.LatLng(37.563688, 126.978879)
	    },
	    {
	        title: '소공로',
	        latlng: new kakao.maps.LatLng(37.563770, 126.980747)
	    }
	];**/
	
	// 마커 이미지의 이미지 주소
	var imageSrc = "http://localhost:9000/starbucks/images/pin_general.png";
	    
	//for (var i = 0; i < positions.length; i ++) {	    
	    // 마커 이미지의 이미지 크기
	    var imageSize = new kakao.maps.Size(38, 60); 	    
	    // 마커 이미지 생성
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 	    
	    // 마커 생성
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        //position: positions[i].latlng, // 마커를 표시할 위치
	       // title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시
	        image : markerImage // 마커 이미지 
	    });	    
	//}		

	
	function zoomOut() {	
	    // 이동할 위도 경도 위치를 생성합니다 
	   var moveLatLon = new kakao.maps.LatLng(37.501243, 127.0431557);	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	   map.panTo(moveLatLon);      
	}
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
		function zoomIn(name) {		
			if (name == "서울시 전체") {
				name = "서울시 스타벅스";
			} else if (name == "세종시 전체") {
				name = "세종시 스타벅스";				
			} else {
				// 키워드로 장소를 검색합니다
				name += "스타벅스";				
			}
			ps.keywordSearch(name, placesSearchCB); 
		}

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		    	map: map,
		        position: new kakao.maps.LatLng(place.y, place.x),
		    	image : markerImage // 마커 이미지 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
</script>
</html>