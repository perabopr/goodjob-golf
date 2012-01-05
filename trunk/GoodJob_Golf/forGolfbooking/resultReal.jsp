<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int gcId = NumberUtils.toInt(request.getParameter("gcId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"),0);
int date = NumberUtils.toInt(request.getParameter("date"),0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"),0);

if(menu == 0 || gcId == 0 || golf == 0 || date == 0 || cdate == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=1'</script>");
	return;
}

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
glrDto.setProductsub_seq(gcId);

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