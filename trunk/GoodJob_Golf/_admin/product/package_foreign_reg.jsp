<%@page import="com.goodjob.conf.Config"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.product.dto.RegionDto"%>
<%@ page import="com.goodjob.product.dto.PackageDto"%>
<%@ page import="com.goodjob.product.dto.PackagePriceDto"%>
<%
int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"), 0);

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("2");

List<PackageDto> arrList = null;
PackageDto vPk = new PackageDto();
List<PackagePriceDto> arrList2 = null;
PackagePriceDto vPkp = new PackagePriceDto();
PackageDao pkDao = new PackageDao();
if(pkSeq > 0){
	arrList = pkDao.getPackageSelect(0, 4, pkSeq);
	if(arrList != null && arrList.size() == 1){
		vPk = arrList.get(0);
	}
	arrList2 = pkDao.getPackagePriceSelect(pkSeq);
	if(arrList2 != null && arrList2.size() == 1){
		vPkp = arrList2.get(0);
	}
}

String up_dir = Config.get("reserve_dir");
%>
<html>
<head>
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="../css/jquery.ui.all.css">
<script src="../js/jquery-1.6.2.min.js"></script>
<script src="../js/jquery.ui.core.js"></script>
<script src="../js/jquery.ui.widget.js"></script>
<script src="../js/jquery.ui.datepicker.js"></script>
<script src="/js/jquery.ui.datepicker.kr.js"></script>
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
	$( "#saleDateEnd" ).datepicker({dateFormat:'yy-mm-dd'});
});

function frmSubmit(){
	frm.submit();
	return false;
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<FORM NAME="frm" METHOD="post" ACTION="package_foreign_reg_ok.jsp"  enctype="multipart/form-data">
<input type="hidden" id="pkSeq" name="pkSeq" value="<%= pkSeq%>" />
<input type="hidden" id="menuSeq" name="menuSeq" value="<%=4%>" />
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 해외패키지 등록 ★</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="900" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td bgcolor="#E6E7E8" align="right" style="padding-right:10px;" width="162"><span class=list_title>상품명</span></td>
          <td width="712" bgcolor="white" style="padding-left:10px;">
          	<input class="input_box" size="60" id="package_name1" name="package_name1" value="<%= vPk.getPackage_name1() %>">
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>지역선택</span></td>
          <td bgcolor="white" style="padding-left:10px;"><select name="regionseq" size="1">
              <option>선택하세요</option>
<% 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
			if(vPk.getRegion_seq() == arrRegions.get(i).getRegion_seq()){
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
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>간략소개</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          	<input class="input_box" size="60" id="package_type" name="package_type" value="<%= vPk.getPackage_type() %>">
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>예약기간</span></td>
          <td bgcolor="white" style="padding-left:10px;"><img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
            <input class="input_box" size="13" id="saleDateStart" name="saleDateStart" readonly value="<%= vPk.getSaledate_start() %>">
            ~ <img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
            <input class="input_box" size="13" id="saleDateEnd" name="saleDateEnd" readonly value="<%= vPk.getSaledate_end() %>"></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>목록이미지</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg0" name="txtimg0" value="<%= vPk.getImg_sub() %>">
          <input class="upload" name="img0" type="file" size="55">(313x110)</br>
          <%= vPk.getImg_sub4().length() > 0 ? up_dir + "/" + vPk.getImg_sub() : "" %>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드1</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg1" name="txtimg1" value="<%= vPk.getImg_sub1() %>">
          <input class="upload" name="img1" type="file" size="55">(270x202) </br> 
          <%= vPk.getImg_sub1().length() > 0 ? up_dir + "/" + vPk.getImg_sub1() : "" %>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드2</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg2" name="txtimg2" value="<%= vPk.getImg_sub2() %>">
          <input class="upload" name="img2" type="file" size="55">(270x202)</br>
          <%= vPk.getImg_sub2().length() > 0 ? up_dir + "/" + vPk.getImg_sub2() : "" %>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드3</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg3" name="txtimg3" value="<%= vPk.getImg_sub3() %>">
          <input class="upload" name="img3" type="file" size="55">(270x202)</br>
          <%= vPk.getImg_sub3().length() > 0 ? up_dir + "/" + vPk.getImg_sub3() : "" %>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드4</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg4" name="txtimg4" value="<%= vPk.getImg_sub4() %>">
          <input class="upload" name="img4" type="file" size="55">(270x202)</br>
          <%= vPk.getImg_sub4().length() > 0 ? up_dir + "/" + vPk.getImg_sub4() : "" %>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" height="25"><span class=list_title>노출여부</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <%
          	if(vPk.getView_yn().startsWith("Y")){
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
    <td><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="900" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="162"><p><span class=list_title>가격입력</span></p></td>
          <td height="18" bgcolor="white" style="padding-left:10px;" width="711"><table width="100%" cellpadding="2" cellspacing="1" bgcolor="silver" height="102">
              <tr>
                <td align="center" bgcolor="#FCF9EB" rowspan="2" width="81">&nbsp;</td>
                <td align="center" bgcolor="white" colspan="2" width="309"><p>비성수기</p></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#F1F1F1" width="57">요일</td>
                <td align="center" bgcolor="#F1F1F1" width="115">정상가</td>
              </tr>
              <tr>
                <td align="center" bgcolor="#FCF9EB" width="81" rowspan="5">주중</td>
                <td align="center" bgcolor="white">월</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_mon" value="<%= vPkp.getOff_n_mon() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">화</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_tue" value="<%= vPkp.getOff_n_tue() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">수</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_wed" value="<%= vPkp.getOff_n_wed() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">목</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_thu" value="<%= vPkp.getOff_n_thu() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">금</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_fri" value="<%= vPkp.getOff_n_fri() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#FCF9EB" width="81" rowspan="2">주말</td>
                <td align="center" bgcolor="white">토</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_sat" value="<%= vPkp.getOff_n_sat() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">일</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_sun" value="<%= vPkp.getOff_n_sun() %>"></td>
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
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="162"><span class=list_title>상품안내</span></td>
          <td bgcolor="white" style="padding-left:10px;" width="710">
          	<textarea class="box03" rows="10" cols="113" id="content1" name="content1" title="higheditor_simple"><%= vPk.getPackage_guide() %></textarea>
          </td>
        </tr>
        <tr>
          <td width="162" align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이용안내</span></td>
          <td width="710" bgcolor="white" style="padding-left:10px;">
          	<textarea class="box03" rows="10" cols="113" id="content2" name="content2" title="higheditor_simple"><%= vPk.getUse_guide() %></textarea>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>상품정보</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          	<textarea class="box03" rows="10" cols="113" id="content3" name="content3" title="higheditor_simple"><%= vPk.getGolflink_guide() %></textarea>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>국외여행표준약관</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          	<textarea class="box03" rows="10" cols="113" id="content4" name="content4" title="higheditor_simple"><%= vPk.getUse_rule() %></textarea>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>개인정보제공 및 공유약관</span></td>
          <td bgcolor="white" style="padding-left:10px;">
              <textarea class="box03" rows="10" cols="113" id="content5" name="content5" title="higheditor_simple"><%= vPk.getUserinfo_terms() %></textarea>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>일정표</span></td>
          <td bgcolor="white" style="padding-left:10px;">
              <textarea class="box03" rows="10" cols="113" id="content6" name="content6" title="higheditor_simple"><%= vPk.getWay_map() %></textarea>
          </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:20px;padding-bottom:20px;"><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0" onclick="frmSubmit();"></td>
  </tr>
</table>
</FORM>
</body>
</html>