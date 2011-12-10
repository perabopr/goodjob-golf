<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.reserve.dto.RegionDto"%>
<%@ page import="com.goodjob.reserve.dto.GolfLinkDto"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkPriceDto"%>
<%@ page import="com.goodjob.reserve.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));
String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));

	RegionDao regionDao = new RegionDao();
	List<RegionDto> arrRegions = regionDao.getRegionList("1");
	
	GolfLinkDao dld = new GolfLinkDao();
	List<GolfLinkDto> arrgldto = null;
	List<GolfLinkPriceDto> dlpricedto = null;
	GolfLinkDto gldto = new GolfLinkDto();
	String vPrice1 = "";
	String vPrice2 = "";
	String vPrice3 = "";
	String vPrice4 = "";
	if(glSeq.length() > 0){
		arrgldto = dld.getGolfLink(Integer.parseInt(glSeq));
		if(arrgldto.size() == 1){
			gldto = arrgldto.get(0);
		}
		
		dlpricedto = dld.getGolfLinkPriceSelect(Integer.parseInt(glSeq));		
		if(dlpricedto != null){
			for(int i = 0; i< dlpricedto.size();i++){
				if(dlpricedto.get(i).getPrice_type().startsWith("1")){
					vPrice1 = Integer.toString(dlpricedto.get(i).getGolflink_price());
				}else if(dlpricedto.get(i).getPrice_type().startsWith("2")){
					vPrice2 = Integer.toString(dlpricedto.get(i).getGolflink_price());
				}else if(dlpricedto.get(i).getPrice_type().startsWith("3")){
					vPrice3 = Integer.toString(dlpricedto.get(i).getGolflink_price());
				}else if(dlpricedto.get(i).getPrice_type().startsWith("4")){
					vPrice4 = Integer.toString(dlpricedto.get(i).getGolflink_price());
				}
			}
		}
	}
	
String pageTitle = "";
if(menuSeq.startsWith("1")){
	pageTitle += "★  실시간 ";
}else{
	pageTitle += "★  사전 ";
}
if(glSeq.length() > 0){
	pageTitle += "골프장 수정 ★";
}else{
	pageTitle += "골프장 등록 ★";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../style.css">
<title></title>
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">
<!-- 
function NewWindow(mypage, myname, w, h, scroll) { 
var winl = (screen.width - w) / 2; 
var wint = (screen.height - h) / 2; 
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
win = window.open(mypage, myname, winprops) 
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
} 

function real_submit() {
	
	if(!$('#golflinkName').val()) {
		alert('제목을 입력하시기 바랍니다.');
		$('#golflinkName').focus();
		return;
	} 	

	if($('#img1').val()) {
		var src = getFileExtension($('#img1').val());
		if ( !((src.toLowerCase() == "png") || (src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg")) ) {
			alert('gif , jpg , png 파일만 지원합니다.');
			return;
		}
	}
	if($('#img2').val()) {
		var src = getFileExtension($('#img2').val());
		if ( !((src.toLowerCase() == "png") || (src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg")) ) {
			alert('gif , jpg , png 파일만 지원합니다.');
			return;
		}
	}
	if($('#img3').val()) {
		var src = getFileExtension($('#img3').val());
		if ( !((src.toLowerCase() == "png") || (src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg")) ) {
			alert('gif , jpg , png 파일만 지원합니다.');
			return;
		}
	}
	if($('#img4').val()) {
		var src = getFileExtension($('#img4').val());
		if ( !((src.toLowerCase() == "png") || (src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg")) ) {
			alert('gif , jpg , png 파일만 지원합니다.');
			return;
		}
	}
	
	frm.submit();
}

function getFileExtension(filePath)
{
  var lastIndex = -1;
  lastIndex = filePath.lastIndexOf('.');
  var extension = "";
  if ( lastIndex != -1 ) {
    extension = filePath.substring( lastIndex+1, filePath.len );
  }
  else {
    extension = "";
  }
  return extension;
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<FORM NAME="frm" METHOD="post" ACTION="real_reg_ok.jsp"  enctype="multipart/form-data">
<input type="hidden" id="menuSeq" name="menuSeq" value="<%= menuSeq%>" />
<input type="hidden" id="glSeq" name="glSeq" value="<%= glSeq%>" />
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="50%" class=title><%= pageTitle%></td>
    <td width="50%"></td>
  </tr>
  <tr>
    <td align="center" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" colspan="2"><table border="0" width="900" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td bgcolor="#E6E7E8" align="right" style="padding-right:10px;" width="162"><span class=list_title>골프장명</span></td>
          <td width="712" bgcolor="white" style="padding-left:10px;"><input id="golflinkName" class="input_box" size="40" name="golflinkName" value="<%= gldto.getGolflink_name()%>"></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>지역선택</span></td>
          <td bgcolor="white" style="padding-left:10px;"><select id="regionSeq" name="regionSeq" size="1">
              <option>선택하세요</option>
<% 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
			if(gldto.getRegion_seq() == arrRegions.get(i).getRegion_seq()){
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
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>홀구분</span></td>
          <td bgcolor="white" style="padding-left:10px;"><input id="hollType" name="hollType" class="input_box" size="40" value="<%= gldto.getHoll_type()%>"></td>
        </tr>
                <tr>
                    <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>코스안내</span></td>
                    <td bgcolor="white" style="padding-left:10px;"><input id="courseGuide" name="courseGuide" class="input_box" size="110" value="<%= gldto.getCourse_guide()%>">
                    </td>
                </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드1</span></td>
          <td bgcolor="white" style="padding-left:10px;"><input id="img1" name="img1" class="upload" type="file" size="55">
            (270x202) </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드2</span></td>
          <td bgcolor="white" style="padding-left:10px;"><input id="img2" name="img2" class="upload" type="file" size="55">
            (270x202)</td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드3</span></td>
          <td bgcolor="white" style="padding-left:10px;"><input id="img3" name="img3" class="upload" type="file" size="55">
            (270x202)</td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이미지업로드4</span></td>
          <td bgcolor="white" style="padding-left:10px;"><input id="img4" name="img4" class="upload" type="file" size="55">
            (270x202)</td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>주소</span></td>
          <td bgcolor="white" style="padding-left:10px;"><table border="0" width="80%" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" width="572"><input id="address1" name="address1" class="input_box" size="80" value="<%= gldto.getGolflink_address1()%>"></td>
              </tr>
              <tr>
                <td colspan="2" height="2" width="572"></td>
              </tr>
              <tr>
                <td width="495"><input id="address2" name="address2" class="input_box" size="80" value="<%= gldto.getGolflink_address2()%>"></td>
                <td width="77"><a href="../inc/zip.html" onClick="NewWindow(this.href,'name','420','400','yes');return false;"><img align="absmiddle" src="../images/inc/btn_search.gif" width="45" height="22" border="0"></a></td>
              </tr>
              <tr>
                <td colspan="2" height="2" width="572"></td>
              </tr>
              <tr>
                <td colspan="2" width="572"><a href="../inc/naver_map.html" onClick="NewWindow(this.href,'name','420','400','yes');return false;"><img align="absmiddle" src="../images/inc/btn_search_xy.gif" width="65" height="22" border="0"></a> &nbsp;&nbsp;X&nbsp;
                  <input id="pointx" name="pointx" class="input_box" size="20" value="<%= gldto.getPoint_x()%>">
                  &nbsp;&nbsp;Y&nbsp;
                  <input id="pointy" name="pointy" class="input_box" size="20" value="<%= gldto.getPoint_y()%>"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>취소불가기간설정</span></td>
          <td bgcolor="white" style="padding-left:10px;"><select id="cancelterm" name="cancelterm" size="1">
              <option value="">선택하세요</option>
              <% 
              	for (int i = 3; i < 11;i++){
              		if(gldto.getCancel_term().length() > 0 && Integer.parseInt(gldto.getCancel_term()) == i){
              %>
            			<option value="<%= i%>" selected><%= i%>일</option>
              <%
              		}else{
              %>
            			<option value="<%= i%>"><%= i%>일</option>
              <%              			
              		}      
              	}
              %>
            </select></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="0" height="25"><span class=list_title>노출여부</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <%
          	if(gldto.getView_yn().startsWith("Y")){
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
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><table border="0" width="900" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="162"><span class=list_title>가격입력</span></td>
          <td height="18" bgcolor="white" style="padding-left:10px;" width="711"><table width="100%" cellpadding="2" cellspacing="1" bgcolor="silver">
              <tr>
                <td bgcolor="#FCF9EB" align=middle colspan="2" width="353"><b>그린피 정상요금</b></td>
                <td bgcolor=#fcf9eb colspan="2" align=middle  할인요금 width="356"><b>그린피 할인요금</b></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#FCF9EB">주중</td>
                <td bgcolor=#fcf9eb align=middle 주중>&nbsp;주말</td>
                <td bgcolor=#fcf9eb align=middle 주중>&nbsp;주중</td>
                <td align="center" bgcolor="#FCF9EB">주말</td>
              </tr>
              <tr>
                <td height="11" align="center" bgcolor="white"><input class="input_box" size="15" id="priceN1" name="priceN1" value="<%= vPrice1%>"></td>
                <td height="22" align="center" bgcolor="white"><input class="input_box" size="15" id="priceN2" name="priceN2" value="<%= vPrice2%>"></td>
                <td height="22" align="center" bgcolor="white"><input class="input_box" size="15" id="priceS1" name="priceS1" value="<%= vPrice3%>"></td>
                <td height="22" align="center" bgcolor="white"><input class="input_box" size="15" id="priceS2" name="priceS2" value="<%= vPrice4%>"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><table border="0" width="899" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;" width="162"><span class=list_title>취소규정</span></td>
          <td bgcolor="white" style="padding-left:10px;" width="710"><textarea class="box03" rows="3" cols="113" id="content1" name="content1"><%= gldto.getCancel_rule()%></textarea></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>위약처리규정</span></td>
          <td bgcolor="white" style="padding-left:10px;"><textarea class="box03" rows="6" cols="113" id="content2" name="content2"><%= gldto.getPromise_rule()%></textarea></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>이용안내</span></td>
          <td bgcolor="white" style="padding-left:10px;"><textarea class="box03" rows="6" cols="113" id="content3" name="content3"><%= gldto.getUse_guide()%></textarea></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=list_title>골프장안내</span></td>
          <td bgcolor="white" style="padding-left:10px;"><textarea class="box03" rows="6" cols="113" id="content4" name="content4"><%= gldto.getGolflink_guide()%></textarea></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="2" align="center" style="padding-top:20px;padding-bottom:20px;"><img align="absmiddle" src="../images/inc/btn_regist2.gif" width="74" height="26" border="0" onclick="real_submit();"></td>
  </tr>
</table>
</FORM>
</body>
</html>
