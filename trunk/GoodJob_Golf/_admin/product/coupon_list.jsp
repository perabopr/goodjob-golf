<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.util.*" %>
<%
	String type = StringUtils.defaultIfEmpty(request.getParameter("type") , "on");
	String title = "";
	
	if("on".equals(type)){
		title = "★ 온라인 상품권 등록 ★";
	}
	else{
		title = "★ 오프라인 상품권 등록 ★";
	}
%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<title></title>
<script language="javascript">
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
    <td width="50%" class=title><%=title%></td>
    <td width="50%" align="right" style="padding-right:30px;">남은상품권 : <span class=orange>100장</span></td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="1242">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="1242">
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
                <tr>
        <td bgcolor="#e6e7e8" align="center" height="25" width="323"><span class=list_title>상품권 번호</span></td>
                    <td bgcolor="#e6e7e8" align="center" width="531"><span class=list_title>사용자 아이디</span></td>
                    <td align="center" bgcolor="#E6E7E8" width="372"><span class=list_title>사용자 아름</span></td>
                </tr>
                <tr>
        <td bgcolor="white" align="center" bgcolor="white" height="23" width="323">
        1234567890
      </td>
                    <td align="center" bgcolor="white" width="531">abc@goodjobgolf.com</td>
                    <td align="center" bgcolor="white" width="372">홍길동</td>
                </tr>
    </table>
    </td>
  </tr>
    <tr>
        <td colspan="2" align="center" width="0" height="50">
            <table border="0" cellpadding="0" cellspacing="0" width="80%" bgcolor="white">
                <tr>
                    <td width="50%" align="center">
                        <p><img align="absmiddle" src="/_admin/images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="/_admin/images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <img align="absmiddle" src="/_admin/images/board/btn_next.gif" width="16" height="15" border="0"> <img align="absmiddle"
src="/_admin/images/board/btn_next_dual.gif"
width="16" height="15" border="0"></p>
                    </td>
                    <td width="50%" align="center">
<select name="formselect1" size="1">
                                <option>선택</option>
                                <option value="1">이름</option>
                                <option value="2">아이디</option>
            </select>
<input class="input_01" type="text" size="20" name="day">
            <input name="imagefield" type="image" src="/_admin/images/board/bt_search.gif" border="0" width="43" height="19" align="absmiddle">

                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="1242" height="50" align="center" colspan="2">
<a href="coupon_input.jsp?type=<%=type%>" onClick="NewWindow(this.href,'name','400','300','no');return false;"><img align="absmiddle" src="/_admin/images/inc/btn_regist2.gif" width="74" height="26" border="0"></a></td>
    </tr>
</table>
</body>
</html>