<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.util.*"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.coupon.*"%>
<%
	String[] coupon_seq = request.getParameterValues("coupon_seq");
	
	CouponDao cpDao = new CouponDao();
	
	int len = coupon_seq.length;
	
	for(int i = 0 ; i < len ; i++){
		
		cpDao.couponDel(NumberUtils.toInt(coupon_seq[i]));
	}
	
%>
<script language="javascript" type="text/javascript">
alert("쿠폰이 정상적으로 삭제 되었습니다.");
top.main.document.location.reload();
</script>