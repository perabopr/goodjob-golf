<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<html>
<head>
<link rel="stylesheet" href="../../style.css">
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
    <td class=title>★ 회원가입현황 ★</td>
  </tr>
  <tr>
    <td align="center" width="1852">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" width="1852"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" height="25" align="center" width="235"><span class=normal_b>회원가입일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="241"><span class=normal_b>회원명</span></td>
          <td bgcolor="#e6e7e8" align="center" width="429"><span class=normal_b>아이디</span></td>
          <td width="280" align="center" bgcolor="#E6E7E8"><span class=normal_b>연락처</span></td>
          <td bgcolor="#e6e7e8" align="center" width="358"><span class=normal_b>회원가입상태</span></td>
          <td bgcolor="#e6e7e8" align="center" width="278">&nbsp;</td>
        </tr>
        <tr>
          <td bgcolor="white" align="center" height="25">2011-12-31 12:30</td>
          <td align="center" bgcolor="white">홍길동</td>
          <td align="center" bgcolor="white">abc@naver.com</td>
          <td align="center" bgcolor="white">010-123-4567 </td>
          <td align="center" bgcolor="white"><select name="formselect1" size="1">
              <option>무료회원</option>
              <option>유료회원(1년)</option>
              <option>유료회원(2년)</option>
            </select>
            <img align="absmiddle" src="../../images/common/btn_save2.gif" width="32" height="16" border="0"></td>
          <td align="center" bgcolor="white"><a href="mem_detail.html" onClick="NewWindow(this.href,'name','740','520','yes');return false;"><img align="absmiddle" src="../../images/common/btn_detail.gif" width="75" height="22" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:50px;padding-bottom:40px;"><table border="0" cellpadding="0" cellspacing="0" width="50%">
        <tr>
          <td align="center"><p><img align="absmiddle" src="../../images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="../../images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <img align="absmiddle" src="../../images/board/btn_next.gif" width="16" height="15" border="0"> <img align="absmiddle"
src="../../images/board/btn_next_dual.gif"
width="16" height="15" border="0"></p></td>
        </tr>
        <tr>
          <td height="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="4" align="center"><select name="formselect1" size="1">
              <option>선택하세요</option>
              <option>가입일</option>
              <option>회원명</option>
              <option>아이디</option>
              <option>회원가입상태</option>
            </select>
            <input name="key" type="text" size="30" class="input_box">
            <input name="imagefield" type="image" src="../../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>