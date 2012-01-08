<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.goodjob.conf.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String x = StringUtils.defaultString(request.getParameter("x"), "37.5675451");
String y = StringUtils.defaultString(request.getParameter("y"), "126.9773356");
if(x.length() == 0  || y.length() == 0){
	x = "37.5675451";
	y = "126.9773356";
}
String mapkey = Config.get("mapkeyUser");
%>
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>샘플코드</title>
	
</head>
<body>
<script type="text/javascript" src="/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=<%=mapkey %>"></script>
<div id="map" style="border:1px solid #000;"></div>
<script type="text/javascript">
		var oSeoulCityPoint = new nhn.api.map.LatLng(<%=x%>, <%=y%>);
		var defaultLevel = 11;
		var oMap = new nhn.api.map.Map(document.getElementById('map'), { 
						point : oSeoulCityPoint,
						zoom : defaultLevel,
						enableWheelZoom : true,
						enableDragPan : true,
						enableDblClickZoom : false,
						mapMode : 0,
						activateTrafficMap : false,
						activateBicycleMap : false,
						minMaxLevel : [ 1, 14 ],
						size : new nhn.api.map.Size(400, 400)		});
		var oSlider = new nhn.api.map.ZoomControl();
		oMap.addControl(oSlider);
		oSlider.setPosition({
			top : 10,
			left : 10
		});

		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);

		var oInfoWnd = new nhn.api.map.InfoWindow();
		oInfoWnd.setVisible(false);
		oMap.addOverlay(oInfoWnd);

		oInfoWnd.setPosition({
			top : 20,
			left :20
		});
		
		var oMarker = null;
		var oPoint = null;

		function onLoad(){
			if(oMarker != null){
				oMap.removeOverlay(oMarker);
			}
			oPoint = new nhn.api.map.LatLng(<%=x%>, <%=y%>);
			oMarker = new nhn.api.map.Marker(oIcon, { title : '마커 : ' + oPoint.toString() });
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);	
		}
		onLoad();
</script>
</body>
</html>
				
