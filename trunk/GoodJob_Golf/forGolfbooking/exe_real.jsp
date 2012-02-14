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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//사용자정보.
String user_Name = StringUtils.trimToEmpty((String)session.getAttribute("mem_name"));
String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));

int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int gcId = NumberUtils.toInt(request.getParameter("gcId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"),0);
int date = NumberUtils.toInt(request.getParameter("date"),0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"),0);
int perNum = NumberUtils.toInt(request.getParameter("perNum"),0);
String cbNum = StringUtils.trimToEmpty(request.getParameter("cbNum"));
//int couponSeq = NumberUtils.toInt(request.getParameter("ddlCoupon"),0);
String couponValue = StringUtils.trimToEmpty(request.getParameter("ddlCoupon"));
String[] arrCouponValue = couponValue.split("/");
int couponSeq = 0;
try{
	couponSeq  = NumberUtils.toInt(arrCouponValue[0]);
}catch(Exception e){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=1'</script>");
	return;
}

if(menu == 0 || gcId == 0 || golf == 0 || date == 0 || cdate == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=1'</script>");
	return;
}

String resName = request.getParameter("reserveName");
String uPhone = "";
uPhone += request.getParameter("phone1") + "-";
uPhone += request.getParameter("phone2") + "-";
uPhone += request.getParameter("phone3");

/* ----- 쿠폰 ----- */
CouponDao cpDao = new CouponDao();
List<CouponDto> couponList = cpDao.getUserCouponList(user_Id, "0",true);

GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
glrDto.setReserve_name(resName);
glrDto.setReserve_uid(user_Id);
glrDto.setPer_num(Integer.toString(perNum));
glrDto.setReserve_phone(uPhone);
int couponPrice = 0;
CouponDto cpDto = new CouponDto();
for(int i = 0; i < couponList.size(); i++){
	if(couponList.get(i).getCoupon_seq() == couponSeq){
		couponPrice = couponList.get(i).getSale_price(); 
		cpDto = couponList.get(i);
		cpDto.setMenu_seq(menu);
	}
}
glrDto.setCoupon_price(couponPrice);
glrDto.setProcess_status("0");
glrDto.setCard_bill_num(cbNum);
glrDto.setProductsub_seq(gcId);

GolfLinkDao glDao = new GolfLinkDao();
glDao.setGolfReserve(glrDto, cpDto);

/*--------------- 문자 발송 --------------*/
String bookingDate = request.getParameter("bookingDate");
String golflinkName = request.getParameter("golflinkName");
golflinkName = golflinkName.replace("(P)","").replace("(PAR3)","");
String message = "";
message += "[" + golflinkName + "]";
bookingDate = bookingDate.substring(5,16).replace("-",".");
message += bookingDate;
message += " 예약되셨습니다";
message += "(굿잡골프)";
String sphone = "02-6670-0202";
String reserveuid = user_Id;
String reservephone = uPhone;
Map<String,String> params = new HashMap<String,String>();
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id",reserveuid);
params.put("rphone",reservephone);

SMSDao sDao = new SMSDao();
boolean isSend = sDao.auth(params);

%>
<script language="javascript" type="text/javascript">
top.document.location.href="result.jsp?menu=1";
</script>