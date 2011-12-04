<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%
String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../style.css">
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
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 실시간골프장 위약처리규정 ★</td>
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
              	<input class="input_box" size="55" id="" name="subject">
              </td>
              <td align="center" bgcolor="white">
              	<input class="input_box" size="55" name="subject">
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
                  <input class="input_box" size="55" name="subject">
                </td>
              <td align="center" bgcolor="white" width="50%">
              <input class="input_box" size="55" name="subject">
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
                  <input class="input_box" size="55" name="subject">
				</td>
              <td align="center" bgcolor="white" width="50%">
              <input class="input_box" size="55" name="subject">
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
                  <input class="input_box" size="55" name="subject">
			</td>
              <td align="center" bgcolor="white" width="50%">
              <input class="input_box" size="55" name="subject">
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
                  <input class="input_box" size="55" name="subject">
			</td>
              <td align="center" bgcolor="white" width="50%">
              <input class="input_box" size="55" name="subject">
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
              <textarea class="box03" rows="8" cols="113" name="content1"></textarea>
            </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:20px;padding-bottom:20px;"><img align="absmiddle" src="../../images/inc/btn_regist2.gif" width="74" height="26" border="0"></td>
  </tr>
</table>
</body>
</html>
