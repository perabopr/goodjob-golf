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
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 제휴 및 광고문의 ★</td>
  </tr>
  <tr>
    <td align="center" width="1852">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" width="1852"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" height="25" align="center" width="565"><span class=normal_b>제목</span></td>
          <td bgcolor="#e6e7e8" align="center" width="315"><span class=normal_b>고객명(회사명)</span></td>
          <td bgcolor="#e6e7e8" align="center" width="277"><span class=normal_b>E-Mail</span></td>
          <td width="200" align="center" bgcolor="#E6E7E8"><span class=normal_b>핸드폰</span></td>
          <td bgcolor="#e6e7e8" align="center" width="246"><span class=normal_b>전달사항</span></td>
          <td bgcolor="#e6e7e8" align="center" width="218"><span class=normal_b>첨부파일</span></td>
        </tr>
        <tr>
          <td bgcolor="white" align="center" height="25">2011-12-31 12:30</td>
          <td align="center" bgcolor="white">홍길동</td>
          <td align="center" bgcolor="white">abc@naver.com</td>
          <td align="center" bgcolor="white">010-123-4567 </td>
          <td align="center" bgcolor="white"><a href="partner_detail.jsp" onClick="NewWindow(this.href,'name','740','450','yes');return false;"><img align="absmiddle" src="/_admin/images/common/btn_detail.gif" width="75" height="22" border="0"></a></td>
          <td align="center" bgcolor="white"><img src="/_admin/images/common/btn_download.gif" width="75" height="22" border="0"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:50px;padding-bottom:40px;"><table border="0" cellpadding="0" cellspacing="0" width="50%">
        <tr>
          <td align="center"><p><img align="absmiddle" src="/_admin/images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="/_admin/images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <img align="absmiddle" src="/_admin/images/board/btn_next.gif" width="16" height="15" border="0"> <img align="absmiddle"
src="/_admin/images/board/btn_next_dual.gif"
width="16" height="15" border="0"></p></td>
        </tr>
        <tr>
          <td height="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="4" align="center">
            <input name="key" type="text" size="30" class="input_box">
            <input name="imagefield" type="image" src="/_admin/images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>