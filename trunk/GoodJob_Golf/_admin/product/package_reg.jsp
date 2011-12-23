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
String pkSeq = StringUtils.trimToEmpty(request.getParameter("pkSeq"));

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("1");

List<PackageDto> arrList = null;
PackageDto vPk = new PackageDto();
List<PackagePriceDto> arrList2 = null;
PackagePriceDto vPkp = new PackagePriceDto();
PackageDao pkDao = new PackageDao();
if(pkSeq.length() > 0){
	arrList = pkDao.getPackageSelect("AND package_seq = " + pkSeq);
	if(arrList != null && arrList.size() == 1){
		vPk = arrList.get(0);
	}
	arrList2 = pkDao.getPackagePriceSelect(Integer.parseInt(pkSeq));
	if(arrList2 != null && arrList2.size() == 1){
		vPkp = arrList2.get(0);
	}
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
function frmSubmit(){
	frm.submit();
	return false;
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<FORM NAME="frm" METHOD="post" ACTION="package_reg_ok.jsp"  enctype="multipart/form-data">
<input type="hidden" id="pkSeq" name="pkSeq" value="<%= pkSeq%>" />
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 국내패키지 등록 ★</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="900" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td bgcolor="#E6E7E8" align="right" style="padding-right:10px;" width="162"><span class=list_title>골프패키지명1</span></td>
          <td width="712" bgcolor="white" style="padding-left:10px;">
          	<input class="input_box" size="60" id="package_name1" name="package_name1" value="<%= vPk.getPackage_name1() %>">
          </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>골프패키지명2</span></td>
            <td bgcolor="white" style="padding-left:10px;">
				<input class="input_box" size="60"  id="package_name2" name="package_name2" value="<%= vPk.getPackage_name2() %>">
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
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>목록이미지</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg0" name="txtimg0" value="<%= vPk.getImg_sub() %>">
          <input class="upload" name="img0" type="file" size="55">(313x110)</td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드1</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg1" name="txtimg1" value="<%= vPk.getImg_sub1() %>">
          <input class="upload" name="img1" type="file" size="55">(270x202) </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드2</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg2" name="txtimg2" value="<%= vPk.getImg_sub2() %>">
          <input class="upload" name="img2" type="file" size="55">(270x202)</td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드3</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg3" name="txtimg3" value="<%= vPk.getImg_sub3() %>">
          <input class="upload" name="img3" type="file" size="55">(270x202)</td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드4</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input type="hidden" id="txtimg4" name="txtimg4" value="<%= vPk.getImg_sub4() %>">
          <input class="upload" name="img4" type="file" size="55">(270x202)</td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>주소</span></td>
          <td bgcolor="white" style="padding-left:10px;"><table border="0" width="80%" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" width="572"><input class="input_box" size="80" id="address1" name="address1" value="<%= vPk.getAddress1()%>"></td>
              </tr>
              <tr>
                <td colspan="2" height="2" width="572"></td>
              </tr>
              <tr>
                <td colspan="2" width="495"><input class="input_box" size="80" id="address2" name="address2" value="<%= vPk.getAddress2()%>"></td>                
              </tr>
              <tr>
                <td colspan="2" width="572"></td>
              </tr>
              <tr>
                <td colspan="2"></td>
              </tr>
            </table></td>
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
                <td align="center" bgcolor="white" colspan="3" width="305"><p>성수기</p></td>
                <td align="center" bgcolor="white" colspan="3" width="309"><p>비성수기</p></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#F1F1F1" width="55">요일</td>
                <td align="center" bgcolor="#F1F1F1" width="118">정상가</td>
                <td width="122" align="center" bgcolor="#F1F1F1">할인가</td>
                <td align="center" bgcolor="#F1F1F1" width="57">요일</td>
                <td align="center" bgcolor="#F1F1F1" width="115">정상가</td>
                <td width="127" align="center" bgcolor="#F1F1F1">할인가</td>
              </tr>
              <tr>
                <td align="center" bgcolor="#FCF9EB" width="81" rowspan="5">주중</td>
                <td align="center" bgcolor="white">월</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_pn_mon" value="<%= vPkp.getPeak_n_mon() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_ps_mon" value="<%= vPkp.getPeak_s_mon() %>"></td>
                <td align="center" bgcolor="white">월</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_mon" value="<%= vPkp.getOff_n_mon() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_os_mon" value="<%= vPkp.getOff_s_mon() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">화</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_pn_tue" value="<%= vPkp.getPeak_n_tue() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_ps_tue" value="<%= vPkp.getPeak_s_tue() %>"></td>
                <td align="center" bgcolor="white">화</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_tue" value="<%= vPkp.getOff_n_tue() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_os_tue" value="<%= vPkp.getOff_s_tue() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">수</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_pn_wed" value="<%= vPkp.getPeak_n_wed() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_ps_wed" value="<%= vPkp.getPeak_s_wed() %>"></td>
                <td align="center" bgcolor="white">수</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_wed" value="<%= vPkp.getOff_n_wed() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_os_wed" value="<%= vPkp.getOff_s_wed() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">목</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_pn_thu" value="<%= vPkp.getPeak_n_thu() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_ps_thu" value="<%= vPkp.getPeak_s_thu() %>"></td>
                <td align="center" bgcolor="white">목</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_thu" value="<%= vPkp.getOff_n_thu() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_os_thu" value="<%= vPkp.getOff_s_thu() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">금</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_pn_fri" value="<%= vPkp.getPeak_n_fri() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_ps_fri" value="<%= vPkp.getPeak_s_fri() %>"></td>
                <td align="center" bgcolor="white">금</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_fri" value="<%= vPkp.getOff_n_fri() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_os_fri" value="<%= vPkp.getOff_s_fri() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#FCF9EB" width="81" rowspan="2">주말</td>
                <td align="center" bgcolor="white">토</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_pn_sat" value="<%= vPkp.getPeak_n_sat() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_ps_sat" value="<%= vPkp.getPeak_s_sat() %>"></td>
                <td align="center" bgcolor="white">토</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_sat" value="<%= vPkp.getOff_n_sat() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_os_sat" value="<%= vPkp.getOff_s_sat() %>"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="white">일</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_pn_sun" value="<%= vPkp.getPeak_n_sun() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_ps_sun" value="<%= vPkp.getPeak_s_sun() %>"></td>
                <td align="center" bgcolor="white">일</td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_on_sun" value="<%= vPkp.getOff_n_sun() %>"></td>
                <td align="center" bgcolor="white"><input class="input_box" size="12" name="price_os_sun" value="<%= vPkp.getOff_s_sun() %>"></td>
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
          	<textarea class="box03" rows="6" cols="113" name="content1"><%= vPk.getPackage_guide() %></textarea>
          </td>
        </tr>
        <tr>
          <td width="162" align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이용안내</span></td>
          <td width="710" bgcolor="white" style="padding-left:10px;">
          	<textarea class="box03" rows="6" cols="113" name="content2"><%= vPk.getUse_guide() %></textarea>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>골프장소개</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          	<textarea class="box03" rows="6" cols="113" name="content3"><%= vPk.getGolflink_guide() %></textarea>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>오시는길</span></td>
          <td bgcolor="white" style="padding-left:10px;">
              <textarea class="box03" rows="6" cols="113" name="content4"><%= vPk.getWay_map() %></textarea>
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