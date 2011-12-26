<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.dto.PackageReserveDto"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"),0);
String reserveName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String reservePhone = StringUtils.trimToEmpty(request.getParameter("phone1")) 
					+ "-" + StringUtils.trimToEmpty(request.getParameter("phone2"))
					+ "-" + StringUtils.trimToEmpty(request.getParameter("phone3"));
String reserveEMail = StringUtils.trimToEmpty(request.getParameter("eMail1"))
					+ "@" + StringUtils.trimToEmpty(request.getParameter("eMail2"));
String reserveDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String reserveTeam = StringUtils.trimToEmpty(request.getParameter("reserveTeam"));
String reservePerson = StringUtils.trimToEmpty(request.getParameter("reservePerson"));
String content = StringUtils.trimToEmpty(request.getParameter("content"));

PackageReserveDto prDto = new PackageReserveDto();
prDto.setMenu_seq(3);
prDto.setReserve_name(reserveName);
prDto.setReserve_uid(reserveEMail);
prDto.setTour_date(reserveDate);
prDto.setPer_num(reservePerson);
prDto.setReserve_phone(reservePhone);
prDto.setPackage_price(0);
prDto.setRequest_content(content);
prDto.setProcess_status("1");
prDto.setPackage_seq(pkSeq);

PackageDao pkDao = new PackageDao();
pkDao.setPackageReserve(prDto);

%>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>예약확인 및 결제</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>예약확인 및 결제</TD></TR>
<TR>
<TD>
<P>&nbsp;</P></TD></TR>
<TR>
<TD align=center><IMG border=0 src="../../images/booking/img_without_title.gif" width=640 height=108></TD></TR>
<TR>
<TD align=center>
<P><IMG border=0 src="../../images/booking/img_bank_number.gif" width=640 height=298></P></TD></TR>
<TR>
<TD height=100 align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>