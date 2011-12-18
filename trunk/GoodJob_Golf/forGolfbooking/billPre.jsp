<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menuSeq = request.getParameter("menu");
String productsubSeq = request.getParameter("gcId");

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> listPr = glDao.getGolfProduct(Integer.parseInt(productsubSeq));

ProductReserveDto prDto = null;
if(listPr != null && listPr.size() == 1){
	prDto = listPr.get(0); 
}else{
	//초기페이지 이동.....
	out.close();
}

String bookingDate = prDto.getProduct_date();
String bookingTime = prDto.getTime_start();
bookingDate = bookingDate.substring(0,4) + "-" + bookingDate.substring(4,6) + "-" + bookingDate.substring(6,8) + " ";
bookingDate += bookingTime.substring(0,2) + ":" + bookingTime.substring(2,4); 
String buyPrice = Integer.toString(Integer.parseInt(prDto.getGoodjob_price()) * 4);

String menu = "2";
String golf = request.getParameter("golf");
String date = request.getParameter("date");
String cdate = request.getParameter("cdate");
%>
<script type="text/javascript">
<!--
function reSetDate(){
	location.href = "/forGolfbooking/detail.jsp?menu=<%=menu%>&golf=<%=golf%>&date=<%=date%>&cdate=<%=cdate%>";
}

function billok(){
	var chkBool = true;
	if($("#phone1").val().length == 0){
		chkBool = false;
	}
	if($("#phone2").val().length == 0){
		chkBool = false;
	}
	if($("#phone3").val().length == 0){
		chkBool = false;
	}
	if(!chkBool){
		alert("연락처를 입력하세요.");
		return false;
	}
	
	$("#menu").val("<%=request.getParameter("menu")%>");
	$("#gcId").val("<%=request.getParameter("gcId")%>");
	$("#golf").val('<%=request.getParameter("golf")%>');
	$("#date").val('<%=request.getParameter("date")%>');
	$("#cdate").val('<%=request.getParameter("cdate")%>');
	
	if($("#billCtype").attr("checked")){
	}else{
		frm.submit();
	}
}
//-->
</script>
<FORM NAME="frm" METHOD="post" ACTION="result.jsp">
<input type="hidden" id="menu" name="menu" >
<input type="hidden" id="gcId" name="gcId" >
<input type="hidden" id="golf" name="golf" >
<input type="hidden" id="date" name="date" >
<input type="hidden" id="cdate" name="cdate" >
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/index.html">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>예약확인 및 결제</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>예약확인 및 결제</TD></TR>
<TR>
<TD>
<P>&nbsp;</P></TD></TR>
<TR>
<TD align=center><IMG border=0 src="/images/booking/img_finished_title.gif" width=640 height=108></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=601 bgColor=#d1d3d4>
<TBODY>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 width=170 align=right>예약자명</TD>
<TD style="PADDING-LEFT: 10px" class=normal_b bgColor=white width=420>홍길동</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>연락처</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=30><SELECT size=1 id="phone1" name="phone1"> 
<OPTION value="" selected>선택</OPTION> 
<OPTION value="010">010</OPTION> 
<OPTION value="011">011</OPTION> 
<OPTION value="016">016</OPTION> 
<OPTION value="017">017</OPTION> 
<OPTION value="018">018</OPTION> 
<OPTION value="019">019</OPTION>
</SELECT> - <INPUT id="phone2" name="phone2" class=input_01 name=day size=6 maxlength="4"> - <INPUT id="phone3" name="phone3" class=input_01 name=day size=6 maxlength="4"></TD></TR>
<TR>
<TD class=mem_notice height=20>예약사항을 입력하신 핸드폰번호로 SMS발송해드립니다 </TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>골프장명</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=prDto.getGolflink_name() %></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>부킹일시</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=bookingDate %> &nbsp;<IMG border=0 align=absMiddle src="/images/booking/btn_back.gif" width=67 height=16 onclick="reSetDate();"></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>코스명</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=prDto.getCourse_name() %></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>인원</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white>4명</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>프리미엄상품권 적용</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white height=25><SELECT size=1 name=formselect1> <OPTION selected>선택하세요</OPTION></SELECT></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>결제금액</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><SPAN class=orange><%=buyPrice %></SPAN>원</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>결제방법선택</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><INPUT id="billCtype" name="billtype" value="C" type=radio disabled="disabled"> 신용카드결제 &nbsp;&nbsp; <INPUT id="billBtype" name="billtype" value="B" type=radio checked> 실시간계좌이체</TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD style="PADDING-BOTTOM: 50px; PADDING-TOP: 30px" align=center><IMG border=0 src="/images/booking/btn_pay.gif" width=200 height=60 onclick="billok();"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</FORM>