<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.reserve.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.reserve.dto.RegionDto"%>
<%
String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("1");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/jquery.ui.all.css">
<script src="../js/jquery-1.6.2.min.js"></script>
<script src="../js/jquery.ui.core.js"></script>
<script src="../js/jquery.ui.widget.js"></script>
<script src="../js/jquery.ui.datepicker.js"></script>
<link rel="stylesheet" href="../css/demos.css">
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

$(function() {
	$( "#saleDateStart" ).datepicker({dateFormat:'yy-mm-dd'});
});
$(function() {
	$( "#saleDateEnd" ).datepicker({dateFormat:'yy-mm-dd'});
});
$(function() {
	$( "#ReserveDateStart" ).datepicker({dateFormat:'yy-mm-dd'});
});
$(function() {
	$( "#ReserveDateEnd" ).datepicker({dateFormat:'yy-mm-dd'});
});

//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 콘도 등록 ★</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="900" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td bgcolor="#E6E7E8" align="right" style="padding-right:10px;" width="162"><span class=list_title>콘도명</span></td>
          <td width="712" bgcolor="white" style="padding-left:10px;"><input class="input_box" size="40" name="subject"></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>지역선택</span></td>
          <td bgcolor="white" style="padding-left:10px;"><select name="ddl_region" size="1">
              <option>선택하세요</option>
<% 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
%>
        <option value="<%=arrRegions.get(i).getRegion_seq() %>"><%=arrRegions.get(i).getRegion_name() %></option>
<%
		}
	}
%>
            </select></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>할인기간</span></td>
          <td bgcolor="white" style="padding-left:10px;"><img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
            <input class="input_box" size="13" id="saleDateStart" name="saleDateStart" readonly>
            ~ <img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
            <input class="input_box" size="13" id="saleDateEnd" name="saleDateEnd" readonly></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>목록이미지</span></td>
          <td bgcolor="white" style="padding-left:10px;"><input class="upload" name="image1" type="file" size="55">
            (313x110) </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>주소</span></td>
          <td bgcolor="white" style="padding-left:10px;"><table border="0" width="80%" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" width="572"><input class="input_box" size="80" name="subject"></td>
              </tr>
              <tr>
                <td colspan="2" height="2" width="572"></td>
              </tr>
              <tr>
                <td width="495"><input class="input_box" size="80" name="subject"></td>
                <td width="77"><a href="../inc/zip.html" onClick="NewWindow(this.href,'name','420','400','yes');return false;"><img align="absmiddle" src="../images/inc/btn_search.gif" width="45" height="22" border="0"></a></td>
              </tr>
              <tr>
                <td colspan="2" height="2" width="572"></td>
              </tr>
              <tr>
                <td colspan="2" width="572"><a href="../inc/naver_map.html" onClick="NewWindow(this.href,'name','420','400','yes');return false;"><img align="absmiddle" src="../images/inc/btn_search_xy.gif" width="65" height="22" border="0"></a> &nbsp;&nbsp;X&nbsp;
                  <input class="input_box" size="20" name="subject">
                  &nbsp;&nbsp;Y&nbsp;
                  <input class="input_box" size="20" name="subject"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>노출여부</span></td>
          <td bgcolor="white" style="padding-left:10px;"> 노출함
            <input type="radio" name="formradio3">
            &nbsp;&nbsp;노출안함
            <input type="radio" name="formradio4" checked></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="900">
        <tr>
          <td width="50%" height="30"><span class=list_title>가격입력</span></td>
          <td width="50%" align="right"><img align="absmiddle" src="../images/inc/btn_plus.gif" width="32" height="16" border="0"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center"><table width="900" cellpadding="2" cellspacing="1" bgcolor="silver">
        <tr>
          <td bgcolor="#FCF9EB" align=middle width="340"><p><img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
              <input class="input_box" size="13" id="ReserveDateStart" name="ReserveDateStart" readonly>
              ~ <img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
              <input class="input_box" size="13" id="ReserveDateEnd" name="ReserveDateEnd" readonly>
            </p></td>
          <td width="307" align="center" bgcolor="#FCF9EB" colspan="3"><b>정상가</b></td>
          <td bgcolor=#fcf9eb colspan="3" align=middle  할인요금 width="271"><b>할인가</b></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FCF9EB" width="340"><b>객실타입 및 평형</b></td>
          <td width="86" align="center" bgcolor="#FCF9EB">주중</td>
          <td bgcolor=#fcf9eb align=middle 주중 width="95">주말</td>
          <td bgcolor=#fcf9eb align=middle 주말 width="91">휴일</td>
          <td bgcolor=#fcf9eb align=middle 주중 width="89">주중</td>
          <td align="center" bgcolor="#FCF9EB" width="88">주말</td>
          <td bgcolor=#fcf9eb align=middle 주말 width="84">휴일</td>
        </tr>
        <tr>
          <td height="11" align="center" bgcolor="white"><input class="input_box" size="55" name="subject"></td>
          <td height="11" align="center" bgcolor="white"><input class="input_box" size="10" name="subject"></td>
          <td height="22" align="center" bgcolor="white"><input class="input_box" size="10" name="subject"></td>
          <td height="22" align="center" bgcolor="white"><input class="input_box" size="10" name="subject"></td>
          <td height="22" align="center" bgcolor="white"><input class="input_box" size="10" name="subject"></td>
          <td height="22" align="center" bgcolor="white"><input class="input_box" size="10" name="subject"></td>
          <td height="22" align="center" bgcolor="white"><input class="input_box" size="10" name="subject"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="899" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="162"><span class=list_title>콘도안내</span></td>
          <td bgcolor="white" style="padding-left:10px;" width="710"><textarea class="box03" rows="6" cols="113" name="content1"></textarea></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>상세정보</span></td>
          <td bgcolor="white" style="padding-left:10px;"><textarea class="box03" rows="6" cols="113" name="content1"></textarea></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>사진갤러리</span></td>
          <td bgcolor="white" style="padding-left:10px;"><p>
              <input class="upload" name="image1" type="file" size="55">
              <img align="absmiddle" src="../images/inc/btn_plus.gif" width="32" height="16" border="0"></p></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>오시는길</span></td>
          <td bgcolor="white" style="padding-left:10px;"><textarea class="box03" rows="8" cols="113" name="content1"></textarea></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:20px;padding-bottom:20px;"><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0"></td>
  </tr>
</table>
</body>
</html>
