<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>굳잡골프 통합 관리자</title>
</head>

<frameset cols="200, 1*" border="0">
	<frame src="left_menu.jsp" name="left_menu" scrolling="no" marginwidth="0" marginheight="0" namo_target_frame="main">
	<frameset rows="30, 92%, 25">
		<frame src="top.html" scrolling="no" marginwidth="0" marginheight="0">
		<frame src="product/real_list.jsp?menu=1" name="main" scrolling="yes" marginwidth="10" marginheight="10" namo_target_frame="main">
		<frame src="bottom.html" scrolling="no" marginwidth="0" marginheight="0" name="bottom">
	</frameset>
	<noframes>
	<body bgcolor="white">
	<p>이 페이지를 보려면, 프레임을 볼 수 있는 브라우저가 필요합니다.</p>
	</body>
	</noframes>
</frameset>
</html>