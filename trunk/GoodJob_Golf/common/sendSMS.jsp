<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%
	Map<String,String> params = new HashMap<String,String>();

	String msg 			= StringUtils.trimToEmpty(request.getParameter("msg"));
	String mobile 		= StringUtils.trimToEmpty(request.getParameter("mobile"));
	
	//예약 발송 (즉시 발송은 null 값)
	String rdate 		= StringUtils.trimToEmpty(params.get("rdate"));
	String rtime 		= StringUtils.trimToEmpty(params.get("rtime"));

	params.put("mem_id",StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
	params.put("msg",msg);
	params.put("rphone",mobile);
	params.put("sphone","02-6670-0202");
	params.put("rdate",rdate);
	params.put("rtime",rtime);
	
	SMSDao sDao = new SMSDao();
	
	boolean isSend = sDao.send(params);
	
	if(isSend) out.println("0");
	else  out.println("1");
%>
