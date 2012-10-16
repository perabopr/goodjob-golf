<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="com.goodjob.sms.SMSDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkReserveDto"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.goodjob.util.Utils"%>
<%
//사용자정보.
int menu = 1;

String buyr_name = StringUtils.trimToEmpty(request.getParameter("buyr_name"));
int gcId = NumberUtils.toInt(request.getParameter("gcId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"),0);
int date = NumberUtils.toInt(request.getParameter("date"),0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"),0);
int perNum = NumberUtils.toInt(request.getParameter("perNum"),0);
int bill_price = NumberUtils.toInt(request.getParameter("good_mny"),0);
int save_price = NumberUtils.toInt(request.getParameter("save_price"),0);
String bookingDate = StringUtils.trimToEmpty(request.getParameter("bookingDate"));
String golflinkName = StringUtils.trimToEmpty(request.getParameter("golflinkName"));
golflinkName = golflinkName.replace("(P)","").replace("(PAR3)","");

String res_cd = StringUtils.trimToEmpty(request.getParameter("res_cd"));
String res_msg = StringUtils.trimToEmpty(request.getParameter("res_msg"));
String cbNum = StringUtils.trimToEmpty(request.getParameter("ordr_idxx"));
int couponSeq = 0;

if(menu == 0 || gcId == 0 || golf == 0 || date == 0 || cdate == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='realtime_list.jsp?menu=1'</script>");
	return;
}


String uPhone = StringUtils.trimToEmpty(request.getParameter("mtel"));

/* ----- 쿠폰 ----- */
CouponDao cpDao = new CouponDao();

GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
glrDto.setReserve_name(buyr_name);
glrDto.setReserve_uid(buyr_name);
glrDto.setPer_num(Integer.toString(perNum));
glrDto.setProduct_price(bill_price);
glrDto.setReserve_phone(uPhone);
int couponPrice = 0;

glrDto.setCoupon_price(couponPrice);
glrDto.setProcess_status("1");
glrDto.setCard_bill_num(cbNum);
glrDto.setProductsub_seq(gcId);
glrDto.setSite_seq(3);
glrDto.setSave_price(save_price);

int reserve_seq = 0;
GolfLinkDao glDao = new GolfLinkDao();

reserve_seq = glDao.setGolfReserve(glrDto, new CouponDto());

/*--------------- 문자 발송 --------------*/

String message = "";

String sphone = "02-6670-0205";
String reservephone = uPhone;

Map<String,String> params = new HashMap<String,String>();

//추가 SMS 발송
message += "[" + golflinkName + "]";
bookingDate = bookingDate.substring(5,16).replace("-",".");
message += bookingDate;
message += " 예약되셨습니다";
message += "[NH카드고객센터]";
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id","nh_card");
params.put("rphone",reservephone);

SMSDao sDao = new SMSDao();
boolean isSend = sDao.send(params);

params.clear();
message = "적립금액 : "+(Utils.numberFormat(save_price))+"원은 12월 중 채움 포인트로 일괄 적립 예정";
message += "[NH카드고객센터]";
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id","nh_card");
params.put("rphone",reservephone);
isSend = sDao.send(params);

%>
<script type="text/javascript">
document.location.href="result.jsp?menu=1&reserve_seq=<%=reserve_seq%>";
</script>