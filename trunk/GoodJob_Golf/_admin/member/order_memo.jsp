<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.member.*"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.MEMBER"%>
<%
	
	String mem_id = StringUtils.defaultIfEmpty(request.getParameter("mem_id"), "");
	
	MemberDao mDao = new MemberDao();
	String memo = mDao.getOrderMemo(mem_id);

%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript">
	function on_submit() {
 	      
		var frm = document.frm;
		frm.target =  "ifr_hidden"; 
		frm.action = "member_memo.jsp";
		frm.submit();
   	}
</script>
<title>회원정보</title>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="700">
  <tr>
    <td width="630" class=title>★ 예약메모 ★</td>
    <td width="70" align="center"><a href="javascript:self.close();"><img src="/_admin/images/common/btn_close2.gif" width="18" height="19" border="0"></a></td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="700">&nbsp;</td>
  </tr>
<form name="frm" method="post">
<input type="hidden" name="mem_id" value="<%=mem_id%>"/>
<input type="hidden" name="type" value="order"/>
  <tr>
    <td colspan="2">
    <table border="0" cellpadding="2" cellspacing="1" width="698" bgcolor="silver">
          <td height="25" align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=normal_b>특이사항기록</span></td>
          <td height="25" bgcolor="white" style="padding-left:10px;" colspan="3"><textarea name="memo" rows="14" cols="70" class="box03"><%=memo%></textarea></td>
        </tr>
      </table></td>
  </tr>
</form>
  <tr>
    <td colspan="2" align="center" style="padding-top:20px;padding-bottom:20px;">
    <a href="javascript:on_submit();"><img align="absmiddle" src="/_admin/images/inc/btn_regist2.gif" width="74" height="26" border="0"></a></td>
  </tr>
</table>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe> 
</body>
</html>