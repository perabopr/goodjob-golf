<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%@page import="com.goodjob.util.Utils"%>
<%

String nhNum = request.getParameter("gr_cd");
String nhName = request.getParameter("username");
//사용자정보.

int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int psId = NumberUtils.toInt(request.getParameter("psId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"),0);
int date = NumberUtils.toInt(request.getParameter("date"),0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"),0);
int rCnt = NumberUtils.toInt(request.getParameter("reserveCnt"),0);
int rTeam = NumberUtils.toInt(request.getParameter("reserveTeam"),0);
int savePrice = NumberUtils.toInt(request.getParameter("savePrice"),0);

String rDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String rTime = StringUtils.trimToEmpty(request.getParameter("reserveTime"));
String rName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String rPhone = StringUtils.trimToEmpty(request.getParameter("reservePhone"));
String rEmail = StringUtils.trimToEmpty(request.getParameter("reserveEmail"));
String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));
String couponValue = StringUtils.trimToEmpty(request.getParameter("ddlCoupon"));
String[] arrCouponValue = couponValue.split("/");
int couponSeq = 0;
try{
	couponSeq  = NumberUtils.toInt(arrCouponValue[0]);
}catch(Exception e){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=1&gr_cd="+nhNum+"&username="+nhName+"'</script>");
	return;
}

if(menu == 0 || psId == 0 || golf == 0 || date == 0 || cdate == 0 || rCnt == 0 || rTeam == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=2&gr_cd="+nhNum+"&username="+nhName+"'</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> prList = glDao.getGolfProduct(psId);

int reserve_seq = 0;
if(prList.size() != 1){
	out.print("<script>alert('잘못된 접근입니다.');location.href='/forGolfbooking/reserve.jsp?menu=2&gr_cd="+nhNum+"&username="+nhName+"'</script>");
}else{
	if(prList.get(0).getProduct_status().equals("0")){
		
		GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
		glrDto.setReserve_name(rName);
		glrDto.setReserve_uid(rName);
		glrDto.setPer_num(Integer.toString(rCnt));
		glrDto.setReserve_phone(rPhone);
		glrDto.setProduct_price(prList.get(0).getGoodjob_price() * rCnt);
		int couponPrice = 0;
		
		CouponDto cpDto = new CouponDto();

		glrDto.setCoupon_price(couponPrice);
		glrDto.setProcess_status("0");
		glrDto.setCard_bill_num("");
		glrDto.setSave_price(savePrice);
		glrDto.setSite_seq(3);
		
		glrDto.setProductsub_seq(psId);
		
		reserve_seq = glDao.setGolfReserve(glrDto, cpDto);
		
	}else{
		out.print("<script>alert('예약할 수 없습니다.');location.href='/linkpages/reserve.jsp?menu=2&gr_cd="+nhNum+"&username="+nhName+"'</script>");		
	}
}

if(menu == 0 || reserve_seq == 0){
	out.println("<script>alert('예약 오류 입니다.');location.href='reserve.jsp?menu=2&gr_cd="+nhNum+"&username="+nhName+"'</script>");
	return;
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
message += "[NH카드고객센터]";
String sphone = "02-6670-0205";
String reservephone = rPhone;
Map<String,String> params = new HashMap<String,String>();
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id",rEmail);
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
frm.reserve_seq.value=<%=reserve_seq%>;
frm.action = "result.jsp";
frm.submit();
</script>