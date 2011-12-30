<%@page import="com.goodjob.reserve.dto.RegionDto"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.goodjob.reserve.dto.SearchDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.SearchDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ddlSearchRegion_tmp = StringUtils.trimToEmpty(request.getParameter("ddlSearchRegion"));
String ddlSearchMenu_tmp = StringUtils.trimToEmpty(request.getParameter("ddlSearchMenu"));
String txtSearchStartDate_tmp = StringUtils.trimToEmpty(request.getParameter("txtSearchStartDate"));
txtSearchStartDate_tmp = txtSearchStartDate_tmp.replace("-","");
String txtSearchEndDate_tmp = StringUtils.trimToEmpty(request.getParameter("txtSearchEndDate"));
txtSearchEndDate_tmp = txtSearchEndDate_tmp.replace("-","");

int totalCnt = 0;

SearchDao sDao = new SearchDao();
List<SearchDto> listSearch1 = null;
List<SearchDto> listSearch2 = null;
if(ddlSearchMenu_tmp.equals("") || ddlSearchMenu_tmp.equals("1")){
	listSearch1 = sDao.getSearch(ddlSearchRegion_tmp, "1", txtSearchStartDate_tmp, txtSearchEndDate_tmp);
	totalCnt += listSearch1.size(); 
}
if(ddlSearchMenu_tmp.equals("") || ddlSearchMenu_tmp.equals("2")){
	listSearch2 = sDao.getSearch(ddlSearchRegion_tmp, "2", txtSearchStartDate_tmp, txtSearchEndDate_tmp);
	totalCnt += listSearch2.size();
}

PackageDao listRegionDao2 = new PackageDao();
List<RegionDto> listRegion2 = listRegionDao2.getRegionList("1");

String searchWheres = "";

if(!ddlSearchRegion_tmp.equals("")){
	for(int i = 0; i < listRegion2.size();i++){	
		if(listRegion2.get(i).getRegion_seq() == Integer.parseInt(ddlSearchRegion_tmp)){
			searchWheres += "<span class=blue>" + listRegion2.get(i).getRegion_name() + "</span> ";
		}
	}
}
if(ddlSearchMenu_tmp.equals("1")){
	searchWheres += "<span class=blue>실시간 골프장</span> ";
}else if(ddlSearchMenu_tmp.equals("2")){
	searchWheres += "<span class=blue>사전 골프장</span> ";
}
%>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; <SPAN class=location_b>골프장 빠른검색</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>골프장 빠른검색</TD></TR>
<TR>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD>&nbsp;</TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=707>
<TBODY>
<TR>
<TD style="PADDING-LEFT: 10px">
<%=searchWheres %>예약가능한타임 총 검색수 : <SPAN class=orange><%=totalCnt %></SPAN>건
</TD></TR></TBODY></TABLE></TD></TR>
<% if(listSearch1 != null && listSearch1.size() > 0){ %>
<TR>
<TD align=center>&nbsp;</TD></TR>
<TR>
<TR>
<TD align="left"><b>- 실시간</b></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=706 bgColor=#d1d3d4>
<TBODY>
<TR>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=90 align=center>부킹날짜</TD>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=253 align=center>골프장명</TD>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=100 align=center>부킹시간</TD>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=100 align=center>코스</TD>
<TD class=normal_b bgColor=#f1f1f1 width=142 align=center>예약가능여부</TD></TR>
<%
	for(int i = 0;i < listSearch1.size();i++){
		String bookingDate = listSearch1.get(i).getProduct_date();
		bookingDate = bookingDate.substring(0,4)
				+ "-" + bookingDate.substring(4,6)
				+ "-" + bookingDate.substring(6,8);
		
		String bookingTime = listSearch1.get(i).getTime_start();
		bookingTime = bookingTime.substring(0,2) + ":" + bookingTime.substring(2,4);
%>
<TR>
<TD bgColor=white height=25 align=center><%=bookingDate %></TD>
<TD bgColor=white height=25 align=center><%=listSearch1.get(i).getGolflink_name() %></TD>
<TD bgColor=white height=25 align=center><%=bookingTime %></TD>
<TD bgColor=white height=25 align=center><%=listSearch1.get(i).getCourse_name() %></TD>
<TD bgColor=white align=center><A href="/forGolfbooking/detail.jsp?menu=1&golf=<%=listSearch1.get(i).getGolflink_seq() %>&date=<%=listSearch1.get(i).getProduct_date() %>&cdate=<%=listSearch1.get(i).getProduct_date() %>"><IMG border=0 align=absMiddle src="../../images/booking/btn_detail.gif" width=112 height=20></A></TD></TR>
<% 
	} 
%>
</TBODY></TABLE></TD></TR>
<% } %>
<% if(listSearch2 != null && listSearch2.size() > 0){ %>
<TR>
<TD align=center>&nbsp;</TD></TR>
<TR>
<TR>
<TD align="left"><b>- 사전</b></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=706 bgColor=#d1d3d4>
<TBODY>
<TR>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=90 align=center>부킹날짜</TD>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=253 align=center>골프장명</TD>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=100 align=center>부킹시간</TD>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=100 align=center>가능팀수</TD>
<TD class=normal_b bgColor=#f1f1f1 width=142 align=center>예약가능여부</TD></TR>
<%
	for(int i = 0;i < listSearch2.size();i++){
		String bookingDate = listSearch2.get(i).getProduct_date();
		bookingDate = bookingDate.substring(0,4)
				+ "-" + bookingDate.substring(4,6)
				+ "-" + bookingDate.substring(6,8);
		
		String bookingTime = "";
		String bookingSTime = listSearch2.get(i).getTime_start();
		String bookingETime = listSearch2.get(i).getTime_end();
		bookingTime = bookingSTime.substring(0,2) + ":" + bookingSTime.substring(2,4)
				+ " ~ "
				+ bookingETime.substring(0,2) + ":" + bookingETime.substring(2,4);
%>
<TR>
<TD bgColor=white height=25 align=center><%=bookingDate %></TD>
<TD bgColor=white height=25 align=center><%=listSearch2.get(i).getGolflink_name() %></TD>
<TD bgColor=white height=25 align=center><%=bookingTime %></TD>
<TD bgColor=white height=25 align=center>1타임</TD>
<TD bgColor=white align=center><A href="/forGolfbooking/detail.jsp?menu=2&golf=<%=listSearch2.get(i).getGolflink_seq() %>&date=<%=listSearch2.get(i).getProduct_date() %>&cdate=<%=listSearch2.get(i).getProduct_date() %>"><IMG border=0 align=absMiddle src="../../images/booking/btn_detail.gif" width=112 height=20></A></TD></TR>
<%
	}
%>
</TBODY></TABLE></TD></TR>
<% } %>
<TR>
<TD align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>