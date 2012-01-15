<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.util.*" %>
<%
	String type = StringUtils.defaultIfEmpty(request.getParameter("type") , "0");
	String title = "";
	
	if("0".equals(type)){
		title = "★ 온라인 상품권 등록 ★";
	}
	else{
		title = "★ 오프라인 상품권 등록 ★";
	}
%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.6.2.min.js"></script>
<script language="javascript" type="text/javascript">

	function go_submit() {
		
		if(!$('#upfile').val()) {
			alert('업로드할 파일이 없습니다.');
			$('#upfile').focus();
			return;
		} 
		
		var frm = document.frm;
		frm.action="coupon_reg.jsp";
		frm.submit();
   	}
</script>
<title></title>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="390">
    <tr>
        <td width="390" class=title align="center"><%=title%></td>
    </tr>
<FORM NAME="frm" METHOD="post" ACTION="coupon_reg.jsp"  enctype="multipart/form-data">
<input type="hidden" id="type" name="type" value="<%=type%>" />
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
    <tr>
        <td align="center">
		<input class="upload" id="upfile" name="upfile" type="file" size="36">
        </td>
    </tr>
    <tr>
        <td width="1242" height="50" align="center">
		<a href="javascript:go_submit();"><img align="absmiddle" src="/_admin/images/inc/btn_regist2.gif" width="74" height="26" border="0"></a></td>
    </tr>
</table>
</body>
</html>