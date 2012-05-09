<%@page import="com.goodjob.product.dto.MenuViewSiteDto"%>
<%@page import="com.goodjob.product.MenuViewSiteDao"%>
<%@page import="com.goodjob.product.dto.GolfLinkDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.dto.GolfLinkCourseDto"%>
<%@ page import="com.goodjob.product.dto.ProductDto"%>
<%@ page import="com.goodjob.product.productDao"%>
<%@ page import="com.goodjob.product.GolfLinkDao"%>
<%
String menuSeq = StringUtils.trimToEmpty(request.getParameter("menuseq"));
String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));
String nowDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
int action = 0;  // incoming request for moving calendar up(1) down(0) for month
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth = 0; // same as year

Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();

if (request.getParameter("action") == null) // Check to see if we should set the year and month to the current
{
	currMonth = c.get(c.MONTH);
	currYear = c.get(c.YEAR);
	cal.set(currYear, currMonth,1);
}
else
{
	if (!(request.getParameter("action") == null)) // Hove the calendar up or down in this if block
	{
		currMonth = Integer.parseInt(request.getParameter("month"));
		currYear = Integer.parseInt(request.getParameter("year"));

			if (Integer.parseInt( request.getParameter("action")) == 1 )
			{
				cal.set(currYear, currMonth, 1);
				cal.add(cal.MONTH, 1);
				currMonth = cal.get(cal.MONTH);
				currYear = cal.get(cal.YEAR);
			}
			else
			{
				cal.set(currYear, currMonth ,1);
				cal.add(cal.MONTH, -1);
				currMonth = cal.get(cal.MONTH);
				currYear = cal.get(cal.YEAR);
			}
	}
} 

/**
 * 선택달의 상품정보.
*/
ProductDto prdtDto = new ProductDto();
prdtDto.setMenu_seq(2);
prdtDto.setGolflink_seq(Integer.parseInt(glSeq));
prdtDto.setProduct_year(Integer.toString(currYear));
String selectMonth = "0" + Integer.toString(currMonth+1);
prdtDto.setProduct_month(selectMonth.substring(selectMonth.length()-2));
productDao prdtDao = new productDao();
List<ProductDto> arrPrdt = prdtDao.getProductSelect(prdtDto);

String golflinkName = "";
GolfLinkDao dld = new GolfLinkDao();
List<GolfLinkDto> arrgldto = null;
arrgldto = dld.getGolfLink(Integer.parseInt(glSeq));
if(arrgldto.size() == 1){
	GolfLinkDto gldto = arrgldto.get(0);
	golflinkName = gldto.getGolflink_name();
}

/**
 *관련싸이트 정보 가져오기.
*/
MenuViewSiteDto mvsDto = new MenuViewSiteDto();
mvsDto.setMenu_seq(Integer.parseInt(menuSeq));
mvsDto.setService_seq(Integer.parseInt(glSeq));
MenuViewSiteDao mvsd = new MenuViewSiteDao();
List<MenuViewSiteDto> listMvsd = mvsd.getMenuViewSiteListNHException(mvsDto);

String siteSeq = "";
for(int i = 0; i < listMvsd.size();i++){
	siteSeq += listMvsd.get(i).getSite_seq() +",";
}
if(siteSeq.length() > 0){
	siteSeq = siteSeq.substring(0, siteSeq.length() - 1);
}
%>
<%!
	public ProductDto chkDayFind(List<ProductDto> arrPrdtparam, int day){
		for(int i = 0; i < arrPrdtparam.size();i++){
			ProductDto prdtdto = null;
			prdtdto = arrPrdtparam.get(i);
			if(Integer.parseInt(prdtdto.getProduct_day()) == day){
				return prdtdto;
			}
		}
		return null;
	}
%>
<%!
    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = null;
        c = Calendar.getInstance();
        c.setLenient(false);

        try{
                c.set(y,m,d);
                java.util.Date dt = c.getTime();
        }catch (IllegalArgumentException e) {
                return false;

        }
                return true;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사전 골프장 시간 및 가격입력</title>
<link rel="stylesheet" href="../../style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript">
var selDate = "<%= nowDate%>";

function StatusModify(sDate, status){
	var splitDate = sDate.split('/');
	selDate = splitDate[0] + "/" + LenChk(splitDate[1], 2) + "/" + LenChk(splitDate[2], 2);
	
	var prdtseq = $("#date"+sDate.replace('/','').replace('/','')).val();

	$.ajax({
	  url: "/_admin/product/ajax/ajax_product_update.jsp?prdtseq="+prdtseq+"&mnseq=2&glseq=<%=glSeq%>&date="+selDate+"&status="+status,
	  cache: false,
	  async: false,
	  success: function(html){
		var evalData = eval("("+html+")");
		if(evalData.Product.length == 1){
			var msgStr = "";
			if(evalData.Product[0].c == "1"){
				//alert("마감 되었습니다.");
				$("#date"+evalData.Product[0].b).prev().html("예약마감");
				$("#date"+evalData.Product[0].b).prev().parent().find("span").attr("class", "regist_no");
			}else if(evalData.Product[0].c == "2"){
				//alert("휴장 되었습니다.");
				$("#date"+evalData.Product[0].b).prev().html("휴장");
				$("#date"+evalData.Product[0].b).prev().parent().find("span").attr("class", "regist_no");
			}else if(evalData.Product[0].c == "Y"){
				//alert("예약가능 하게 되었습니다.");
				$("#date"+evalData.Product[0].b).prev().html("예약가능");
				$("#date"+evalData.Product[0].b).prev().parent().find("span").attr("class", "regist_yes");
			}
		}
	  }
	});
}

function selSetting(sDate){	
	var splitDate = sDate.split('/');
	selDate = splitDate[0] + "/" + LenChk(splitDate[1], 2) + "/" + LenChk(splitDate[2], 2);	
	var prdtseq = $("#date"+sDate.replace('/','').replace('/','')).val();
	//상품일련번호.
	if(prdtseq == ""){
		$.ajax({
		  url: "/_admin/product/ajax/ajax_product_insert.jsp?mnseq=2&glseq=<%=glSeq%>&date="+selDate,
		  cache: false,
		  async: false,
		  success: function(html){
			var evalData = eval("("+html+")");
			if(evalData.Product.length == 1){
				//alert("예약가능 하게 되었습니다.");
				$("#date"+evalData.Product[0].b).prev().html("예약가능");
				$("#date"+evalData.Product[0].b).prev().parent().find("span").attr("class", "regist_yes");
				$("#prdtseq").val(evalData.Product[0].a);				
			}
		  }
		});
	}else{
		if($("#date"+sDate.replace("/","").replace("/","")).prev().html() != "예약가능"){
			$("#date"+sDate.replace("/","").replace("/","")).prev().html("예약가능");
			$("#date"+sDate.replace("/","").replace("/","")).prev().attr("class", "regist_yes");
			//StatusModify(selDate, "Y");	
		}		
		$("#prdtseq").val(prdtseq);
	}
	prdtseq = $("#prdtseq").val();
	$("#date"+sDate.replace('/','').replace('/','')).val(prdtseq);

	//초기화
	var arrChkItems = $("input[name='timeItems']");
	if(arrChkItems.length > 0){
		for(var i = arrChkItems.length; i >= 0;i--){
			$("#tbTimeCost tr:eq("+(i+1)+")").remove();
		}
	}

	//ajax호출 - 입력값 확인.
	$.ajax({
	  url: "/_admin/product/ajax/ajax_datetimecost_list.jsp?mnseq=2&glseq=<%=glSeq%>&date="+selDate,
	  cache: false,
	  async: false,
	  success: function(html){
		var evalData = eval("("+html+")");
		for(var i=0;i<evalData.ProductSub.length;i++){
			var vArrSite = null;
			if(evalData.ProductSub[i].k.length > 0){
				vArrSite = new Array(evalData.ProductSub[i].k.length);
				for(var ilstCnt = 0; ilstCnt < vArrSite.length;ilstCnt++){
					vArrSite[ilstCnt] = new Array(3);
					vArrSite[ilstCnt][0] = evalData.ProductSub[i].k[ilstCnt].aa;
					vArrSite[ilstCnt][1] = evalData.ProductSub[i].k[ilstCnt].bb;
					vArrSite[ilstCnt][2] = evalData.ProductSub[i].k[ilstCnt].cc;
					vArrSite[ilstCnt][3] = evalData.ProductSub[i].k[ilstCnt].dd;
				}
			}			
			addTime(evalData.ProductSub[i].a,evalData.ProductSub[i].c,evalData.ProductSub[i].d.substring(0,2),evalData.ProductSub[i].d.substring(2,4),evalData.ProductSub[i].e.substring(0,2),evalData.ProductSub[i].e.substring(2,4),evalData.ProductSub[i].f,evalData.ProductSub[i].g,evalData.ProductSub[i].h,evalData.ProductSub[i].i,evalData.ProductSub[i].j,vArrSite);
			
			var calcVal = document.all['idCourseNh'];
			if (typeof calcVal.length == "undefined") {
				calcVal.onkeyup(calcVal,evalData.ProductSub[i].g);
			} else {
				for (var j=0; j<calcVal.length; j++) {
					calcVal[j].onkeyup(calcVal[j],evalData.ProductSub[j].g);
				}
			}
		}

		//기본행
		addTime('','0','0','0','0','0','0','0','0','1','0',null);
	  }
	});
}

function customAddTime(){
	var vPriceN = $("#txtAddPriceN").val();
	var vPriceS = $("#txtAddPriceS").val();
	var vPriceN0 = $("#txtAddPriceN0").val();
	var vArrSite =new Array(<%=listMvsd.size()%>);
	var iCnt = -1;
	$("#tbCustomAddTime input").each(function(e){
		if(this.name.length > 12 && this.name.substring(12,13)!="0"){
			if(this.name.substring(0,12) == "txtAddPriceN"){
				iCnt++;
				vArrSite[iCnt] = new Array(3);
				vArrSite[iCnt][0] = this.name.replace("txtAddPriceN","");
				vArrSite[iCnt][1] = this.value;
			}
			if(this.name.substring(0,12) == "txtAddPriceS"){
				vArrSite[iCnt][2] = this.value;
			}
			if(this.name.substring(0,12)== "txtAddPriceP"){
				vArrSite[iCnt][3] = this.value;	
			}
		}
	});
	
	addTime('','0','0','0','0','0',vPriceN,vPriceS,'0','1',vPriceN0,vArrSite);
}

function checkNhColor(parm, parmPreVal) {
	if (parmPreVal == "") {
		parmPreVal = 0;
	} else {
		parmPreVal = parseInt(parmPreVal);
	}
	//var inTest = document.getElementById("test1");
	//alert(inTest.style.color);
	if (parm.value.substring(0,1) == "-") {
		parm.style.color = "red";
	} else {
		parm.style.color = "blue";
	}
	var n = parm.value.replace(/\,/g,"");
	var orgN = parseInt(n);
	var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	while (reg.test(n))
		n = n.replace(reg, '$1' + ',' + '$2');
	parm.value = n;
	
	var calcVal = document.all['idCourseNh'];
	var calcResult = document.all['idCourseNhResult'];
	
	if (typeof calcVal.length == "undefined") {
		calcResult.value = parmPreVal + orgN;
		while (reg.test(calcResult.value))
			calcResult.value = calcResult.value.replace(reg, '$1' + ',' + '$2');
	} else {
		for (var i=0; i<calcResult.length; i++) {
			if (calcVal[i] == parm) {
				calcResult[i].value = parmPreVal + orgN;
				while (reg.test(calcResult[i].value))
					calcResult[i].value = calcResult[i].value.replace(reg, '$1' + ',' + '$2');
			}
		}
	}
}
function addTime(pdsubseq, vCourse, vTimeSH, vTimeSM, vTimeEH, vTimeEM, nPrice, sPrice, sStatus, sCoupon, realNhPrice, vArrSite){
	var currMD = selDate.split('/');
	var timecostHTML = "";
	timecostHTML += "<tr><td bgcolor='white' align='center' width='40' nowrap><input type='hidden' name='pdsubseq' value='" + pdsubseq + "'>"+currMD[1]+"/"+currMD[2]+"</td>"
		+"<td bgcolor='white' align='center' nowrap><select name='course_S_hour'>"
	for(var i=0;i<24;i++){
		var ih = LenChk(i, 2);
		
		if(ih == vTimeSH){
			timecostHTML += "<option value='" + ih + "' selected>" + ih + "</option>";
		}else{
			timecostHTML += "<option value='" + ih + "'>" + ih + "</option>";
		}		
	}
	timecostHTML += "</select>시";
	timecostHTML += "<select name='course_S_minute'>";
	for(var i=0;i<60;i++){
		var im = LenChk(i, 2);
		
		if(im == vTimeSM){
			timecostHTML += "<option value='" + im + "' selected>" + im + "</option>";
		}else{
			timecostHTML += "<option value='" + im + "'>" + im + "</option>";
		}	
	}  
	timecostHTML += "</select>분 ~ <select name='course_E_hour'>"
		for(var i=0;i<24;i++){
			var ih = LenChk(i, 2);
			
			if(ih == vTimeEH){
				timecostHTML += "<option value='" + ih + "' selected>" + ih + "</option>";
			}else{
				timecostHTML += "<option value='" + ih + "'>" + ih + "</option>";
			}		
		}
		timecostHTML += "</select>시";
		timecostHTML += "<select name='course_E_minute'>";
		for(var i=0;i<60;i++){
			var im = LenChk(i, 2);
			
			if(im == vTimeEM){
				timecostHTML += "<option value='" + im + "' selected>" + im + "</option>";
			}else{
				timecostHTML += "<option value='" + im + "'>" + im + "</option>";
			}	
		}  
	timecostHTML += "</select>분</td>";
	var calcRealNhPrice = 0;
	if (sPrice != "") {
		calcRealNhPrice = parseInt(sPrice) + parseInt(realNhPrice);	
	}
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' name='courseN' value='" + nPrice + "' ></td>";
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' name='courseS' value='" + sPrice + "' ></td>";
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='9' name='courseNH' id='idCourseNh' value='" + realNhPrice + "'  style='color:blue' onkeyup='javascript:checkNhColor(this,"+sPrice+");'></td>";
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='9' name='courseNH_calc' id='idCourseNhResult' value='" + calcRealNhPrice + "' readonly></td>";
	
	var sitePriceN, sitePriceS, sitePriceP;
	<% for(int i = 0; i < listMvsd.size(); i++){ %>
		sitePriceN = "";
		sitePriceS = "";
		sitePriceP = "";
		if(vArrSite != null){
			for(var i = 0; i < vArrSite.length;i++){
				if(vArrSite[i][0] == <%=listMvsd.get(i).getSite_seq()%>){
					sitePriceN = vArrSite[i][1];
					sitePriceS = vArrSite[i][2];
					sitePriceP = vArrSite[i][3];				
				}
			}
		} 
		timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' name='sitePriceN<%=listMvsd.get(i).getSite_seq() %>' value='" + sitePriceN + "' ></td>";
		timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' name='sitePriceS<%=listMvsd.get(i).getSite_seq() %>' value='" + sitePriceS + "' ></td>";
		if("<%=listMvsd.get(i).getSite_name()%>" == "NH카드"){
			timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' name='sitePriceP<%=listMvsd.get(i).getSite_seq() %>' value='" + sitePriceP + "' ></td>";
		}	
	<% }%>
	timecostHTML += "<td align='center' bgcolor='white'><input type='hidden' name='prdtStatus' value='" + sStatus + "' /><input type='checkbox' name='timeItems' /></td>";
	timecostHTML += "<td bgcolor='white' align='center'><select name='ddl_prdtStatus'>"
		for(var i = 0; i < 3;i++){
			var selectStr = "";
			if(sStatus == i){
				selectStr = "selected";
			}
			switch(i){
				case 0:
					timecostHTML += "<option value='" + i + "' " + selectStr + ">예약가능</option>";
					break;
				case 1:
					timecostHTML += "<option value='" + i + "' " + selectStr + ">예약중</option>";
					break;
				case 2:
					timecostHTML += "<option value='" + i + "' " + selectStr + ">예약마감</option>";
					break;
			}
		}
	timecostHTML += "</select>";
	timecostHTML += "</td> ";
	timecostHTML += "<td bgcolor='white' align='center'><select name='ddl_couponUse'>";
	for(var i = 0; i < 2;i++){
		var selectStr = "";
		if(sCoupon == i){
			selectStr = "selected";
		}
		switch(i){
			case 0:
				timecostHTML += "<option value='" + i + "' " + selectStr + ">미적용</option>";
				break;
			case 1:
				timecostHTML += "<option value='" + i + "' " + selectStr + ">적용</option>";
				break;
		}
	}	
	timecostHTML += "</select>";
	timecostHTML += "</td> ";
	timecostHTML += "</tr>";
	$("#tbTimeCost").append(timecostHTML);

	$("#tbTimeCost tr:last-child select[name='course_list']").val(vCourse);
}
function removeTime(){
	var arrChkItems = $("input[name='timeItems']");
	var arrtmPrdtStatus = $("input[name='prdtStatus']");
	for(var i = arrChkItems.length - 1; i >= 0;i--){
		if(arrChkItems[i].checked){
			if(arrtmPrdtStatus[i].value == "1"){
				alert("예약중 고객이 있습니다.");
			}else if(arrtmPrdtStatus[i].value == "2"){
				alert("예약마감된 고객이 있습니다.");
			}else{
				$("#tbTimeCost tr:eq("+(i+1)+")").remove();
			}
		}
	}
}

var regClick = false;
function saveTime(){
	if($("#prdtseq").val().length == 0)	{
		alert("날짜를 선택하세요.");
		return;			
	}
	//클릭은 한번만.
	if(regClick){
		return;
	}
	regClick = true;
	
	var blVali = false;
	var arrCourseN = $("input[name='courseN']");

	var delchkStr = "";
	/*
	for(var i = 0; i < arrCourseN.length;i++){
		if(arrCourseN[i].value.length > 0){
			blVali = true;
		} 
	}
	*/	
	if(arrCourseN.length > 0){
		blVali = true;
	}
	else{
		if(confirm("등록할 시간이 없습니다. 전체 삭제 하시겠습니까?")){
			frm2.submit();
			return;
		}
	}
	
	var calcVal = document.all['idCourseNh'];
	var calcResult = document.all['idCourseNhResult'];
	
	if (typeof calcResult.length == "undefined") {
		calcResult.value = calcResult.value.replace(/\,/g,"");
	} else {
		for (var i=0; i<calcResult.length; i++) {
			calcResult[i].value = calcResult[i].value.replace(/\,/g,"");
		}
	}
	if (typeof calcVal.length == "undefined") {
		calcVal.value = calcVal.value.replace(/\,/g,"");
	} else {
		for (var i=0; i<calcVal.length; i++) {
			calcVal[i].value = calcVal[i].value.replace(/\,/g,"");
		}
	}
	
	if(blVali){
		frm2.submit();
	}else{
		regClick = false;
		alert("등록한 최신 정보를 입력하지 않으셨습니다.");
	}
}
function btnAllCouponClick(){
	var cpUseYn = 0;
	if($("#chkAllCoupon").attr("checked")){
		cpUseYn = 1;
		if(!window.confirm("상품권을 전체 '적용'하시겠습니까?")){
			return;
		}
	}else{
		if(!window.confirm("상품권을 전체 '미적용'하시겠습니까?")){
			return;
		}		
	}
	$.ajax({
	  url: "/_admin/product/ajax/ajax_productsub_coupon_update.jsp?cpUseYn="+cpUseYn+"&menu=2&glseq=<%=glSeq%>&year=<%=currYear%>&month=<%=currMonth+1%>",
	  cache: false,
	  async: false,
	  success: function(html){
		  alert("수정되었습니다");
		  location.href = "/_admin/product/popup/pop_real_time_reg.jsp?menuseq=2&glseq=<%=glSeq%>";
	  }
	});
}
function prdtViewChange(cDate, cValue){
	$("#changeDate").val(cDate);
	$("#changeView").val(cValue);
	frm1.submit();
}
function LenChk(inval, n){
	var tmp = "00000" + inval;
	var len = tmp.length;
	return (tmp.substring(len - n, len));
}
String.prototype.trim = function(){
	return this.replace(/^\s*/,"").replace(/\s*$/,"");
}
</script>
</head>
<body>
<form NAME="frm1" METHOD="post" ACTION="pop_real_time_reg_view_ok.jsp">
<input type="hidden" name="changeDate" value="" />
<input type="hidden" name="changeView" value="" />
</form>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="760">
  <tr>
    <td align="center" width="760" class=title>★ <%=golflinkName.length() > 0 ? golflinkName+" ":"" %>사전 골프장 시간 및 가격입력 ★</td>
  </tr>
  <tr>
    <td height="35" align="center">
    <table border="0" width="740" cellpadding="2" cellspacing="1" >
    <tr>
    <td width="50%" align="left"><input type="checkbox" id="chkAllCoupon" name="chkAllCoupon"><input type="button" id="btnAllCoupon" name="btnAllCoupon" value="상품권 전체적용" onclick="btnAllCouponClick();" > </td>
    <td align="right"><img src="../../images/inc/month_prev.gif" style="cursor:pointer;" width="41" height="16" border="0" align="absmiddle" onclick="location.href='pop_pre_time_reg.jsp?menuseq=2&glseq=<%= glSeq%>&month=<%=currMonth%>&year=<%=currYear%>&action=0'"> &nbsp;<span class=month><%= (currYear) %>년 <%= (currMonth+1) %>월</span> &nbsp;<img align="absmiddle" src="../../images/inc/month_next.gif" width="41" height="16" style="cursor:pointer;" border="0" onclick="location.href='pop_pre_time_reg.jsp?menuseq=2&glseq=<%= glSeq%>&month=<%=currMonth%>&year=<%=currYear%>&action=1'"></td>
    </tr>
    </table>    
    </td>    
  </tr>
  <tr>
    <td align="center"><table border="0" width="740" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
        <tr>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=sunday>일요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>월요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>화요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>수요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>목요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>금요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=saturday>토요일</span></td>
        </tr>
<%
//'Calendar loop

	int currDay;
	String todayColor;
	int count = 1;
	int dispDay = 1;

	for (int w = 1; w < 7; w++)
	{
		if(w == 6 && !isDate( currMonth + 1, dispDay, currYear)){
			break;
		}
%>
<tr>
<% 
  		for (int d = 1; d < 8; d++)
		{
			if (! (count >= cal.get(c.DAY_OF_WEEK)))
			{ 
%>
		<td bgcolor="white" align="center">
<%
				count += 1;
			} 
			else
			{
				if (isDate( currMonth + 1, dispDay, currYear)) // use the isDate method
				{ 

					if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)) // Here we check to see if the current day is today
       				{
						todayColor = "#6C7EAA";
					}
					else
					{
						todayColor = "#ffffff";
					}
%> 
		<td bgcolor="white" align="center">
			<table border="0" width="97%" cellpadding="0" cellspacing="0">
           	<tr>
            <td height="20" width="35">
            <% if (d == 1){ %>
            	<span class=sunday><%= (currMonth+1) + "/" + dispDay%></span>
            <% }else if(d == 7){ %>
            	<span class=saturday><%= (currMonth+1) + "/" + dispDay%></span>
            <% }else{ %>
            	<span class=day><%= (currMonth+1) + "/" + dispDay%></span>
            <% } %>
            </td>
            <%
            	ProductDto prdtdto_day = new ProductDto();
            	prdtdto_day = chkDayFind(arrPrdt, dispDay);
            %>
            <td height="20" align="center" width="65">
            <%
	            //N : 예약불가
	            //Y : 예약가능
	            //1 : 마감
	            //2 : 휴장
	            String prdtSeq_day = "";
            	if (prdtdto_day == null){
            %>
            	<span class=regist_no>예약불가</span>
            <%
            	}else{
            		prdtSeq_day = Integer.toString(prdtdto_day.getProduct_seq());
            		if (prdtdto_day.getView_yn().startsWith("N")){
            %>
                       	<span class=regist_no>예약불가</span>
            <%
                    }else if (prdtdto_day.getView_yn().startsWith("Y")){
            %>
                       	<span class=regist_yes>예약가능</span>
           	<%
                    }else if (prdtdto_day.getView_yn().startsWith("1")){
            %>
                       	<span class=regist_no>예약마감</span>
           	<%
                    }else if (prdtdto_day.getView_yn().startsWith("2")){
            %>
                       	<span class=regist_no>휴장</span>
            <%            
                    }
            	}
            %>
            <%
	            String ttYear = Integer.toString(currYear);
				String ttMonth = "0" + Integer.toString(currMonth+1);
				ttMonth = ttMonth.substring(ttMonth.length()-2);
				String ttDay = "0" + Integer.toString(dispDay);
				ttDay = ttDay.substring(ttDay.length()-2);
				String ttDate = ttYear + ttMonth + ttDay;
            %>
            	<input type="hidden" id="date<%=ttDate%>" value="<%=prdtSeq_day%>" />
            </td>
           	</tr>
           	<tr>
            <td align="center" colspan="2">
            	<table border="0" width="97%" cellpadding="0" cellspacing="0">
	            <tr>
	            <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0" style="cursor:pointer;" onclick="StatusModify('<%=ttYear + "/" + ttMonth + "/" + ttDay%>', '1')"></td>
	            <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0" style="cursor:pointer;" onclick="StatusModify('<%=ttYear + "/" + ttMonth + "/" + ttDay%>', '2')"></td>
	            <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle" onclick="selSetting('<%=ttYear + "/" + ttMonth + "/" + ttDay%>');" style="cursor:pointer;"></td>
	            </tr>
	            </table>
	        </td>
           	</tr>
         	</table>
		</td>
<%
					count += 1;
					dispDay += 1;
				}
				else
				{
%>					
		<td bgcolor="white" align="center">
			<table border="0" width="97%" cellpadding="0" cellspacing="0">
           	<tr>
            <td height="20" width="35"><span class=day></span></td>
            <td height="20" align="center" width="65"></span></td>
           	</tr>
           	<tr>
            <td align="center" colspan="2">
            	<table border="0" width="97%" cellpadding="0" cellspacing="0">
	            <tr>
	            <td align="center" height="20"></td>
	            <td align="center"></td>
	            <td align="center"></td>
	            </tr>
	            </table>
	        </td>
           	</tr>
         	</table>
		</td>
<%
				} 
			}
       } 
%>
</tr>
<% 
}
%>
</table>
</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center">
    	<table id="tbCustomAddTime" name="tbCustomAddTime" border="0" width="745" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
    	<tr>
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		정상가 </br><input type="text" id="txtAddPriceN" name="txtAddPriceN" size="10" value="0">    		
    	</td>
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		할인가 </br><input type="text" id="txtAddPriceS" name="txtAddPriceS" size="10" value="0">    		
    	</td>    	
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		NH하나로농협가 </br><input type="text" id="txtAddPriceN0" name="txtAddPriceN0" size="10" value="0" >    		
    	</td>	
<% for(int i = 0; i < listMvsd.size(); i++){ %>    	
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		<%=listMvsd.get(i).getSite_name() %>적용가 </br><input type="text" id="txtAddPriceN<%=listMvsd.get(i).getSite_seq() %>" name="txtAddPriceN<%=listMvsd.get(i).getSite_seq() %>" size="10" >    		
    	</td>    	
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		<%=listMvsd.get(i).getSite_name() %>가 </br><input type="text" id="txtAddPriceS<%=listMvsd.get(i).getSite_seq() %>" name="txtAddPriceS<%=listMvsd.get(i).getSite_seq() %>" size="10" >    		
    	</td>
	<% 	if(listMvsd.get(i).getSite_name().equals("NH카드")){	%>    	
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		<%=listMvsd.get(i).getSite_name() %>적립가 </br><input type="text" id="txtAddPriceP<%=listMvsd.get(i).getSite_seq() %>" name="txtAddPriceP<%=listMvsd.get(i).getSite_seq() %>" size="10" >    		
    	</td>
	<%	} 	%>
<% } %>
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		<IMG border=0 src="../../images/inc/btn_regist2.gif" width=74 height=26 onclick="customAddTime();">    		
    	</td>
    	</tr>
    	</table>
		</br>
    <form NAME="frm2" METHOD="post" ACTION="pop_pre_time_reg_ok.jsp">
    	<input type="hidden" id="siteSeqs" name="siteSeqs" value="<%=siteSeq %>" >
    	<table id="tbTimeCost" name="tbTimeCost" border="0" width="745" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
        <tr>
          <td bgcolor="#F1F1F1" align="center" height="19" width="40" nowrap>날짜</td>
          <td bgcolor="#F1F1F1" align="center" height="19" nowrap>시간선택 </td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="60" nowrap>정상가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="60" nowrap>할인가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="60" nowrap>NH하나로농협가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="60" nowrap>NH하나로가</td>
<% for(int i = 0; i < listMvsd.size(); i++){ %>    
          <td align="center" bgcolor="#F1F1F1" height="19" width="70" nowrap><%=listMvsd.get(i).getSite_name() %>적용가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="70" nowrap><%=listMvsd.get(i).getSite_name() %>가</td>
	<% 	if(listMvsd.get(i).getSite_name().equals("NH카드")){	%>    	
    	<td align="center" bgcolor="#F1F1F1" height="19" width="70" nowrap><%=listMvsd.get(i).getSite_name() %>적립가 </td>    		
    <%	} 	%>
<% } %>	
          <td align="center" bgcolor="#F1F1F1" height="19" width="80" nowrap>
          	<img align="absmiddle" src="../../images/inc/btn_plus.gif" style="cursor:pointer;" width="32" height="16" border="0" onclick="addTime('','0','0','0','0','0','0','0','0','1','0',null);">
          	<img src="../../images/inc/btn_del2.gif" style="cursor:pointer;" width="32" height="16" border="0" align="absmiddle" onclick="removeTime();">
          	<!-- <img align="absmiddle" src="../../images/inc/btn_save.gif" width="32" height="16" border="0"> -->
          	<input type="hidden" id="menuseq" name="menuseq" value="<%=menuSeq %>" />
          	<input type="hidden" id="prdtseq" name="prdtseq" value="" />
          	<input type="hidden" name="glseq" value="<%= glSeq%>" />
          	<input type="hidden" name="cpYear" value="<%= currYear%>" />
          	<input type="hidden" name="cpMonth" value="<%= currMonth+1%>" />
		  </td>
		  <td bgcolor="#F1F1F1" align="center" height="19" width="62" nowrap>마감 </td>
		  <td bgcolor="#F1F1F1" align="center" height="19" width="70" nowrap>상품권 </td>
        </tr>
      	</table>
    </form>
    </td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><img align="absmiddle" src="../../images/inc/btn_regist2.gif" style="cursor:pointer;" width="74" height="26" border="0" onclick="saveTime();"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="bottom"><a href="javascript:self.close();"><img align="absmiddle" src="../../images/inc/btn_del.gif" width="13" height="14" border="0"></a></td>
  </tr>
</table>
</body>
</html>