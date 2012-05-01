<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.product.dto.SiteDto"%>
<%@page import="com.goodjob.product.SiteDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%
SiteDao sDao = new SiteDao();
List<SiteDto> list = sDao.getSiteAllList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript">
function selectitem(id){	
	$("#btnIns").hide();	
	$("#btnUpd").show();
	$("#siteseq").val(id);
	$("#txtSitename").val($("#txtsizename"+id).val());
	$("#txtPhonenum").val($("#txtphonenum"+id).val());
	$("#ddlUseyn").val($("#txtuseyn"+id).val());
}

function sizeReset(){
	$("#btnIns").show();	
	$("#btnUpd").hide();
	$("#txtSitename").val("");
	$("#txtPhonenum").val("");
	$("#ddlUseyn").val("Y");
}

function sizeAdd(){
	$("#mode").val("add");
	frm.submit();
}

function sizeModify(){
	$("#mode").val("mod");
	frm.submit();	
}
</script>
</head>
<body>
<form id="frm" name="frm" METHOD="post" ACTION="site_ok.jsp">
<table border="0" cellpadding="2" cellspacing="1" bgcolor="silver">
<tr>
<td colspan="4" bgcolor="white">상호 관리</td>
</tr>
<tr>
<td colspan="4" align="right" bgcolor="white">
	<input type="hidden" id="mode" name="mode" value="">
	<input type="hidden" id="siteseq" name="siteseq" value="">
	<input type="button" id="btnIns" name="btnIns"  value="추가" onclick="sizeAdd();">
	<input type="button" id="btnUpd" name="btnUpd"  value="수정" onclick="sizeModify();" style="display:none">
	<input type="button" id="btnRes" name="btnRes"  value="초기화" onclick="sizeReset();">
</td>
</tr>
<tr>
<td colspan="4">&nbsp;</td>
</tr>
<tr>
<td bgcolor="white">상호명</td>
<td colspan="3" bgcolor="white"><input type="text" id="txtSitename" name="txtSitename" value="" ></td>
</tr>
<tr>
<td bgcolor="white">전화번호</td>
<td bgcolor="white"><input type="text" id="txtPhonenum" name="txtPhonenum" value="" maxlength="13"></td>
<td bgcolor="white">사용여부</td>
<td bgcolor="white">
	<select id="ddlUseyn" name="ddlUseyn" >
	<option value="Y">사용</option>
	<option value="N">미사용</option>
	</select>
</td>
</tr>
<tr>
<td  colspan="4" bgcolor="white">&nbsp;</td>
</tr>
<tr>
<td bgcolor="#e6e7e8">선택</td>
<td bgcolor="#e6e7e8">상호명</td>
<td bgcolor="#e6e7e8">전화번호</td>
<td bgcolor="#e6e7e8">사용여부</td>
</tr>
<% 
	for(int i = 0; i < list.size();i++){
%>
<tr>
<td bgcolor="white"><input type="button" onclick="selectitem('<%=list.get(i).getSite_seq()%>')" value="선택"></td>
<td bgcolor="white"><%=list.get(i).getSite_name() %><input type="hidden" id="txtsizename<%=list.get(i).getSite_seq() %>" value="<%=list.get(i).getSite_name()%>"></td>
<td bgcolor="white"><%=list.get(i).getPhone_num() %><input type="hidden" id="txtphonenum<%=list.get(i).getSite_seq() %>" value="<%=list.get(i).getPhone_num()%>"></td>
<td bgcolor="white"><%=list.get(i).getUse_yn().equals("Y")?"사용":"미사용" %><input type="hidden" id="txtuseyn<%=list.get(i).getSite_seq() %>" value="<%=list.get(i).getUse_yn()%>"></td>
</tr>
<% } %>
</table>
</form>
</body>
</html>