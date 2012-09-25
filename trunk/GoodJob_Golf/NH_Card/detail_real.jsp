<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%

int menuNum = NumberUtils.toInt(request.getParameter("menu"),1);

String golfSeq = Integer.toString(NumberUtils.toInt(request.getParameter("golf"),0));
String curDate = Integer.toString(NumberUtils.toInt(request.getParameter("cdate"),0));
if(curDate == null || curDate.length() != 8){
	out.print("<script>");
	out.print("location.href='reserve.jsp?menu=1';");
	out.print("</script>");
	return;
}

//골프장상세정보.
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> listGolf = glDao.getGolfLinkDetail(Integer.parseInt(golfSeq));
if(listGolf == null || listGolf.size() != 1){
	out.print("<script>");
	out.print("location.href='reserveReal.jsp?menu=1';");
	out.print("</script>");
	return;
}
GolfLinkDto glDto = listGolf.get(0);
String imgSubPath1 = glDto.getImg_sub1();
if(imgSubPath1.length() != 0){
	imgSubPath1 = "/upload/" + imgSubPath1;
}else{
	imgSubPath1 = "../../images/common/img_thumb_ready.jpg";
}
String imgSubPath2 = glDto.getImg_sub2();
if(imgSubPath2.length() != 0){
	imgSubPath2 = "/upload/" + imgSubPath2;
}else{
	imgSubPath2 = "../../images/common/img_thumb_ready.jpg";
}
String imgSubPath3 = glDto.getImg_sub3();
if(imgSubPath3.length() != 0){
	imgSubPath3 = "/upload/" + imgSubPath3;
}else{
	imgSubPath3 = "../../images/common/img_thumb_ready.jpg";
}
String imgSubPath4 = glDto.getImg_sub4();
if(imgSubPath4.length() != 0){
	imgSubPath4 = "/upload/" + imgSubPath4;
}else{
	imgSubPath4 = "../../images/common/img_thumb_ready.jpg";
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

String arrDateStr = "";
for(int i = 0; i < listPrdt.size();i++){
	arrDateStr += listPrdt.get(i).getProduct_date()+",";
}
if(arrDateStr.length() > 0){
	arrDateStr = arrDateStr.substring(0,arrDateStr.length()-1);
}

//선택날짜 예약리스트 가져오기.
ProductReserveDto prDto = new ProductReserveDto();
prDto.setGolflink_seq(Integer.parseInt(golfSeq));
prDto.setProduct_date(curDate);
List<ProductReserveDto> listPr = glDao.getGolfProduct(prDto);

String strNowDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
int intNowDate = Integer.parseInt(strNowDate);
%>
<script type="text/javascript">
<!---//
function DisplayMenu(vIdx){
	$("#imgtap1").attr("src", "../../images/booking/btn_tab_off_01.gif");
	$("#imgtap2").attr("src", "../../images/booking/btn_tab_off_02.gif");
	$("#imgtap3").attr("src", "../../images/booking/btn_tab_off_03.gif");
	$("#imgtap4").attr("src", "../../images/booking/btn_tab_off_04.gif"); 
	$("#destap1").hide();
	$("#destap2").hide();
	$("#destap3").hide();
	$("#destap4").hide();
	
	switch(vIdx){
		case 1:
			$("#imgtap1").attr("src", "../../images/booking/btn_tab_on_01.gif"); 
			$("#destap1").show();
			break;
		case 2:
			$("#imgtap2").attr("src", "../../images/booking/btn_tab_on_02.gif");
			$("#destap2").show(); 
			break;
		case 3:
			$("#imgtap3").attr("src", "../../images/booking/btn_tab_on_03.gif");
			$("#destap3").show(); 
			break;
		case 4:
			$("#imgtap4").attr("src", "../../images/booking/btn_tab_on_04.gif");
			$("#ifrmMap").attr("src", "/forGolfbooking/ifrm_map.jsp?x=<%=glDto.getPoint_x()%>&y=<%=glDto.getPoint_y()%>");
			$("#destap4").show(); 
			break;
	}
	//subAutoResizeIFrame();
}

function reserveSubmit(gcId){
	$("#menu").val("1");
	$("#gcId").val(gcId);
	$("#golf").val('<%=request.getParameter("golf")%>');
	$("#date").val('<%=request.getParameter("date")%>');
	$("#cdate").val('<%=request.getParameter("cdate")%>');
	frm.submit();
}

function nextResDate(){
	location.href = "/NH_Card/detail.jsp?menu=1&golf=<%=golfSeq%>&date=<%=eDate%>&cdate=<%=curDate%>";
	return false;
}

function preResDate(){
	location.href = "/NH_Card/detail.jsp?menu=1&golf=<%=golfSeq%>&date=<%=preDate%>&cdate=<%=curDate%>";
}

function imgChange(objId){
	$("#imgmain").attr("src", objId.src);
}
//--->
</script>
<FORM NAME="frm" METHOD="post" ACTION="rule.jsp">
<input type="hidden" id="menu" name="menu" >
<input type="hidden" id="gcId" name="gcId" >
<input type="hidden" id="golf" name="golf" >
<input type="hidden" id="date" name="date" >
<input type="hidden" id="cdate" name="cdate" >
</FORM>
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">실시간예약</td>
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
                            <td width="320"><%=glDto.getGolflink_address1() + " " + glDto.getGolflink_address2()%></td>
                          </tr>
                          <tr>
                            <td height="23" class=normal_b>홀구분</td>
                            <td>:</td>
                            <td class=orange><%=glDto.getHoll_type()%> &nbsp;&nbsp;<a href="<%=glDto.getCourse_guide()%>" target="_blank"><img src="../images/common/btn_golfcourse.gif" width="68" height="17" border="0" align="absmiddle"></a></td>
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
                <td class=red_s><%=StringUtils.trimToEmpty(glDto.getCancel_rule_nh())%></td>
              </tr>
            </table>
            <p>&nbsp;</p></td>
        </tr>
        <tr>
          <td colspan="2" width="707">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" width="707"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#D1D3D4">
              <tr>
                <td align="center" bgcolor="#F1F1F1" height="35"><img src="../images/common/img_real_subject.gif" width="160" height="25" border="0"></td>
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
			<TD bgColor=#f1f1f1 width=30 align=center>
			<SPAN class="<%=weekClass%>"><%=Integer.toString(incMonth)+"/"+Integer.toString(incDay)%><BR></SPAN>
			<IMG border=0 align=absMiddle src="../../images/booking/<%=weekImg%>" width=20 height=16>
			</TD>
<% 
} 
%>
			</TR>
			<TR>
			<TD style="PADDING-LEFT: 5px" bgColor=white height=30><SPAN class=blue_list><%=glDto.getGolflink_name()%></SPAN></TD>
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
			<TD bgColor=white height=30 align=center>&nbsp;</TD>
<%
		}else if( Integer.parseInt(cYear + cMonth + cDay) < intNowDate 
				|| cCnt == 0 || viewYn.equals("1")){
%>
		<TD bgColor=white height=30 align=center>
		<IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감/휴장">
		</TD>
<%
		}else if(viewYn.equals("2")){
%>
		<TD bgColor=white height=30 align=center>
		<IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감/휴장">
		</TD>
<%
		}else{
%>
			<TD bgColor=white height=30 align=center>
			<a href="/NH_Card/detail.jsp?menu=<%=menuNum%>&golf=<%=glDto.getGolflink_seq()%>&date=<%=sDate%>&cdate=<%=cDate%>"><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22 onMouseover="ddrivetip('<%=pDate%></br>--------------------</br>예약가능팀 : <%=cCnt%>/<%=rCnt%>팀');" onMouseout="hideddrivetip()"></a>
			</TD>
<%
		}
	}
%>            
            </table></td>
        </tr>
        <tr>
          <td colspan="2" height="50" align="right" width="707"><table border="0" width="150" cellpadding="0" cellspacing="0">
              <tr>
                <td width="75" align="center"><img src="../images/booking/btn_2week_pre.gif" onclick="preResDate();" width="62" height="22" border="0"></td>
                <td width="75" align="center"><img src="../images/booking/btn_2week_later.gif" onclick="nextResDate();" width="62" height="22" border="0"></td>
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
					<DIV style="DISPLAY: block" id=destap1>
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
					<TBODY>
					<TR>
					<TD>
						<TABLE id="tbReserveList" border=0 cellSpacing=1 cellPadding=2 width=706 bgColor=#d1d3d4>
						<TR>
						<TD class=normal_b bgColor=#f1f1f1 height=25 width=100 align=center>부킹날짜</TD>
						<TD class=normal_b bgColor=#f1f1f1 height=25 width=80 align=center>부킹시간</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=100 align=center>코스</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=120 align=center>할인요금(4人기준)</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=80 align=center>홀구분</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=160 align=center>예약가능여부</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=60 align=center>적립금액</TD>
						</TR>
<%
	int currPrice = 0;
	ProductSubSiteDto psDto = null;
	for(int i = 0; i < listPr.size();i++){
		String tmpDate = listPr.get(i).getProduct_date();
		String tmpTime = listPr.get(i).getTime_start();
		tmpDate = tmpDate.substring(0,4) + "-" + tmpDate.substring(4,6) + "-" + tmpDate.substring(6,8);
		tmpTime = tmpTime.substring(0,2) + ":" + tmpTime.substring(2,4);
		
		psDto = glDao.getSitePrice(listPr.get(i).getProductsub_seq(),3);
		currPrice = psDto.getPrice2() - psDto.getPrice1();
%>
						<TR>
						<TD bgColor=white height=25 align=center><%=tmpDate%></TD>
						<TD bgColor=white align=center><%=tmpTime%></TD>
						<TD bgColor=white align=center><%=StringUtils.defaultIfEmpty(listPr.get(i).getCourse_name(), "<div class=red_ss>없음</div>")%></TD>
						<TD bgColor=white align=center><span class=orange_s><%=Utils.numberFormat(currPrice * 4)%></span> <span class=normal_s>원</span></TD>
						<TD bgColor=white align=center><span class=normal_s><%=listPr.get(i).getHoll_type()%></span></TD>
<%
		if(listPr.get(i).getProduct_status().equals("0")){			
%>
						<TD bgColor=white align=center><A href="javascript:;" onclick="reserveSubmit('<%=listPr.get(i).getProductsub_seq()%>')"><IMG border=0 align=absMiddle src="../../images/booking/btn_regist_ok.gif" width=112 height=20></A></TD>		
<%
		}else{
%>
						<TD bgColor=white height=25 align=center><IMG border=0 align=absMiddle src="../../images/booking/btn_regist_no.gif" width=112 height=20></TD>
<%			
		}
%>
						<TD bgColor=white align=center><span class=orange_s><%=Utils.numberFormat(psDto.getPrice3()*4)%></span> 원</TD>
						</TR>
<%
	}
%>
						</TABLE>
					</TD>
					</TR>
					<TR><TD height=50>&nbsp;</TD></TR>
					</TBODY>
					</TABLE>
					</DIV>
					<div id="destap2" style="display:none;"><%=glDto.getUse_guide()%></div>
					<div id="destap3" style="display:none;"><%=glDto.getGolflink_guide()%></div>
					<div id="destap4" style="display:none;">					
					<iframe id="ifrmMap" src="" width=702 height=702 frameborder="0" border="0" marginheight="0" marginwidth="0" scrolling="no" noresize></iframe>
					</div>
						</td>
                      </tr>
                    </table>
                  </div></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="center" valign="top" colspan="2" width="707">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
