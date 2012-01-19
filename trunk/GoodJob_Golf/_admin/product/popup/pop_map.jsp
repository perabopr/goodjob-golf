<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.goodjob.conf.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String x = StringUtils.defaultString(request.getParameter("x"), "37.5675451");
String y = StringUtils.defaultString(request.getParameter("y"), "126.9773356");
String mapkey = Config.get("mapkeyAdmin");
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
		var defaultLevel = 7;
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
		
		oMap.attach('click', function(oCustomEvent) {
			if(oMarker != null){
				oMap.removeOverlay(oMarker);
			}
			oPoint = oCustomEvent.point;
			var oTarget = oCustomEvent.target;
			oInfoWnd.setVisible(false);
			// 마커 클릭하면
			if (oTarget instanceof nhn.api.map.Marker) {
				// 겹침 마커 클릭한거면
				if (oCustomEvent.clickCoveredMarker) {
					return;
				}
				// - InfoWindow 에 들어갈 내용은 setContent 로 자유롭게 넣을 수 있습니다. 외부 css를 이용할 수 있으며, 
				// - 외부 css에 선언된 class를 이용하면 해당 class의 스타일을 바로 적용할 수 있습니다.
				// - 단, DIV 의 position style 은 absolute 가 되면 안되며, 
				// - absolute 의 경우 autoPosition 이 동작하지 않습니다. 
				oInfoWnd.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
					'<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' + 
					'Hello World <br /> ' + oTarget.getPoint()
					+'<span></div>');
				oInfoWnd.setPoint(oTarget.getPoint());
				oInfoWnd.setPosition({right : 15, top : 30});
				oInfoWnd.setVisible(true);
				oInfoWnd.autoPosition();
				return;
			}
			oMarker = new nhn.api.map.Marker(oIcon, { title : '마커 : ' + oPoint.toString() });
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);			
		});

		function selPoint(){
			$('#pointx', window.opener.document).val(oPoint.y);
			$('#pointy', window.opener.document).val(oPoint.x);
			self.close();
		}

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
<table width="400">
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center">
<input type="button" id="btnOk" name="btnOk" value="선택" onclick="selPoint();">
<input type="button" id="btnClose" name="btnClose" value="닫기" onclick="self.close();">
</td>
</tr>
</table>
</body>
</html>
				
