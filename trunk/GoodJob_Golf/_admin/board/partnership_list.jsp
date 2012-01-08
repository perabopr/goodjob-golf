<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.BBS"%>
<%@page import="com.goodjob.util.Utils"%>
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
	
	int totalCount = bDao.getPartnershipTotal(params);
	
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
	frm.action="partnership_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="partnership_list.jsp"
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
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		PartnershipDto dto;
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
        <tr>
          <td bgcolor="white" align="center" height="25"><%=dto.getReg_dt()%></td>
          <td align="center" bgcolor="white"><%=dto.getName()%></td>
          <td align="center" bgcolor="white"><%=dto.getEmail()%></td>
          <td align="center" bgcolor="white"><%=dto.getMobile()%></td>
          <td align="center" bgcolor="white"><a href="partnership_detail.jsp?seq=<%=dto.getSeq()%>" onClick="NewWindow(this.href,'name','740','450','yes');return false;"><img align="absmiddle" src="/_admin/images/common/btn_detail.gif" width="75" height="22" border="0"></a></td>
          <td align="center" bgcolor="white"><a href="download.jsp?fileName=<%=Utils.getEncoder("/bbs_upload/"+dto.getFilename())%>" target="_blank"><img src="/_admin/images/common/btn_download.gif" width="75" height="22" border="0"></a></td>
        </tr>
<%
		}
	}
%>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:50px;padding-bottom:40px;"><table border="0" cellpadding="0" cellspacing="0" width="50%">
        <tr>
          <td height="50" align="center"><p><span class=normal_b><%=strPage%></span></p></td>
        </tr>
        <tr>
          <td height="4" align="center">&nbsp;</td>
        </tr>
<form name="frm" method="post">
<input type="hidden" name="npage" value="<%=npage%>"/>
        <tr>
          <td height="4" align="center">
            <input nid="keyword" name="keyword" value="<%=keyword%>" type="text" size="30" class="input_box">
            <a href="javascript:on_search();"><img src="/_admin/images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle"></a></td>
        </tr>
</form>
      </table></td>
  </tr>
</table>
</body>
</html>