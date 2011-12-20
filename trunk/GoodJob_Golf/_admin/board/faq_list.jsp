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
	BoardDao dao = new BoardDao();
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , BBS.per_page );
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("field",field);
	params.put("keyword",keyword);
	
	List<BoardDto> bbsList = dao.getList("tb_faq_bbs" , params);
	
	int totalCount = dao.getTotalCount("tb_faq_bbs" , params);
	
	String strPage = paging.getPaging(totalCount, false);
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">
	
function on_search() {

	var frm = document.frm;
	if(!$('#keyword').val()) {
		alert('검색어를 입력하시기 바랍니다.');
		$('#keyword').focus();
		return;
	} 
	frm.action="faq_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="faq_list.jsp"
	frm.submit();
}
//-->
</script>
</head>
<body bgcolor="white">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ FAQ ★</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center"><table width="580" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="/_admin/images/board/line01.gif" width="600" height="1"></td>
              </tr>
              <tr>
                <td><table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#f5f5f5">
                    <tr>
                      <td width="40" align="center"><img src="/_admin/images/board/sbj_no.gif" width="25" height="23"></td>
                      <td width="10" align="center">&nbsp;</td>
                      <td align="center"><img src="/_admin/images/board/sbj_ttl.gif" width="24" height="23"></td>
                      <td width="19" align="center">&nbsp;</td>
                      <td width="80" align="center"><img src="/_admin/images/board/sbj_date.gif" width="32" height="23"></td>
                      <td width="14" align="center">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="4" valign="top"><img src="/_admin/images/board/line04.gif" width="600" height="1"></td>
              </tr>
            </table>
            <table width="580" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="600" border="0" cellspacing="0" cellpadding="0">
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		BoardDto dto;
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
					<tr>
                     <td height="24" width="40" align="center"><%=dto.getSeq()%></td>
                     <td width="10"><img src="/_admin/images/board/bl.gif" width="10" height="22"></td>
                     <td width="437" class="list"><a href="./faq_view.jsp?seq=<%=dto.getSeq()%>" class=b_list><%=dto.getSubject()%></a></td>
                     <td width="10">&nbsp;</td>
                     <td width="9"><img src="/_admin/images/board/bl.gif" width="10" height="22"></td>
                     <td width="80" align="center"><%=dto.getReg_dt()%></td>
                     <td width="14">&nbsp;</td>
                   </tr>
<%
		}
	}
%>
				</tr>
                  </table></td>
              </tr>
              <tr>
                <td><img src="/_admin/images/board/line02.gif" width="600" height="4"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><p><img src="/_admin/images/board/line01.gif" width="600" height="1"></p></td>
              </tr>
              <form name="frm" method="post">
              <input type="hidden" name="npage" value="<%=npage%>"/>
              <tr>
                <td height="45" align="center" bgcolor="#f5f5f5">
                <table border="0" cellpadding="0" cellspacing="0" width="230">
                    <tr>
                      <td><select id="field" name="field" class="form_style6">
                          <option value="subject"<%=("subject".equals(field)?" selected":"")%>>제 목</option>
                          <option value="content"<%=("content".equals(field)?" selected":"")%>>내 용</option>
                        </select></td>
                      <td><input id="keyword" name="keyword" value="<%=keyword%>" type="text" size="15" class="input_box"></td>
                      <td><a href="javascript:on_search();"><img src="/_admin/images/board/bt_search.gif" border="0" width="43" height="19"></a></td>
                    </tr>
                  </table>
                  </td>
              </tr>
              </form>
              <tr>
                <td align="center"><p><img src="/_admin/images/board/line01.gif" width="600" height="1"></p></td>
              </tr>
            </table></td>
        </tr>
        <tr>
                    <td height="50" align="center"><p><span class=normal_b><%=strPage%></span></p></td>
                </tr>
        <tr>
          <td align="right"><a href="faq_write.jsp"><img src="/_admin/images/board/bbs_write.gif" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td></td>
  </tr>
</table>
</body>
</html>