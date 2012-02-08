<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menu = "2";
int productsubSeq = NumberUtils.toInt(request.getParameter("psId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"), 0);
int date = NumberUtils.toInt(request.getParameter("date"), 0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"), 0);
int rCnt = NumberUtils.toInt(request.getParameter("reserveCnt"), 0);
int rTeam = NumberUtils.toInt(request.getParameter("reserveTeam"), 0);
String rDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String rTime = StringUtils.trimToEmpty(request.getParameter("reserveTime"));
int rCoupon = NumberUtils.toInt(request.getParameter("reserveCoupon"), 0);

String rName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String rPhone = StringUtils.trimToEmpty(request.getParameter("reservePhone"));
String rEmail = StringUtils.trimToEmpty(request.getParameter("reserveEmail"));
String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));
rRequest = rRequest.replaceAll("\r\n","</br>");

if(productsubSeq == 0 || golf == 0 || date == 0
		|| cdate == 0 || rCnt == 0 || rTeam == 0){
	out.println("<script>location.href='reserve.jsp?menu=2'</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> listPr = glDao.getGolfProduct(productsubSeq);

ProductReserveDto prDto = null;
if(listPr == null || listPr.size() != 1){
	out.println("<script>location.href='reserve.jsp?menu=2'</script>");
	return;
}
prDto = listPr.get(0);

String bookingDate = prDto.getProduct_date();
String bookingTime = prDto.getTime_start();
bookingDate = bookingDate.substring(0,4) + "-" + bookingDate.substring(4,6) + "-" + bookingDate.substring(6,8) + " ";
bookingDate += bookingTime.substring(0,2) + ":" + bookingTime.substring(2,4); 

int buyPrice = prDto.getGoodjob_price() * rCnt;

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
	location.href = "/forGolfbooking/detail.jsp?menu=2&golf=<%=golf%>&date=<%=date%>&cdate=<%=cdate%>";
}

function billok(){
	if(window.confirm("사전예약신청 내역입니다.\r\n예약신청내역이 맞으시면 사전신청예약버튼을 누르십시오 \r\n예약신청확인 SMS : <%=rPhone %>")){
		var frm = document.exefrm;
		frm.target =  "ifr_hidden"; 
		frm.action = "exe_pre.jsp";
		frm.submit();
	}
}

function couponChange(){
	var price;
	var billprice = <%=buyPrice%>;
	var tmpValue = $("#ddlCoupon").val();
	var arrValue = tmpValue.split("/");
	price = arrValue[1];
	if(price.length > 0){
		billprice = billprice - price;
		price = commify(-price)+"원";
		billprice = commify(billprice);
	}else{
		billprice = commify(billprice);
	}
	$("#billPrice").html(billprice);
}

function commify(n) {
  var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
  n += '';                          // 숫자를 문자열로 변환

  while (reg.test(n))
    n = n.replace(reg, '$1' + ',' + '$2');

  return n;
}
//-->
</script>
<FORM NAME="exefrm" METHOD="post">
<input type="hidden" id="menu" name="menu" value="2" >
<input type="hidden" id="psId" name="psId" value="<%=productsubSeq %>">
<input type="hidden" id="golf" name="golf" value="<%=golf %>">
<input type="hidden" id="date" name="date" value="<%=date %>">
<input type="hidden" id="cdate" name="cdate" value="<%=cdate %>">

<input type="hidden" id="reserveCnt" name="reserveCnt" value="<%=rCnt %>">
<input type="hidden" id="reserveTeam" name="reserveTeam" value="<%=rTeam %>">
<input type="hidden" id="reserveDate" name="reserveDate" value="<%=rDate %>">
<input type="hidden" id="reserveTime" name="reserveTime" value="<%=rTime %>">

<input type="hidden" id="reserveName" name="reserveName" value="<%=rName %>">
<input type="hidden" id="reservePhone" name="reservePhone" value="<%=rPhone %>">
<input type="hidden" id="reserveEmail" name="reserveEmail" value="<%=rEmail %>">
<textarea id="reserveRequest" name="reserveRequest" style="display:none"><%=rRequest%></textarea>

<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>예약확인</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>예약확인</TD></TR>
<TR>
<TD>&nbsp;</TD></TR>
<TR>
<TD align=center><IMG border=0 src="../../images/booking/img_finished_before_title.gif" width=640 height=108></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=601 bgColor=#d1d3d4>
<TBODY>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 width=132 align=right>예약자이름</TD>
<TD style="PADDING-LEFT: 10px" class=normal_b bgColor=white width=442><%=rName %></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>핸드폰</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white>
<P><%=rPhone %></P></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>E-Mail</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=rEmail %></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>골프장명</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white>
<%=prDto.getGolflink_name() %>
<input type="hidden" id="golflinkName" name="golflinkName" value="<%=prDto.getGolflink_name() %>">
</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>시간대</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white>
<%=rDate %> &nbsp;<%=rTime %> &nbsp;<IMG border=0 align=absMiddle src="../../images/booking/btn_back.gif" width=67 height=16 onclick="reSetDate();" style="cursor:hand">
<input type="hidden" id="bookingDate" name="bookingDate" value="<%=rDate %> <%=rTime %>">
</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>인원</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=rCnt %>인 <%=rTeam %>팀</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>프리미엄상품권 적용</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white>
	<SELECT size=1 id="ddlCoupon" name="ddlCoupon" onchange="couponChange();">
	<OPTION value="0/" selected>선택하세요</OPTION>
	<%
	int selPrice = 0;
	if(couponList != null){
		for(int i = 0; i < couponList.size(); i++){
			if(rCoupon==couponList.get(i).getCoupon_seq()){
				selPrice = couponList.get(i).getSale_price();
			}
	%>
		<option value="<%=couponList.get(i).getCoupon_seq() %>/<%=couponList.get(i).getSale_price() %>" <%= selPrice>0?"selected":"" %>><%=couponList.get(i).getCoupon_name()+"("+commify(couponList.get(i).getSale_price())+"원)" %></option>
	<%
		}
	}
	%>
	</SELECT>
</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>결제예상금액</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><SPAN class=orange id="billPrice" name="billPrice"><%=commify(buyPrice-selPrice) %></SPAN>원</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=normal_b bgColor=#f1f1f1 height=25 align=right>요청사항</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><%=rRequest %></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD style="PADDING-BOTTOM: 50px; PADDING-TOP: 30px" align=center><IMG border=0 src="/images/booking/btn_before_01.gif" onclick="billok();" style="cursor:hand"></TD></TR>
<TR>
<TD height=100>&nbsp;</TD></TR>
</TBODY></TABLE></TD></TR></TBODY></TABLE>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe>
</FORM>