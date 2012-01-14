<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.product.dto.RegionDto"%>
<%@ page import="com.goodjob.product.dto.PackageDto"%>
<%
String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));
int regionseq = NumberUtils.toInt(request.getParameter("region"),0);

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("2");

PackageDao pkDao = new PackageDao();
List<PackageDto> arrList = null;
arrList = pkDao.getPackageSelect(regionseq, 4, 0);
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
	location.href = "/_admin/product/package_foreign_list.jsp?menu=4&region=" + $("#ddl_region").val();
} 
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 해외패키지 목록 ★</td>
    <td width="50%" align="right" style="padding-right:30px;"><select id="ddl_region" name="ddl_region" size="1">
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
		<td bgcolor="#e6e7e8" align="center" width="142" height="25"><span class=list_title>지역</span></td>
		<td bgcolor="#e6e7e8" align="center" width="326"><span class=list_title>골프패키지명</span></td>
		<td bgcolor="#e6e7e8" align="center" width="399"><span class=list_title>위치</span></td>
	    <td width="259" align="center" bgcolor="#E6E7E8"><span class=list_title>위약처리규정입력 및 수정</span></td>
	    <td bgcolor="#e6e7e8" align="center" width="220"><span class=list_title>패키지수정</span></td>
	</tr>
<% 
	for(int i = 0; i < arrList.size();i++){		
%>
	<tr>
		<td bgcolor="white" align="center" bgcolor="white"><%= arrList.get(i).getRegion_name() %></td>
		<td align="center" bgcolor="white"><span class=list_subject><%= arrList.get(i).getPackage_name1() %></span></td>
		<td align="center" bgcolor="white"><%= arrList.get(i).getAddress1() %></td>
		<td align="center" bgcolor="white">
			<a href="package_rule_reg.jsp?menu=4&pkSeq=<%= arrList.get(i).getPackage_seq()%>"><img align="absmiddle" src="../images/inc/btn_input.gif" width="74" height="26" border="0"></a>
		</td>
		<td align="center" bgcolor="white">
		    <p><a href="package_foreign_reg.jsp?pkSeq=<%= arrList.get(i).getPackage_seq()%>"><img src="../images/inc/btn_edit2.gif" width="74" height="26" border="0"></a></p>
		</td>
	</tr>
<%
	}
%>
    </table>    
  </tr>
  <tr>
    <td colspan="2" align="center" height="100"><a href="package_foreign_reg.jsp?pkSeq="><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0"></a></td>
  </tr>
</table>
</body>
</html>