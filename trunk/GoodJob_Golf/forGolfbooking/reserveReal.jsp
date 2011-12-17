<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int menuNum = Integer.parseInt(menuName);

String nowDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());

Calendar incDate = Calendar.getInstance();
%>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=751><TBODY>
<TR>
<TD width=751>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2>
<TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>실시간예약</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>실시간예약</TD></TR>
<TR>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=40 align=right>
<P><A href="#"><IMG border=0 align=absMiddle src="../../images/booking/btn_2week_later.gif" width=100 height=22></A></P></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=707 bgColor=#d1d3d4>
<TBODY>
<TR>
<TD bgColor=#f1f1f1 height=35 width=212 align=center><SPAN class=normal_s>실시간예약 골프장명</SPAN></TD>
<% 
for (int i = 1; i < 15 ;i++){
	int incYear = incDate.get(incDate.YEAR);
	int incMonth = incDate.get(incDate.MONTH)+1;
	int incDay = incDate.get(incDate.DATE);
	
	int incWeek = incDate.get(incDate.DAY_OF_WEEK);
	String weekImg = "";
	switch(incWeek)
	{
		case 1:
			weekImg = "img_monday.gif";
			break;
		case 2:
			weekImg = "img_tuesday.gif";
			break;
		case 3:
			weekImg = "img_wednesday.gif";
			break;
		case 4:
			weekImg = "img_thursday.gif";
			break;
		case 5:
			weekImg = "img_friday.gif";
			break;
		case 6:
			weekImg = "img_saturday.gif";
			break;
		case 7:
			weekImg = "img_sunday.gif";
			break;
		default:
			break;
	}
	incDate.add(incDate.DATE, 1);
%>
<TD bgColor=#f1f1f1 width=30 align=center>
<SPAN class=day><%=Integer.toString(incMonth)+"/"+Integer.toString(incDay)%><BR></SPAN>
<IMG border=0 align=absMiddle src="../../images/booking/<%=weekImg%>" width=20 height=16>
</TD>
<% 
} 
%>
<TR>
<TD style="PADDING-LEFT: 5px" bgColor=white height=30><SPAN class=normal_s><A href="booking_realtime.html">골프장명</A></SPAN></TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22></TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22></TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22></TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD>
<TD bgColor=white height=30 align=center><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22></TD>
<TD bgColor=white height=30 align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>