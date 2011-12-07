<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%
	
	
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>Welcome to GoodJobGolf</title>
<link rel="stylesheet" href="/css/common.css" type="text/css">
<script src="/js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script language="javascript" src="/js/flashObject.js"></script>
</head>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" background="/images/bg_main.jpg">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" align="center"><table border="0" width="1000" cellpadding="0" cellspacing="0" align="center">
        <tr>
          <td width="1000"><table border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="146"><script>flashObject("/images/swf/navigation.swf","","1000","146")</script></td>
              </tr>
              <tr>
                <td>
                <table border="0" width="1000" cellpadding="0" cellspacing="0">
                    <tr>
                      <td colspan="3" background="/images/common/img_top_bg.jpg" height="50" valign="top" width="1000" align="right">
                      	<table cellpadding="0" cellspacing="0" width="749" bgcolor="#052B48">
                          <tr>
                            <td width="120"><img src="/images/common/img_search_title.gif" width="120" height="40" alt="골프장 빠른검색"></td>
                            <td align="center" width="180"><select name="number"  onchange="f_select(this.selectedIndex);">
                                <option value="">지역선택------------</option>
                                <option value="1">전체보기</option>
                                <option value="2">수도권</option>
                                <option value="3">강원권</option>
                                <option value="4">충청권</option>
                                <option value="5">전라권</option>
                                <option value="6">제주권</option>
                              </select></td>
                            <td width="175"><select name="number"  onchange="f_select(this.selectedIndex);">
                                <option value="">항목선택-------------</option>
                                <option value="1">전체보기</option>
                                <option value="2">실시간부킹 골프장</option>
                                <option value="3">사전신청 골프장</option>
                                <option value="4">국내패키지</option>
                                <option value="5">해외패키지</option>
                              </select></td>
                            <td width="198"><input class="input_01" type="text" size="28" name="day">
                            <td width="76"><input type="image" name="formimage1" src="/images/common/btn_top_search.gif" width="52" height="22"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td width="235" valign="top">
                        <table border="0" width="235" cellpadding="0" cellspacing="0">
                          <tr>
                            <td background="/images/img_leftmenu/img_left_bg.jpg" width="235">
<%
	String current_url = StringUtils.trimToEmpty(request.getRequestURI());
	if(current_url.indexOf("/member/") == -1){
	
%>
                            <table border="0" cellpadding="0" cellspacing="0" width="235" bgcolor="#052B48">
                                <tr>
                                  <td width="235" height="146" align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="235">
                                      <tr>
                                        <td><img src="/images/img_leftmenu/img_login_title.gif" width="235" height="49" border="0"></td>
                                      </tr>
                                      <tr>
                                        <td align="center">
                                        <%@ include file="/include/logon_form.jsp" %>
                                         </td>
                                      </tr>
                                    </table>
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
                                          <td><a href="#"><img src="/images/img_leftmenu/btn_user_guide.gif" width="235" height="86" border="0"></a></td>
                                      </tr>
                                      <tr>
                                          <td><a href="sub/board/faq_list.html"><img src="/images/img_leftmenu/btn_faq.gif" width="235" height="86" border="0"></a></td>
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