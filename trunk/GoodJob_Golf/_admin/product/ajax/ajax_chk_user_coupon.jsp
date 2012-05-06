<%@page import="java.util.List"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="com.goodjob.member.MemberDto"%>
<%@page import="com.goodjob.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String mem_id = request.getParameter("mem_id");
MemberDao mDao = new MemberDao();
MemberDto mDto = mDao.getMember(mem_id);

String returnJson = "{";

if(mDto != null){
	returnJson += "\"User_Exist\":\"N\",\"UserCoupon\":[";
	CouponDao cDao = new CouponDao();
	List<CouponDto> couponList = cDao.getUserCouponList(mem_id, "0", true);
	
	returnJson += "]";
}else{
	returnJson += "\"User_Exist\":\"N\",\"UserCoupon\":[]";
}
%>