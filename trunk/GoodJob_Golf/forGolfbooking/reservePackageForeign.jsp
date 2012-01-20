<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.goodjob.reserve.dto.PackageDto"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.RegionDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int pRegion = NumberUtils.toInt(request.getParameter("region"), 0);
//String pRegion = StringUtils.defaultIfEmpty(request.getParameter("region"), "0");
PackageDao pkDao = new PackageDao();
List<RegionDto> rList = pkDao.getRegionList("2");

String strWhere = " AND a.menu_seq = 4 ";
if(pRegion != 0){
	strWhere = "AND a.region_seq = " + pRegion;
}
List<PackageDto> pkList = pkDao.getPackageList(strWhere);
%>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 height="650" align=center>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
	<TBODY>
	<TR>
	<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프패키지 &gt; <SPAN class=location_b>해외골프패키지</SPAN></TD></TR>
	<TR>
	<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>해외골프패키지</TD></TR>
	<TR>
	<TD vAlign=top>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
		<TBODY>
		<TR>
		<TD>
		<P>&nbsp;</P></TD></TR>
		<TR>
		<TD align=center>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
			<TR>
			<TD height=50 align=center></TD>
			</TR>
			<TR>
			<TD style="PADDING-RIGHT: 18px" height=30 align=center>
			<img src="/images/package/img_ready.gif" border="0"/>
			</TD>
			</TR>
		</TABLE>
		<!--
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
			<TBODY>
			<TR>
			<TD style="PADDING-RIGHT: 18px" height=30 align=right>
			<%
				if(pRegion == 0){
			%>
				<SPAN class=blue>전체보기</SPAN> &nbsp;I&nbsp;
			<%		
				}else{
			%>
				<a class=area href="reserve.jsp?menu=4">전체보기</a> &nbsp;I&nbsp;
			<%		
				}
					
				for(int i = 0; i < rList.size(); i++){ 
					if(pRegion == rList.get(i).getRegion_seq()){
			%>
					<SPAN class=blue><%=rList.get(i).getRegion_name()%></SPAN> &nbsp;I&nbsp;
			<%
					}else{
			%>
					<A class=area href="reserve.jsp?menu=4&region=<%=rList.get(i).getRegion_seq()%>"><%=rList.get(i).getRegion_name()%></A> &nbsp;I &nbsp;
			<% 
					}
				} 
			%>
			</TD></TR>
<%
if(pkList.size() > 0){
	int i = 0;
	int j = (int)Math.round((double)pkList.size()/2);
	for(int k = 0; k < j;k++){
%>
			<TR>
			<TD align=center>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width=669>
				<TBODY>
				<TR>
				<TD vAlign=top width=325>
<%
		if(i < pkList.size()){
%>
					<TABLE border=0 cellSpacing=0 cellPadding=0 width=325>
					<TBODY>
					<TR>
					<TD width=325 colSpan=2>
						<TABLE border=0 cellSpacing=1 cellPadding=3 width="100%" bgColor=#d1d3d4>
						<TBODY>
						<TR>
						<TD bgColor=white height=120 align=center>
							<TABLE cellSpacing=0 cellPadding=0 width=313>
							<TBODY>
							<TR>
							<TD bgColor=#f1f1f1 height=110 width=313 align=center><img src="/upload/<%=pkList.get(i).getImg_sub() %>" width="313" height="110"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
					<TR>
					<TD colSpan=2>&nbsp;</TD></TR>
					<TR>
					<TD class=cc_name colSpan=2><%=pkList.get(i).getPackage_name1() %></TD></TR>
					<TR>
					<TD width=225><SPAN class=mem_fee_b>회원가 : <%=commify(pkList.get(i).getOff_n_mon()) %>원 ~</SPAN></TD>
					<TD vAlign=bottom width=100 align=center><A href="detail.jsp?menu=4&pkSeq=<%=pkList.get(i).getPackage_seq() %>"><IMG border=0 align=absMiddle src="../../images/common/btn_regist_booking.gif" width=89 height=34></A></TD></TR>
					</TBODY>
					</TABLE>
<%
			i++;
		}
%>
				</TD>
				<TD width=19>&nbsp;</TD>
				<TD vAlign=top width=325>
<%
		if(i < pkList.size()){
%>
					<TABLE border=0 cellSpacing=0 cellPadding=0 width=325>
					<TBODY>
					<TR>
					<TD width=325 colSpan=2>
						<TABLE border=0 cellSpacing=1 cellPadding=3 width="100%" bgColor=#d1d3d4>
						<TBODY>
						<TR>
						<TD bgColor=white height=120 align=center>
						<img src="/upload/<%=pkList.get(i).getImg_sub() %>" width="313" height="110"></TD></TR></TBODY></TABLE></TD></TR>
					<TR>
					<TD colSpan=2>&nbsp;</TD></TR>
					<TR>
					<TD class=cc_name colSpan=2><%=pkList.get(i).getPackage_name1() %></TD></TR>
					<TR>
					<TD width=225><SPAN class=normal_fee_b><strike>정상가 : <%=commify(pkList.get(i).getOff_n_mon()) %>원 ~</strike></SPAN></TD>
					<TD vAlign=bottom rowSpan=2 width=100 align=center><A href="detail.jsp?menu=4&pkSeq=<%=pkList.get(i).getPackage_seq() %>"><IMG border=0 align=absMiddle src="../../images/common/btn_regist_booking.gif" width=89 height=34></A></TD></TR>
					<TR>
					<TD width=225><SPAN class=mem_fee_b>회원가 : <%=commify(pkList.get(i).getOff_s_mon()) %>원 ~</SPAN></TD></TR></TBODY>
					</TABLE>
<%
			i++;
		}
%>
				</TD></TR></TBODY></TABLE>
			</TD></TR>
		<TR><TD>&nbsp;</TD></TR>
<%
	}
}
%>
			</TBODY></TABLE>
			-->
			</TD></TR>
		<TR>
		<TD align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>