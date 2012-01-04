<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.BBS"%>
<%
	//통합 게시판 
	BoardDao bDao = new BoardDao();
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , BBS.per_page );
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("field",field);
	params.put("keyword",keyword);
	
	List<PartnershipDto> bbsList = bDao.getPartnershipList(params);
	
	int totalCount = bDao.getTotalCount("tb_notice_bbs" , params);
	
	String strPage = paging.getPaging(totalCount, false);
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">

	function NewWindow(mypage, myname, w, h, scroll) { 
		var winl = (screen.width - w) / 2; 
		var wint = (screen.height - h) / 2; 
		winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
		win = window.open(mypage, myname, winprops) 
		if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
	} 
function on_search() {

	var frm = document.frm;
	if(!$('#keyword').val()) {
		alert('검색어를 입력하시기 바랍니다.');
		$('#keyword').focus();
		return;
	} 
	frm.action="notice_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="notice_list.jsp"
	frm.submit();
}
//-->
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="700">
  <tr>
    <td width="630" class=title>★ 제휴 및 광고문의 전달사항 ★</td>
    <td width="70" align="center"><a href="javascript:self.close();"><img src="../../images/common/btn_close2.gif" width="18" height="19" border="0"></a></td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="700">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" height="250" valign="top" style="padding-left:10px;padding-right:10px;">
     제휴 및 광고문의 전달사항은 여기에 기록하세요
</td>
  </tr>
</table>
</body>
</html>