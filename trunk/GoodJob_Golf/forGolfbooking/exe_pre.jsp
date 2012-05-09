<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.goodjob.sms.SMSDao"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//사용자정보.
String user_Name = StringUtils.trimToEmpty((String)session.getAttribute("mem_name"));
String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));

int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int psId = NumberUtils.toInt(request.getParameter("psId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"),0);
int date = NumberUtils.toInt(request.getParameter("date"),0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"),0);
int rCnt = NumberUtils.toInt(request.getParameter("reserveCnt"),0);
int rTeam = NumberUtils.toInt(request.getParameter("reserveTeam"),0);
String rDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String rTime = StringUtils.trimToEmpty(request.getParameter("reserveTime"));
String rName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String rPhone = StringUtils.trimToEmpty(request.getParameter("reservePhone"));
String rEmail = StringUtils.trimToEmpty(request.getParameter("reserveEmail"));
String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));
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

if(menu == 0 || psId == 0 || golf == 0 || date == 0 || cdate == 0 || rCnt == 0 || rTeam == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=2';</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> prList = glDao.getGolfProduct(psId);

if(prList.size() != 1){
	out.print("<script>alert('잘못된 접근입니다.');location.href='/forGolfbooking/reserve.jsp?menu=2';</script>");
}else{
	if(prList.get(0).getProduct_status().equals("0")){
		
		/* ----- 쿠폰 ----- */
		CouponDao cpDao = new CouponDao();
		List<CouponDto> couponList = cpDao.getUserCouponList(user_Id, "0", true);
		
		GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
		glrDto.setReserve_name(rName);
		glrDto.setReserve_uid(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
		//glrDto.setReserve_uid(rEmail);
		glrDto.setPer_num(Integer.toString(rCnt));
		glrDto.setReserve_phone(rPhone);
		glrDto.setProduct_price(prList.get(0).getNH_price() * rCnt);
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
		glrDto.setCard_bill_num("");
		glrDto.setProductsub_seq(psId);
		glrDto.setSite_seq(1);
		
		glDao.setGolfReserve(glrDto, cpDto);
		
	}else{
		out.print("<script>alert('예약할 수 없습니다.');location.href='/forGolfbooking/reserve.jsp?menu=2';</script>");		
	}
}

/*--------------- 문자 발송 --------------*/
String bookingDate = request.getParameter("bookingDate");
String golflinkName = request.getParameter("golflinkName");
golflinkName = golflinkName.replace("(P)","").replace("(PAR3)","");
String message = "";
message += "[" + golflinkName + "]";
bookingDate = bookingDate.substring(5,10).replace("-",".");
message += bookingDate;
message += " 예약신청되셨습니다";
message += "(굿잡골프)";
String sphone = "02-6670-0202";
String reserveuid = user_Id;
String reservephone = rPhone;
Map<String,String> params = new HashMap<String,String>();
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id",reserveuid);
params.put("rphone",reservephone);

SMSDao sDao = new SMSDao();
boolean isSend = sDao.send(params);
/*
message = "계좌번호 : 국민 421737-04-015359\n";
message += "예금주 : ㈜세이브코리아 입니다.\n";
message += "(굿잡골프)";
params.clear();
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id",reserveuid);
params.put("rphone",reservephone);
isSend = sDao.send(params);
*/
%>
<script language="javascript" type="text/javascript">
top.document.location.href="result.jsp?menu=2";
</script>