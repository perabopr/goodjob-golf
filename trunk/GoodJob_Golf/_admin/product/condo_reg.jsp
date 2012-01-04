<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.product.dto.RegionDto"%>
<%@ page import="com.goodjob.product.dto.CondoRoomDto"%>
<%@ page import="com.goodjob.product.dto.CondoGalleryDto"%>
<%@ page import="com.goodjob.product.dto.CondoDto"%>
<%
String condoSeq = StringUtils.trimToEmpty(request.getParameter("condoSeq"));

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("1");

CondoDao cDao = new CondoDao();
List<CondoDto> arrlist = null;
CondoDto vcDto = new CondoDto();
List<CondoGalleryDto> arrlist2 = null;
List<CondoRoomDto> arrlist3 = null;
if(condoSeq.length() > 0){
	arrlist = cDao.getCondoSelect("AND a.condo_seq = '" + condoSeq + "'");
	if(arrlist.size() == 1){
		vcDto = arrlist.get(0); 
		arrlist2 = cDao.getCondoGallerySelect(vcDto.getCondo_seq());		
		arrlist3 = cDao.getCondoRoomSelect(vcDto.getCondo_seq());
	}
}
%>
<html>
<head>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/jquery.ui.all.css">
<script src="../js/jquery-1.6.2.min.js"></script>
<script src="../js/jquery.ui.core.js"></script>
<script src="../js/jquery.ui.widget.js"></script>
<script src="../js/jquery.ui.datepicker.js"></script>
<title></title>
<script type="text/javascript" src="/js/highgardenEditor.js"></script>
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

var galleryCnt = 0;
function addgallery(){
	galleryCnt++;
	var strgallery = "<tr id='trgallery"+galleryCnt+"'><td><input type='hidden' name='condoimgseq' >"
		+ "<input class='upload' name='imggallery' type='file' size='55'>"
		+ "<img align='absmiddle' src='../images/inc/btn_del.gif' width='13' height='14' border='0' onclick='delgallery("+galleryCnt+")'>"
		+ "</td></tr>";
	$("#tbGallery").append(strgallery);
}

function delgallery(obje){
	$("#trgallery"+obje).remove();
}

function condoReg(){
	frm.submit();
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<FORM NAME="frm" METHOD="post" ACTION="condo_reg_ok.jsp"  enctype="multipart/form-data">
<input type="hidden" id="condoSeq" name="condoSeq" value="<%= condoSeq%>" />
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
          <td width="712" bgcolor="white" style="padding-left:10px;"><input class="input_box" size="40" id="condoname" name="condoname" value="<%= vcDto.getCondo_name() %>"></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>지역선택</span></td>
          <td bgcolor="white" style="padding-left:10px;"><select name="ddl_region" size="1">
              <option>선택하세요</option>
<% 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
			if(vcDto.getRegion_seq() == arrRegions.get(i).getRegion_seq()){
%>
	        <option value="<%=arrRegions.get(i).getRegion_seq() %>" selected><%=arrRegions.get(i).getRegion_name() %></option>
<%
			}else{
%>
	        <option value="<%=arrRegions.get(i).getRegion_seq() %>"><%=arrRegions.get(i).getRegion_name() %></option>
<%
			}
		}
	}
%>
            </select></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>할인기간</span></td>
          <td bgcolor="white" style="padding-left:10px;"><img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
            <input class="input_box" size="13" id="saleDateStart" name="saleDateStart" readonly value="<%= vcDto.getSaledate_start() %>">
            ~ <img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
            <input class="input_box" size="13" id="saleDateEnd" name="saleDateEnd" readonly value="<%= vcDto.getSaledate_end() %>"></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>목록이미지</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          	<input type="hidden" name="txtimgmain" value="<%= vcDto.getImg_main() %>">
          	<input class="upload" name="imgmain" type="file" size="55">(313x110) </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>주소</span></td>
          <td bgcolor="white" style="padding-left:10px;"><table border="0" width="80%" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" width="572"><input class="input_box" size="80" id="address1" name="address1" value="<%= vcDto.getAddress1()%>"></td>
              </tr>
              <tr>
                <td colspan="2" height="2" width="572"></td>
              </tr>
              <tr>
                <td width="495"><input class="input_box" size="80" id="address2" name="address2" value="<%= vcDto.getAddress2()%>"></td>
                <td width="77"><a href="zip_code.jsp" onClick="NewWindow(this.href,'name','420','400','yes');return false;"><img align="absmiddle" src="../images/inc/btn_search.gif" width="45" height="22" border="0"></a></td>
              </tr>
              <tr>
                <td colspan="2" height="2" width="572"></td>
              </tr>
              <tr>
                <td colspan="2" width="572"><a href="../inc/naver_map.html" onClick="NewWindow(this.href,'name','420','400','yes');return false;"><img align="absmiddle" src="../images/inc/btn_search_xy.gif" width="65" height="22" border="0"></a> &nbsp;&nbsp;X&nbsp;
                  <input class="input_box" size="20" id="pointx" name="pointx" value="<%= vcDto.getPoint_x()%>">
                  &nbsp;&nbsp;Y&nbsp;
                  <input class="input_box" size="20" id="pointy" name="pointy" value="<%= vcDto.getPoint_y()%>"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" height="25"><span class=list_title>노출여부</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <%
          	if(vcDto.getView_yn().startsWith("Y")){
          %>
          	노출함
            <input type="radio" id="viewY" name="rdbView" value="Y" checked>
            &nbsp;&nbsp;노출안함
            <input type="radio" id="viewN" name="rdbView" value="N">
          <%
          	}else{
          %>
          	노출함
            <input type="radio" id="viewY" name="rdbView" value="Y">
            &nbsp;&nbsp;노출안함
            <input type="radio" id="viewN" name="rdbView" checked value="N">
          <%
          	}
          %>
          </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="900">
        <tr>
          <td width="50%" height="30"><span class=list_title>가격입력</span></td>
          <td width="50%" align="right"><!--<img align="absmiddle" src="../images/inc/btn_plus.gif" width="32" height="16" border="0">--></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center"><table width="900" cellpadding="2" cellspacing="1" bgcolor="silver">
        <tr>
          <td bgcolor="#FCF9EB" align=middle width="340"><p>
          <!--<img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
              <input class="input_box" size="13" id="ReserveDateStart" name="ReserveDateStart" readonly value="<%= vcDto.getReserve_start()%>">
              ~ <img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
              <input class="input_box" size="13" id="ReserveDateEnd" name="ReserveDateEnd" readonly value="<%= vcDto.getReserve_end()%>">-->
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
	<% 
		for(int i = 1; i < 5;i++){
			if(arrlist3 != null && arrlist3.size() >= i){
	%>
		<tr>
          <td height="11" align="center" bgcolor="white">
          	<input type="hidden" id="condoroomseq<%=i%>" name="condoroomseq<%=i%>" value="<%= arrlist3.get(i-1).getCondoroom_seq()%>">
          	<input class="input_box" size="55" id="roomtype<%=i%>" name="roomtype<%=i%>" value="<%= arrlist3.get(i-1).getRoomtype()%>">
          </td>
          <td height="11" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price1N<%=i%>" name="price1N<%=i%>" value="<%= arrlist3.get(i-1).getPrice_n1()%>">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price2N<%=i%>" name="price2N<%=i%>" value="<%= arrlist3.get(i-1).getPrice_n2()%>">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price3N<%=i%>" name="price3N<%=i%>" value="<%= arrlist3.get(i-1).getPrice_n3()%>">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price1S<%=i%>" name="price1S<%=i%>" value="<%= arrlist3.get(i-1).getPrice_s1()%>">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price2S<%=i%>" name="price2S<%=i%>" value="<%= arrlist3.get(i-1).getPrice_s2()%>">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price3S<%=i%>" name="price3S<%=i%>" value="<%= arrlist3.get(i-1).getPrice_s3()%>">
          </td>
        </tr>
	<%
			}else{
	%>
		<tr>
          <td height="11" align="center" bgcolor="white">
          	<input type="hidden" id="condoroomseq<%=i%>" name="condoroomseq<%=i%>" value="">
          	<input class="input_box" size="55" id="roomtype<%=i%>" name="roomtype<%=i%>" value="">
          </td>
          <td height="11" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price1N<%=i%>" name="price1N<%=i%>" value="">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price2N<%=i%>" name="price2N<%=i%>" value="">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price3N<%=i%>" name="price3N<%=i%>" value="">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price1S<%=i%>" name="price1S<%=i%>" value="">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price2S<%=i%>" name="price2S<%=i%>" value="">
          </td>
          <td height="22" align="center" bgcolor="white">
          	<input class="input_box" size="10" id="price3S<%=i%>" name="price3S<%=i%>" value="">
          </td>
        </tr>
	<%
			}
		} 
	%>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="899" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="162"><span class=list_title>콘도안내</span></td>
          <td bgcolor="white" style="padding-left:10px;" width="710"><textarea class="box03" rows="10" cols="113" id="content1" name="content1" title="higheditor_simple"><%= vcDto.getCondo_info()%></textarea></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>상세정보</span></td>
          <td bgcolor="white" style="padding-left:10px;"><textarea class="box03" rows="10" cols="113" id="content2" name="content2" title="higheditor_simple"><%= vcDto.getDetail_info()%></textarea></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>사진갤러리</span></td>
          <td bgcolor="white" style="padding-left:10px;">
			<table border="0">
			<tr>
			<!-- 
			<td valign="top">
	          	<img align="absmiddle" src="../images/inc/btn_plus.gif" width="32" height="16" border="0" onclick="addgallery();">
	        </td>
	         -->
	        <td>
	        	<table  border="0" id="tbGallery">
	        	<tr id="trgallery1">
	        	<td>
		        	<input type="hidden" name="condoimgseq1" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(0).getCondoimg_seq());} %>">
		        	<input type="hidden" name="condoimg1" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(1).getCondo_img());} %>">
		            <input class="upload" name="imggallery1" type="file" size="55">
		            <!-- <img align="absmiddle" src="../images/inc/btn_del.gif" width="13" height="14" border="0" onclick="delgallery('1');"> -->
	        	</td>
	        	</tr>
	        	<tr id="trgallery2">
	        	<td>
		        	<input type="hidden" name="condoimgseq2" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(1).getCondoimg_seq());} %>">
		        	<input type="hidden" name="condoimg2" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(1).getCondo_img());} %>">
		            <input class="upload" name="imggallery2" type="file" size="55">
		            <!-- <img align="absmiddle" src="../images/inc/btn_del.gif" width="13" height="14" border="0" onclick="delgallery('2');"> -->
	        	</td>
	        	</tr>
	        	<tr id="trgallery3">
	        	<td>
		        	<input type="hidden" name="condoimgseq3" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(2).getCondoimg_seq());} %>">
		        	<input type="hidden" name="condoimg3" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(2).getCondo_img());} %>">
		            <input class="upload" name="imggallery3" type="file" size="55">
		            <!-- <img align="absmiddle" src="../images/inc/btn_del.gif" width="13" height="14" border="0" onclick="delgallery('3');"> -->
	        	</td>
	        	</tr>
	        	<tr id="trgallery4">
	        	<td>
		        	<input type="hidden" name="condoimgseq4" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(3).getCondoimg_seq());} %>">
		        	<input type="hidden" name="condoimg4" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(3).getCondo_img());} %>">
		            <input class="upload" name="imggallery4" type="file" size="55">
		            <!-- <img align="absmiddle" src="../images/inc/btn_del.gif" width="13" height="14" border="0" onclick="delgallery('4');"> -->
	        	</td>
	        	</tr>
	        	<tr id="trgallery5">
	        	<td>
		        	<input type="hidden" name="condoimgseq5" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(4).getCondoimg_seq());} %>">
		        	<input type="hidden" name="condoimg5" value="<% if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(4).getCondo_img());} %>">
		            <input class="upload" name="imggallery5" type="file" size="55">
		            <!-- <img align="absmiddle" src="../images/inc/btn_del.gif" width="13" height="14" border="0" onclick="delgallery('5');"> -->
	        	</td>
	        	</tr>
	        	</table>
	        </td>
            </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이용약관</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          	<textarea class="box03" rows="10" cols="113" id="content3" name="content3" title="higheditor_simple"><%= vcDto.getUse_rule() %></textarea>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>오시는길</span></td>
          <td bgcolor="white" style="padding-left:10px;"><textarea class="box03" rows="10" cols="113" id="content4" name="content4" title="higheditor_simple"><%= vcDto.getWay_map()%></textarea></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:20px;padding-bottom:20px;"><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0" onclick="condoReg();"></td>
  </tr>
</table>
</FORM>
</body>
</html>
