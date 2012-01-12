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
		GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
		glrDto.setReserve_name(rName);
		glrDto.setReserve_uid(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
		//glrDto.setReserve_uid(rEmail);
		glrDto.setPer_num(Integer.toString(rCnt));
		glrDto.setReserve_phone(rPhone);
		glrDto.setProduct_price(prList.get(0).getGoodjob_price() * rCnt);
		glrDto.setCoupon_price(0);
		glrDto.setProcess_status("0");
		glrDto.setCard_bill_num("");
		glrDto.setProductsub_seq(psId);
		
		glDao.setGolfReserve(glrDto);
		
	}else{
		out.print("<script>alert('예약할 수 없습니다.');location.href='/forGolfbooking/reserve.jsp?menu=2';</script>");		
	}
}
%>
<script language="javascript" type="text/javascript">
top.document.location.href="result.jsp?menu=2";
</script>