<%@page import="com.goodjob.reserve.dto.RegionDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%
	String curr_url = StringUtils.trimToEmpty(request.getRequestURI());

	String swf_param = "";
	if(curr_url.indexOf("/board/join_List.jsp")>-1){
		swf_param = "pageNum=5&sub=1";
	}
	else if(curr_url.indexOf("/forGolfbooking/")>-1){
		if(request.getParameter("menu")==null || "1".equals(request.getParameter("menu"))){
			swf_param = "pageNum=1&sub=1";
		}
		else if("2".equals(request.getParameter("menu"))){
			swf_param = "pageNum=1&sub=3";
		}
		else if("3".equals(request.getParameter("menu"))){
			swf_param = "pageNum=2&sub=1";
		}
		else if("5".equals(request.getParameter("menu"))){
			swf_param = "pageNum=3&sub=1";
		}
	}
	
	PackageDao listRegionDao = new PackageDao();
	List<RegionDto> listRegion = listRegionDao.getRegionList("1");

	String ddlSearchRegion = StringUtils.trimToEmpty(request.getParameter("ddlSearchRegion"));
	String ddlSearchMenu = StringUtils.trimToEmpty(request.getParameter("ddlSearchMenu"));
	String txtSearchStartDate = StringUtils.trimToEmpty(request.getParameter("txtSearchStartDate"));
	String txtSearchEndDate = StringUtils.trimToEmpty(request.getParameter("txtSearchEndDate"));
	
%><html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>Welcome to GoodJobGolf</title>
<link rel="stylesheet" href="/css/common.css" type="text/css">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<link rel="stylesheet" href="/css/jquery.ui.all.css">
<script src="/js/jquery-1.6.2.min.js"></script>
<script src="/js/jquery.ui.core.js"></script>
<script src="/js/jquery.ui.widget.js"></script>
<script src="/js/jquery.ui.datepicker.js"></script>
<script language="javascript" src="/js/flashObject.js"></script>
<script language="javascript" type="text/javascript">
$(function() {
	$( "#txtSearchStartDate" ).datepicker({dateFormat:'yy-mm-dd'});
	$( "#txtSearchEndDate" ).datepicker({dateFormat:'yy-mm-dd'});
});
	function logon_ok() {
		
		if(!$('#login_id').val()) {
			alert('아이디를 입력하시기 바랍니다.');
			$('#login_id').focus();
			return;
		}

		if(!$('#login_pwd').val()) {
			alert('비밀번호를 입력하시기 바랍니다.');
			$('#login_pwd').focus();
			return;
		} 
				
		var frm = document.forms["logonFrm"];
		frm.action = "/logon/logon.jsp";
		frm.submit();
   	}
//-->
</script>
</head>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" background="/images/bg_main.jpg">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" align="center"><table border="0" width="1000" cellpadding="0" cellspacing="0" align="center">
        <tr>
          <td width="100%">
          <table border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="146"><script>flashObject("/images/swf/navigation.swf","<%=swf_param%>","1000","146")</script></td>
              </tr>
              <tr>
                <td>
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td colspan="3" background="/images/common/img_top_bg.jpg" height="50" valign="top" width="1000" align="right">
                      	<FORM NAME="frmSearch" METHOD="post" ACTION="/forGolfbooking/search.jsp">
						<TABLE cellSpacing=0 cellPadding=0 width=751 bgColor=#052b48>
						<TBODY>
						<TR>
						<TD width=105><IMG alt="골프장 빠른검색" src="/images/common/img_search_title.gif" width=120 height=40></TD>
						<TD width=143 align=center><SELECT id="ddlSearchRegion" name="ddlSearchRegion">
						<OPTION selected value="">지역선택-------</OPTION> 
						<%
							for(int i = 0; i < listRegion.size();i++){
								String selected = "";
								if(ddlSearchRegion.equals(Integer.toString(listRegion.get(i).getRegion_seq()))){
									selected = "selected";
								}
						%>
						<OPTION value="<%=listRegion.get(i).getRegion_seq() %>" <%=selected %>><%=listRegion.get(i).getRegion_name() %></OPTION>
						<%
							}
						%></SELECT></TD>
						<TD width=175><SELECT id="ddlSearchMenu" name="ddlSearchMenu"> 
						<OPTION value="">항목선택-------------</OPTION> 
						<% if(ddlSearchMenu.equals("1")){ %>
						<OPTION value="1" selected>실시간부킹골프장</OPTION>
						<% }else{ %>
						<OPTION value="1">실시간부킹골프장</OPTION>
						<% } %> 
						<% if(ddlSearchMenu.equals("2")){ %>
						<OPTION value="2" selected>사전신청골프장</OPTION></SELECT></TD>
						<% }else{ %>
						<OPTION value="2">사전신청골프장</OPTION></SELECT></TD>
						<% } %> 
						<TD width=30 align=right><A href="#"><IMG src="/images/common/btn_calendar_left.gif" width=22 height=21></A></TD>
						<TD width=106 align=center><INPUT class=input_01 id="txtSearchStartDate" name="txtSearchStartDate" size=13 value="<%=txtSearchStartDate%>"></TD>
						<TD width=9><IMG src="/images/common/img_search_blank.gif" width=9 height=6></TD>
						<TD width=30 align=right><A href="#"><IMG src="/images/common/btn_calendar_right.gif" width=22 height=21></A></TD>
						<TD width=106 align=center><INPUT class=input_01 id="txtSearchEndDate" name="txtSearchEndDate" size=13 value="<%=txtSearchEndDate%>"></TD>
						<TD width=75><A href="javascript:;" onclick="frmSearch.submit();"><IMG border=0 src="/images/common/btn_top_search.gif"></A></TD></TR></TBODY>
						</TABLE>
						</FORM>
                      </td>
                    </tr>
                    <tr>
                      <td width="235" valign="top">
                        <table border="0" width="235" cellpadding="0" cellspacing="0">
                          <tr>
                            <td background="/images/img_leftmenu/img_left_bg.jpg" width="235">
<%
	if(curr_url.indexOf("/member_logon.jsp") == -1){
	
%>
                            <table border="0" cellpadding="0" cellspacing="0" width="235" bgcolor="#052B48">
                                <tr>
                                  <td width="235" align="center" valign="top">
                                  <jsp:include page="/include/logon_form.jsp" flush="true"/>
                                  </td>
                                </tr>
                              </table>
<%
	}
%>
                            </td>
                          </tr>
                          <tr>
                            <td height="10"></td>
                          </tr>
                          <tr>
                              <td bgcolor="#F7F5F6">
                                  <table border="0" width="235" cellpadding="0" cellspacing="0">
                                      <tr>
                                          <td width="235"><a href="#"><img src="/images/img_leftmenu/img_customer_center.gif" width="235" height="139" border="0"></a></td>
                                      </tr>
                                      <tr>
                                          <td><a href="/common/field_guide.jsp"><img src="/images/img_leftmenu/btn_user_guide.gif" width="235" height="86" border="0"></a></td>
                                      </tr>
                                      <tr>
                                          <td><a href="/board/faq_list.jsp"><img src="/images/img_leftmenu/btn_faq.gif" width="235" height="86" border="0"></a></td>
                                      </tr>
                                      <tr>
                                          <td><a href="#"><img src="/images/img_leftmenu/btn_event.gif" width="235" height="86" border="0"></a></td>
                                      </tr>
                                  </table>
                              </td>
                          </tr>
                        </table>
                      </td>
                      <td width="15" valign="top"></td>
                      <td width="750" valign="top">