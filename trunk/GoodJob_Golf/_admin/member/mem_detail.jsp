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
	
	MemberDto mDto = mDao.getMember(mem_id);

%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style/style.css">
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
    <td width="630" class=title>★ 회원정보 ★</td>
    <td width="70" align="center"><a href="javascript:self.close();"><img src="/_admin/images/common/btn_close2.gif" width="18" height="19" border="0"></a></td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="700">&nbsp;</td>
  </tr>
<form name="frm" method="post">
<input type="hidden" name="mem_id" value="<%=mem_id%>"/>
  <tr>
    <td align="center" colspan="2" width="700"><table border="0" cellpadding="2" cellspacing="1" width="702" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" height="25" align="right" width="167" style="padding-right:10px;"><span class=normal_b>회원명</span></td>
          <td bgcolor="white" width="162" style="padding-left:10px;"><span class=normal_b><%=mDto.getMem_name()%></span></td>
          <td width="137" bgcolor="#E6E7E8" style="padding-right:10px;" align="right"><span class=normal_b>회원가입상태</span></td>
          <td width="183" bgcolor="white" style="padding-left:10px;"><span class=red>
          <%
          	if("F".equals(mDto.getMem_type())){
          		out.println("무료회원");
          	}
          	else if("1".equals(mDto.getMem_type())){
            	out.println("유료회원(1년)");
          	}
          	else{
          		out.println("유료회원(2년)");
          	}
          %>
          </span></td>
        </tr>
        <tr>
          <td height="25" align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=normal_b>아이디</span></td>
          <td height="25" bgcolor="white" style="padding-left:10px;" colspan="3"><span class=normal_b><%=mDto.getMem_id()%></span></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">
    <table border="0" cellpadding="2" cellspacing="1" width="698" bgcolor="silver">
        <tr>
          <td align="right" bgcolor="#E6E7E8" height="25" width="167" style="padding-right:10px;"><span class=normal_b>비밀번호</span></td>
          <td bgcolor="white" style="padding-left:10px;" width="504" colspan="3"><span class=normal_b><%=mDto.getMem_pwd()%></span></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" height="25" style="padding-right:10px;"><span class=normal_b>연락처</span></td>
          <td bgcolor="white" style="padding-left:10px;" colspan="3"><span class=normal_b><%=mDto.getMem_mtel()%></span></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" height="25" style="padding-right:10px;" width="167"><span class=normal_b>SMS수신여부</span></td>
          <td bgcolor="white" style="padding-left:10px;" width="162"><span class=normal_b><%=("Y".equals(mDto.getSms_yn())?"Yes":"No")%></span></td>
          <td bgcolor="#E6E7E8" style="padding-right:10px;" align="right" width="137"><span class=normal_b>E-Mail수신여부</span></td>
          <td bgcolor="white" style="padding-left:10px;" width="179"><span class=normal_b><%=("Y".equals(mDto.getEmail_yn())?"Yes":"No")%></span></td>
        </tr>
        <tr>
          <td height="25" align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=normal_b>특이사항기록</span></td>
          <td height="25" bgcolor="white" style="padding-left:10px;" colspan="3"><textarea name="memo" rows="14" cols="70" class="box03"><%=StringUtils.trimToEmpty(mDto.getMemo())%></textarea></td>
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