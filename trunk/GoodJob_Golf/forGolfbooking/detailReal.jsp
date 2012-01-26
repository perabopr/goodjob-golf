<%@page import="java.text.DecimalFormat"%>
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
			$("#ifrmMap").attr("src", "/forGolfbooking/ifrm_map.jsp?x=<%=glDto.getPoint_x()%>&y=<%=glDto.getPoint_y()%>");
			$("#destap4").show(); 
			break;
	}
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
	location.href = "/forGolfbooking/detail.jsp?menu=1&golf=<%=golfSeq%>&date=<%=eDate%>&cdate=<%=curDate%>";
	return false;
}

function preResDate(){
	location.href = "/forGolfbooking/detail.jsp?menu=1&golf=<%=golfSeq%>&date=<%=preDate%>&cdate=<%=curDate%>";
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
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2>
<TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
	<TBODY>
	<TR>
	<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>실시간예약</SPAN></TD>
	</TR>
	<TR>
	<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>실시간예약</TD>
	</TR>
	<TR>
	<TD vAlign=top><P>&nbsp;</P></TD>
	</TR>
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
				<TD bgColor=white width=270><IMG border=0 id="imgmain" name="imgmain" src="<%=imgSubPath1 %>" width=270 height=202></TD>
				</TR>
				</TBODY>
				</TABLE>
			</TD>
			</TR>
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
					<TD bgColor=white><IMG border=0 name=img1 src="<%=imgSubPath1 %>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD>
					</TR>
					</TBODY>
					</TABLE>
				</TD>
				<TD width=62>
					<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
					<TBODY>
					<TR>
					<TD bgColor=white><IMG border=0 name=img2 src="<%=imgSubPath2 %>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD>
					</TR>
					</TBODY>
					</TABLE>
				</TD>
				<TD width=62>
					<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
					<TBODY>
					<TR>
					<TD bgColor=white><IMG border=0 name=img3 src="<%=imgSubPath3 %>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD>
					</TR>
					</TBODY>
					</TABLE>
				</TD>
				<TD width=62>
					<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
					<TBODY>
					<TR>
					<TD bgColor=white><IMG border=0 name=img4 src="<%=imgSubPath4 %>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD>
					</TR>
					</TBODY>
					</TABLE>
				</TD>
				</TR>
				</TBODY>
				</TABLE>
			</TD>
			</TR>
			</TBODY>
			</TABLE>
		</TD>
		<TD vAlign=top width=412>
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
			<TBODY>
			<TR>
			<TD class=cc_name vAlign=top>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
				<TBODY>
				<TR>
				<TD class=cc_name><%=glDto.getGolflink_name()%></TD>
				</TR>
				<TR>
				<TD height=10></TD>
				</TR>
				<TR>
				<TD>
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
					<TBODY>
					<TR>
					<TD class=normal_b height=23 width=47>주소 </TD>
					<TD width=12>:</TD>
					<TD width=320><%=glDto.getGolflink_address1() + " " + glDto.getGolflink_address2() %></TD>
					</TR>
					<TR>
					<TD class=normal_b height=23>홀구분</TD>
					<TD>:</TD>
					<TD class=orange><%=glDto.getHoll_type()%></TD>
					</TR>
					<TR>
					<TD class=normal_b height=23>&nbsp;</TD>
					<TD>&nbsp;</TD>
					<TD><a href="<%=glDto.getCourse_guide() %>" target="_blank"><IMG border=0 src="../../images/booking/btn_golfcourse.gif" width=70 height=19 style="cursor:hand"></a></TD>
					</TR>
					</TBODY>
					</TABLE>
				</TD>
				</TR>
				<TR>
				<TD>&nbsp;</TD></TR>
				<TR>
				<TD class=normal_b>가격정보 </TD>
				</TR>
				<TR>
				<TD>
					<TABLE border=0 cellSpacing=1 cellPadding=2 width="100%" bgColor=#d1d3d4>
					<TR>
					<TD class=normal_s bgColor=white width="150" align=center rowspan=2>그린피 정상금액</TD>
					<TD class=saturday bgColor=#f1f1f1 align=center height=22>주중</TD>
					<TD class=sunday bgColor=#f1f1f1 align=center>주말</TD>
					</TR>
					<TR>
					<TD class=normal_s bgColor=white align=center height=25><%=commify(np) %></TD>
					<TD class=sunday bgColor=white align=center><%=commify(nw) %></TD>
					</TR>
					</TABLE>
				</TD>
				</TR>
				</TBODY>
				</TABLE>
			</TD>
			</TR>
			<TR>
			<TD>&nbsp;</TD></TR>
			<TR>
			<TD class=red_s><%=glDto.getCancel_rule() %></TD>
			</TR>
			</TBODY>
			</TABLE>
			<P>&nbsp;</P>
		</TD>
		</TR>
		<TR>
		<TD width=707 colSpan=2>&nbsp;</TD>
		</TR>
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
			<a href="/forGolfbooking/detail.jsp?menu=<%=menuNum%>&golf=<%=glDto.getGolflink_seq()%>&date=<%=sDate %>&cdate=<%=cDate%>"><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22 onMouseover="ddrivetip('<%=pDate %></br>--------------------</br>예약가능팀 : <%=cCnt %>/<%=rCnt %>팀');" onMouseout="hideddrivetip()"></a>
			</TD>
<%
		}
	}
%>
			</TR>
			</TBODY>
			</TABLE>
		</TD>
		</TR>
		<TR>
		<TD height=50 width=707 colSpan=2 align=right>
			<TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
			<TBODY>
			<TR>
			<TD width=75 align=center><IMG border=0 src="../../images/booking/btn_2week_pre.gif" onclick="preResDate();" style="cursor:hand"></TD>
			<TD width=75 align=center><IMG border=0 src="../../images/booking/btn_2week_later.gif" onclick="nextResDate();" style="cursor:hand"></TD>
			</TR>
			</TBODY>
			</TABLE>
		</TD>
		</TR>
		<TR>
		<TD vAlign=top width=707 colSpan=2 align=center>
			<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>
			<TBODY>
			<TR><TD width=426></TD></TR>
			<TR>
			<TD vAlign=top width="100%">
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
					<TD style="CURSOR: hand" onclick=DisplayMenu(4) width=176><IMG id="imgtap4" alt=오시는길 src="../../images/booking/btn_tab_off_04.gif" width=173 height=25></TD>
					</TR>
					<TR>
					<TD bgColor=#91b500 height=1 width=704 colSpan=4></TD>
					</TR>
					</TBODY>
					</TABLE>
				</TD>
				</TR>
				<TR><TD height=10></TD></TR>
				<TR>
				<TD bgColor=white align=center>
					<DIV style="DISPLAY: block" id=destap1>
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
					<TBODY>
					<TR>
					<TD>
						<TABLE id="tbReserveList" border=0 cellSpacing=1 cellPadding=2 width=706 bgColor=#d1d3d4>
						<TR>
						<TD class=normal_b bgColor=#f1f1f1 height=25 width=100 align=center>부킹날짜</TD>
						<TD class=normal_b bgColor=#f1f1f1 height=25 width=80 align=center>부킹시간</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=150 align=center>코스</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=120 align=center>그린피할인요금</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=90 align=center>홀구분</TD>
						<TD class=normal_b bgColor=#f1f1f1 width=160 align=center>예약가능여부</TD>
						</TR>
<%
	for(int i = 0; i < listPr.size();i++){
		String tmpDate = listPr.get(i).getProduct_date();
		String tmpTime = listPr.get(i).getTime_start();
		tmpDate = tmpDate.substring(0,4) + "-" + tmpDate.substring(4,6) + "-" + tmpDate.substring(6,8);
		tmpTime = tmpTime.substring(0,2) + ":" + tmpTime.substring(2,4);
		
%>
						<TR>
						<TD bgColor=white height=25 align=center><%=tmpDate %></TD>
						<TD bgColor=white align=center><%=tmpTime %></TD>
						<TD bgColor=white align=center><%=StringUtils.defaultIfEmpty(listPr.get(i).getCourse_name(), "<div class=red_s>없음</div>")%></TD>
						<TD bgColor=white align=center><span class=red_s><%=commify(listPr.get(i).getNH_price() * 4) %></span>원</TD>
						<TD bgColor=white align=center><%=listPr.get(i).getHoll_type() %></TD>
<%
		if(listPr.get(i).getProduct_status().equals("0")){			
%>
						<TD bgColor=white align=center><A href="javascript:;" onclick="reserveSubmit('<%=listPr.get(i).getProductsub_seq() %>')"><IMG border=0 align=absMiddle src="../../images/booking/btn_regist_ok.gif" width=112 height=20></A></TD>		
<%
		}else{
%>
						<TD bgColor=white height=25 align=center><IMG border=0 align=absMiddle src="../../images/booking/btn_regist_no.gif" width=112 height=20></TD>
<%			
		}
%>
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
					<div id="destap2" style="display:none;"><%=glDto.getUse_guide() %></div>
					<div id="destap3" style="display:none;"><%=glDto.getGolflink_guide() %></div>
					<div id="destap4" style="display:none;">					
					<iframe id="ifrmMap" src="" width=602 height=402 frameborder="0" border="0" marginheight="0" marginwidth="0" scrolling="no" noresize></iframe>
					</div>
				</TD>
				</TR>
				</TBODY>
				</TABLE>
				</DIV>
			</TD>
			</TR>
			</TBODY>
			</TABLE>
		</TD>
		</TR>
		<TR>
		<TD vAlign=top width=707 colSpan=2 align=center>&nbsp;</TD>
		</TR>
		</TBODY>
		</TABLE>
	</TD>
	</TR>
	</TBODY>
	</TABLE>
</TD>
</TR>
</TBODY>
</TABLE>
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