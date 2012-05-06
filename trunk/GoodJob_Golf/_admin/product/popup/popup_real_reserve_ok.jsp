<%@page import="com.goodjob.util.Utils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.sms.SMSDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.goodjob.product.GolfLinkDao"%>
<%@page import="com.goodjob.product.dto.GolfLinkDto"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkReserveDto"%>
<%@page import="com.goodjob.product.dto.ProductSubDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.product.productDao"%>
<%@page import="com.goodjob.product.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menuSeq = request.getParameter("menuSeq");
String golfSeq = request.getParameter("glSeq");
String bookingDate = request.getParameter("txtBookingDate");
String[] bookingDateSplit = bookingDate.split("-");
String pYear = bookingDateSplit[0];
String pMonth = bookingDateSplit[1];
String pDay = bookingDateSplit[2];
String resRegDate = request.getParameter("txtReserveRegDate");
String golfcourse = request.getParameter("course_list");
String BookingHour = request.getParameter("ddlBookingHour");
String BookingMin = request.getParameter("ddlBookingMin");
String inPrice = request.getParameter("inPrice");
String prdtStatus = request.getParameter("ddl_prdtStatus");
String CouponSeq = request.getParameter("ddlCoupon");
String resName = request.getParameter("txtReserveUser");
String user_Id = request.getParameter("txtReserveUserId");
String perNum = request.getParameter("perNum");
String userPhone1 = request.getParameter("phone1");
String userPhone2 = request.getParameter("phone2");
String userPhone3 = request.getParameter("phone3");
String uPhone = userPhone1 + "-" + userPhone2 + "-" + userPhone3;
String cbNum = StringUtils.trimToEmpty(request.getParameter("cbNum"));


/** 상품 등록 **/
ProductDto prdtDto = new ProductDto();
prdtDto.setMenu_seq(Integer.parseInt(menuSeq));
prdtDto.setGolflink_seq(Integer.parseInt(golfSeq));
prdtDto.setProduct_year(pYear);
prdtDto.setProduct_month(pMonth);
prdtDto.setProduct_day(pDay);
prdtDto.setView_yn("N");
productDao prdtDao = new productDao();

int prdtSeq = 0;
List<ProductDto> list = prdtDao.getProductSelectDate(prdtDto);
if(list.size() == 0){
	prdtSeq = prdtDao.setProductInsert(prdtDto);
}
else{
	prdtSeq = list.get(0).getProduct_seq();
}

/** 상품-시간별 등록 **/
ProductSubDto prdtSubDto = new ProductSubDto();
prdtSubDto.setProduct_seq(prdtSeq);
prdtSubDto.setGolflink_course_seq(Integer.parseInt(golfcourse));
prdtSubDto.setTime_start(BookingHour+BookingMin);
prdtSubDto.setTime_end("");
prdtSubDto.setGoodjob_price(Integer.parseInt(inPrice));
prdtSubDto.setNH_price(0);
prdtSubDto.setReal_nh_price(0);
prdtSubDto.setProduct_status(prdtStatus);
if(CouponSeq.equals("0")){
	prdtSubDto.setCoupon_use_yn(CouponSeq);
}
else{
	prdtSubDto.setCoupon_use_yn("1");
}
productDao pd = new productDao();
int prdtSubSeq = pd.setProductSubInsert(prdtSubDto);

if(prdtStatus.equals("0")){
	pd.setProductUpdate(prdtSeq, "Y");
}

/** 예약 **/
GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
glrDto.setReserve_day(resRegDate);
glrDto.setReserve_name(resName);
glrDto.setReserve_uid(user_Id);
glrDto.setPer_num(perNum);
glrDto.setReserve_phone(uPhone);
int couponPrice = 0;
CouponDto cpDto = new CouponDto();
/*
for(int i = 0; i < couponList.size(); i++){
	if(couponList.get(i).getCoupon_seq() == couponSeq){
		couponPrice = couponList.get(i).getSale_price(); 
		cpDto = couponList.get(i);
		cpDto.setMenu_seq(menu);
	}
}
*/
glrDto.setCoupon_price(couponPrice);
glrDto.setProcess_status("0");
glrDto.setCard_bill_num(cbNum);
glrDto.setProductsub_seq(prdtSubSeq);
glrDto.setSite_seq(1);

com.goodjob.reserve.GolfLinkDao glDao = new com.goodjob.reserve.GolfLinkDao();
glDao.setGolfReserve(glrDto, cpDto);

/*--------------- 문자 발송 --------------*/
GolfLinkDao glDao2 = new GolfLinkDao();
List<GolfLinkDto> glList = glDao2.getGolfLink(Integer.parseInt(golfSeq));

String golflinkName = glList.get(0).getGolflink_name();
golflinkName = golflinkName.replace("(P)","").replace("(PAR3)","");
String message = "";
message += "[" + golflinkName + "]";
bookingDate = bookingDate.replace("-",".");
message += bookingDate;
message += " 예약되셨습니다";
message += " ▶하나로고객센터";
String sphone = "02-6670-0110";
String reserveuid = user_Id;
String reservephone = uPhone;
Map<String,String> params = new HashMap<String,String>();
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id",reserveuid);
params.put("rphone",reservephone);

SMSDao sDao = new SMSDao();
//boolean isSend = sDao.send(params);
/* -- 필요없긴 하겠는데...
if("".equals(cbNum) && cbNum.length() == 0 ){
	message = "계좌번호:농협 317-0001-2481-91 ";
	message += "㈜세이브코리아\n";
	message += "입금액:"+Utils.numberFormat(Integer.parseInt(inPrice) * Integer.parseInt(glrDto.getPer_num()) - glrDto.getCoupon_price())+"\n";
	message += "[하나로고객센터]";
	params.clear();
	params.put("msg",message);
	params.put("sphone",sphone);
	params.put("mem_id",reserveuid);
	params.put("rphone",reservephone);
	isSend = sDao.send(params);
}
*/
%>
<script language="javascript" type="text/javascript">
alert("등록되었습니다.");
parent.opener.location.reload(); 
self.close();
</script>