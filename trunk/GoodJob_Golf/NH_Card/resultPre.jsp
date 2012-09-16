<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.util.Utils"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkReserveDto"%>
<%
int reserve_seq = NumberUtils.toInt(request.getParameter("reserve_seq"), 0);

GolfLinkDao glDao = new GolfLinkDao();

GolfLinkReserveDto grsDto = glDao.getGolfLinkReserve(reserve_seq);

int rCnt = NumberUtils.toInt(grsDto.getPer_num(), 0);

String rName = StringUtils.trimToEmpty(grsDto.getReserve_name());
String rPhone = StringUtils.trimToEmpty(grsDto.getReserve_phone());
String rEmail = StringUtils.trimToEmpty(grsDto.getReserve_uid());

String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));
rRequest = rRequest.replaceAll("\r\n","</br>");

String golflinkName = StringUtils.trimToEmpty(grsDto.getGolflink_name());
String bookingDate = StringUtils.trimToEmpty(grsDto.getBooking_day());
bookingDate = bookingDate.substring(0,4) + "-" + bookingDate.substring(4,6) + "-" + bookingDate.substring(6,8);	

String vbookingTime_s = StringUtils.trimToEmpty(grsDto.getBooking_time_s());
if(vbookingTime_s.length() > 0){
	vbookingTime_s = vbookingTime_s.substring(0,2)+"시";
}

String vbookingTime_e = StringUtils.trimToEmpty(grsDto.getBooking_time_e());
if(vbookingTime_e.length() > 0){
	vbookingTime_e = vbookingTime_e.substring(0,2)+"시";
}

int buyPrice = grsDto.getProduct_price();
int savePrice = grsDto.getSave_price();

//System.out.println("getProductsub_seq : "+grsDto.getProductsub_seq());

//System.out.println("course_name : "+glDao.getCourse_name(grsDto.getProductsub_seq()));

/*
int productsubSeq = NumberUtils.toInt(request.getParameter("gcId"), 0);
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

String golflinkName = StringUtils.trimToEmpty(request.getParameter("golflinkName"));
String bookingDate = StringUtils.trimToEmpty(request.getParameter("bookingDate"));

int buyPrice = NumberUtils.toInt(request.getParameter("buyPrice"),0);
int savePrice = NumberUtils.toInt(request.getParameter("savePrice"),0);
*/
%>
<!-- 상단 영역 -->
<%@ include file="/include/header_nhcard.jsp" %>
<!-- 상단 영역 -->
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
    <td style="padding-left: 55px;"><img src="../img_nhcard/common/img_pre_confirm_title.gif" width="556" height="65" border="0"></td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="600" cellpadding="0" cellspacing="0">
        <tr>
          <td width="600" colspan="3" bgcolor="#D1D3D4" height="1"></td>
        </tr>
        <tr>
          <td width="139" height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>예약자명</td>
          <td width="1" bgcolor="#D1D3D4"></td>
          <td width="440"  style="padding-left: 10px;" class=normal_b><%=rName%></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">핸드폰</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><%=rPhone %> </td>
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
          <td style="padding-left: 10px;" class=blue_list width="440"><%=golflinkName%></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">시간대</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><%=bookingDate%> <%=vbookingTime_s%>~<%=vbookingTime_e%></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">인원</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><span class=orange><%=rCnt%></span> 명</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">결제금액</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><span class=orange><%=Utils.numberFormat(buyPrice)%></span> 원</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">적립금액</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="440"><span class=orange><%=Utils.numberFormat(savePrice)%></span> 원</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="139">요청사항</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;padding-right: 10px;padding-top: 10px;padding-bottom: 10px;" width="430"><%=rRequest%></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
      </table></td>
  </tr>
    <tr>
        <td style="padding-left: 55px;padding-right: 50px;padding-top: 30px;padding-bottom: 50px;">
            ※ 예약내역 확인은 <span class=blue_list>메인페이지</span> &gt; <span class=blue_list>예약확인</span> 메뉴를 이용하시기 바랍니다.<br><br>
            ※ <span class=blue_list>고객센터</span>에서 예약시간 확인 후 연락을 드리며, 예약시간 확정 후 <span class=blue_list>메인페이지</span> &gt; <span class=blue_list>예약확인</span> 메뉴에서 24시간<br> &nbsp;&nbsp;&nbsp;&nbsp;안에 <span class=blue_list>“카드결제”</span>를 하시면 예약이 완료됩니다. 이용해 주셔서 감사합니다.
    </tr>
</table>
