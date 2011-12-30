<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menu = request.getParameter("menu");
String gcId = request.getParameter("gcId");
String golf = request.getParameter("golf");
String date = request.getParameter("date");
String cdate = request.getParameter("cdate");

String resName = request.getParameter("reserveName");
String uPhone = "";
uPhone += request.getParameter("phone1") + "-";
uPhone += request.getParameter("phone2") + "-";
uPhone += request.getParameter("phone3");
int perNum = 4;

GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
glrDto.setReserve_name(resName);
glrDto.setReserve_uid(user_Id);
glrDto.setPer_num(Integer.toString(perNum));
glrDto.setReserve_phone(uPhone);
glrDto.setProduct_price(100);
glrDto.setCoupon_price(0);
glrDto.setProcess_status("0");
glrDto.setCard_bill_num("");
glrDto.setProductsub_seq(Integer.parseInt(gcId));

GolfLinkDao glDao = new GolfLinkDao();
glDao.setGolfReserve(glrDto);
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