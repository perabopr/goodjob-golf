<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.dto.PackageReserveDto"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"),0);
String packageName = StringUtils.trimToEmpty(request.getParameter("packageName"));
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
content = content.replaceAll("\r\n", "</br>");

PackageReserveDto prDto = new PackageReserveDto();
prDto.setMenu_seq(3);
prDto.setReserve_name(reserveName);
//prDto.setReserve_uid(reserveEMail);
prDto.setReserve_uid(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
prDto.setTour_date(reserveDate);
prDto.setPer_num(reservePerson);
prDto.setReserve_phone(reservePhone);
prDto.setPackage_price(0);
prDto.setRequest_content(content);
prDto.setProcess_status("0");
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
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프패키지 &gt; <SPAN class=location_b>국내골프패키지</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>국내골프패키지</TD></TR>
<TR>
<TD vAlign=top align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top></TD></TR>
<TR>
<TD align=center><IMG border=0 src="../images/package/img_domestic_regist_finishe.gif" width=640 height=108></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=600 bgColor="#d1d3d4" align=center>
<TBODY>
<TR>
<TD bgColor=#aed247 width=594 colSpan=2></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>패키지명</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><SPAN class=normal_b><%=packageName %></SPAN></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>예약자이름</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=reserveName %> </TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>핸드폰</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=reservePhone %> </TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>E-Mail</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=reserveEMail %></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>출발일</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=reserveDate %> </TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>인원</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white height=25><%=reserveTeam %>팀 <%=reservePerson %>인 </TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>요청사항</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=content %></TD></TR>
<TR>
<TD bgColor=#aed247 width=594 colSpan=2></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD style="PADDING-BOTTOM: 140px; PADDING-TOP: 40px" align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>