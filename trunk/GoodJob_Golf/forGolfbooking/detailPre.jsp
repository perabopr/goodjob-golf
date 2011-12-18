<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="com.goodjob.reserve.dto.ProductDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkPriceDto"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int menuNum = Integer.parseInt(menuName);

String golfSeq = request.getParameter("golf");
String curDate = request.getParameter("cdate");
if(curDate == null || curDate.length() != 8){
	response.sendRedirect("reserve.jsp?menu=1");
}

//골프장상세정보.
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> listGolf = glDao.getGolfLinkDetail(Integer.parseInt(golfSeq));
if(listGolf == null || listGolf.size() != 1){
	response.sendRedirect("reserveReal.jsp?menu=2");
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
		np = listGolfPrice.get(i).getGolflink_price();		
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

vCalendar.add(vCalendar.DATE, 14);

String tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
String tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
String tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));

String sDate = strDate;
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

function reserveSubmit(gcId){
	$("#menu").val("2");
	$("#gcId").val(gcId);
	$("#golf").val('<%=request.getParameter("golf")%>');
	$("#date").val('<%=request.getParameter("date")%>');
	$("#cdate").val('<%=request.getParameter("cdate")%>');
	frm.submit();
}

function nextResDate(cDate){
	var resDate = "<%=arrDateStr%>";
	resDate = resDate.split(",");
	var chkNext = false;
	for(i = 0; i < resDate.length;i++){
		if(chkNext){
			location.href = "/forGolfbooking/detail.jsp?menu=1&golf=<%=golfSeq%>&date=<%=strDate%>&cdate="+resDate[i];
			return false;
		}
		if(resDate[i] == cDate){
			chkNext = true;
		}
	}
	alert("다음날짜가 없습니다.");
	return false;
}
function preResDate(cDate){
	var resDate = "<%=arrDateStr%>";
	resDate = resDate.split(",");
	var chkPre = false;
	for(i = resDate.length - 1; i >= 0;i--){
		if(chkPre){
			location.href = "/forGolfbooking/detail.jsp?menu=1&golf=<%=golfSeq%>&date=<%=strDate%>&cdate="+resDate[i];
			return false;
		}
		if(resDate[i] == cDate){
			chkPre = true;
		}
	}
	alert("이전날짜가 없습니다.");
	return false;	
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
<TD bgColor=white width=270><IMG border=0 name=img1 src="../../images/common/img_thumb_ready.jpg" width=270 height=202></TD></TR></TBODY></TABLE></TD></TR>
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
<TD bgColor=white><IMG border=0 name=img1 src="<%=glDto.getImg_sub1()%>" width=63 height=47></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="<%=glDto.getImg_sub2()%>" width=63 height=47></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="<%=glDto.getImg_sub3()%>" width=63 height=47></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="<%=glDto.getImg_sub4()%>" width=63 height=47></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
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
<TD class=sunday bgColor=white height=25 align=center>주밀</TD>
<TD class=normal_s bgColor=white align=center><%=nw %></TD>
<TD class=sunday bgColor=white align=center><%=sp %></TD>
<TD class=red_s bgColor=white align=center><%=sp*4 %></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
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
<TD width=75 align=center><IMG border=0 src="../../images/booking/btn_prev_day.gif" width=65 height=20 onclick="preResDate('<%=curDate%>');"></TD>
<TD width=75 align=center><IMG border=0 src="../../images/booking/btn_next_day.gif" width=65 height=20 onclick="nextResDate('<%=curDate%>');"></TD></TR></TBODY></TABLE></TD></TR>
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
<TD class=normal_b bgColor=#f1f1f1 height=25 width=120 align=center>부킹날짜</TD>
<TD class=normal_b bgColor=#f1f1f1 height=25 width=120 align=center>부킹시간</TD>
<TD class=normal_b bgColor=#f1f1f1 width=168 align=center>코스</TD>
<TD class=normal_b bgColor=#f1f1f1 width=90 align=center>홀구분</TD>
<TD class=normal_b bgColor=#f1f1f1 width=182 align=center>예약가능여부</TD></TR>
<%
	for(int i = 0; i < listPr.size();i++){
		String tmpDate = listPr.get(i).getProduct_date();
		String tmpTime = listPr.get(i).getTime_start();
		tmpDate = tmpDate.substring(0,4) + "-" + tmpDate.substring(4,6) + "-" + tmpDate.substring(6,8);
		if((Integer.parseInt(tmpTime.substring(0,2)) - 12) > 0){
			tmpTime = "오후 " + (Integer.parseInt(tmpTime.substring(0,2))-12) + ":" + tmpTime.substring(2,4);
		}else if(Integer.parseInt(tmpTime.substring(0,2)) == 12){
			tmpTime = "오후 " + Integer.parseInt(tmpTime.substring(0,2)) + ":" + tmpTime.substring(2,4);
		}else{
			tmpTime = "오전 " + Integer.parseInt(tmpTime.substring(0,2)) + ":" + tmpTime.substring(2,4);			
		}
		
%>
<TR>
<TD bgColor=white height=25 align=center><%=tmpDate %></TD>
<TD bgColor=white height=25 align=center><%=tmpTime %></TD>
<TD bgColor=white align=center><%=listPr.get(i).getCourse_name()%></TD>
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
</TD></TR>
<TR>
<TD height=50>&nbsp;</TD></TR></TBODY></TABLE>
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