<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.product.dto.ProductSubSiteDto"%>
<%@page import="com.goodjob.util.Utils"%>
<%
String menu = "2";

String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));

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
	out.println("<script>location.href='default.jsp?menu=2'</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> listPr = glDao.getGolfProduct(productsubSeq);

ProductReserveDto prDto = null;
if(listPr == null || listPr.size() != 1){
	out.println("<script>location.href='default.jsp?menu=2&'</script>");
	return;
}
prDto = listPr.get(0);

String bookingDate = prDto.getProduct_date();
String bookingTime = prDto.getTime_start();
bookingDate = bookingDate.substring(0,4) + "-" + bookingDate.substring(4,6) + "-" + bookingDate.substring(6,8) + " ";
bookingDate += bookingTime.substring(0,2) + ":" + bookingTime.substring(2,4); 

int buyPrice = (prDto.getReal_nh_price() + prDto.getNH_price()) * rCnt;

/* ----- 쿠폰 ----- */
CouponDao cpDao = new CouponDao();
List<CouponDto> couponList = null;
if(prDto.getCoupon_use_yn().equals("1")){
	couponList = cpDao.getUserCouponList(user_Id, "0", true);
}

//=================적립금 가져 오기..
ProductSubSiteDto psDto = glDao.getSitePrice(productsubSeq,3);

buyPrice = psDto.getPrice2() - psDto.getPrice1();
int site_save_price = glDao.getSiteSavePrice(productsubSeq , 3);

%>
<script type="text/javascript">
<!--
function reSetDate(){
	location.href = "/NH_Card/detail.jsp?menu=2&golf=<%=golf%>&date=<%=date%>&cdate=<%=cdate%>";
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
<input type="hidden" id="reserve_seq" name="reserve_seq" value="">
<textarea id="reserveRequest" name="reserveRequest" style="display:none"><%=rRequest%></textarea>

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
    <td style="padding-left: 55px;"><img src="../img_nhcard/common/img_pre_finished_title.gif" width="556" height="80" border="0"></td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="600" cellpadding="0" cellspacing="0">
        <tr>
          <td width="600" colspan="3" bgcolor="#D1D3D4" height="1"></td>
        </tr>
        <tr>
          <td width="139" height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>예약자명</td>
          <td width="1" bgcolor="#D1D3D4"></td>
          <td width="440"  style="padding-left: 10px;" class=normal_b><%=rName %></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">핸드폰</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><%=rPhone %></td>
        </tr>
        <!--<tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">E-Mail</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><%=rEmail %></td>
        </tr>-->
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">골프장명</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" class=blue_list width="440">
          <%=prDto.getGolflink_name() %>
		  <input type="hidden" id="golflinkName" name="golflinkName" value="<%=prDto.getGolflink_name() %>">
		</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">시간대</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><p>
          <%=rDate %> &nbsp;<%=rTime %> &nbsp;<IMG border=0 align=absMiddle src="../images/booking/btn_back.gif" width=67 height=16 onclick="reSetDate();" style="cursor:hand">
		<input type="hidden" id="bookingDate" name="bookingDate" value="<%=rDate %> <%=rTime %>"></p></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">인원</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><span class=orange><%=rCnt %> </span>명</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">결제금액</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><span class=orange><%=Utils.numberFormat(buyPrice) %></span> 원
          <input type="hidden" id="buyPrice" name="buyPrice" value="<%=buyPrice%>"></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">적립금액</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><span class=orange><%=Utils.numberFormat(site_save_price*rCnt)%></span> 원
          <input type="hidden" id="savePrice" name="savePrice" value="<%=site_save_price*rCnt%>"></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">요청사항</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;padding-right: 10px;padding-top: 10px;padding-bottom: 10px;" width="430"><%=rRequest %></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td style="padding-bottom: 30px; padding-top: 30px" align=center><a href="javascript:billok();"><img border=0 src="../images/booking/btn_next_page2.gif" width="150" height="39"></a></td>
  </tr>
</table>
</FORM>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe>