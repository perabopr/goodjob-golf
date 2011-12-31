<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.6.2.min.js"></script>
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
    <td class=title>★ 국내패키지 예약현황 ★</td>
  </tr>
  <tr>
    <td><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center" width="1851"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" height="25" align="center" width="125"><span class=normal_b>예약신청일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="61"><span class=normal_b>예약자</span></td>
          <td bgcolor="#e6e7e8" align="center" width="184"><span class=normal_b>아이디</span></td>
          <td width="197" align="center" bgcolor="#E6E7E8"><span class=normal_b>골프장(1순위)</span></td>
          <td bgcolor="#e6e7e8" align="center" width="191"><span class=normal_b>골프장(2순위)</span></td>
          <td bgcolor="#e6e7e8" align="center" width="56"><span class=normal_b>인원</span></td>
          <td width="95" align="center" bgcolor="#E6E7E8"><span class=normal_b>투어예정일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="106"><span class=normal_b>연락처</span></td>
          <td align="center" bgcolor="#e6e7e8" width="161"><span class=normal_b>예약금</span></td>
          <td width="160" align="center" bgcolor="#E6E7E8"><span class=normal_b>잔금</span></td>
          <td width="97" align="center" bgcolor="#E6E7E8"><span class=normal_b>요청사항</span></td>
          <td width="160" align="center" bgcolor="#E6E7E8"><span class=normal_b>처리상태</span></td>
          <td width="193" align="center" bgcolor="#E6E7E8"><span class=normal_b>SMS</span></td>
        </tr>
        <tr>
          <td bgcolor="white" align="center" height="45">2011-12-31 12:30</td>
          <td align="center" bgcolor="white">홍길동</td>
          <td align="center" bgcolor="white">abc@naver.com</td>
          <td align="center" bgcolor="white">레이크힐스</td>
          <td align="center" bgcolor="white">레이크힐스</td>
          <td align="center" bgcolor="white">3명</td>
          <td align="center" bgcolor="white">2011-12-31</td>
          <td align="center" bgcolor="white">011-123-4567</td>
          <td align="center" bgcolor="white"><table border="0" width="90%" cellpadding="0" cellspacing="0">
              <tr>
                <td width="90"><input name="price" type="text" size="10" value="100000" class="input_box"></td>
                <td width="40" align="center"><img align="absmiddle" src="../images/common/btn_edit.gif" width="28" height="16" border="0"></td>
              </tr>
              <tr>
                <td width="90">&nbsp;</td>
                <td width="40" align="center"><img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0"></td>
              </tr>
            </table></td>
          <td align="center" bgcolor="white"><table border="0" width="90%" cellpadding="0" cellspacing="0">
              <tr>
                <td width="90"><input name="price" type="text" size="10" value="100000" class="input_box"></td>
                <td width="40" align="center"><img align="absmiddle" src="../images/common/btn_edit.gif" width="28" height="16" border="0"></td>
              </tr>
              <tr>
                <td width="90">&nbsp;</td>
                <td width="40" align="center"><img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0"></td>
              </tr>
            </table></td>
          <td align="center" bgcolor="white"><a href="domestic_detail.html" onClick="NewWindow(this.href,'name','740','450','yes');return false;"><img align="absmiddle" src="../images/common/btn_detail.gif" width="75" height="22" border="0"></a></td>
          <td align="center" bgcolor="white"><select name="formselect1" size="1">
              <option selected>예약대기</option>
              <option>예약완료</option>
              <option>취소불가</option>
              <option>예약취소</option>
            </select>
            <img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0"></td>
          <td align="center" bgcolor="white"><img align="absmiddle" src="../images/common/btn_r_finished.gif" width="50" height="16" border="0"> &nbsp;<img align="absmiddle" src="../images/common/btn_cancel.gif" width="34" height="16" border="0"> &nbsp;<img align="absmiddle" src="../images/common/btn_tour_oneday.gif" width="59" height="16" border="0"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:50px;padding-bottom:40px;"><table border="0" cellpadding="0" cellspacing="0" width="50%">
        <tr>
          <td align="center"><p><img align="absmiddle" src="../images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="../images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <img align="absmiddle" src="../images/board/btn_next.gif" width="16" height="15" border="0"> <img align="absmiddle"
src="../images/board/btn_next_dual.gif"
width="16" height="15" border="0"></p></td>
        </tr>
        <tr>
          <td height="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="4" align="center"><select name="formselect1" size="1">
              <option>선택하세요</option>
              <option>골프장</option>
              <option>투어예정일</option>
              <option>예약자</option>
              <option>금액</option>
              <option>처리상태</option>
            </select>
            <input name="key" type="text" size="30" class="input_box">
            <input name="imagefield" type="image" src="../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>