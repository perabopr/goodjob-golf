<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menu = "2";
String psId = StringUtils.trimToEmpty(request.getParameter("psId"));
String golf = StringUtils.trimToEmpty(request.getParameter("golf"));
String date = StringUtils.trimToEmpty(request.getParameter("date"));
String cdate = StringUtils.trimToEmpty(request.getParameter("cdate"));
String rCnt = StringUtils.trimToEmpty(request.getParameter("reserveCnt"));
String rTeam = StringUtils.trimToEmpty(request.getParameter("reserveTeam"));
String rDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String rTime = StringUtils.trimToEmpty(request.getParameter("reserveTime"));
String rName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String rPhone = StringUtils.trimToEmpty(request.getParameter("reservePhone"));
String rEmail = StringUtils.trimToEmpty(request.getParameter("reserveEmail"));
String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> prList = glDao.getGolfProduct(Integer.parseInt(psId));

if(prList.size() != 1){
	out.print("<script>alert('잘못된 접근입니다.'');location.href='/forGolfbooking/reserve.jsp?menu=2';</script>");
}else{
	if(prList.get(0).getProduct_status().equals("0")){
		GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
		glrDto.setReserve_name(rName);
		glrDto.setReserve_uid(rEmail);
		glrDto.setPer_num(rCnt);
		glrDto.setReserve_phone(rPhone);
		glrDto.setProduct_price(prList.get(0).getGoodjob_price()*Integer.parseInt(rCnt));
		glrDto.setCoupon_price(0);
		glrDto.setProcess_status("0");
		glrDto.setCard_bill_num("");
		glrDto.setProductsub_seq(Integer.parseInt(psId));
		
		glDao.setGolfReserve(glrDto);
		
	}else{
		out.print("<script>alert('예약할 수 없습니다.');location.href='/forGolfbooking/reserve.jsp?menu=2';</script>");		
	}
}
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