<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="inc/header.jsp" flush="true" />

    
 <div class="tablebox">
	<div class="textbox formbox">
		<h3>오시는길</h3>
	</div>
</div>
	<div class="infobox" id="map">
    
    </div>  
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22cb58696de48cf5c8ef72c6b984f1df"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.6446455, 126.6670966), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.6446455, 126.6670966); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.6446455, 126.6670966);
    // 현재 지도의 레벨을 얻어옵니다
    var level = map.setLevel(3);
    
    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
    
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon, level);
}
</script>
<div id="ltmap" onclick="panTo()">
	<i class="fa-solid fa-location-crosshairs"></i>
</div>   
<div class="infobox mapdd">
    <div class="infohead mymenu" id="mapdiv">
    경기도 김포시 김포한강4로 125 KR 월드타워 10층
    </div>
   </div>  
<jsp:include page="inc/aside.jsp" flush="true" />        
<jsp:include page="inc/footer.jsp" flush="true" />