<%@page import="com.goodjob.product.dto.SiteDto"%>
<%@page import="com.goodjob.product.SiteDao"%>
<%@page import="com.goodjob.product.MenuViewSiteDao"%>
<%@page import="com.goodjob.product.dto.MenuViewSiteDto"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int menuseq =  NumberUtils.toInt(request.getParameter("menuseq"),0);
int serviceseq =  NumberUtils.toInt(request.getParameter("serviceseq"),0);

MenuViewSiteDto mvsDto = new MenuViewSiteDto();
mvsDto.setMenu_seq(menuseq);
mvsDto.setService_seq(serviceseq);

MenuViewSiteDao mvsDao = new MenuViewSiteDao();
List<MenuViewSiteDto> list = mvsDao.getMenuViewSiteList(mvsDto);

SiteDao sDao = new SiteDao();
List<SiteDto> siteList = sDao.getSiteList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>노출사이트</title>
<link rel="stylesheet" href="../../style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">
	function reg_submit() {
		if(!$("#ddlsite").val()){
			alert('사이트를 선택하세요.');
			$("#ddlsite").focus();
			return;
		}
		
		$("#actmode").val("ins");
		$("#siteseq").val($("#ddlsite").val());
		frm.submit();			
	}

	function del_submit(seq){
		if(confirm("삭제 하겠습니까?")){
			$("#actmode").val("del");
			$("#siteseq").val(seq);
			frm.submit();
		}
	}
</script>
</head>
<body>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="360">
	<tr>
		<td align="center" width="360" class=title>★ 노출 사이트 ★</td>
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	<tr>
		<td align="center">
		  	<table width="320" cellpadding="0" cellspacing="0" bgcolor="#D1D3D4">
		    <tr>
		    	<td bgcolor="white" width="279">
				<select id="ddlsite" name="ddlsite">
				<%for(int i = 0; i < siteList.size();i++){ %>
				<option value="<%=siteList.get(i).getSite_seq() %>"><%=siteList.get(i).getSite_name() %></option>
				<%} %>
				</select>
				</td>
		        <td align="center" bgcolor="white" width="60"><img align="absmiddle" src="../../images/inc/btn_plus.gif" width="32" height="16" border="0" onclick="reg_submit();return false;"></td>
		    </tr>
		    </table>
		</td>
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	<tr>
		<td align="center">
			<table width="320" cellpadding="0" cellspacing="0">
			<%
				for(int i = 0; i < list.size();i++){
			%>
			<tr>
				<td><%= list.get(i).getSite_name()%></td>
				<td align="right">
				<a href="javascript:del_submit('<%= list.get(i).getSite_seq()%>');"><img align="absmiddle" src="../../images/inc/btn_del.gif" width="13" height="14" border="0">	</a>
				</td>
			</tr>
			<%
				}
			%>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><img align="absmiddle" src="../../images/common/btn_close.gif"  border="0" onclick="self.close();"></td>
	</tr>
	</table>
<form NAME="frm" METHOD="post" ACTION="pop_menuviewsite_ok.jsp">
<input type="hidden" id="actmode" name="actmode" value="" />
<input type="hidden" id="menuseq" name="menuseq" value="<%=menuseq %>" />
<input type="hidden" id="serviceseq" name="serviceseq" value="<%=serviceseq %>" />
<input type="hidden" id="siteseq" name="siteseq" value="" />
</form>
</body>
</html>