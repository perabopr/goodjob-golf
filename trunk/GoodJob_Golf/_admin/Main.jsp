<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%

String admin_type = StringUtils.trimToEmpty((String)session.getAttribute("admin_type"));

if(StringUtils.trimToEmpty((String)session.getAttribute("admin_id")).length()==0){
%>
<script language="javascript" type="text/javascript">
	alert("로그인이 필요한 곳입니다.");
	top.location.href="/_admin/";
</script>
<%
	return;
}
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>굳잡골프 통합 관리자</title>
</head>

<frameset cols="200, 1*" border="0">
	<frame src="left_menu.jsp" name="left_menu" scrolling="no" marginwidth="0" marginheight="0" namo_target_frame="main">
	<frameset rows="30, 92%, 25">
		<frame src="top.jsp" scrolling="no" marginwidth="0" marginheight="0">
		<%if("9".equals(admin_type)){ %>
		<frame src="product/real_list.jsp?menu=1" name="main" scrolling="yes" marginwidth="10" marginheight="10" namo_target_frame="main">
		<%}else if("0".equals(admin_type)){ %>
		<frame src="/_admin/order/total_search.jsp" name="main" scrolling="yes" marginwidth="10" marginheight="10" namo_target_frame="main">
		<%}else{ %>
		<frame src="/_admin/stats/stats_list.jsp" name="main" scrolling="yes" marginwidth="10" marginheight="10" namo_target_frame="main">
		<%} %>
		<frame src="bottom.jsp" scrolling="no" marginwidth="0" marginheight="0" name="bottom">
	</frameset>
	<noframes>
	<body bgcolor="white">
	<p>이 페이지를 보려면, 프레임을 볼 수 있는 브라우저가 필요합니다.</p>
	</body>
	</noframes>
</frameset>
</html>