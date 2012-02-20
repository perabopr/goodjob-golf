<%@page import="java.awt.print.Printable"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.product.dto.RegionDto"%>
<%@page import="com.goodjob.product.RegionDao"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.product.dto.StatsDto"%>
<%@page import="com.goodjob.product.StatsDao" %>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String reserveDateStart = StringUtils.trimToEmpty(request.getParameter("reserveDateStart"));
String reserveDateEnd = StringUtils.trimToEmpty(request.getParameter("reserveDateEnd"));
int regionSeq = NumberUtils.toInt(request.getParameter("regionseq"), 0);
int menuSeq = NumberUtils.toInt(request.getParameter("menuSeq"), 1);
int perNum = NumberUtils.toInt(request.getParameter("perNum"), 0);
String txtReservePrdtName = StringUtils.trimToEmpty(request.getParameter("txtReservePrdtName"));
String txtPriceS = StringUtils.trimToEmpty(request.getParameter("txtPriceS"));
String txtPriceE = StringUtils.trimToEmpty(request.getParameter("txtPriceE"));
String txtReserveName = StringUtils.trimToEmpty(request.getParameter("txtReserveName"));

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("1");

StatsDto sDto = new StatsDto();
sDto.setReservedate_start(reserveDateStart);
sDto.setReservedate_end(reserveDateEnd);
sDto.setMenu_seq(menuSeq);
sDto.setRegion_seq(regionSeq);
sDto.setPer_num(perNum);
sDto.setReserve_prdt_name(txtReservePrdtName);
sDto.setPriceS(txtPriceS);
sDto.setPriceE(txtPriceE);
sDto.setReserve_name(txtReserveName);

StatsDao sDao = new StatsDao();
List<StatsDto> list = null;
list = sDao.getStats_menu(sDto);
if(menuSeq == 1){
	//list = sDao.getStats_menu1(sDto);
}else if(menuSeq == 2){
	//list = sDao.getStats_menu2(sDto);
}else if(menuSeq == 5){
	//list = sDao.getStats_menu5(sDto);
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.goodjob.util.Utils"%><html>
<head>
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="../css/jquery.ui.all.css">
<script src="../js/jquery-1.6.2.min.js"></script>
<script src="../js/jquery.ui.core.js"></script>
<script src="../js/jquery.ui.widget.js"></script>
<script src="../js/jquery.ui.datepicker.js"></script>
<script src="/js/jquery.ui.datepicker.kr.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="/js/highgardenEditor.js"></script>
<script type="text/javascript">
$(function() {
	$( "#reserveDateStart" ).datepicker({dateFormat:'yy-mm-dd'});
	$( "#reserveDateEnd" ).datepicker({dateFormat:'yy-mm-dd'});
});

function formSubmit(){
	myform.submit();
}
</script>
</head>
<body>
<form id="myform" name="myform" method="post" action="stats_list.jsp">
	<table>
	<tr>
	<td>예약신청일</td>
	<td bgcolor="white" style="padding-left:10px;"><img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
	            <input class="input_box" size="13" id="reserveDateStart" name="reserveDateStart" readonly value="<%=reserveDateStart %>">
	            ~ <img align="absmiddle" src="../images/common/img_calendar.gif" width="15" height="16" border="0">
	            <input class="input_box" size="13" id="reserveDateEnd" name="reserveDateEnd" readonly value="<%=reserveDateEnd %>">
	</td>
	<td rowspan="5" valign=bottom><IMG style="CURSOR: pointer" onclick="formSubmit();return false;" border=0 align=absMiddle src="../images/inc/btn_search2.gif" width=45 height=22></td>
	</tr>
	<tr>
	<td>분류</td>
	<td>
		<select id="regionseq" name="regionseq" size="1">
	              <option value="0">지역선택-------</option>
	<% 
		if (arrRegions != null && !arrRegions.isEmpty()){
			for(int i = 0; i < arrRegions.size();i++){
	%>
		        <option value="<%=arrRegions.get(i).getRegion_seq() %>" <%= arrRegions.get(i).getRegion_seq() == regionSeq? "selected":"" %>><%=arrRegions.get(i).getRegion_name() %></option>
	<%
			}
		}
	%>
		</select>
		<select id="menuSeq" name="menuSeq">
	        <!--  <option value="0" <%= menuSeq == 0? "selected":"" %>>항목선택-------</option>-->
			<option value="1" <%= menuSeq == 1? "selected":"" %>>실시간</option>
			<option value="2" <%= menuSeq == 2? "selected":"" %>>사전예약</option>
			<option value="3" <%= menuSeq == 3? "selected":"" %>>국내 패키지</option>
			<option value="4" <%= menuSeq == 4? "selected":"" %>>국외 패키지</option>
			<option value="5" <%= menuSeq == 5? "selected":"" %>>콘도</option>
		</select>
		인원/팀수 <select id="perNum" name="perNum">
	        <option value="0" <%= perNum == 0? "selected":"" %>>인원선택-------</option>
			<option value="3" <%= perNum == 1? "selected":"" %>>1</option>
			<option value="3" <%= perNum == 2? "selected":"" %>>2</option>
			<option value="3" <%= perNum == 3? "selected":"" %>>3</option>
			<option value="4" <%= perNum == 4? "selected":"" %>>4</option></select>인/1팀
	</td>
	</tr>
	<tr>
	<td>골프장/콘도명</td>
	<td><input type=text id="txtReservePrdtName" name="txtReservePrdtName" value="<%=txtReservePrdtName %>" /></td>
	</tr>
	<tr>
	<td>결제금액</td>
	<td><input type=text id="txtPriceS" name="txtPriceS" value="<%=txtPriceS %>" />원 ~ <input type=text id="txtPriceE" name="txtPriceE" value="<%=txtPriceE %>" />원</td>
	</tr>
	<tr>
	<td>예약자명</td>
	<td><input type=text id="txtReserveName" name="txtReserveName" value="<%=txtReserveName %>" /></td>
	</tr>
	</table>
	</p>
	<table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
	<tr height="23">
	<td bgcolor="#e6e7e8" align="center"><span class=list_title>날짜</span></td>
	<td bgcolor="#e6e7e8" align="center"><span class=list_title>골프장명(패키지,콘도명)</span></td>
	<td bgcolor="#e6e7e8" align="center"><span class=list_title>예약대기건</span></td>
	<td bgcolor="#e6e7e8" align="center"><span class=list_title>예약완료건</span></td>
	<td bgcolor="#e6e7e8" align="center"><span class=list_title>예약취소건</span></td>
	<td bgcolor="#e6e7e8" align="center"><span class=list_title>상품권</span></td>
	<td bgcolor="#e6e7e8" align="center"><span class=list_title>금액</span></td>
	<td bgcolor="#e6e7e8" align="center"><span class=list_title>인원/팀수</span></td>
	</tr>
	<% 
	StatsDto tmpsdto = new StatsDto();
	for (int i = 0; i < list.size(); i++){ 
		tmpsdto.setProcess_status0(tmpsdto.getProcess_status0()+list.get(i).getProcess_status0());
		tmpsdto.setProcess_status1(tmpsdto.getProcess_status1()+list.get(i).getProcess_status1());
		tmpsdto.setProcess_status3(tmpsdto.getProcess_status3()+list.get(i).getProcess_status3());
		tmpsdto.setCoupon_price(tmpsdto.getCoupon_price()+list.get(i).getCoupon_price());
		tmpsdto.setProduct_price(tmpsdto.getProduct_price()+list.get(i).getProduct_price());
		tmpsdto.setPer_num(tmpsdto.getPer_num()+list.get(i).getPer_num());
		
		if(list.get(i).getPackage_name().length() > 0){
			String tmpPackName = list.get(i).getPackage_name().substring(list.get(i).getPackage_name().length()-1,list.get(i).getPackage_name().length());
			if(tmpPackName.equals("+")){
				list.get(i).setPackage_name(list.get(i).getPackage_name().substring(0,list.get(i).getPackage_name().length()-1));
			}
		}
	%>
	<tr>
	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=list.get(i).getReserve_day() %></td>
	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=list.get(i).getGolflink_name()+list.get(i).getPackage_name()+list.get(i).getCondo_name() %></td>
	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=list.get(i).getProcess_status0() %></td>
	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=list.get(i).getProcess_status1() %></td>
	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=list.get(i).getProcess_status3() %></td>
	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=Utils.numberFormat(list.get(i).getCoupon_price()) %></td>
	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=Utils.numberFormat(list.get(i).getProduct_price()) %></td>
	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=list.get(i).getPer_num() %>인/1팀</td>
	</tr>
	<% 
	} 
	%>
	<tr>
	<td bgcolor="#e6e7e8" align="center" height="23"><span class=list_title>합계</span></td>
	<td bgcolor="#e6e7e8" align="center" height="23"></td>
	<td bgcolor="#e6e7e8" align="center" height="23"><span class=list_title><%=tmpsdto.getProcess_status0() %></span></td>
	<td bgcolor="#e6e7e8" align="center" height="23"><span class=list_title><%=tmpsdto.getProcess_status1() %></span></td>
	<td bgcolor="#e6e7e8" align="center" height="23"><span class=list_title><%=tmpsdto.getProcess_status3() %></span></td>
	<td bgcolor="#e6e7e8" align="center" height="23"><span class=list_title><%=Utils.numberFormat(tmpsdto.getCoupon_price()) %></span></td>
	<td bgcolor="#e6e7e8" align="center" height="23"><span class=list_title><%=Utils.numberFormat(tmpsdto.getProduct_price()) %></span></td>
	<td bgcolor="#e6e7e8" align="center" height="23"><span class=list_title><%=tmpsdto.getPer_num() %>인/1팀</span></td>
	</tr>
	</table>
</form>
</body>
</html>