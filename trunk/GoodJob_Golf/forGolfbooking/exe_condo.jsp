<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.CondoReserveDao"%>
<%@page import="com.goodjob.reserve.dto.*"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="com.goodjob.util.Utils"%>
<%

	String menu = StringUtils.trimToEmpty(request.getParameter("menu"));
	int condo_seq = NumberUtils.toInt(request.getParameter("condo_seq"),1);
	String condo_name = StringUtils.trimToEmpty(request.getParameter("condo_name"));
	String in_date = StringUtils.trimToEmpty(request.getParameter("in_date"));
	String out_date = StringUtils.trimToEmpty(request.getParameter("out_date"));
	String condoroom_seq = StringUtils.trimToEmpty(request.getParameter("condoroom_seq"));
	String roomtype = StringUtils.trimToEmpty(request.getParameter("roomtype"));
	String room_num = StringUtils.trimToEmpty(request.getParameter("room_num"));
	String per_num = StringUtils.trimToEmpty(request.getParameter("per_num"));
	String reserve_name = StringUtils.trimToEmpty(request.getParameter("reserve_name"));
	String mobile = StringUtils.trimToEmpty(request.getParameter("mobile"));
	String reserve_memo = StringUtils.trimToEmpty(request.getParameter("reserve_memo"));
	
	CondoReserveDto cdDto = new CondoReserveDto();
	cdDto.setCondo_name(condo_name);
	cdDto.setCondo_seq(condo_seq);
	cdDto.setIn_date(in_date);
	cdDto.setOut_date(out_date);
	cdDto.setCondoroom_seq(NumberUtils.toInt(condoroom_seq));
	cdDto.setRoom_num(NumberUtils.toInt(room_num));
	cdDto.setRoomtype(roomtype);
	cdDto.setPer_num(NumberUtils.toInt(per_num));
	cdDto.setReserve_name(reserve_name);
	cdDto.setReserve_uid(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
	cdDto.setReserve_phone(mobile);
	cdDto.setReserve_memo(reserve_memo);
	
	CondoReserveDao cdDao = new CondoReserveDao();
	
	cdDao.setCondoReserve(cdDto);
%>
<script language="javascript" type="text/javascript">
var frm = top.document.exefrm;
frm.target =  "_self"; 
frm.action = "result.jsp";
frm.submit();
</script>