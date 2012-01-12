<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.dto.RegionDto"%>
<%@ page import="com.goodjob.product.dto.GolfLinkDto"%>
<%@page import="com.goodjob.product.dto.GolfLinkCourseDto"%>
<%@ page import="com.goodjob.product.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
int regionseq = NumberUtils.toInt(request.getParameter("region"),0);

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("1");
String mainTitle = "";
String pageName = "";

mainTitle = "★ 사전 골프장목록 ★";
pageName = "사전";

GolfLinkDao dld = new GolfLinkDao();
List<GolfLinkDto> arrGolfLink = null;
arrGolfLink = dld.getGolfLinkList(2, regionseq);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../style.css">
<title></title>
<script type="text/javascript" src="/js/jquery-1.6.2.min.js"></script>
<script language="JavaScript"> 
<!-- 
function NewWindow(mypage, myname, w, h, scroll) { 
var winl = (screen.width - w) / 2; 
var wint = (screen.height - h) / 2; 
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
win = window.open(mypage, myname, winprops) 
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
} 

function searchRegion(){
	location.href = "/_admin/product/pre_list.jsp?menu=2&region=" + $("#ddl_region").val();
} 
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title><%= mainTitle%></td>
    <td align="right" style="padding-right:30px;"><select id="ddl_region" name="ddl_region" size="1">
        <option>전체지역보기</option>
<% 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
%>
        <option value="<%=arrRegions.get(i).getRegion_seq() %>" <%= regionseq == arrRegions.get(i).getRegion_seq()? "SELECTED":"" %>><%=arrRegions.get(i).getRegion_name() %></option>
<%
		}
	}
%>
      </select> <img align="absmiddle" src="../images/inc/btn_search2.gif" width="45" height="22" border="0" onclick="searchRegion();return false;" style="cursor:pointer"></td>
  </tr>
  <tr>
    <td align="center" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" colspan="2">
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
	<tr>
	    <td bgcolor="#e6e7e8" align="center" height="25" width="176"><span class=list_title>지역</span></td>
	    <td bgcolor="#e6e7e8" align="center" width="236"><span class=list_title>골프장명</span></td>
	    <td bgcolor="#e6e7e8" align="center" width="293"><span class=list_title>주소</span></td>
	    <td bgcolor="#e6e7e8" align="center" width="159"><span class=list_title>운영방식</span></td>
	    <td width="233" align="center" bgcolor="#E6E7E8"><span class=list_title>시간 및 가격입력</span></td>
	    <td align="center" bgcolor="#E6E7E8" width="248"><span class=list_title>위약처리규정입력 및 수정</span></td>
	    <td align="center" bgcolor="#E6E7E8" width="216"><span class=list_title>골프장 정보</span></td>
	</tr>
	<% 
	if(arrGolfLink.size() > 0){
		for(int i = 0; i < arrGolfLink.size();i++){
	%>
	
	<tr>
	    <td bgcolor="white" align="center" bgcolor="white"><%= arrGolfLink.get(i).getRegion_name()%></td>
		<td align="center" bgcolor="white"><span class=list_subject><%= arrGolfLink.get(i).getGolflink_name()%></span></td>
		<td align="center" bgcolor="white"><%= arrGolfLink.get(i).getGolflink_address1()%></td>
		<td align="center" bgcolor="white"><%= pageName %></td>
		<td align="center" bgcolor="white"><a href="/_admin/product/popup/pop_pre_time_reg.jsp?glseq=<%=arrGolfLink.get(i).getGolflink_seq()%>" onClick="NewWindow(this.href,'name','820','520','yes');return false;"><img src="../images/inc/btn_input.gif" width="74" height="26" border="0"></a></td>
        <td align="center" bgcolor="white"><a href="pre_rule_reg.jsp?menu=<%=arrGolfLink.get(i).getMenu_seq() %>&glseq=<%=arrGolfLink.get(i).getGolflink_seq()%>"><img src="../images/inc/btn_input.gif" width="74" height="26" border="0"></a></td>
        <td align="center" bgcolor="white"><a href="pre_reg.jsp?menu=<%=arrGolfLink.get(i).getMenu_seq() %>&glseq=<%=arrGolfLink.get(i).getGolflink_seq()%>"><img src="../images/inc/btn_edit2.gif" width="74" height="26" border="0"></a></td>
    </tr>
    <%
		}
   	}
    %>
    </table>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center" height="100"><a href="pre_reg.jsp"><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0"></a></td>
  </tr>
</table>
</body>
</html>
