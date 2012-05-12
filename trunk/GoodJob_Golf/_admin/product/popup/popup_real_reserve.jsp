<%@page import="com.goodjob.product.dto.ProductDto"%>
<%@page import="com.goodjob.product.MenuViewSiteDao"%>
<%@page import="com.goodjob.product.dto.MenuViewSiteDto"%>
<%@page import="com.goodjob.product.productDao"%>
<%@page import="com.goodjob.product.dto.ProductSubDto"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.product.dto.SiteDto"%>
<%@page import="com.goodjob.product.SiteDao"%>
<%@page import="com.goodjob.product.dto.GolfLinkCourseDto"%>
<%@page import="com.goodjob.product.dto.GolfLinkDto"%>
<%@page import="com.goodjob.product.GolfLinkDao"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="com.goodjob.util.Utils"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menuSeq = StringUtils.trimToEmpty(request.getParameter("menuseq"));
String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));
int pdsubseq = NumberUtils.toInt(request.getParameter("pdsubseq"), 0);
if(pdsubseq == 0){
	out.print("<script>");
	out.print("self.close();");
	out.print("</script>");
}

String headDate_now = Utils.getDate("yyyy-MM-dd" , 5);

GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> glList = glDao.getGolfLink(Integer.parseInt(glSeq));

List<GolfLinkCourseDto> glcList = glDao.getGolfLinkCourseSelect(Integer.parseInt(glSeq));

SiteDao sDao = new SiteDao();
List<SiteDto> sitelist = sDao.getSiteAllList();

/**
  * 상품시간 가격정보.
  */
productDao pdDao = new productDao();
List<ProductDto> pdDto = null;
List<ProductSubDto> pdsubDto = pdDao.getProductSubSelect(pdsubseq);
if(pdsubDto != null){
	pdDto = pdDao.getProductSelect(pdsubDto.get(0).getProduct_seq());
}else{
	out.print("<script>");
	out.print("self.close();");
	out.print("</script>");
}
String bookingDate = pdDto.get(0).getProduct_year() + "-" + pdDto.get(0).getProduct_month() + "-" + pdDto.get(0).getProduct_day();
String bookingDate_hour = pdsubDto.get(0).getTime_start().substring(0,2);
String bookingDate_min = pdsubDto.get(0).getTime_start().substring(2,4);
String courseName = "";
for(int i = 0; i < glcList.size();i++){
	if(glcList.get(i).getGolflink_course_seq() == pdsubDto.get(0).getGolflink_course_seq()){
		courseName = glcList.get(i).getCourse_name();
	}
}
/**
 *관련싸이트 정보 가져오기.
*/
MenuViewSiteDto mvsDto = new MenuViewSiteDto();
mvsDto.setMenu_seq(Integer.parseInt(menuSeq));
mvsDto.setService_seq(Integer.parseInt(glSeq));
MenuViewSiteDao mvsd = new MenuViewSiteDao();
List<MenuViewSiteDto> listMvsd = mvsd.getMenuViewSiteListNHException(mvsDto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<link rel="stylesheet" href="../../style.css" type="text/css">
<link rel="stylesheet" href="/css/jquery.ui.all.css">
<script src="/js/jquery-1.6.2.min.js"></script>
<script src="/js/jquery.ui.core.js"></script>
<script src="/js/jquery.ui.widget.js"></script>
<script src="/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript">
$(function() {
	$( "#txtReserveRegDate" ).datepicker({
		dateFormat:'yy-mm-dd',
		onSelect : function(dateText, inst){
		}
	});
	$("#txtReserveRegDate").click(
			function(){
				$( "#txtReserveRegDate" ).datepicker("show");
			}
		);
});

function billSubmit(cbNum){
	var frm = document.exefrm;
	frm.target =  "ifr_hidden"; 
	frm.action = "popup_real_reserve_ok.jsp";
	frm.submit();
}
</script>
</head>
<body>
★ 임의 등록 (실시간 예약) ★
<FORM NAME="exefrm" METHOD="post">
<input type="hidden" id="menuSeq" name="menuSeq" value="1">
<input type="hidden" id="glSeq" name="glSeq"  value="<%=glSeq%>">
<input type="hidden" id="pdsubseq" name="pdsubseq" value="<%=pdsubDto.get(0).getProductsub_seq()%>">
<table cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
<tr>
<td  bgcolor="#F1F1F1">(예약)사이트</td>
<td bgcolor='white' nowrap>
<select id="txtSiteSeq" name="txtSiteSeq">
<%
for(int i = 0; i < sitelist.size();i++){
%>
<option value="<%=sitelist.get(i).getSite_seq() %>"><%=sitelist.get(i).getSite_name() %></option>
<%
}
%>
</select>
</td>
<tr>
<td  bgcolor="#F1F1F1">예약신청일</td>
<td bgcolor='white' nowrap>
	<input type="text" id="txtReserveRegDate" name="txtReserveRegDate" value="" size="10" maxlength=10 />
	<select name='ddlReserveRegHour'>
	<%
	for(int  i=0;i<24;i++){
		String ih = "0" + Integer.toString(i);
		ih = ih.substring(ih.length()-2);
	%>
	<option value="<%=ih %>"><%=ih %></option>
	<%
	}
	%>
	</select>시
	<select name='ddlReserveRegMin'>
	<%
	for(int  i=0;i<60;i++){
		String im = "0" + Integer.toString(i);
		im = im.substring(im.length()-2);
	%>
	<option value="<%=im %>"><%=im%></option>
	<%
	}
	%>
	</select>분
</td>
</tr>
<tr>
<td  bgcolor="#F1F1F1">예약자</td>
<td bgcolor='white' nowrap><input type="text" id="txtReserveUser" name="txtReserveUser" value="" size="10" /></td>
</tr>
<tr>
<td  bgcolor="#F1F1F1">아이디</td>
<td bgcolor='white' nowrap><input type="text" id="txtReserveUserId" name="txtReserveUserId" value="" size="10" /></td>
</tr>
<tr>
<td  bgcolor="#F1F1F1">골프장명</td>
<td bgcolor='white' nowrap>
	<input type="hidden" id="txtGolfSeq" name="txtGolfSeq" value="<%=glSeq%>">
	<div><%=glList.get(0).getGolflink_name() %></div>
</td>
</tr>
<tr>
<td  bgcolor="#F1F1F1">부킹일시</td>
<td bgcolor='white' nowrap>
	<input type="text" id="txtBookingDate" name="txtBookingDate" size="10" value="<%=bookingDate %>" readonly  />
	<input type="text" id="txtBookingDateHour" name="txtBookingDateHour" size="2" value="<%=bookingDate_hour %>" readonly  />시
	<input type="text" id="txtBookingDateMin" name="txtBookingDateMin" size="2" value="<%=bookingDate_min %>" readonly  />분
</td>
</tr>
<tr>
<td  bgcolor="#F1F1F1" nowrap>인원/팀</td>
<td bgcolor='white' nowrap>
	<SELECT id=perNum name=perNum>
	<OPTION value=1>1</OPTION>
	<OPTION value=2>2</OPTION>
	<OPTION value=3>3</OPTION>
	<OPTION selected value=4>4</OPTION>
	</SELECT>
</td>
</tr>
<tr>
<td  bgcolor="#F1F1F1">코스</td>
<td bgcolor='white' nowrap>
<%=courseName%>
</td>
</tr>
<tr>
<td  bgcolor="#F1F1F1">연락처</td><td bgcolor='white' nowrap>
<SELECT id=phone1 size=1 name=phone1> 
<OPTION selected value="">선택</OPTION> 
<OPTION value=010>010</OPTION> <OPTION value=011>011</OPTION> 
<OPTION value=016>016</OPTION> <OPTION value=017>017</OPTION> 
<OPTION value=018>018</OPTION> <OPTION value=019>019</OPTION>
</SELECT> - <INPUT id=phone2 class=input_01 name=phone2 maxLength=4 size=3> - <INPUT id=phone3 class=input_01 name=phone3 maxLength=4 size=3>
</td>
</tr>
<tr>
<td  bgcolor="#F1F1F1">입금액</td>
<td bgcolor='white' nowrap><INPUT id=inPrice name=inPrice ></td>
</tr>
<tr>
<td  bgcolor="#F1F1F1">처리상태</td>
<td bgcolor='white' nowrap>
	<select name='ddl_prdtStatus'>
		<option value=0>예약대기</option>
		<option value=1>예약완료</option>
	</select>
</td>
</tr>
<tr>
<td colspan="2" align="center" bgcolor='white'>
	<img align="absmiddle" src="../../images/inc/btn_regist2.gif" style="cursor:pointer;" width="74" height="26" border="0" onclick="billSubmit();">
</td>
</tr>
</table>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe>
</FORM>
</body>
</html>