<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="com.goodjob.reserve.dto.ProductDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkPriceDto"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int menuNum = NumberUtils.toInt(request.getParameter("menu"),1);

String golfSeq = Integer.toString(NumberUtils.toInt(request.getParameter("golf"),0));
String curDate = Integer.toString(NumberUtils.toInt(request.getParameter("cdate"),0));
if(curDate == null || curDate.length() != 8){
	out.print("<script>");
	out.print("location.href='reserve.jsp?menu=2';");
	out.print("</script>");
	return;
}

//골프장상세정보.
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> listGolf = glDao.getGolfLinkDetail(Integer.parseInt(golfSeq));
if(listGolf == null || listGolf.size() != 1){
	out.print("<script>");
	out.print("location.href='reserve.jsp?menu=2';");
	out.print("</script>");
	return;
}
GolfLinkDto glDto = listGolf.get(0);

//가격정보.
List<GolfLinkPriceDto> listGolfPrice = glDao.getGolfLinkPrice(Integer.parseInt(golfSeq));
int np = 0;
int nw = 0;
int sp = 0;
int sw = 0;
for(int i = 0; i < listGolfPrice.size();i++){
	if(listGolfPrice.get(i).getPrice_type().equals("1")){
		np = listGolfPrice.get(i).getGolflink_price();
	}else if(listGolfPrice.get(i).getPrice_type().equals("2")){
		nw = listGolfPrice.get(i).getGolflink_price();		
	}else if(listGolfPrice.get(i).getPrice_type().equals("3")){
		sp = listGolfPrice.get(i).getGolflink_price();		
	}else if(listGolfPrice.get(i).getPrice_type().equals("4")){
		sw = listGolfPrice.get(i).getGolflink_price();		
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

/*
String arrDateStr = "";
for(int i = 0; i < listPrdt.size();i++){
	arrDateStr += listPrdt.get(i).getProduct_date()+",";
}
if(arrDateStr.length() > 0){
	arrDateStr = arrDateStr.substring(0,arrDateStr.length()-1);
}
*/

//선택날짜 예약리스트 가져오기.
ProductReserveDto prDto = new ProductReserveDto();
prDto.setGolflink_seq(Integer.parseInt(golfSeq));
prDto.setProduct_date(curDate);
List<ProductReserveDto> listPr = glDao.getGolfProduct(prDto);
%>
<style type="text/css">

#dhtmltooltip{
position: absolute;
left: -300px;
width: 300px;
border: 1px solid black;
padding: 3px;
background-color: lightyellow;
visibility: hidden;
z-index: 100;
filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135);
}

#dhtmlpointer{
position:absolute;
left: -300px;
z-index: 101;
visibility: hidden;
}

</style>
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
			$("#destap4").show(); 
			break;
	}
}

function nextResDate(){
	location.href = "/forGolfbooking/detail.jsp?menu=2&golf=<%=golfSeq%>&date=<%=eDate%>&cdate=<%=curDate%>";
	return false;
}

function preResDate(){
	location.href = "/forGolfbooking/detail.jsp?menu=2&golf=<%=golfSeq%>&date=<%=preDate%>&cdate=<%=curDate%>";
}

function selectGolfLink(){
	$("#ddlTimeTerm option:selected").each(function(){
		$("#selectTime").val($(this).text().replace("선택하세요",""));
	});
	var tmpPerCnt = $("#ddlPersonCnt").val();
	var tmpOptions = $("#ddlTimeTerm").val();
	var tmpOption = tmpOptions.split("/");

	$("#txtBillPrice").text(commify(tmpPerCnt*tmpOption[1]));
	$("#personCnt").val($("#ddlPersonCnt").val());
	
	$("#psId").val(tmpOption[0]);
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
	if($("#phone1").val().length == 0 && $("#phone2").val().length == 0 && $("#phone3").val().length){
		alert("핸드폰을 입력하세요.");
		return false;
	}
	var rEmail = $("#email1").val()+"@"+$("#email2").val();
	if($("#email1").val().length == 0 && $("#email2").val().length == 0){
		alert("E-Mail을 입력하세요.");
		return false;
	}
	var rRequestContent = $("#requestContent").val();
	
	$("#reserveCnt").val(rCnt);
	$("#reserveTeam").val(rTeam);
	$("#reserveDate").val(rDate);
	$("#reserveTime").val(rTime);
	
	$("#reserveName").val(rName);	
	$("#reservePhone").val(rPhone);	
	$("#reserveEmail").val(rEmail);	
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

<input type="hidden" id="reserveName" name="reserveName">
<input type="hidden" id="reservePhone" name="reservePhone">
<input type="hidden" id="reserveEmail" name="reserveEmail">
<input type="hidden" id="reserveRequest" name="reserveRequest">
</FORM>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>사전예약</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>사전예약</TD></TR>
<TR>
<TD vAlign=top>
<P>&nbsp;</P></TD></TR>
<TR>
<TD vAlign=top align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=295>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=274 bgColor=white>
<TBODY>
<TR>
<TD bgColor=white>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=274 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white width=270><IMG border=0 id="imgmain" name="imgmain" src="/upload/<%=glDto.getImg_sub1()%>" width=270 height=202></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD bgColor=white height=10></TD></TR>
<TR>
<TD bgColor=white width=272>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="/upload/<%=glDto.getImg_sub1()%>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="/upload/<%=glDto.getImg_sub2()%>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="/upload/<%=glDto.getImg_sub3()%>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="/upload/<%=glDto.getImg_sub4()%>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD vAlign=top width=412>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD class=cc_name vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD class=cc_name>골프장명</TD></TR>
<TR>
<TD height=10></TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD class=normal_b height=23 width=47>주소 </TD>
<TD width=12>:</TD>
<TD width=320><%=glDto.getGolflink_address1() + " " + glDto.getGolflink_address2() %></TD></TR>
<TR>
<TD class=normal_b height=23>홀구분</TD>
<TD>:</TD>
<TD class=orange><%=glDto.getHoll_type()%></TD></TR>
<TR>
<TD class=normal_b height=23>&nbsp;</TD>
<TD>&nbsp;</TD>
<TD><IMG border=0 src="../../images/booking/btn_golfcourse.gif" width=70 height=19 onMouseover="ddrivetip('<%=glDto.getCourse_guide() %>');" onMouseout="hideddrivetip()"></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD>&nbsp;</TD></TR>
<TR>
<TD class=normal_b>가격정보 </TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=1 cellPadding=2 width="100%" bgColor=#d1d3d4>
<TBODY>
<TR>
<TD bgColor=#f1f1f1 height=25 width=45 align=center>&nbsp;</TD>
<TD class=normal_s bgColor=#f1f1f1 height=22 width=95 align=center>그린피정상가</TD>
<TD class=sunday bgColor=#f1f1f1 width=90 align=center>그린피할인가</TD>
<TD class=red_s bgColor=#f1f1f1 width=150 align=center>4인그린피할인가 합계</TD></TR>
<TR>
<TD class=saturday bgColor=white height=25 align=center>주중</TD>
<TD class=normal_s bgColor=white align=center><%=np %></TD>
<TD class=sunday bgColor=white align=center><%=sp %></TD>
<TD class=red_s bgColor=white align=center><%=sp*4 %></TD></TR>
<TR>
<TD class=sunday bgColor=white height=25 align=center>주말</TD>
<TD class=normal_s bgColor=white align=center><%=nw %></TD>
<TD class=sunday bgColor=white align=center><%=sw %></TD>
<TD class=red_s bgColor=white align=center><%=sw*4 %></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD>&nbsp;</TD></TR>
<TR>
<TD class=red_s><%=glDto.getCancel_rule() %></TD></TR></TBODY></TABLE>
<P>&nbsp;</P></TD></TR>
<TR>
<TD width=707 colSpan=2>&nbsp;</TD></TR>
<TR>
<TD width=707 colSpan=2>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=707 bgColor=#d1d3d4>
<TBODY>
<TR>
<TD bgColor=#f1f1f1 height=35 width=212 align=center><SPAN class=normal_s>실시간예약 골프장명</SPAN></TD>
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
			weekImg = "img_monday.gif";
			break;
		case 3:
			weekImg = "img_tuesday.gif";
			break;
		case 4:
			weekImg = "img_wednesday.gif";
			break;
		case 5:
			weekImg = "img_thursday.gif";
			break;
		case 6:
			weekImg = "img_friday.gif";
			break;
		case 7:
			weekImg = "img_saturday.gif";
			weekClass = "saturday";
			break;
		case 1:
			weekImg = "img_sunday.gif";
			weekClass = "sunday";
			break;
		default:
			break;
	}
	incDate.add(incDate.DATE, 1);
%>
<TD bgColor=#f1f1f1 width=30 align=center>
<SPAN class="<%=weekClass%>"><%=Integer.toString(incMonth)+"/"+Integer.toString(incDay)%><BR></SPAN>
<IMG border=0 align=absMiddle src="../../images/booking/<%=weekImg%>" width=20 height=16>
</TD>
<% 
} 
%>
<TR>
<TD style="PADDING-LEFT: 5px" bgColor=white height=30><SPAN class=normal_s><%=glDto.getGolflink_name()%></SPAN></TD>
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
		for(int j = 0; j < listPrdt.size(); j++){
			if(listPrdt.get(j).getProduct_year().equals(cYear)
					&&listPrdt.get(j).getProduct_month().equals(cMonth)
					&&listPrdt.get(j).getProduct_day().equals(cDay))
			{
				pDate = cYear + "/" + cMonth + "/" + cDay;
				cDate = cYear + cMonth + cDay;
				rCnt = listPrdt.get(j).getProduct_cnt();
			}
		}		
		if(pDate.equals("")){
%>
		<TD bgColor=white height=30 align=center>&nbsp;</TD>
<%
		}else{
%>
		<TD bgColor=white height=30 align=center>
		<a href="/forGolfbooking/detail.jsp?menu=<%=menuNum%>&golf=<%=glDto.getGolflink_seq()%>&date=<%=sDate %>&cdate=<%=cDate%>"><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22 onMouseover="ddrivetip('<%=pDate %></br>--------------------</br>예약가능팀 : <%=rCnt %>팀');" onMouseout="hideddrivetip()"></a>
		</TD>
<%
		}
	}
%>
</TR>
</TBODY></TABLE></TD></TR>
<TR>
<TD height=50 width=707 colSpan=2 align=right>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
<TBODY>
<TR>
<TD width=75 align=center><IMG border=0 src="../../images/booking/btn_prev_day.gif" width=65 height=20 onclick="preResDate();"></TD>
<TD width=75 align=center><IMG border=0 src="../../images/booking/btn_next_day.gif" width=65 height=20 onclick="nextResDate();"></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD vAlign=top width=707 colSpan=2 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>
<TBODY>
<TR>
<TD width=426></TD></TR>
<TR>
<TD vAlign=top width="100%">
<DIV style="DISPLAY: block" id=menu1>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width="100%">
<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>
<TBODY>
<TR>
<TD style="CURSOR: hand" onclick=DisplayMenu(1) width=176><IMG id="imgtap1" alt="실시간 예약하기" src="../../images/booking/btn_tab_on_01.gif" width=173 height=25></TD>
<TD style="CURSOR: hand" onclick=DisplayMenu(2) width=176><IMG id="imgtap2" alt=이용안내 src="../../images/booking/btn_tab_off_02.gif" width=173 height=25></TD>
<TD style="CURSOR: hand" onclick=DisplayMenu(3) width=176><IMG id="imgtap3" alt=골프장소개 src="../../images/booking/btn_tab_off_03.gif" width=173 height=25></TD>
<TD style="CURSOR: hand" onclick=DisplayMenu(4) width=176><IMG id="imgtap4" alt=오시는길 src="../../images/booking/btn_tab_off_04.gif" width=173 height=25></TD></TR>
<TR>
<TD bgColor=#91b500 height=1 width=704 colSpan=4></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD height=10></TD></TR>
<TR>
<TD bgColor=white align=center>
<TABLE id="destap1" border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD>
	<TABLE id="tbReserveList" border=0 cellSpacing=1 cellPadding=2 width=706 bgColor=#d1d3d4>
	<TR>
	<TD class=normal_b bgColor=#f1f1f1 height=25 width=192 align=center>골프장명</TD>
	<TD class=normal_b bgColor=#f1f1f1 height=25 width=118 align=center>날짜</TD>
	<TD class=normal_b bgColor=#f1f1f1 width=108 align=center>시간대</TD>
	<TD class=normal_b bgColor=#f1f1f1 width=177 align=center>인원/팀</TD>
	<TD class=normal_b bgColor=#f1f1f1 width=85 align=center>결제예상금액</TD></TR>
	<TR>
	<TD bgColor=white height=25 align=center><%=glDto.getGolflink_name()%></TD>
	<TD bgColor=white align=center><%=curDate.substring(0,4) + "-" + curDate.substring(4,6) + "-" + curDate.substring(6,8)%></TD>
	<TD bgColor=white align=center><SELECT size=1 id="ddlTimeTerm" name="ddlTimeTerm" onchange="selectGolfLink();">
		<OPTION value="/0" selected>선택하세요</OPTION>
<% 
	for(int i = 0; i < listPr.size();i++){
		int tPrdtSeq = listPr.get(i).getProductsub_seq();
		String tTerm = listPr.get(i).getTime_start().substring(0,2) + "시 ~ " + listPr.get(i).getTime_end().substring(0,2) + "시";
		int tPrice = listPr.get(i).getGoodjob_price();
%>
		<OPTION value="<%=tPrdtSeq+"/"+tPrice%>"><%=tTerm%></OPTION>
<% 
	} 
%>
		</SELECT></TD>
	<TD bgColor=white align=center>
	<P><SELECT size=1 id="ddlPersonCnt" name="ddlPersonCnt" onchange="selectGolfLink();"> 
		<OPTION value="0" selected>선택</OPTION> 
		<OPTION value="1">1</OPTION> 
		<OPTION value="2">2</OPTION> 
		<OPTION value="3">3</OPTION> 
		<OPTION value="4">4</OPTION></SELECT> 명 /
		<SELECT size=1 id="ddlTeamCnt" name="ddlTeamCnt" disabled="disabled"> 
		<OPTION value="1" selected>1</OPTION> 
		</SELECT> 팀 </P></TD>
	<TD bgColor=white align=center><SPAN class=orange id="txtBillPrice" name="txtBillPrice">0</SPAN>원
	</TD></TR>
	</TABLE>
</TD></TR>
<TR>
<TD>&nbsp;</TD>
</TR>
<TR>
<TD colspan="5">
	<TABLE border=0 cellSpacing=1 cellPadding=2 width="100%" bgColor=#d1d3d4 align=center>
	<TBODY>
	<TR>
	<TD bgColor=#aed247 width=700 colSpan=4></TD></TR>
	<TR>
	<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=142 align=right>골프장</TD>
	<TD style="PADDING-LEFT: 10px" bgColor=white width=537 colSpan=3><SPAN class=normal_b><%=glDto.getGolflink_name()%></SPAN></TD></TR>
	<TR>
	<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=13 width=142 align=right>인원</TD>
	<TD style="PADDING-LEFT: 10px" bgColor=white width=211><INPUT class="mem_input" id="personCnt" name="personCnt" size=5 disabled> 인 &nbsp; <INPUT class=mem_input id="teamCnt" name="teamCnt" size=5 disabled value="1"> 팀 </TD>
	<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 width=130 align=right>날짜/시간대</TD>
	<TD style="PADDING-LEFT: 10px" bgColor=white width=170>
		<input type="text" class="mem_input" id="selectDate" name="selectDate" size="10" disabled value="<%=curDate.substring(0,4) + "-" + curDate.substring(4,6) + "-" + curDate.substring(6,8)%>">/<input type="text" class="mem_input" id="selectTime" name="selectTime" size="10" disabled>  
	</TD></TR>
	<TR>
	<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=13 align=right>예약자이름</TD>
	<TD style="PADDING-LEFT: 10px" bgColor=white height=27 colSpan=3><INPUT class=mem_input id="reserveUName" name="reserveUName" size=15></TD></TR>
	<TR>
	<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 align=right>핸드폰</TD>
	<TD style="PADDING-LEFT: 10px" bgColor=white colSpan=3><SELECT size=1 id="phone1" name="phone1"> 
	<OPTION selected>선택</OPTION> 
	<OPTION>010</OPTION> <OPTION>011</OPTION> 
	<OPTION>016</OPTION> <OPTION>017</OPTION> 
	<OPTION>018</OPTION> <OPTION>019</OPTION></SELECT> 
	- <INPUT class=mem_input id="phone2" name="phone2" maxLength=4 size=8> 
	- <INPUT class=mem_input id="phone3" name="phone3" maxLength=4 size=8></TD></TR>
	<TR>
	<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 align=right>E-Mail</TD>
	<TD style="PADDING-LEFT: 10px" bgColor=white colSpan=3><INPUT class=mem_input id="email1" name="email1" size=15> @ <INPUT class=mem_input ID="email2" name="email2" size=15> 
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
	<OPTION value="gmail.com">gmail.com</OPTION></SELECT></TD></TR>
	<TR>
	<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 align=right>요청사항</TD>
	<TD style="PADDING-LEFT: 10px" bgColor=white colSpan=3><TEXTAREA class=box_01 cols=80 rows=4 id="requestContent" name="requestContent"></TEXTAREA></TD></TR>
	<TR>
	<TD bgColor=#aed247 width=700 colSpan=4></TD></TR></TBODY></TABLE>
</TD>
</TR>
<TR>
<TD height=50>&nbsp;</TD></TR>
<TR><TD style="PADDING-BOTTOM: 40px; PADDING-TOP: 40px" align=center><A href="javascript:;" onclick="reserveSubmit();"><IMG border=0 align=textTop src="../../images/booking/btn_next_page2.gif" width=150 height=39></A></TD></TR>
</TBODY></TABLE>
<div id="destap2" style="display:none;"><%=glDto.getUse_guide() %></div>
<div id="destap3" style="display:none;"><%=glDto.getGolflink_guide() %></div>
<div id="destap4" style="display:none;"><%=glDto.getPoint_x() +"/" +glDto.getPoint_y() %></div>
</TD></TR></TBODY></TABLE></DIV>
</TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD vAlign=top width=707 colSpan=2 align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<script type="text/javascript">
<!---//
var offsetfromcursorX=12 // 커서의 x 축 
var offsetfromcursorY=10 //y 축 위치

var offsetdivfrompointerX=10 //커서그림의 X
var offsetdivfrompointerY=14 //Y축임 신경안써도 무방
document.write('<div id="dhtmltooltip"></div>') 
document.write('<img id="dhtmlpointer" src="http://gif00.com.ne.kr/image/balloon.gif">') //말풍선모양의 꼭지그림주소입니다.필히넣어야합니다

var ie=document.all
var ns6=document.getElementById && !document.all
var enabletip=false
if (ie||ns6)
var tipobj=document.all? document.all["dhtmltooltip"] : document.getElementById? document.getElementById("dhtmltooltip") : ""

var pointerobj=document.all? document.all["dhtmlpointer"] : document.getElementById? document.getElementById("dhtmlpointer") : ""

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function ddrivetip(thetext, thewidth, thecolor){
if (ns6||ie){
if (typeof thewidth!="undefined") tipobj.style.width=thewidth+"px"
if (typeof thecolor!="undefined" && thecolor!="") tipobj.style.backgroundColor=thecolor
tipobj.innerHTML=thetext
enabletip=true
return false
}
}

function positiontip(e){
if (enabletip){
var nondefaultpos=false
var curX=(ns6)?e.pageX : event.x+ietruebody().scrollLeft;
var curY=(ns6)?e.pageY : event.y+ietruebody().scrollTop;
//Find out how close the mouse is to the corner of the window
var winwidth=ie&&!window.opera? ietruebody().clientWidth : window.innerWidth-20
var winheight=ie&&!window.opera? ietruebody().clientHeight : window.innerHeight-20

var rightedge=ie&&!window.opera? winwidth-event.clientX-offsetfromcursorX : winwidth-e.clientX-offsetfromcursorX
var bottomedge=ie&&!window.opera? winheight-event.clientY-offsetfromcursorY : winheight-e.clientY-offsetfromcursorY

var leftedge=(offsetfromcursorX<0)? offsetfromcursorX*(-1) : -1000

if (rightedge<tipobj.offsetWidth){
tipobj.style.left=curX-tipobj.offsetWidth+"px"
nondefaultpos=true
}
else if (curX<leftedge)
tipobj.style.left="5px"
else{
tipobj.style.left=curX+offsetfromcursorX-offsetdivfrompointerX+"px"
pointerobj.style.left=curX+offsetfromcursorX+"px"
}

if (bottomedge<tipobj.offsetHeight){
tipobj.style.top=curY-tipobj.offsetHeight-offsetfromcursorY+"px"
nondefaultpos=true
}
else{
tipobj.style.top=curY+offsetfromcursorY+offsetdivfrompointerY+"px"
pointerobj.style.top=curY+offsetfromcursorY+"px"
}
tipobj.style.visibility="visible"
if (!nondefaultpos)
pointerobj.style.visibility="visible"
else
pointerobj.style.visibility="hidden"
}
}

function hideddrivetip(){
if (ns6||ie){
enabletip=false
tipobj.style.visibility="hidden"
pointerobj.style.visibility="hidden"
tipobj.style.left="-1000px"
tipobj.style.backgroundColor=''
tipobj.style.width=''
}
}

document.onmousemove=positiontip
//--->
</script>