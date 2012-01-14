<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkPromiseDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int productsubSeq = NumberUtils.toInt(request.getParameter("psId"), 0);
if(productsubSeq == 0){
	out.println("<script>location.href='reserve.jsp?menu=2'</script>");
	return;
}
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkPromiseDto> listPromise = glDao.getGolfPromise(productsubSeq);

if(listPromise == null || listPromise.size() == 0){
	out.println("<script>location.href='reserve.jsp?menu=2'</script>");
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
	$("#menu").val("2");
	$("#psId").val("<%=productsubSeq%>");
	$("#golf").val('<%=request.getParameter("golf")%>');
	$("#date").val('<%=request.getParameter("date")%>');
	$("#cdate").val('<%=request.getParameter("cdate")%>');
	
	$("#reserveCnt").val('<%=request.getParameter("reserveCnt")%>');
	$("#reserveTeam").val('<%=request.getParameter("reserveTeam")%>');
	$("#reserveDate").val('<%=request.getParameter("reserveDate")%>');
	$("#reserveTime").val('<%=request.getParameter("reserveTime")%>');

	$("#reserveCoupon").val('<%=request.getParameter("reserveCoupon")%>');
	
	$("#reserveName").val('<%=request.getParameter("reserveName")%>');
	$("#reservePhone").val('<%=request.getParameter("reservePhone")%>');
	$("#reserveEmail").val('<%=request.getParameter("reserveEmail")%>');
	frm.submit();
}
</script>
<FORM NAME="frm" METHOD="post" ACTION="bill.jsp">
<input type="hidden" id="menu" name="menu" value="2" >
<input type="hidden" id="psId" name="psId">
<input type="hidden" id="golf" name="golf" >
<input type="hidden" id="date" name="date" >
<input type="hidden" id="cdate" name="cdate" >

<input type="hidden" id="reserveCnt" name="reserveCnt">
<input type="hidden" id="reserveTeam" name="reserveTeam">
<input type="hidden" id="reserveDate" name="reserveDate">
<input type="hidden" id="reserveTime" name="reserveTime">

<input type="hidden" id="reserveCoupon" name="reserveCoupon">

<input type="hidden" id="reserveName" name="reserveName">
<input type="hidden" id="reservePhone" name="reservePhone">
<input type="hidden" id="reserveEmail" name="reserveEmail">
<textarea id="reserveRequest" name="reserveRequest" style="display:none"><%=request.getParameter("reserveRequest")%></textarea>
</FORM>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>사전예약</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>사전예약</TD></TR>
<TR>
<TD vAlign=top>
<P>&nbsp;</P></TD></TR>
<TR>
<TD vAlign=top align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD>
<P><IMG border=0 src="../../images/booking/img_rule_title.gif" width=192 height=30></P></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=630 bgColor=#d1d3d4>
<TBODY>
<TR>
<TD class=normal_b bgColor=#f1f1f1 height=25 width="50%" align=center>구분</TD>
<TD class=normal_b bgColor=#f1f1f1 width="50%" align=center>위약처리규정</TD>
</TR>
<%
	if(listPromise != null && listPromise.size() == 1){
		if(listPromise.get(0).getPromise1_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise1_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise1() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise2_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise2_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise2() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise3_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise3_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise3() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise4_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise4_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise4() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise5_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise5_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise5() %></TD>
</TR>
<%
		}
	}
%>
</TBODY></TABLE></TD>
<TR><TD>&nbsp;</TD></TR>
<TR>
<TD style="PADDING-LEFT: 40px; PADDING-RIGHT: 40px">
<%
	if(listPromise != null && listPromise.size() == 1){	
 		out.print(listPromise.get(0).getCancelrule());
	}
%>
</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 40px" align=right><INPUT id="chkAgree1" value="" type=checkbox> 위약처리규정에 동의합니다 </TD>
</TR>
<TR>
<TD><IMG border=0 src="../../images/booking/img_agree_title.gif" width=192 height=30></TD>
</TR>
<TR height="130px" valign="top">
<TD align=center>
<div style="overflow-x:hidden; overflow-y:auto; height:130px; width:630px;text-align:left; border: 1px solid; border-color:#D1D3D4;">
<%
	if(listPromise != null && listPromise.size() == 1){	
		out.print(listPromise.get(0).getUse_rule());
	}
%>
</div>
</TD>
</TR>
<TR>
<TD>&nbsp;</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 40px" align=right><INPUT id="chkAgree2" value="" type=checkbox> 이용약관에 동의합니다 </TD>
</TR>
<TR>
<TD style="PADDING-BOTTOM: 30px; PADDING-TOP: 30px" align=center><A href="javascript:;" onclick="reserveAgree();"><IMG border=0 src="../../images/common/btn_regist_booking2.gif"></A></TD>
</TR>
</TBODY>
</TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>