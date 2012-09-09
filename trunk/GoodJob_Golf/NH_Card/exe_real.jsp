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
String user_Name = StringUtils.trimToEmpty(request.getParameter("username"));
String user_Id = StringUtils.trimToEmpty(request.getParameter("gr_cd"));

int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int gcId = NumberUtils.toInt(request.getParameter("gcId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"),0);
int date = NumberUtils.toInt(request.getParameter("date"),0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"),0);
int perNum = NumberUtils.toInt(request.getParameter("perNum"),0);
int bill_price = NumberUtils.toInt(request.getParameter("bill_price"),0);

int savePrice = NumberUtils.toInt(request.getParameter("savePrice"),0);

String cbNum = StringUtils.trimToEmpty(request.getParameter("cbNum"));
String couponValue = StringUtils.trimToEmpty(request.getParameter("ddlCoupon"));
String[] arrCouponValue = couponValue.split("/");
int couponSeq = 0;
try{
	couponSeq  = NumberUtils.toInt(arrCouponValue[0]);
}catch(Exception e){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=1&gr_cd="+request.getParameter("gr_cd")+"&username="+user_Name+"'</script>");
	return;
}

if(menu == 0 || gcId == 0 || golf == 0 || date == 0 || cdate == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=1&gr_cd="+request.getParameter("gr_cd")+"&username="+user_Name+"'</script>");
	return;
}

String resName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String uPhone = "";
uPhone += request.getParameter("phone1") + "-";
uPhone += request.getParameter("phone2") + "-";
uPhone += request.getParameter("phone3");

/* ----- 쿠폰 ----- */
CouponDao cpDao = new CouponDao();
List<CouponDto> couponList = cpDao.getUserCouponList(user_Id, "0",true);

GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
glrDto.setReserve_name(resName);
glrDto.setReserve_uid(resName);
glrDto.setPer_num(Integer.toString(perNum));
glrDto.setReserve_phone(uPhone);
int couponPrice = 0;
CouponDto cpDto = new CouponDto();
/*for(int i = 0; i < couponList.size(); i++){
	if(couponList.get(i).getCoupon_seq() == couponSeq){
		couponPrice = couponList.get(i).getSale_price(); 
		cpDto = couponList.get(i);
		cpDto.setMenu_seq(menu);
	}
}*/
glrDto.setCoupon_price(couponPrice);
glrDto.setProcess_status("1");
glrDto.setCard_bill_num(cbNum);
glrDto.setProductsub_seq(gcId);
glrDto.setSite_seq(3);
glrDto.setSave_price(savePrice);

GolfLinkDao glDao = new GolfLinkDao();
glDao.setGolfReserve(glrDto, cpDto);

/*--------------- 문자 발송 --------------*/
String bookingDate = StringUtils.trimToEmpty(request.getParameter("bookingDate"));
String golflinkName = StringUtils.trimToEmpty(request.getParameter("golflinkName"));

golflinkName = golflinkName.replace("(P)","").replace("(PAR3)","");

String message = "";
message += "[" + golflinkName + "]";
bookingDate = bookingDate.substring(5,16).replace("-",".");
message += bookingDate;
message += " 예약되셨습니다";
message += "[NH카드고객센터]";
String sphone = "02-6670-0200";
String reserveuid = user_Id;
String reservephone = uPhone;

Map<String,String> params = new HashMap<String,String>();
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id",reserveuid);
params.put("rphone",reservephone);

SMSDao sDao = new SMSDao();
boolean isSend = sDao.send(params);

//추가 SMS 발송
message = "적립금액 : "+(Utils.numberFormat(savePrice))+"원은 익월 초에 자동 적립됩니다.";
message += "(NH카드)";
params.put("msg",message);
isSend = sDao.send(params);

%>
<script type="text/javascript">
var frm = this.parent.document.exefrm;
frm.target = ""; 
frm.action = "result.jsp";
frm.submit();
</script>