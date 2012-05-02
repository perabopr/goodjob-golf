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
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

String nhNum = request.getParameter("gr_cd");
String nhName = request.getParameter("username");
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
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=1&gr_cd="+nhNum+"&username="+URLEncoder.encode(nhName, "utf-8")+"'</script>");
	return;
}

if(menu == 0 || psId == 0 || golf == 0 || date == 0 || cdate == 0 || rCnt == 0 || rTeam == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=2&gr_cd="+nhNum+"&username="+URLEncoder.encode(nhName, "utf-8")+"'</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> prList = glDao.getGolfProduct(psId);

if(prList.size() != 1){
	out.print("<script>alert('잘못된 접근입니다.');location.href='/forGolfbooking/reserve.jsp?menu=2&gr_cd="+nhNum+"&username="+URLEncoder.encode(nhName, "utf-8")+"'</script>");
}else{
	if(prList.get(0).getProduct_status().equals("0")){
		
		/* ----- 쿠폰 ----- */
		CouponDao cpDao = new CouponDao();
		List<CouponDto> couponList = cpDao.getUserCouponList(user_Id, "0", true);
		
		GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
		glrDto.setReserve_name(rName);
		glrDto.setReserve_uid(nhNum);
		//glrDto.setReserve_uid(rEmail);
		glrDto.setPer_num(Integer.toString(rCnt));
		glrDto.setReserve_phone(rPhone);
		glrDto.setProduct_price(prList.get(0).getGoodjob_price() * rCnt);
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
		glrDto.setSite_seq(2);
		
		glrDto.setProductsub_seq(psId);
		
		glDao.setGolfReserve(glrDto, cpDto);
		
	}else{
		out.print("<script>alert('예약할 수 없습니다.');location.href='/linkpages/reserve.jsp?menu=2&gr_cd="+nhNum+"&username="+URLEncoder.encode(nhName, "utf-8")+"'</script>");		
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
message += " ▶하나로고객센터";
String sphone = "02-6670-0110";
String reserveuid = user_Id;
String reservephone = rPhone;
Map<String,String> params = new HashMap<String,String>();
params.put("msg",message);
params.put("sphone",sphone);
params.put("mem_id",reserveuid);
params.put("rphone",reservephone);

SMSDao sDao = new SMSDao();
boolean isSend = sDao.send(params);
%>
<script type="text/javascript">
this.parent.document.location.href="result.jsp?menu=2&gr_cd=<%=request.getParameter("gr_cd")%>";
</script>