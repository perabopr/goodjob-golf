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
String bookingDate = StringUtils.trimToEmpty(grsDto.getBooking_day()+grsDto.getBooking_time_s());
bookingDate = bookingDate.substring(0,4)
		+ "-" + bookingDate.substring(4,6)
		+ "-" + bookingDate.substring(6,8)
		+ " " + bookingDate.substring(8,10)
		+ ":" + bookingDate.substring(10,12);
		
int buyPrice = grsDto.getProduct_price();
int savePrice = grsDto.getSave_price();

String course_name = StringUtils.trimToEmpty(glDao.getCourse_name(grsDto.getProductsub_seq()));
int perNum = NumberUtils.toInt(grsDto.getPer_num(),0);

/*int productsubSeq = NumberUtils.toInt(request.getParameter("gcId"), 0);
int golf = NumberUtils.toInt(request.getParameter("golf"), 0);
int date = NumberUtils.toInt(request.getParameter("date"), 0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"), 0);

int rCnt = NumberUtils.toInt(request.getParameter("reserveCnt"), 0);
int rTeam = NumberUtils.toInt(request.getParameter("reserveTeam"), 0);
String rDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String rTime = StringUtils.trimToEmpty(request.getParameter("reserveTime"));
int rCoupon = NumberUtils.toInt(request.getParameter("reserveCoupon"), 0);


String course_name = StringUtils.trimToEmpty(request.getParameter("course_name"));
int perNum = NumberUtils.toInt(request.getParameter("perNum"),0);
String rName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String rPhone = StringUtils.trimToEmpty(request.getParameter("phone1"))+"-"+StringUtils.trimToEmpty(request.getParameter("phone2"))
					+"-"+StringUtils.trimToEmpty(request.getParameter("phone3"));
String rEmail = StringUtils.trimToEmpty(request.getParameter("email1"))+"@"+StringUtils.trimToEmpty(request.getParameter("email2"));
String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));
rRequest = rRequest.replaceAll("\r\n","</br>");

String golflinkName = StringUtils.trimToEmpty(request.getParameter("golflinkName"));
String bookingDate = StringUtils.trimToEmpty(request.getParameter("bookingDate"));
int buyPrice = NumberUtils.toInt(request.getParameter("bill_price"),0);
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
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">실시간예약</td>
          <td width="50%" height="25" bgcolor="#DCDDDE" style="padding-top:4px; padding-right: 10px;" align="right"><a href="default.jsp"><img align="absmiddle" src="../img_nhcard/common/btn_home.gif" width="60" height="19" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="padding-left: 55px;"><img src="../img_nhcard/common/img_pay_confirm_title.gif" width="556" height="65" border="0"></td>
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
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>부킹일시</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><%=bookingDate %></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>코스명</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><%=course_name %></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>인원</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><span class=orange><%=perNum %> </span>명</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>결제금액</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><span class=orange><%=Utils.numberFormat(buyPrice)%></span> 원</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>적립금액</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><span class=orange><%=Utils.numberFormat(savePrice)%></span> 원</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>결제방법</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;">신용카드결제</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
      </table></td>
  </tr>
    <tr>
        <td align="center" style="padding-top: 30px;padding-bottom: 50px;">※ 예약내역 확인은 &nbsp;<span class=blue_list>메인페이지</span> &gt; <span class=blue_list>예약확인</span> 메뉴를 이용하시기 바랍니다.
        </td>
    </tr>
</table>
