<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	//통합 게시판 
	BoardDao dao = new BoardDao();
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("field",field);
	params.put("keyword",keyword);
	
	List<BoardDto> bbsList = dao.getList("TB_NOTICE_BBS" , params);
	
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body bgcolor="white">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 공지사항 ★</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center"><table width="580" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="../../images/board/line01.gif" width="600" height="1"></td>
              </tr>
              <tr>
                <td><table width="600" border="0" cellpadding="0" cellspacing="0" bgcolor="#f5f5f5">
                    <tr>
                      <td width="40" align="center"><img src="../../images/board/sbj_no.gif" width="25" height="23"></td>
                      <td width="10" align="center">&nbsp;</td>
                      <td align="center"><img src="../../images/board/sbj_ttl.gif" width="24" height="23"></td>
                      <td width="19" align="center">&nbsp;</td>
                      <td width="80" align="center"><img src="../../images/board/sbj_date.gif" width="32" height="23"></td>
                      <td width="14" align="center">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="4" valign="top"><img src="../../images/board/line04.gif" width="600" height="1"></td>
              </tr>
            </table>
            <table width="580" border="0" cellspacing="0" cellpadding="0">
				<tr>
                <td>
                <table width="600" border="0" cellspacing="0" cellpadding="0">
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		BoardDto dto;
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
					<tr>
                     <td height="24" width="40" align="center"><%=dto.getSeq()%></td>
                     <td width="10"><img src="../../images/board/bl.gif" width="10" height="22"></td>
                     <td width="437" class="list"><a href="notice_view.html"><a href="./view.jsp?seq=<%=dto.getSeq()%>"><%=dto.getSubject()%></a></a></td>
                     <td width="10">&nbsp;</td>
                     <td width="9"><img src="../../images/board/bl.gif" width="10" height="22"></td>
                     <td width="80" align="center"><%=dto.getWrite_date()%></td>
                     <td width="14">&nbsp;</td>
                   </tr>
<%
		}
	}
%>
				</table></td>
              </tr>
              <tr>
                <td><img src="../../images/board/line02.gif" width="600" height="4"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><p><img src="../../images/board/line01.gif" width="600" height="1"></p></td>
              </tr>
              <tr>
                <td height="45" align="center" bgcolor="#f5f5f5"><table border="0" cellpadding="0" cellspacing="0" width="230">
                    <tr>
                      <td><select name="keyfield" class="form_style6">
                          <option value="subject">제 목</option>
                          <option value="content">내 용</option>
                        </select></td>
                      <td><input name="key" type="text" size="15" class="input_box"></td>
                      <td><input name="imagefield" type="image" src="../../images/board/bt_search.gif" border="0" width="43" height="19"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="center"><p><img src="../../images/board/line01.gif" width="600" height="1"></p></td>
              </tr>
            </table></td>
        </tr>
                <tr>
                    <td height="50" align="center">
                        <p><img align="absmiddle" src="../../images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="../../images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <img align="absmiddle" src="../../images/board/btn_next.gif" width="16" height="15" border="0">
<img align="absmiddle" src="../../images/board/btn_next_dual.gif"
width="16" height="15" border="0"></p>
                    </td>
                </tr>
        <tr>
          <td align="right"><a href="notice_write.html"><img src="../../images/board/bbs_write.gif" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td></td>
  </tr>
</table>
</body>

</html>