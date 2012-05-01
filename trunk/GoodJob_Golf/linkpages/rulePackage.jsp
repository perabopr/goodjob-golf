<%@page import="com.goodjob.reserve.dto.PackagePromiseDto"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkPromiseDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"),0);
	if (pkSeq == 0) {
		out.println("<script>location.href='reserve.jsp?menu=3&gr_cd="+nhNum+"&username="+URLEncoder.encode(nhName, "utf-8")+"';</script>");
		return;
	}
	PackageDao pkDao = new PackageDao();
	List<PackagePromiseDto> listPromise = pkDao.getPackagePromise(pkSeq);
	
	if (listPromise.size() != 1) {
		out.println("<script>alert('취소 규정이 없습니다.');location.href='reserve.jsp?menu=3&gr_cd="+nhNum+"&username="+URLEncoder.encode(nhName, "utf-8")+"'</script>");
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
	$("#menu").val("3");
	$("#pkSeq").val("<%=pkSeq%>");
	frm.submit();
}
</script>
<FORM NAME="frm" METHOD="post" ACTION="bill.jsp">
<input type="hidden" id="menu" name="menu" value="3" >
<input type="hidden" id="pkSeq" name=pkSeq>
<input type="hidden" id="gr_cd" name="gr_cd" value="<%=nhNum%>">
<input type="hidden" id="username" name="username" value="<%=nhName%>">
</FORM>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
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
<div style="overflow-x:hidden; overflow-y:auto; height:130px; width:630px;text-align:left;border: 1px solid; border-color:#D1D3D4">
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
<TD style="PADDING-BOTTOM: 30px; PADDING-TOP: 30px" align=center><A href="javascript:;" onclick="reserveAgree();"><IMG border=0 src="../../images/package/btn_domestic_regist3.gif"></A></TD>
</TR>
</TBODY>
</TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>