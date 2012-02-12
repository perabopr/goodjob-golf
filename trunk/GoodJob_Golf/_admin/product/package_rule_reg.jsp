<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.product.PackageDao"%>
<%@ page import="com.goodjob.product.dto.PackagePromiseDto"%>
<%
String menu = StringUtils.trimToEmpty(request.getParameter("menu"));
String pkSeq = StringUtils.trimToEmpty(request.getParameter("pkSeq"));

List<PackagePromiseDto> arrList = null;
PackagePromiseDto pkProList = new PackagePromiseDto();  
PackageDao pkDao = new PackageDao();
if(pkSeq.length() > 0){
	arrList = pkDao.getPackagePromiseSelect(Integer.parseInt(pkSeq));
	if(arrList != null && arrList.size() > 0){
		pkProList = arrList.get(0);
	}
}


String pageTitle = "";
if(menu.equals("3")){
	pageTitle = "★ 국내패키지 위약처리규정 ★";
}else{
	pageTitle = "★ 해외패키지 위약처리규정 ★";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../style.css">
<title></title>
<script language="JavaScript"> 
<!-- 
function NewWindow(mypage, myname, w, h, scroll) { 
var winl = (screen.width - w) / 2; 
var wint = (screen.height - h) / 2; 
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
win = window.open(mypage, myname, winprops) 
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
} 
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<FORM NAME="frm" METHOD="post" ACTION="package_rule_reg_ok.jsp" >
<input type="hidden" id="pkSeq" name="pkSeq" value="<%= pkSeq%>" />
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title><%= pageTitle %></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="900" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td bgcolor="#E6E7E8" align="right" style="padding-right:10px;" width="162"><span class=list_title>위약처리규정 1</span></td>
          <td width="712" bgcolor="white" style="padding-left:10px;"><table width="100%" cellpadding="2" cellspacing="1" bgcolor="silver">
              <tr>
                <td bgcolor="#FCF9EB" align=middle width="50%"><b>구분</b></td>
                <td bgcolor=#fcf9eb align=middle  할인요금 width="50%"><b>위약처리규정</b></td>
              </tr>
              <tr>
              <td align="center" bgcolor="white">
              	<input class="input_box" size="55" id="promise1_type" name="promise1_type" value="<%= pkProList.getPromise1_type()%>">
              </td>
              <td align="center" bgcolor="white">
              	<input class="input_box" size="55" id="promise1" name="promise1" value="<%= pkProList.getPromise1()%>">
              </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>위약처리규정 2</span></td>
          <td bgcolor="white" style="padding-left:10px;"><table width="100%" cellpadding="2" cellspacing="1" bgcolor="silver">
              <tr>
                <td bgcolor="#FCF9EB" align=middle width="50%"><b>구분</b></td>
                <td bgcolor=#fcf9eb align=middle  할인요금 width="50%"><b>위약처리규정</b></td>
              </tr>
              <tr>
              <td align="center" bgcolor="white" width="50%">
              	<input class="input_box" size="55" name="promise2_type" value="<%= pkProList.getPromise2_type()%>">
              </td>
              <td align="center" bgcolor="white" width="50%">
                <input class="input_box" size="55" name="promise2" value="<%= pkProList.getPromise2()%>">
              </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>위약처리규정 3</span></td>
          <td bgcolor="white" style="padding-left:10px;"><table width="100%" cellpadding="2" cellspacing="1" bgcolor="silver">
              <tr>
                <td bgcolor="#FCF9EB" align=middle width="50%"><b>구분</b></td>
                <td bgcolor=#fcf9eb align=middle  할인요금 width="50%"><b>위약처리규정</b></td>
              </tr>
              <tr>
              <td align="center" bgcolor="white" width="50%">
              	<input class="input_box" size="55" name="promise3_type" value="<%= pkProList.getPromise3_type()%>">
			  </td>
              <td align="center" bgcolor="white" width="50%">
                <input class="input_box" size="55" name="promise3" value="<%= pkProList.getPromise3()%>">
              </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>위약처리규정 4</span></td>
          <td bgcolor="white" style="padding-left:10px;"><table width="100%" cellpadding="2" cellspacing="1" bgcolor="silver">
              <tr>
                <td bgcolor="#FCF9EB" align=middle width="50%"><b>구분</b></td>
                <td bgcolor=#fcf9eb align=middle  할인요금 width="50%"><b>위약처리규정</b></td>
              </tr>
              <tr>
              <td align="center" bgcolor="white" width="50%">
              	<input class="input_box" size="55" name="promise4_type" value="<%= pkProList.getPromise4_type()%>">
			  </td>
              <td align="center" bgcolor="white" width="50%">
                <input class="input_box" size="55" name="promise4" value="<%= pkProList.getPromise4()%>">
              </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>위약처리규정 5</span></td>
          <td bgcolor="white" style="padding-left:10px;"><table width="100%" cellpadding="2" cellspacing="1" bgcolor="silver">
              <tr>
                <td bgcolor="#FCF9EB" align=middle width="50%"><b>구분</b></td>
                <td bgcolor=#fcf9eb align=middle  할인요금 width="50%"><b>위약처리규정</b></td>
              </tr>
              <tr>
              
              <td align="center" bgcolor="white" width="50%">
              	<input class="input_box" size="55" name="promise5_type" value="<%= pkProList.getPromise5_type()%>">
			  </td>
              <td align="center" bgcolor="white" width="50%">
                <input class="input_box" size="55" name="promise5" value="<%= pkProList.getPromise5()%>">
              </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="899" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="162"><span class=list_title>취소규정</span></td>
          <td bgcolor="white" style="padding-left:10px;" width="710">
            <textarea class="box03" rows="8" cols="113" id="cancelrule" name="cancelrule"><%= pkProList.getCancelrule() %></textarea>
          </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:20px;padding-bottom:20px;"><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0" onclick="frm.submit();"></td>
  </tr>
</table>
</FORM>
</body>
</html>
