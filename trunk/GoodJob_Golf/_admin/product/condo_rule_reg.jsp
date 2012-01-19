<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.product.CondoDao"%>
<%@ page import="com.goodjob.product.dto.CondoPromiseDto"%>
<%
String cdSeq = StringUtils.trimToEmpty(request.getParameter("condoSeq"));

List<CondoPromiseDto> arrList = null;
CondoPromiseDto cdProList = new CondoPromiseDto();  
CondoDao cdDao = new CondoDao();
if(cdSeq.length() > 0){
	arrList = cdDao.getCondoPromiseSelect(Integer.parseInt(cdSeq));
	if(arrList != null && arrList.size() > 0){
		cdProList = arrList.get(0);
	}
}


String pageTitle = "★ 콘도 위약처리규정 ★";
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
<FORM NAME="frm" METHOD="post" ACTION="condo_rule_reg_ok.jsp" >
<input type="hidden" id="cdSeq" name="cdSeq" value="<%= cdSeq%>" />
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
              	<input class="input_box" size="55" id="promise1" name="promise1" value="<%= cdProList.getPromise1()%>">
              </td>
              <td align="center" bgcolor="white">
              	<input class="input_box" size="55" id="promise1_type" name="promise1_type" value="<%= cdProList.getPromise1_type()%>">
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
                  <input class="input_box" size="55" name="promise2" value="<%= cdProList.getPromise2()%>">
                </td>
              <td align="center" bgcolor="white" width="50%">
              <input class="input_box" size="55" name="promise2_type" value="<%= cdProList.getPromise2_type()%>">
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
                  <input class="input_box" size="55" name="promise3" value="<%= cdProList.getPromise3()%>">
				</td>
              <td align="center" bgcolor="white" width="50%">
              <input class="input_box" size="55" name="promise3_type" value="<%= cdProList.getPromise3_type()%>">
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
                  <input class="input_box" size="55" name="promise4" value="<%= cdProList.getPromise4()%>">
			</td>
              <td align="center" bgcolor="white" width="50%">
              <input class="input_box" size="55" name="promise4_type" value="<%= cdProList.getPromise4_type()%>">
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
                  <input class="input_box" size="55" name="promise5" value="<%= cdProList.getPromise5()%>">
			</td>
              <td align="center" bgcolor="white" width="50%">
              <input class="input_box" size="55" name="promise5_type" value="<%= cdProList.getPromise5_type()%>">
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
              <textarea class="box03" rows="8" cols="113" id="cancelrule" name="cancelrule"><%= cdProList.getCancelrule() %></textarea>
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