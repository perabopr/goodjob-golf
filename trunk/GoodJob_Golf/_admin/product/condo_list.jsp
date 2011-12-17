<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.product.dto.RegionDto"%>
<%@page import="com.goodjob.product.dto.CondoDto"%>
<%
String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("1");

CondoDao cDao = new CondoDao();
List<CondoDto> arrCondo = cDao.getCondoSelect("");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../style.css">
<title></title>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="50%" class=title>★ 콘도 목록 ★</td>
    <td width="50%" align="right" style="padding-right:30px;"><select name="ddl_region" size="1">
        <option>전체지역보기</option>
<% 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
%>
        <option value="<%=arrRegions.get(i).getRegion_seq() %>"><%=arrRegions.get(i).getRegion_name() %></option>
<%
		}
	}
%>
      </select></td>
  </tr>
  <tr>
    <td align="center" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" colspan="2">
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
      <tr>
        <td bgcolor="#e6e7e8" align="center" height="25" width="230"><span class=list_title>지역</span></td>
        <td bgcolor="#e6e7e8" align="center" width="355"><span class=list_title>콘도명</span></td>
        <td bgcolor="#e6e7e8" align="center" width="501"><span class=list_title>위치</span></td>
         <!-- 
        <td bgcolor="#e6e7e8" align="center" width="237"><span class=list_title>주중가</span></td>
        <td align="center" bgcolor="#E6E7E8" width="260"><span class=list_title>주말가</span></td>
        -->
        <td align="center" bgcolor="#E6E7E8" width="268"></td>
      </tr>
<%
	for(int i = 0; i < arrCondo.size(); i++){
%>
      <tr>
        <td bgcolor="white" align="center" bgcolor="white"><%= arrCondo.get(i).getRegion_name() %></td>
        <td align="center" bgcolor="white"><span class=list_subject><%= arrCondo.get(i).getCondo_name() %></span></td>
        <td align="center" bgcolor="white"><%= arrCondo.get(i).getAddress1()%></td>
         <!-- 
        <td align="center" bgcolor="white">100,000원</td>
        <td align="center" bgcolor="white" span class=red>80,000원</td>
         -->
        <td align="center" bgcolor="white"><a href="condo_reg.jsp?condoSeq=<%= arrCondo.get(i).getCondo_seq() %>"><img src="../images/inc/btn_edit2.gif" width="74" height="26" border="0"></a></td>
      </tr>
<%
	}
%>
    </table>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center" height="100"><a href="condo_reg.jsp?condoSeq="><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0"></a></td>
  </tr>
</table>
</body>
</html>