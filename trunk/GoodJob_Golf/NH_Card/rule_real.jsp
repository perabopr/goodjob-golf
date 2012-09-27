<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkPromiseDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int productsubSeq = NumberUtils.toInt(request.getParameter("gcId"), 0);
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkPromiseDto> listPromise = glDao.getGolfPromise(productsubSeq);

if(listPromise == null || listPromise.size() == 0){
	out.println("<script>location.href='realtime_list.jsp'</script>");
	return;
}
%>
<script type="text/javascript">
function reserveAgree(){
	if(!$("#chkAgree1").attr("checked")){
		alert("위약처리규정에 동의하세요.");
		$("#chkAgree1").select();
		return false;
	}
	if(!$("#chkAgree2").attr("checked")){
		alert("이용약관에 동의하세요.");
		$("#chkAgree2").select();
		return false;		
	}
	$("#menu").val("1");
	$("#gcId").val("<%=productsubSeq%>");
	$("#golf").val('<%=request.getParameter("golf")%>');
	$("#date").val('<%=request.getParameter("date")%>');
	$("#cdate").val('<%=request.getParameter("cdate")%>');
	frm.submit();
}
</script>
<form NAME="frm" method="post" action="bill.jsp">
<input type="hidden" id="menu" name="menu" >
<input type="hidden" id="gcId" name="gcId" >
<input type="hidden" id="golf" name="golf" >
<input type="hidden" id="date" name="date" >
<input type="hidden" id="cdate" name="cdate" >
</form>
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">실시간예약</td>
          <td width="50%" height="25" bgcolor="#DCDDDE" style="padding-top:4px; padding-right: 10px;" align="right"><a href="default.jsp"><img align="absmiddle" src="../img_nhcard/common/btn_home.gif" width="60" height="19" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border=0 cellspacing=0 cellpadding=0 width="100%">
        <tr>
          <td><p><img border=0 src="../images/booking/img_rule_title.gif" width=192 height=30></p></td>
        </tr>
        <tr>
          <td align=center><table border=0 cellspacing=1 cellpadding=2 width=630 bgcolor=#d1d3d4>
<%
	if(listPromise != null && listPromise.size() == 1){
		if(listPromise.get(0).getPromise1_type().length() > 0){
%>
<TR>
<TD style="padding-left: 20px" class=normal_b bgColor=white height=25><%=listPromise.get(0).getPromise1_type() %></TD>
<TD style="padding-left: 20px" class=orange bgColor=white><%=listPromise.get(0).getPromise1() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise2_type().length() > 0){
%>
<TR>
<TD style="padding-left: 20px" class=normal_b bgColor=white height=25><%=listPromise.get(0).getPromise2_type() %></TD>
<TD style="padding-left: 20px" class=orange bgColor=white><%=listPromise.get(0).getPromise2() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise3_type().length() > 0){
%>
<TR>
<TD style="padding-left: 20px" class=normal_b bgColor=white height=25><%=listPromise.get(0).getPromise3_type() %></TD>
<TD style="padding-left: 20px" class=orange bgColor=white><%=listPromise.get(0).getPromise3() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise4_type().length() > 0){
%>
<TR>
<TD style="padding-left: 20px" class=normal_b bgColor=white height=25><%=listPromise.get(0).getPromise4_type() %></TD>
<TD style="padding-left: 20px" class=orange bgColor=white><%=listPromise.get(0).getPromise4() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise5_type().length() > 0){
%>
<TR>
<TD style="padding-left: 20px" class=normal_b bgColor=white height=25><%=listPromise.get(0).getPromise5_type() %></TD>
<TD style="padding-left: 20px" class=orange bgColor=white><%=listPromise.get(0).getPromise5() %></TD>
</TR>
<%
		}
	}
%>            
            </table></td>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td style="padding-left: 40px; padding-right: 40px"><%
	if(listPromise != null && listPromise.size() == 1){	
 		out.print(listPromise.get(0).getCancelrule());
	}
%></td>
        </tr>
        <tr>
          <td style="padding-right: 40px" align=right><input id="chkAgree1" value="" type=checkbox>
            위약처리규정에 동의합니다 </td>
        </tr>
        <tr>
          <td><img border=0 src="../images/booking/img_agree_title.gif" width=192 height=30></td>
        </tr>
        <tr height="130px" valign="top">
          <td align=center>
          <div style="overflow-x:hidden; overflow-y:auto; height:130px; width:630px;text-align:left;border: 1px solid; border-color:#D1D3D4;" >
<%
	if(listPromise != null && listPromise.size() == 1){	
		out.print(listPromise.get(0).getUse_rule());
	}
%>
</div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td style="padding-right: 40px" align=right><input id="chkAgree2" value="" type=checkbox>
            이용약관에 동의합니다 </td>
        </tr>
        <tr>
          <td style="padding-bottom: 30px; padding-top: 30px" align=center><A href="javascript:;" onclick="reserveAgree();"><img border=0 src="../images/common/btn_regist_booking2.gif" width="150" height="39"></a></td>
        </tr>
      </table></td>
  </tr>
</table>
