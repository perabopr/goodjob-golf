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
prDto.setMenu_seq(4);
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
<script language="javascript" type="text/javascript">
var frm = top.document.exefrm;
frm.target =  "_self"; 
frm.action = "result.jsp";
frm.submit();
</script>