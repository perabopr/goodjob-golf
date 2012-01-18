<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.util.Utils"%>
<%@page import="com.goodjob.reserve.dto.RegionDto"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductDto"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%
int menuNum = NumberUtils.toInt(request.getParameter("menu"),1);

int pRegion = NumberUtils.toInt(request.getParameter("region"), 0);
PackageDao pkDao = new PackageDao();
List<RegionDto> rList = pkDao.getRegionList("1");

Calendar vCalendar = Calendar.getInstance();

String strDate = StringUtils.defaultIfEmpty(request.getParameter("date"),Utils.getDate("yyyyMMdd"));

int tYear;
int tMonth;
int tDay;
if(strDate == null || strDate.length() != 8){
	out.print("<script>");
	out.print("location.href='/forGolfbooking/reserve.jsp?menu=1&region="+pRegion+"&date="+strDate+"';");
	out.print("</script>");
	return;
	/*
	tYear = Integer.parseInt(strDate.substring(0,4));
	tMonth = Integer.parseInt(strDate.substring(4,6));
	tDay = Integer.parseInt(strDate.substring(6,8));
	*/
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

String preDate = tmYear
			+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
			+ tmDay.substring(tmDay.length()-2, tmDay.length());

vCalendar.add(vCalendar.DATE, 28);
tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));

String sDate = strDate;
String eDate = tmYear
			+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
			+ tmDay.substring(tmDay.length()-2, tmDay.length());

String strWhere = "AND A.menu_seq = " + menuNum + " ";
if(pRegion >= 1 && pRegion <= 6){
	strWhere += "AND A.region_seq = " + pRegion;
}
/*
String strRegion = request.getParameter("region");
if(strRegion != null){
	if(strRegion.equals("1") || strRegion.equals("2") 
			|| strRegion.equals("3") || strRegion.equals("4")
			|| strRegion.equals("5") || strRegion.equals("6")){
		strWhere += "AND A.region_seq = " + strRegion;
	}
}
*/
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> listGolf = glDao.getGolfLinkList(strWhere);

Calendar incDate = Calendar.getInstance();
incDate.set(tYear, tMonth-1, tDay);

String strNowDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
int intNowDate = Integer.parseInt(strNowDate);
%>
<style type="text/css">

#dhtmltooltip{
position: absolute;
left: -300px;
width: 130px;
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

<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2 height="650">
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
	<TD vAlign=top>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
		<TBODY>
		<TR>
		<TD align=center>
			<TABLE border=0 cellSpacing=0 cellPadding=0 width=707>
			<TBODY>
			<TR>
			<TD height=30 vAlign=bottom width=707 colSpan=2 align=right>
			<%
				if(pRegion == 0){
			%>
				<SPAN class=blue>전체보기</SPAN> &nbsp;I&nbsp;
			<%		
				}else{
			%>
				<a class=area href="reserve.jsp?menu=1&date=<%=strDate %>">전체보기</a> &nbsp;I&nbsp;
			<%		
				}
					
				for(int i = 0; i < rList.size(); i++){ 
					if(pRegion == rList.get(i).getRegion_seq()){
			%>
					<SPAN class=blue><%=rList.get(i).getRegion_name()%></SPAN> &nbsp;I&nbsp;
			<%
					}else{
			%>
					<A class=area href="reserve.jsp?menu=1&region=<%=rList.get(i).getRegion_seq()%>&date=<%=strDate %>"><%=rList.get(i).getRegion_name()%></A> <%=i+1 < rList.size()? "&nbsp;I &nbsp;":"" %>
			<% 
					}
				} 
			%>
			</TD>
			</TR>
			<TR>
			<TD height=35 width="50%">
				<TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
				<TBODY>
				<TR>
				<TD width=75 align=center><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole_yes.gif" width=70 height=22></TD>
				<TD width=75 align=center><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole_no.gif" width=73 height=22></TD>
				</TR>
				</TBODY>
				</TABLE>
			</TD>
			<TD height=22 width="50%" align=right>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width=150>
				<TBODY>
				<TR>
				<td width="75" align="center"><a href="/forGolfbooking/reserve.jsp?menu=<%=menuNum%>&region=<%=pRegion %>&date=<%=preDate%>"><img align="absmiddle" src="../../images/booking/btn_2week_pre.gif" width="62" height="22" border="0"></a></td>
    			<td width="75" align="center"><a href="/forGolfbooking/reserve.jsp?menu=<%=menuNum%>&region=<%=pRegion %>&date=<%=eDate%>"><img align="absmiddle" src="../../images/booking/btn_2week_later.gif" width="62" height="22" border="0"></a></td>
				</TR>
				</TBODY>
				</TABLE>
			</TD>
			</TR>
			</TBODY>
			</TABLE>
		</TD>
		</TR>
		<TR>
		<TD align=center>
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
			<%
			for(int i = 0; i < listGolf.size(); i++){
				ProductDto pDto = new ProductDto();
				pDto.setGolflink_seq(listGolf.get(i).getGolflink_seq());
				pDto.setProduct_startDate(sDate);
				pDto.setProduct_endDate(eDate);
				List<ProductDto> listPrdt = glDao.getGolfProductList(pDto);
			%>
			<TR>
			<TD style="PADDING-LEFT: 10px" bgColor=white height=30><SPAN class=blue_list style="color:red;font-weight:bold"><!--(<%=listGolf.get(i).getRegion_name() %>)--><span style="color:#2860c7"><%=listGolf.get(i).getGolflink_name()%></SPAN></SPAN></TD>
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
							|| cCnt == 0 || viewYn == "1"){
			%>
					<TD bgColor=white height=30 align=center>
					<IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감">
					</TD>
			<%
					}else if(viewYn == "2"){
			%>
					<TD bgColor=white height=30 align=center>
					<IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="휴장">
					</TD>
			<%
					}else{
			%>
					<TD bgColor=white height=30 align=center>
					<a href="/forGolfbooking/detail.jsp?menu=<%=menuNum%>&golf=<%=listGolf.get(i).getGolflink_seq()%>&date=<%=sDate %>&cdate=<%=cDate%>"><IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22 onMouseover="ddrivetip('<%=pDate %></br>--------------------</br>예약가능팀 : <%=cCnt %>/<%=rCnt %>팀');" onMouseout="hideddrivetip()"></a>
					</TD>
			<%
					}
				}
			%>
			</TR>
			<%
			}
			%>
			</TBODY>
			</TABLE>
		</TD>
		</TR>
		<TR>
		<TD align=center>&nbsp;</TD>
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