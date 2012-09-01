<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	BoardDao dao = new BoardDao();
	 
	String seq = StringUtils.trimToEmpty(request.getParameter("seq"));
	String thread = StringUtils.trimToEmpty(request.getParameter("thread"));
	String npage = StringUtils.trimToEmpty(request.getParameter("npage"));
	
	BoardDto dto = dao.getView("tb_notice_bbs" , NumberUtils.toInt(seq,0));
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header_nhcard.jsp" %>
<!-- 상단 영역 -->
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">공지사항</td>
          <td width="50%" height="25" bgcolor="#DCDDDE" style="padding-top:4px; padding-right: 10px;" align="right"><a href="default.jsp"><img align="absmiddle" src="../img_nhcard/common/btn_home.gif" width="60" height="19" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="669">
        <tr>
          <td background="../images/board/img_main_title_bg.gif" height="31">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="114"><img src="../images/board/img_subject.gif" width="29" height="18" border="0" align="absmiddle"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="30">&nbsp;</td>
                <td width="524" class=normal_b><%=StringUtils.trimToEmpty(dto.getSubject())%></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="../images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="114"><img src="../images/board/img_date.gif" width="29" height="18" border="0" align="absmiddle"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="30">&nbsp;</td>
                <td width="524"><%=StringUtils.trimToEmpty(dto.getReg_dt())%></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="../images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" valign="top" width="114"><img src="../images/board/img_contents.gif" width="29" height="18" border="0" align="absmiddle"></td>
                <td align="center" valign="top" bgcolor="#D1D3D4" width="1"></td>
                <td width="30">&nbsp;</td>
                <td width="524" height="200" valign="top"><%=StringUtils.trimToEmpty(dto.getContent())%></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="../images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="50"><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td width="88">&nbsp;</td>
                <td width="88">&nbsp;</td>
                <td width="418">&nbsp;</td>
                <td width="75" align="right"><a href="./notice_list.jsp?npage=<%=npage%>"><img src="../images/board/btn_list.gif" width="71" height="24" border="0"></a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- 하단 footer  -->
<%@ include file="/include/footer_nhcard.jsp" %>
<!-- 하단 footer  -->