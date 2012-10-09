<%@page import="com.goodjob.product.MonthPriceDao"%>
<%@page import="com.goodjob.product.dto.MonthPriceDto"%>
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
	
	GolfLinkDao gfdao = new GolfLinkDao(); 
	List<GolfLinkCourseDto> glcDto = gfdao.getGolfLinkCourseSelect(Integer.parseInt(glSeq));
	
	String ddlCourseHTML = "<select name='course_list'><option value='0' selected>선택하세요</option>";
	for(int i = 0; i < glcDto.size();i++){
		ddlCourseHTML += "<option value='" + glcDto.get(i).getGolflink_course_seq() +"'>" + glcDto.get(i).getCourse_name() + "</option>";
	}
	ddlCourseHTML += "</select>";

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
prdtDto.setMenu_seq(Integer.parseInt(menuSeq));
prdtDto.setGolflink_seq(Integer.parseInt(glSeq));
prdtDto.setProduct_year(Integer.toString(currYear));
String selectMonth = "0" + Integer.toString(currMonth+1);
selectMonth = selectMonth.substring(selectMonth.length()-2);
prdtDto.setProduct_month(selectMonth);
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

List<MenuViewSiteDto> listSiteSeq = mvsd.getMenuViewSiteList(mvsDto);

String siteSeq = "";
for(int i = 0; i < listSiteSeq.size();i++){
	siteSeq += listSiteSeq.get(i).getSite_seq() +",";
}
if(siteSeq.length() > 0){
	siteSeq = siteSeq.substring(0, siteSeq.length() - 1);
}

/**
 *메뉴골프장월별 - 가격가져오기.
 */
MonthPriceDao mPriceDao = new MonthPriceDao();
MonthPriceDto mPriceDto = new MonthPriceDto();
mPriceDto.setMenu_seq(Integer.parseInt(menuSeq));
mPriceDto.setService_seq(Integer.parseInt(glSeq));
mPriceDto.setYearmonth(currYear+selectMonth);  
List<MonthPriceDto> arrMPDto = mPriceDao.getMonthPrice(mPriceDto); 
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
<title>실시간 골프장 시간 및 가격입력</title>
<link rel="stylesheet" href="../../style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript">
var selDate = "<%= nowDate%>";
function StatusModify(sDate, status){
	var splitDate = sDate.split('/');
	selDate = splitDate[0] + "/" + LenChk(splitDate[1], 2) + "/" + LenChk(splitDate[2], 2);
	
	var prdtseq = $("#date"+sDate.replace('/','').replace('/','')).val();

	$.ajax({
	  url: "/_admin/product/ajax/ajax_product_update.jsp?prdtseq="+prdtseq+"&mnseq=<%=menuSeq%>&glseq=<%=glSeq%>&date="+selDate+"&status="+status,
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
		  url: "/_admin/product/ajax/ajax_product_insert.jsp?mnseq=<%=menuSeq%>&glseq=<%=glSeq%>&date="+selDate,
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
			//StatusModify(selDate, "N");	
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
	  url: "/_admin/product/ajax/ajax_datetimecost_list.jsp?mnseq=<%=menuSeq%>&glseq=<%=glSeq%>&date="+selDate,
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

			addTime(evalData.ProductSub[i].a
					,evalData.ProductSub[i].c
					,evalData.ProductSub[i].d.substring(0,2)
					,evalData.ProductSub[i].d.substring(2,4)
					,evalData.ProductSub[i].f
					,evalData.ProductSub[i].g
					,evalData.ProductSub[i].h
					,evalData.ProductSub[i].i
					,evalData.ProductSub[i].j
					,parseInt(evalData.ProductSub[i].g)+parseInt(evalData.ProductSub[i].j) 
					, vArrSite);
		}
	  }
	});
	
	$("input:text").each(function (i){
		this.value = this.value.replace(/\,/g,"");
		this.value = commify(this.value);
	});
}

function customAddTime(){
	if($("#prdtseq").val().length == 0)	{
		alert("날짜를 선택하세요.");
		return;			
	}
	
	var vPriceN = $("#txtAddPriceN").val();
	var vPriceS = $("#txtAddPriceS").val();
	var vPriceN0 = $("#txtAddPriceN0").val();
	var vPriceS0 = $("#txtAddPriceS0").val();
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
	
	addTime('','0','0','0',vPriceN,vPriceS,'0','1',vPriceN0, vPriceS0, vArrSite);
}

var addTimeCnt = 0;
function addTime(pdsubseq, vCourse, vTimeH, vTimeM, nPrice, sPrice, sStatus, sCoupon, realNhPrice, realNhsPrice, vArrSite){
	var currMD = selDate.split('/');
	var timecostHTML = "";
	
	timecostHTML += "<tr><td bgcolor='white' align='center' width='40' nowrap><input type='hidden' name='pdsubseq' value='" + pdsubseq + "'>"+currMD[1]+"/"+currMD[2]+"</td>"
		+"<td bgcolor='white' align='center' nowrap><%= ddlCourseHTML%></td>"
		+"<td bgcolor='white' align='center' nowrap><select name='course_hour'>"
	for(var i=0;i<24;i++){
		var ih = LenChk(i, 2);
		
		if(ih == vTimeH){
			timecostHTML += "<option value='" + ih + "' selected>" + ih + "</option>";
		}else{
			timecostHTML += "<option value='" + ih + "'>" + ih + "</option>";
		}		
	}
	timecostHTML += "</select>시";
	timecostHTML += "<select name='course_minute'>";
	for(var i=0;i<60;i++){
		var im = LenChk(i, 2);
		
		if(im == vTimeM){
			timecostHTML += "<option value='" + im + "' selected>" + im + "</option>";
		}else{
			timecostHTML += "<option value='" + im + "'>" + im + "</option>";
		}	
	}
	
	var calcRealNhPrice = 0;
	if (sPrice != "") {
		calcRealNhPrice = parseInt(sPrice) + parseInt(realNhPrice);	
	}
	
	timecostHTML += "</select>분 </td>";
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='9' id='courseN' name='courseN' value='" + nPrice + "' ></td>";
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='9' id='courseS"+addTimeCnt+"' name='courseS' value='" + sPrice + "' ></td>";
	if(realNhPrice >= 0){
		timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='9' id='idCourseNh"+addTimeCnt+"' name='courseNH' value='" + realNhPrice + "' style='color:blue' onkeyup=\"autoPriceCalc('courseS"+addTimeCnt+"','idCourseNh"+addTimeCnt+"','courseNH_calc"+addTimeCnt+"');\"></td>";
	}else{
		timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='9' id='idCourseNh"+addTimeCnt+"' name='courseNH' value='" + realNhPrice + "' style='color:red' onkeyup=\"autoPriceCalc('courseS"+addTimeCnt+"','idCourseNh"+addTimeCnt+"','courseNH_calc"+addTimeCnt+"');\"></td>";
	}
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='9' id='courseNH_calc"+addTimeCnt+"' name='courseNH_calc' value='" + realNhsPrice + "' readonly></td>";
	
	var sitePriceN, sitePriceS, sitePriceP;
<% for(int i = 0; i < listMvsd.size(); i++){ %>
	sitePriceN = 0;
	sitePriceS = 0;
	sitePriceP = 0;
	if(vArrSite != null){
		for(var i = 0; i < vArrSite.length;i++){
			if(vArrSite[i][0] == <%=listMvsd.get(i).getSite_seq()%>){
				sitePriceN = vArrSite[i][1];
				sitePriceS = vArrSite[i][2];
				sitePriceP = vArrSite[i][3];				
			}
		}
	}
	if(sitePriceN >= 0){
		timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' id='sitePriceN<%=listMvsd.get(i).getSite_seq() %>_"+addTimeCnt+"' name='sitePriceN<%=listMvsd.get(i).getSite_seq() %>' style='color:blue' value='" + sitePriceN + "' onkeyup=\"autoPriceCalc('courseS"+addTimeCnt+"','sitePriceN<%=listMvsd.get(i).getSite_seq() %>_"+addTimeCnt+"','sitePriceS<%=listMvsd.get(i).getSite_seq() %>_"+addTimeCnt+"');\"></td>";
	}else{
		timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' id='sitePriceN<%=listMvsd.get(i).getSite_seq() %>_"+addTimeCnt+"' name='sitePriceN<%=listMvsd.get(i).getSite_seq() %>' style='color:red' value='" + sitePriceN + "' onkeyup=\"autoPriceCalc('courseS"+addTimeCnt+"','sitePriceN<%=listMvsd.get(i).getSite_seq() %>_"+addTimeCnt+"','sitePriceS<%=listMvsd.get(i).getSite_seq() %>_"+addTimeCnt+"');\"></td>";
	}
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' id='sitePriceS<%=listMvsd.get(i).getSite_seq() %>_"+addTimeCnt+"' name='sitePriceS<%=listMvsd.get(i).getSite_seq() %>' value='" + sitePriceS + "' ></td>";
	if("<%=listMvsd.get(i).getSite_name()%>" == "NH카드"){
		timecostHTML += "<td align='center' bgcolor='white' nowrap><input class='input_box' size='10' name='sitePriceP<%=listMvsd.get(i).getSite_seq() %>' value='" + sitePriceP + "' ></td>";
	}	
<% }%>
	timecostHTML += "<td align='center' bgcolor='white' nowrap><input type='hidden' name='prdtStatus' value='" + sStatus + "' /><input type='checkbox' name='timeItems' /></td>";
	timecostHTML += "<td bgcolor='white' align='center' nowrap><select name='ddl_prdtStatus'>";
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
				timecostHTML += "<option value='" + i + "' " + selectStr + " style='color:red'>예약중</option>";
				break;
			case 2:
				timecostHTML += "<option value='" + i + "' " + selectStr + " style='color:red'>예약마감</option>";
				break;
		}
	}
	timecostHTML += "</select>";
	timecostHTML += "</td> ";
	timecostHTML += "<td bgcolor='white' align='center' nowrap><select name='ddl_couponUse'>"
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
	//timecostHTML += "<IMG style='CURSOR: pointer' border=0 align=absMiddle src='/_admin/images/common/btn_save3.gif' width=28 height=16>"
	timecostHTML += "<td bgcolor='white' align='center' nowrap><IMG border=0 src='../../images/inc/btn_regist2.gif' width=74 height=26 onclick=\"realReserve('"+pdsubseq+"')\"></td>";
	timecostHTML += "</tr>";
	$("#tbTimeCost").append(timecostHTML);
	
	$("#tbTimeCost tr:last-child select[name='course_list']").val(vCourse);
	
	addTimeCnt++;
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
	if(arrCourseN.length > 0){
		blVali = true;
	}
	else{
		if(confirm("등록할 시간이 없습니다. 전체 삭제 하시겠습니까?")){
			frm2.submit();
			return;
		}
	}

	$("input:text").each(function (i){
		this.value = this.value.replace(/\,/g,"");
	});

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
	  url: "/_admin/product/ajax/ajax_productsub_coupon_update.jsp?cpUseYn="+cpUseYn+"&menu=<%=menuSeq%>&glseq=<%=glSeq%>&year=<%=currYear%>&month=<%=currMonth+1%>",
	  cache: false,
	  async: false,
	  success: function(html){
		  alert("수정되었습니다");
		  location.href = "/_admin/product/popup/pop_real_time_reg.jsp?menuseq=<%=menuSeq%>&glseq=<%=glSeq%>";
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
function autoPriceCalc(price1tag, price2tag, resulttag){	
	var a = $("#"+price1tag).val().replace(/\,/g,"");
	if(a.length > 0){
		a = parseInt(a);
	}
	var b = $("#"+price2tag).val().replace(/\,/g,"");
	if(b.length > 0){
		if(b.substring(0,1) == "-"){
			$("#"+price2tag).attr('style', 'color:red');
		}else{
			$("#"+price2tag).attr('style', 'color:blue');
		}
		b = parseInt(b);
	}
	
	$("#"+resulttag).val(commify(a+b));
	
	$("input:text").each(function (i){
		this.value = this.value.replace(/\,/g,"");
		this.value = commify(this.value);
	});
}

function regMonthPrice(){
	$("input:text").each(function (i){
		this.value = this.value.replace(/\,/g,"");
	});
	var arrsiteseq = $("#siteseqs").val().split(",");
	
	var tmpArrPrices = "";
	tmpArrPrices = ":"+$("#txtAddPriceN").val()+":"+$("#txtAddPriceS").val()+":,";
	tmpArrPrices += "0:"+$("#txtAddPriceN0").val()+":"+$("#txtAddPriceS0").val()+":,";
	for(var  i = 0;  i < arrsiteseq.length; i++){
		if($("#txtAddPriceP"+arrsiteseq[i]).val() == undefined){
			tmpArrPrices += arrsiteseq[i]+":"+$("#txtAddPriceN"+arrsiteseq[i]).val()+":"+$("#txtAddPriceS"+arrsiteseq[i]).val()+":,";
		}else{
			tmpArrPrices += arrsiteseq[i]+":"+$("#txtAddPriceN"+arrsiteseq[i]).val()+":"+$("#txtAddPriceS"+arrsiteseq[i]).val()+":"+$("#txtAddPriceP"+arrsiteseq[i]).val()+",";
		}
	}
	if(tmpArrPrices.length > 0){
		tmpArrPrices = tmpArrPrices.substring(0, tmpArrPrices.length-1);
	}

	alert(tmpArrPrices);
	
	$.ajax({
		url: "/_admin/product/ajax/ajax_month_price_set.jsp?menuseq=<%=menuSeq%>&serviceseq=<%=glSeq%>&yearmonth=<%=currYear+selectMonth%>&arrprices="+tmpArrPrices,
		cache: false,
		success: function(html){
			alert("저장 되었습니다");
			 
			$("input:text").each(function (i){
				this.value = this.value.replace(/\,/g,"");
				this.value = commify(this.value);
			});
		}
	});
}

String.prototype.trim = function(){
	return this.replace(/^\s*/,"").replace(/\s*$/,"");
}

function commify(n) {
	  var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	  n += '';                          // 숫자를 문자열로 변환

	  while (reg.test(n))
	    n = n.replace(reg, '$1' + ',' + '$2');

	  return n;
}

function realReserve(pdsubseq){
	if(pdsubseq.length < 1){
		alert("미등록 시간입니다.");
		return;
	}
	var w = 800;
	var h = 600;
	var winl = (screen.width - w) / 2; 
	var wint = (screen.height - h) / 2; 
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars=yes,resizable' 
	win = window.open("popup_real_reserve.jsp?menuseq=<%=menuSeq%>&glseq=<%=glSeq%>&pdsubseq="+pdsubseq, "임의실시간예약", winprops)
}

window.onload = (function(){
	$("input:text").each(function (i){
		this.value = this.value.replace(/\,/g,"");
		this.value = commify(this.value);
	});
});
</script>
</head>
<body>
<form NAME="frm1" METHOD="post" ACTION="pop_real_time_reg_view_ok.jsp">
<input type="hidden" name="changeDate" value="" />
<input type="hidden" name="changeView" value="" />
</form>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="760">
  <tr>
    <td align="center" width="760" class=title>★  <%=golflinkName.length() > 0 ? golflinkName+" ":"" %>실시간 골프장 시간 및 가격입력 ★</td>
  </tr>
  <tr>
    <td height="35" align="center">
    <table border="0" width="740" cellpadding="2" cellspacing="1" >
    <tr>
    <td width="50%" align="left"><input type="checkbox" id="chkAllCoupon" name="chkAllCoupon"><input type="button" id="btnAllCoupon" name="btnAllCoupon" value="상품권 전체적용" onclick="btnAllCouponClick();" > </td>
    <td align="right"><img src="../../images/inc/month_prev.gif"  style="cursor:pointer;" width="41" height="16" border="0" align="absmiddle" onclick="location.href='pop_real_time_reg.jsp?menuseq=<%=menuSeq %>&glseq=<%= glSeq%>&month=<%=currMonth%>&year=<%=currYear%>&action=0'"> &nbsp;<span class=month><%= (currYear) %>년 <%= (currMonth+1) %>월</span> &nbsp;<img align="absmiddle" src="../../images/inc/month_next.gif" width="41" height="16" style="cursor:pointer;" border="0" onclick="location.href='pop_real_time_reg.jsp?menuseq=<%=menuSeq %>&glseq=<%= glSeq%>&month=<%=currMonth%>&year=<%=currYear%>&action=1'"></td>
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
            		if (prdtdto_day.getView_yn().equals("N")){
            %>
                       	<span class=regist_no>예약불가</span>
            <%
                    }else if (prdtdto_day.getView_yn().equals("Y")){
            %>
                       	<span class=regist_yes>예약가능</span>
           	<%
                    }else if (prdtdto_day.getView_yn().equals("1")){
            %>
                       	<span class=regist_no>예약마감</span>
           	<%
                    }else if (prdtdto_day.getView_yn().equals("2")){
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
    <% 
    	String tmpSiteSeqs = "";
	    for(int i = 0; i < listMvsd.size(); i++){
	    	tmpSiteSeqs += listMvsd.get(i).getSite_seq() + ",";
		} 
	  	if(tmpSiteSeqs.length() > 0){
	  		tmpSiteSeqs = tmpSiteSeqs.substring(0, tmpSiteSeqs.length()-1);
	  	}
	%>
    <input type=hidden id="siteseqs" name="siteseqs" value="<%=tmpSiteSeqs%>"/>
<%
	int v1NPrice = 0;
	int v1SPrice = 0;
	int v2NPrice = 0;
	int v2SPrice = 0;
	String Price_style = "blue" ;
	if(arrMPDto.size() > 0){
		for(int k = 0; k < arrMPDto.size(); k++){
			if(arrMPDto.get(k).getSite_seq() == -1){
				v1NPrice = arrMPDto.get(k).getPrice1();
				v1SPrice = arrMPDto.get(k).getPrice2();
			}
			if(arrMPDto.get(k).getSite_seq() == 0){
				if(arrMPDto.get(k).getPrice1() < 0){
					Price_style = "red";
				}
				v2NPrice = arrMPDto.get(k).getPrice1();
				v2SPrice = arrMPDto.get(k).getPrice2();
			}
		}
	}
%>
    	<table id="tbCustomAddTime" name="tbCustomAddTime" border="0" width="745" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
    	<tr>
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		정상가 </br><input type="text" id="txtAddPriceN" name="txtAddPriceN" size="10" value="<%=v1NPrice%>">    		
    	</td>
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		할인가 </br><input type="text" id="txtAddPriceS" name="txtAddPriceS" size="10" value="<%=v1SPrice%>">    		
    	</td>    	
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		NH하나로적용가 </br><input type="text" id="txtAddPriceN0" name="txtAddPriceN0" size="10" value="<%=v2NPrice%>" style="color:<%=Price_style %>"  onkeyup="autoPriceCalc('txtAddPriceS','txtAddPriceN0','txtAddPriceS0');">    		
    	</td>
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		NH하나로가 </br><input type="text" id="txtAddPriceS0" name="txtAddPriceS0" size="10" value="<%=v2SPrice%>" >    		
    	</td>
<% 
	for(int i = 0; i < listMvsd.size(); i++){
		int vNPrice = 0;
		int vSPrice = 0;
		int vPPrice = 0;
		Price_style = "blue" ;
		for(int k = 0; k < arrMPDto.size();k++){
			if(listMvsd.get(i).getSite_seq() == arrMPDto.get(k).getSite_seq()){
				if(arrMPDto.get(k).getPrice1() < 0){
					Price_style = "red";
				}
				vNPrice = arrMPDto.get(k).getPrice1();
				vSPrice = arrMPDto.get(k).getPrice2();
				vPPrice = arrMPDto.get(k).getPrice3();
				break;
			}
		}
%>    	
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		<%=listMvsd.get(i).getSite_name() %>적용가 </br><input type="text" id="txtAddPriceN<%=listMvsd.get(i).getSite_seq() %>" name="txtAddPriceN<%=listMvsd.get(i).getSite_seq() %>" size="10" style="color:<%=Price_style %>"  onkeyup="autoPriceCalc('txtAddPriceS','txtAddPriceN<%=listMvsd.get(i).getSite_seq() %>','txtAddPriceS<%=listMvsd.get(i).getSite_seq() %>');" value="<%=vNPrice %>">    		
    	</td>    	
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		<%=listMvsd.get(i).getSite_name() %>가 </br><input type="text" id="txtAddPriceS<%=listMvsd.get(i).getSite_seq() %>" name="txtAddPriceS<%=listMvsd.get(i).getSite_seq() %>" size="10" value="<%=vSPrice %>" >    		
    	</td>
	<% 	if(listMvsd.get(i).getSite_name().equals("NH카드")){	%>    	
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		<%=listMvsd.get(i).getSite_name() %>적립가 </br><input type="text" id="txtAddPriceP<%=listMvsd.get(i).getSite_seq() %>" name="txtAddPriceP<%=listMvsd.get(i).getSite_seq() %>" size="10" value="<%=vPPrice %>" >    		
    	</td>
	<%	} 	%>
<% } %>
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>
    		추가</br>
    		<IMG border=0 src="../../images/inc/btn_regist2.gif" width=74 height=26 onclick="regMonthPrice();">    		
    	</td>
    	</tr>
    	</table>
		</br>
    <form NAME="frm2" METHOD="post" ACTION="pop_real_time_reg_ok.jsp">
    	<input type="hidden" id="siteSeqs" name="siteSeqs" value="<%=siteSeq %>" >
    	<table id="tbTimeCost" name="tbTimeCost" border="0" width="745" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
        <tr>
          <td bgcolor="#F1F1F1" align="center" height="19" width="40" nowrap>날짜</td>
          <td bgcolor="#F1F1F1" align="center" height="19" nowrap>코스선택 </td>
          <td bgcolor="#F1F1F1" align="center" height="19" width="90" nowrap>시간선택</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="60" nowrap>정상가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="60" nowrap>할인가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="60" nowrap>NH하나로적용가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="60" nowrap>NH하나로가</td>
<% for(int i = 0; i < listMvsd.size(); i++){ %>    
          <td align="center" bgcolor="#F1F1F1" height="19" width="70" nowrap><%=listMvsd.get(i).getSite_name() %>적용가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="70" nowrap><%=listMvsd.get(i).getSite_name() %>가</td>
	<% 	if(listMvsd.get(i).getSite_name().equals("NH카드")){	%>    	
    	<td align="center" bgcolor="#F1F1F1" height="19" width="70" nowrap><%=listMvsd.get(i).getSite_name() %>적립가 </td>    		
    <%	} 	%>
<% } %>	
		<td align="center" bgcolor="#F1F1F1" height="19" nowrap>
          	<img align="absmiddle" src="../../images/inc/btn_plus.gif" style="cursor:pointer;" width="32" height="16" border="0" onclick="customAddTime();">
          	<img src="../../images/inc/btn_del2.gif" style="cursor:pointer;" width="32" height="16" border="0" align="absmiddle" onclick="removeTime();">
          	<!-- <img align="absmiddle" src="../../images/inc/btn_save.gif" width="32" height="16" border="0"> -->
          	<input type="hidden" id="menuseq" name="menuseq" value="<%=menuSeq %>" />
          	<input type="hidden" id="prdtseq" name="prdtseq" value="" />
          	<input type="hidden" name="glseq" value="<%= glSeq%>" />
          	<input type="hidden" name="cpYear" value="<%= currYear%>" />
          	<input type="hidden" name="cpMonth" value="<%= currMonth+1%>" />
		</td>
		<td bgcolor="#F1F1F1" align="center" height="19" width="80" nowrap>마감 </td>
		<td bgcolor="#F1F1F1" align="center" height="19" width="70" nowrap>상품권 </td>		  
    	<td bgcolor="#F1F1F1" align="center" height="19" nowrap>임의등록</td>
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
