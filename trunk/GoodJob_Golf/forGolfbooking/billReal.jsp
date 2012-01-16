<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menu = "1";
int productsubSeq = NumberUtils.toInt(request.getParameter("gcId"), 0);
int golf = NumberUtils.toInt(request.getParameter("golf"), 0);
int date = NumberUtils.toInt(request.getParameter("date"), 0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"), 0);

if(productsubSeq == 0 || golf == 0 || date == 0 || cdate == 0){
	out.println("<script>location.href='reserve.jsp?menu=1'</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> listPr = glDao.getGolfProduct(productsubSeq);

ProductReserveDto prDto = null;
if(listPr == null || listPr.size() != 1){
	out.println("<script>location.href='reserve.jsp?menu=1'</script>");
	return;
}
prDto = listPr.get(0);

String bookingDate = prDto.getProduct_date();
String bookingTime = prDto.getTime_start();
bookingDate = bookingDate.substring(0,4) + "-" + bookingDate.substring(4,6) + "-" + bookingDate.substring(6,8) + " ";
bookingDate += bookingTime.substring(0,2) + ":" + bookingTime.substring(2,4); 
int buyPrice = prDto.getNH_price() * 4;


/* ----- 쿠폰 ----- */
CouponDao cpDao = new CouponDao();
List<CouponDto> couponList = null;
if(prDto.getCoupon_use_yn().equals("1")){
	couponList = cpDao.getUserCouponList(user_Id, "0", true);
}
%>
<script type="text/javascript">
<!--
function reSetDate(){
	location.href = "/forGolfbooking/detail.jsp?menu=1&golf=<%=golf%>&date=<%=date%>&cdate=<%=cdate%>";
}

function billok(){
	var chkBool = true;
	if($("#reserveName").val().length == 0){
		alert("예약자명을 입력하세요");
		return false;
	}
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
	
	$("#menu").val("<%=menu%>");
	$("#gcId").val("<%=productsubSeq%>");
	$("#golf").val('<%=golf%>');
	$("#date").val('<%=date%>');
	$("#cdate").val('<%=cdate%>');
	
	if($("#billBtype").attr("checked")){
		if(window.confirm("예약을 완료하시려면 확인 버튼을 누르십시오 \r\n예약확인 SMS : "+$("#phone1").val()+$("#phone2").val()+$("#phone3").val())){
			var frm = document.exefrm;
			frm.target =  "ifr_hidden"; 
			frm.action = "exe_real.jsp";
			frm.submit();
		}
	}
}

$(function(){
	$("#chkRealName").click(function(){		
		if(this.checked){
			document.getElementById("reserveName").readOnly = true;
			$("#reserveName").val("<%=user_Name%>");
		}else{
			document.getElementById("reserveName").readOnly = false;
			$("#reserveName").val("");
		}
	});
});
//-->
</script>
<FORM NAME="exefrm" METHOD="post">
<input type="hidden" id="menu" name="menu" value="1">
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
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>예약확인 및 결제</SPAN></TD></TR>
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
<TD style="PADDING-LEFT: 10px" class=normal_b bgColor=white width=420><INPUT id="reserveName" name="reserveName" class=input_01 name=day size=14 value=""> <INPUT name="chkRealName" id="chkRealName" type=checkbox><SPAN class=mem_notice>실제이용자가 예약자와 동일한 경우 체크</SPAN></TD></TR>
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
<TD style="PADDING-LEFT: 10px" bgColor=white>
<%=prDto.getGolflink_name() %>
<input type="hidden" id="golflinkName" name="golflinkName" value="<%=prDto.getGolflink_name() %>">
</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>부킹일시</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white>
<%=bookingDate %> &nbsp;<IMG border=0 align=absMiddle src="/images/booking/btn_back.gif" width=67 height=16 onclick="reSetDate();" style="cursor:hand">
<input type="hidden" id="bookingDate" name="bookingDate" value="<%=bookingDate %>">
</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>코스명</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=StringUtils.defaultIfEmpty(prDto.getCourse_name(), "<div class=red_s>없음</div>") %></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>인원</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white>4명</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>프리미엄상품권 적용</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white height=25>
<SELECT size=1 id="ddlCoupon" name="ddlCoupon">
<OPTION value="0" selected>선택하세요</OPTION>
<%
if(couponList != null){
	for(int i = 0; i < couponList.size(); i++){
%>
	<option value="<%=couponList.get(i).getCoupon_seq() %>"><%=couponList.get(i).getCoupon_name() %></option>
<%
	}
}
%>
</SELECT>
</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>결제금액</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><SPAN class=orange><%=commify(buyPrice) %></SPAN>원</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>결제방법선택</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><INPUT id="billBtype" name="billtype" value="B" type=radio checked> 무통장입금</TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD style="PADDING-BOTTOM: 50px; PADDING-TOP: 30px" align=center><IMG border=0 src="/images/booking/btn_next_page3.gif" onclick="billok();" style="cursor:hand"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe>
</FORM>