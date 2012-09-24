<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.ObjectUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="com.goodjob.reserve.dto.ProductDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkPriceDto"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.product.dto.ProductSubSiteDto"%>
<%@page import="com.goodjob.util.Utils"%>
<%!
	public boolean indexOf(String str , String... strings){
		for(String temp : strings){
			if(str.indexOf(temp)>-1)
				return true;
		}
		return false;
	}
%>
<%
	int menuNum = NumberUtils.toInt(request.getParameter("menu"),1);
	String user_Name = StringUtils.trimToEmpty((String)session.getAttribute("mem_name"));
	String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));

	String golfSeq = Integer.toString(NumberUtils.toInt(request.getParameter("golf"),0));
	String curDate = Integer.toString(NumberUtils.toInt(request.getParameter("cdate"),0));
	if(curDate == null || curDate.length() != 8){
		out.print("<script>");
		out.print("location.href='default.jsp&';");
		out.print("</script>");
		return;
	}
	
	//골프장상세정보.
	GolfLinkDao glDao = new GolfLinkDao();
	List<GolfLinkDto> listGolf = glDao.getGolfLinkDetail(Integer.parseInt(golfSeq));
	if(listGolf == null || listGolf.size() != 1){
		out.print("<script>");
		out.print("location.href='default.jsp&';");
		out.print("</script>");
		return;
	}
	GolfLinkDto glDto = listGolf.get(0);
	
	String imgSubPath1 = glDto.getImg_sub1();
	if(imgSubPath1.length() != 0){
		imgSubPath1 = "/upload/" + imgSubPath1;
	}else{
		imgSubPath1 = "../images/common/img_thumb_ready.jpg";
	}
	String imgSubPath2 = glDto.getImg_sub2();
	if(imgSubPath2.length() != 0){
		imgSubPath2 = "/upload/" + imgSubPath2;
	}else{
		imgSubPath2 = "../images/common/img_thumb_ready.jpg";
	}
	String imgSubPath3 = glDto.getImg_sub3();
	if(imgSubPath3.length() != 0){
		imgSubPath3 = "/upload/" + imgSubPath3;
	}else{
		imgSubPath3 = "../images/common/img_thumb_ready.jpg";
	}
	String imgSubPath4 = glDto.getImg_sub4();
	if(imgSubPath4.length() != 0){
		imgSubPath4 = "/upload/" + imgSubPath4;
	}else{
		imgSubPath4 = "../images/common/img_thumb_ready.jpg";
	}
	
	//가격정보.
	List<GolfLinkPriceDto> listGolfPrice = glDao.getGolfLinkPrice(Integer.parseInt(golfSeq));
	String[] priceInfo = {"0","0","0","0","0","0","0","0","0","0","0","0"};
	for(int i = 0; i < listGolfPrice.size();i++){
		
		String index = (i+1)+"";
		if(listGolfPrice.get(i).getPrice_type().equals(index)){
			priceInfo[i] = ObjectUtils.toString(listGolfPrice.get(i).getGolflink_price(),"0");
		}
	}
	
	//파라메터 날짜체크.
	Calendar vCalendar = Calendar.getInstance();
	String strDate = request.getParameter("date");
	int tYear;
	int tMonth;
	int tDay;
	if(strDate == null || strDate.length() != 8){
		strDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	
		tYear = Integer.parseInt(strDate.substring(0,4));
		tMonth = Integer.parseInt(strDate.substring(4,6));
		tDay = Integer.parseInt(strDate.substring(6,8));
	}else{
		tYear = Integer.parseInt(strDate.substring(0,4));
		tMonth = Integer.parseInt(strDate.substring(4,6));
		tDay = Integer.parseInt(strDate.substring(6,8));
		
		vCalendar.set(tYear, tMonth-1, tDay);
	}
	
	vCalendar.add(vCalendar.DATE, -14);
	
	String tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
	String tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
	String tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));
	
	//이전날짜.
	String preDate = tmYear
				+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
				+ tmDay.substring(tmDay.length()-2, tmDay.length());
	
	vCalendar.add(vCalendar.DATE, 28);
	
	tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
	tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
	tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));
	
	//현재날짜.
	String sDate = strDate;
	//다음날짜.
	String eDate = tmYear
				+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
				+ tmDay.substring(tmDay.length()-2, tmDay.length());
	
	//2주 예약가능리스트
	ProductDto pDto = new ProductDto();
	pDto.setGolflink_seq(glDto.getGolflink_seq());
	pDto.setProduct_startDate(sDate);
	pDto.setProduct_endDate(eDate);
	List<ProductDto> listPrdt = glDao.getGolfProductList(pDto);
	
	//시작일 설정.
	Calendar incDate = Calendar.getInstance();
	incDate.set(tYear, tMonth-1, tDay);
	
	//선택날짜 예약리스트 가져오기.
	ProductReserveDto prDto = new ProductReserveDto();
	prDto.setGolflink_seq(Integer.parseInt(golfSeq));
	prDto.setProduct_date(curDate);
	List<ProductReserveDto> listPr = glDao.getGolfProduct(prDto);
	
	String[] eMail = (user_Id!=null)? user_Id.split("@") : null;
	String eMail1 = "";
	String eMail2 = "";
	if(eMail != null && eMail.length == 2){
		eMail1 = eMail[0];
		eMail2 = eMail[1];
	}
	
	String strNowDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	int intNowDate = Integer.parseInt(strNowDate);
	
	/* ----- 쿠폰 ----- */
	CouponDao cpDao = new CouponDao();
	List<CouponDto> couponList = cpDao.getUserCouponList(user_Id, "0", true);
%>
<style type="text/css">
#dhtmltooltip {
	position: absolute;
	left: -300px;
	width: 300px;
	border: 1px solid black;
	padding: 3px;
	background-color: lightyellow;
	visibility: hidden;
	z-index: 100;
filter: progid:DXImageTransform.Microsoft.Shadow(color=gray, direction=135);
}
#dhtmlpointer {
	position:absolute;
	left: -300px;
	z-index: 101;
	visibility: hidden;
}
</style>
<script type="text/javascript">
<!---//
function DisplayMenu(vIdx){
	$("#imgtap1").attr("src", "../images/booking/btn_tab_off_05.gif");
	$("#imgtap2").attr("src", "../images/booking/btn_tab_off_02.gif");
	$("#imgtap3").attr("src", "../images/booking/btn_tab_off_03.gif");
	$("#imgtap4").attr("src", "../images/booking/btn_tab_off_04.gif"); 
	$("#destap1").hide();
	$("#destap2").hide();
	$("#destap3").hide();
	$("#destap4").hide();
	
	switch(vIdx){
		case 1:
			$("#imgtap1").attr("src", "../images/booking/btn_tab_on_05.gif"); 
			$("#destap1").show();
			break;
		case 2:
			$("#imgtap2").attr("src", "../images/booking/btn_tab_on_02.gif");
			$("#destap2").show(); 
			break;
		case 3:
			$("#imgtap3").attr("src", "../images/booking/btn_tab_on_03.gif");
			$("#destap3").show(); 
			break;
		case 4:
			$("#imgtap4").attr("src", "../images/booking/btn_tab_on_04.gif");
			$("#ifrmMap").attr("src", "/forGolfbooking/ifrm_map.jsp?x=<%=glDto.getPoint_x()%>&y=<%=glDto.getPoint_y()%>");
			$("#destap4").show(); 
			break;
	}
	//subAutoResizeIFrame();
}

function nextResDate(){
	location.href = "/NH_Card/detail.jsp?menu=2&golf=<%=golfSeq%>&date=<%=eDate%>&cdate=<%=curDate%>";
	return false;
}

function preResDate(){
	location.href = "/NH_Card/detail.jsp?menu=2&golf=<%=golfSeq%>&date=<%=preDate%>&cdate=<%=curDate%>";
}

function selectGolfLink(){
	$("#ddlTimeTerm option:selected").each(function(){
		$("#selectTime").val($(this).text().replace("선택하세요",""));
	});
	var tmpPerCnt = $("#ddlPersonCnt").val();
	var tmpOptions = $("#ddlTimeTerm").val();
	var tmpOption = tmpOptions.split("/");

	//alert(tmpOption[0]);
	$("#txtBillPrice").text(commify(tmpPerCnt*tmpOption[1]));
	$("#billPrice").text(commify(tmpPerCnt*tmpOption[1]));
	$("#personCnt").val($("#ddlPersonCnt").val());
	
	$("#psId").val(tmpOption[0]);

	var result = site_save_price(tmpOption[0] , tmpPerCnt);
	$("#totSavePrice").text(commify(result*tmpPerCnt));
		
}

function site_save_price(product_seq , perCnt){

	var price = "";
	$.ajax({
		url: "/NH_Card/ajax_save_price.jsp?product_seq="+product_seq,
		cache: false,
		async: false,
		success: function(result){
			price = result;
			$("#savePrice").text(commify(result*perCnt));
			$("#reserveSavePrice").val(result);
			
		}
	});

	return price;
}

function selectCoupon(){
	var tmpPerCnt = $("#ddlPersonCnt").val();
	var tmpOptions = $("#ddlTimeTerm").val();
	var tmpOption = tmpOptions.split("/");

	//var tmpCoupons = $("#ddlCoupon").val();
	var tmpCoupon = tmpCoupons.split("/");
	var couponPrice = 0;
	if(tmpCoupon.length > 1){
		couponPrice = tmpCoupon[1];
	}
	$("#billPrice").text(commify(tmpPerCnt*tmpOption[1]-couponPrice));
}

function reserveSubmit(){
	$("#menu").val("2");
	$("#golf").val('<%=request.getParameter("golf")%>');
	$("#date").val('<%=request.getParameter("date")%>');
	$("#cdate").val('<%=request.getParameter("cdate")%>');

	var rCnt = $("#personCnt").val();
	if(rCnt.length == 0){
		alert("인원을 선택하세요.");
		return false;
	}
	var rTeam = $("#teamCnt").val();
	if(rTeam.length == 0){
		alert("팀을 선택하세요.");
		return false;
	}
	var rDate = $("#selectDate").val();
	if(rDate.length == 0){
		alert("날짜를 선택하세요.");
		return false;
	}
	var rTime = $("#selectTime").val();
	if(rTime.length == 0){
		alert("시간대를 선택하세요.");
		return false;
	}
	var rName = $("#reserveUName").val();
	if(rName.length == 0){
		alert("예약자이름을 입력하세요.");
		return false;
	}
	var rPhone = $("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val();
	if($("#phone1").val().length == 0 || $("#phone2").val().length < 3 || $("#phone3").val().length != 4){
		alert("핸드폰을 입력하세요.");
		return false;
	}
	/*
	var rEmail = $("#email1").val()+"@"+$("#email2").val();
	if($("#email1").val().length == 0 && $("#email2").val().length == 0){
		alert("E-Mail을 입력하세요.");
		return false;
	}
	*/
	var rRequestContent = $("#requestContent").val();
	
	$("#reserveCnt").val(rCnt);
	$("#reserveTeam").val(rTeam);
	$("#reserveDate").val(rDate);
	$("#reserveTime").val(rTime);

	//$("#reserveCoupon").val($("#ddlCoupon").val().split("/")[0]);
	
	$("#reserveName").val(rName);	
	$("#reservePhone").val(rPhone);	
	//$("#reserveEmail").val(rEmail);	
	$("#reserveRequest").val(rRequestContent);	
	frm.submit();
}

function emaildomain(){
	$("#email2").val($("#ddlEmail").val());
}

function imgChange(objId){
	$("#imgmain").attr("src", objId.src);
}

function commify(n) {
  var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
  n += '';                          // 숫자를 문자열로 변환

  while (reg.test(n))
    n = n.replace(reg, '$1' + ',' + '$2');

  return n;
}

$(function(){
	$("#chkRealName").click(function(){		
		if(this.checked){
			document.getElementById("reserveUName").readOnly = true;
			$("#reserveUName").val("<%=user_Name%>");
		}else{
			document.getElementById("reserveUName").readOnly = false;
			$("#reserveUName").val("");
		}
	});
});

function sel_phone1(){
	$("#phone2").focus();
}

function sel_phone2(){
	var ph_num = $("#phone2").val();
	if(ph_num.length >= 4){
		$("#phone3").focus();
	}
}

//--->
</script>
<FORM NAME="frm" METHOD="post" ACTION="rule.jsp">
  <input type="hidden" id="menu" name="menu" value="2" >
  <input type="hidden" id="psId" name="psId">
  <input type="hidden" id="golf" name="golf" >
  <input type="hidden" id="date" name="date" >
  <input type="hidden" id="cdate" name="cdate" >
  <input type="hidden" id="reserveCnt" name="reserveCnt">
  <input type="hidden" id="reserveTeam" name="reserveTeam">
  <input type="hidden" id="reserveDate" name="reserveDate">
  <input type="hidden" id="reserveTime" name="reserveTime">
  <input type="hidden" id="reserveCoupon" name="reserveCoupon">
  <input type="hidden" id="reserveName" name="reserveName">
  <input type="hidden" id="reservePhone" name="reservePhone">
  <input type="hidden" id="reserveEmail" name="reserveEmail">
  <input type="hidden" id="reserveRequest" name="reserveRequest">
  <input type="hidden" id="reserveSavePrice" name="reserveSavePrice">
</FORM>
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">사전신청예약</td>
          <td width="50%" height="25" bgcolor="#DCDDDE" style="padding-top:4px; padding-right: 10px;" align="right"><a href="default.jsp"><img align="absmiddle" src="../img_nhcard/common/btn_home.gif" width="60" height="19" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="295" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="274" bgcolor="white">
              <tr>
                <td bgcolor="white"><table border="0" cellpadding="2" cellspacing="1" width="274" bgcolor="silver">
                    <tr>
                      <td bgcolor="white" width="270"><img id="imgmain" name="imgmain" src="<%=imgSubPath1%>" name="img1" width="270" height="202" border="0"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td bgcolor="white" height="10"></td>
              </tr>
              <tr>
                <td width="272" bgcolor="white"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td width="62"><table border="0" cellpadding="2" cellspacing="1" width="69" bgcolor="silver">
                          <tr>
                            <td bgcolor="white"><img src="<%=imgSubPath1%>" name="img1" onclick="imgChange(this);" width="63" height="47" border="0"></td>
                          </tr>
                        </table></td>
                      <td width="62"><table border="0" cellpadding="2" cellspacing="1" width="69" bgcolor="silver">
                          <tr>
                            <td bgcolor="white"><img src="<%=imgSubPath2%>" name="img2" onclick="imgChange(this);" width="63" height="47" border="0"></td>
                          </tr>
                        </table></td>
                      <td width="62"><table border="0" cellpadding="2" cellspacing="1" width="69" bgcolor="silver">
                          <tr>
                            <td bgcolor="white"><img src="<%=imgSubPath3%>" name="img3" onclick="imgChange(this);" width="63" height="47" border="0"></td>
                          </tr>
                        </table></td>
                      <td width="62"><table border="0" cellpadding="2" cellspacing="1" width="69" bgcolor="silver">
                          <tr>
                            <td bgcolor="white"><img src="<%=imgSubPath4%>" name="img4" onclick="imgChange(this);" width="63" height="47" border="0"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="412" valign="top"><table border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td class=cc_name valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td class="cc_name"><%=glDto.getGolflink_name()%></td>
                    </tr>
                    <tr>
                      <td height="10"></td>
                    </tr>
                    <tr>
                      <td><table border="0" width="100%" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="23" width="47" class=normal_b>주소 </td>
                            <td width="12">:</td>
                            <td width="320"><%=glDto.getGolflink_address1() + " " + glDto.getGolflink_address2() %></td>
                          </tr>
                          <tr>
                            <td height="23" class=normal_b>홀구분</td>
                            <td>:</td>
                            <td class=orange><%=glDto.getHoll_type()%>&nbsp;&nbsp;&nbsp;<a href="<%=glDto.getCourse_guide() %>" target="_blank"><img src="../images/common/btn_golfcourse.gif" width="68" height="17" border="0" align="absmiddle"></a></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="6"></td>
                    </tr>
                    <tr>
                      <td><span class=normal_b>가격정보</span> <span class=red_ss>(자세한 할인 금액은 아래 요일/시간 별로 확인해 주시기 바랍니다.)</span></td>
                    </tr>
                    <tr>
                      <td><table border="0" width="100%" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
                          <tr>
                            <td align="center" bgcolor="#F1F1F1" height="20" width="185" class="normal_b">구분</td>
                            <td height="22" align="center" bgcolor="#F1F1F1" class="normal_b" width="106">주중</td>
                            <td align="center" bgcolor="#F1F1F1" class="normal_b" width="109">주말</td>
                          </tr>
                          <tr>
                            <td bgcolor="white" align="center" height="20" class="normal_s">그린피 정상금액</td>
                            <td align="center" bgcolor="white" class=normal_s><strike><%=Utils.numberFormat(NumberUtils.toInt(priceInfo[6]))%></strike></td>
                            <td align="center" bgcolor="white" class=normal_s><strike><%=Utils.numberFormat(NumberUtils.toInt(priceInfo[7]))%></strike></td>
                          </tr>
                          <tr>
                            <td bgcolor="white" align="center" height="20" class="normal_s">그린피 할인금액</td>
                            <td align="center" bgcolor="white" class=saturday><%=Utils.numberFormat(NumberUtils.toInt(priceInfo[8]))%> ~ <%=Utils.numberFormat(NumberUtils.toInt(priceInfo[9]))%></td>
                            <td align="center" bgcolor="white" class=sunday><%=Utils.numberFormat(NumberUtils.toInt(priceInfo[10]))%> ~ <%=Utils.numberFormat(NumberUtils.toInt(priceInfo[11]))%></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
              <tr>
                <td><%=StringUtils.trimToEmpty(glDto.getCancel_rule_nh())%></td>
              </tr>
            </table>
            &nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" width="707">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" width="707"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#D1D3D4">
              <tr>
                <td align="center" bgcolor="#F1F1F1" height="35"><img src="../images/common/img_pre_subject.gif" width="160" height="25" border="0"></td>
<% 
for (int i = 1; i < 15 ;i++){
	int incYear = incDate.get(incDate.YEAR);
	int incMonth = incDate.get(incDate.MONTH)+1;
	int incDay = incDate.get(incDate.DATE);
	
	int incWeek = incDate.get(incDate.DAY_OF_WEEK);
	String weekImg = "";
	String weekClass = "day";
	switch(incWeek)
	{
		case 2:
			weekImg = "img_monday%s.gif";
			break;
		case 3:
			weekImg = "img_tuesday%s.gif";
			break;
		case 4:
			weekImg = "img_wednesday%s.gif";
			break;
		case 5:
			weekImg = "img_thursday%s.gif";
			break;
		case 6:
			weekImg = "img_friday%s.gif";
			break;
		case 7:
			weekImg = "img_saturday%s.gif";
			weekClass = "saturday";
			break;
		case 1:
			weekImg = "img_sunday%s.gif";
			weekClass = "sunday";
			break;
		default:
			break;
	}
	incDate.add(incDate.DATE, 1);
	
	boolean isHoliday = com.goodjob.util.Holiday.isHoliday(incYear+""+(incMonth<10?"0"+incMonth:incMonth)+""+incDay);
	if(isHoliday){
		weekClass = "sunday";
		weekImg = String.format(weekImg , "_h");
	}
	else{
		weekImg = String.format(weekImg , "");
	}
%>
                <td width="30" align="center" bgcolor="#F1F1F1"><span class=<%=weekClass%>><%=Integer.toString(incMonth)+"/"+Integer.toString(incDay)%><br>
                  </span><img align="absmiddle" src="../images/booking/<%=weekImg%>" width="20" height="16" border="0"></td>
<%}%>
              </tr>
              <tr>
                <td bgcolor="white" height="30" style="padding-left:5px;"><span class=blue_list><%=glDto.getGolflink_name()%></span></td>
<%
	incDate.set(tYear, tMonth-1, tDay);
	for (int k = 1; k < 15 ;k++){
		String cYear = Integer.toString(incDate.get(incDate.YEAR));
		cYear = cYear.substring(cYear.length()-4,cYear.length());
		String cMonth = "0" + Integer.toString(incDate.get(incDate.MONTH)+1);
		cMonth = cMonth.substring(cMonth.length()-2,cMonth.length());
		String cDay = "0" + Integer.toString(incDate.get(incDate.DATE));
		cDay = cDay.substring(cDay.length()-2,cDay.length());
		incDate.add(incDate.DATE, 1);
		
		String pDate = "";
		String cDate = "";
		int rCnt = 0;
		int cCnt = 0;
		String viewYn = "";
		for(int j = 0; j < listPrdt.size(); j++){
			if(listPrdt.get(j).getProduct_year().equals(cYear)
					&&listPrdt.get(j).getProduct_month().equals(cMonth)
					&&listPrdt.get(j).getProduct_day().equals(cDay))
			{
				int prdtsubCnt = glDao.getGolfProductListCnt(listPrdt.get(j).getProduct_seq());
				pDate = cYear + "/" + cMonth + "/" + cDay;
				cDate = cYear + cMonth + cDay;
				rCnt = listPrdt.get(j).getProduct_cnt();
				cCnt = prdtsubCnt;
				viewYn = listPrdt.get(j).getView_yn();
				break;
			}
		}		
		if(pDate.equals("")){
%>
                    <td align="center" bgcolor="white">&nbsp;</td>
                    <%
		}else if( Integer.parseInt(cYear + cMonth + cDay) < intNowDate 
				|| cCnt == 0 || viewYn.equals("1")){
%>
                     <td align="center" bgcolor="white"><img border=0 align=absmiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감/휴장"></TD>
                    <%
		}else if(viewYn.equals("2")){
%>
                     <td align="center" bgcolor="white"><img border=0 align=absmiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감/휴장"></TD>
                    <%
		}else{
%>
                     <td align="center" bgcolor="white"><a href="/NH_Card/detail.jsp?menu=<%=menuNum%>&golf=<%=glDto.getGolflink_seq()%>&date=<%=sDate %>&cdate=<%=cDate%>"><img border=0 align=absmiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22 onMouseover="ddrivetip('<%=pDate %></br>--------------------</br>예약가능팀 : <%=cCnt %>/<%=rCnt %>팀');" onMouseout="hideddrivetip()"></a></TD>
                    <%
		}
	}
%>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td colspan="2" height="50" align="right" width="707"><table border="0" width="150" cellpadding="0" cellspacing="0">
              <tr>
                <td width="75" align="center"><img src="../images/booking/btn_2week_pre.gif" width="62" height="22" border="0"></td>
                <td width="75" align="center"><img src="../images/booking/btn_2week_later.gif" width="62" height="22" border="0"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td valign="top" colspan="2" align="center" width="707"><table border="0" width="704" cellpadding="0" cellspacing="0">
              <tr>
                <td width="426"></td>
              </tr>
              <tr>
                <td valign="top" width="100%"><div id="menu1" style="display:block;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td width="100%"><table border="0" cellpadding="0" cellspacing="0" width="704">
                            <tr>
                              <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img id="imgtap1" src="../images/booking/btn_tab_on_01.gif" width="173" height="25" alt="실시간 예약하기"></td>
                              <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img id="imgtap2" src="../images/booking/btn_tab_off_02.gif" width="173" height="25" alt="이용안내"></td>
                              <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img id="imgtap3" src="../images/booking/btn_tab_off_03.gif" width="173" height="25" alt="골프장소개"></td>
                              <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><img id="imgtap4" src="../images/booking/btn_tab_off_04.gif" width="173" height="25" alt="오시는길"></td>
                            </tr>
                            <tr>
                              <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr>
                        <td height="10"></td>
                      </tr>
                      <tr>
                        <td bgcolor="white" align="center">
                        <div style="display: block" id="destap1">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" height="103">
                            <tr>
                              <td><table border="0" cellpadding="2" cellspacing="1" width="702" bgcolor="#D1D3D4">
                                  <tr>
                                    <td align="center" bgcolor="#F1F1F1" class="normal_b" height="25" width="215">골프장명</td>
                                    <td align="center" bgcolor="#F1F1F1" class="normal_b" width="90">부킹날짜</td>
                                    <td align="center" bgcolor="#F1F1F1" class="normal_b" width="110">부킹시간대</td>
                                    <td align="center" bgcolor="#F1F1F1" class="normal_b" width="150">인원/팀</td>
                                    <td align="center" bgcolor="#F1F1F1" class="normal_b" width="88">결제예상금액</td>
                                    <td align="center" bgcolor="#F1F1F1" class="normal_b" width="60">적립금액</td>
                                  </tr>
                                  <tr>
                                    <td align="center" bgcolor="white" height="25"><%=glDto.getGolflink_name()%></td>
                                    <td align="center" bgcolor="white"><%=curDate.substring(0,4) + "-" + curDate.substring(4,6) + "-" + curDate.substring(6,8)%></td>
                                    <td align="center" bgcolor="white">
                                    <SELECT size=1 id="ddlTimeTerm" name="ddlTimeTerm" onchange="selectGolfLink();">
                                                <OPTION value="/0/0" selected>선택하세요</OPTION>
                                                <% 	
	boolean disabled = indexOf(glDto.getGolflink_name(),"PAR3","파3");
	ProductSubSiteDto psDto = null;
	for(int i = 0; i < listPr.size();i++){
		int tPrdtSeq = listPr.get(i).getProductsub_seq();
		String tTerm = listPr.get(i).getTime_start().substring(0,2) + "시 ~ " + listPr.get(i).getTime_end().substring(0,2) + "시";
		
		psDto = glDao.getSitePrice(tPrdtSeq,3);
		int tPrice = psDto.getPrice2() - psDto.getPrice1();
%>
                                                <OPTION value="<%=tPrdtSeq+"/"+tPrice+"/"+listPr.get(i).getCoupon_use_yn()%>"><%=tTerm%></OPTION>
                                                <% 
	} 
%>
                                              </SELECT>
                                    </td>
                                    <td align="center" bgcolor="white">
                                    <SELECT size=1 id="ddlPersonCnt" name="ddlPersonCnt" onchange="selectGolfLink();">
                                                  <OPTION value="0" selected>선택</OPTION>
                                                  <% if(disabled){ %>
                                                  <OPTION value="1">1</OPTION>
                                                  <OPTION value="2">2</OPTION>
                                                  <% } %>
                                                  <OPTION value="3">3</OPTION>
                                                  <OPTION value="4"<%=(disabled?"":" selected")%>>4</OPTION>
                                                </SELECT>
                                                명 /
                                                <SELECT size=1 id="ddlTeamCnt" name="ddlTeamCnt" disabled="disabled">
                                                  <OPTION value="1" selected>1</OPTION>
                                                </SELECT>
                                                팀 
                                    </td>
                                    <td align="center" bgcolor="white"><span class=orange_s id="txtBillPrice" name="txtBillPrice">0</span> <span class=normal_s>원</span></td>
                                    <td align="center" bgcolor="white"><span class=orange id="savePrice" name="savePrice">0</span> <span class=normal_s>원</span></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr>
                              <td height="17">&nbsp;</td>
                            </tr>
                            <tr>
                              <td align="center"><table align="center" border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#D1D3D4">
                                  <tr>
                                    <td bgcolor="#AED247" colspan="4" width="698"></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=normal_b width="118">골프장</td>
                                    <td bgcolor="white" style="padding-left:10px;" width="559" colspan="3"><span class=normal_b><%=glDto.getGolflink_name()%></span></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=normal_b width="118">인원</td>
                                    <td bgcolor="white" style="padding-left:10px;" width="205"><INPUT class="mem_input" id="personCnt" name="personCnt" size=5 disabled>
                                                인 &nbsp;
                                                <INPUT class=mem_input id="teamCnt" name="teamCnt" size=5 disabled value="1">
                                                팀 </td>
                                    <td width="137" bgcolor="#F1F1F1" style="padding-right:10px;" class=normal_b align="right">부킹날짜/시간대</td>
                                    <td width="191" bgcolor="white" style="padding-left:10px;"><input type="text" class="mem_input" id="selectDate" name="selectDate" size="10" disabled value="<%=curDate.substring(0,4) + "-" + curDate.substring(4,6) + "-" + curDate.substring(6,8)%>">
                                                /
                                                <input type="text" class="mem_input" id="selectTime" name="selectTime" size="10" disabled></td>
                                  </tr>
                                  <tr>
                                    <td height="25" align="right" bgcolor="#F1F1F1" class="normal_b" style="padding-right:10px;" width="118">결제금액</td>
                                    <td height="27" bgcolor="white" style="padding-left:10px;" colspan="3" width="559"><span class=orange id="billPrice" name="billPrice"></span> 원</td>
                                  </tr>
                                  <tr>
                                    <td height="25" align="right" bgcolor="#F1F1F1" class="normal_b" style="padding-right:10px;" width="118">적립금액</td>
                                    <td height="27" bgcolor="white" style="padding-left:10px;" colspan="3" width="559"><span class=orange id="totSavePrice" name="totSavePrice"></span> 원</td>
                                  </tr>
                                  <tr>
                                    <td height="25" align="right" bgcolor="#F1F1F1" class="normal_b" style="padding-right:10px;" width="118">예약자이름</td>
                                    <td height="27" colspan="3" bgcolor="white" style="padding-left:10px;" width="559"><INPUT class=mem_input id="reserveUName" name="reserveUName" size=15 value="<%=user_Name %>" style="ime-mode:active;"></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=normal_b width="118">핸드폰</td>
                                    <td bgcolor="white" style="padding-left:10px;" colspan="3" width="559"><SELECT size=1 id="phone1" name="phone1" onChange="sel_phone1();">
                                        <OPTION value="" selected>선택</OPTION>
                                                  <OPTION value="010">010</OPTION>
                                                  <OPTION value="011">011</OPTION>
                                                  <OPTION value="016">016</OPTION>
                                                  <OPTION value="017">017</OPTION>
                                                  <OPTION value="018">018</OPTION>
                                                  <OPTION value="019">019</OPTION>
                                      </SELECT>
                                                -
                                                <INPUT class=mem_input id="phone2" name="phone2" onKeyup="sel_phone2();" maxLength=4 size=8>
                                                -
                                                <INPUT class=mem_input id="phone3" name="phone3" maxLength=4 size=8></td>
                                  </tr>
                                  <!--tr>
                                    <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=normal_b width="118">E-Mail</td>
                                    <td bgcolor="white" style="padding-left:10px;" colspan="3" width="559"><INPUT class=mem_input id="email1" name="email1" size=15 value="<%=eMail1 %>">
                                                @
                                                <INPUT class=mem_input ID="email2" name="email2" size=15 value="<%=eMail2 %>">
                                                <SELECT size=1 id="ddlEmail" name="ddlEmail" onchange="emaildomain();">
                                                  <OPTION value="" SELECTED>직접입력하기</OPTION>
                                                  <OPTION value="naver.com">naver.com</OPTION>
                                                  <OPTION value="hanmail.net">hanmail.net</OPTION>
                                                  <OPTION value="dreamwiz.com">dreamwiz.com</OPTION>
                                                  <OPTION value="empal.com">empal.com</OPTION>
                                                  <OPTION value="hanmir.com">hanmir.com</OPTION>
                                                  <OPTION value="hanafos.com">hanafos.com</OPTION>
                                                  <OPTION value="nate.com">nate.com</OPTION>
                                                  <OPTION value="paran.com">paran.com</OPTION>
                                                  <OPTION value="yahoo.co.kr">yahoo.co.kr</OPTION>
                                                  <OPTION value="gmail.com">gmail.com</OPTION>
                                                </SELECT></td>
                                  </tr-->
                                  <tr>
                                    <td align="right" bgcolor="#F1F1F1" class="normal_b" style="padding-right:10px;" width="118">요청사항</td>
                                    <td bgcolor="white" style="padding-left:10px;" colspan="3" width="559"><TEXTAREA class=box_02 cols=90 rows=4 id="requestContent" name="requestContent"></TEXTAREA></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="#AED247" colspan="4" width="698"></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr>
                              <td align="center"  style="padding-top:30px;padding-bottom:30px;"><A href="javascript:;" onclick="reserveSubmit();"><img src="../images/booking/btn_next_page2.gif" width="150" height="39" border="0"></a></td>
                            </tr>
                          </table>
                          </div>
                          <div id="destap2" style="display:none;"><%=glDto.getUse_guide() %></div>
                          <div id="destap3" style="display:none;"><%=glDto.getGolflink_guide() %></div>
                          <div id="destap4" style="display:none;">
                            <iframe id="ifrmMap" src="" width=702 height=702 frameborder="0" border="0" marginheight="0" marginwidth="0" scrolling="no" noresize></iframe>
                          </div>
                          </td>
                      </tr>
                    </table>
                  </div>
                  </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="center" valign="top" colspan="2" width="707">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
