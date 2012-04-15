<%@page import="com.goodjob.sms.SMSDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));
	
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
	cdDto.setReserve_uid(user_Id);
	cdDto.setReserve_phone(mobile);
	cdDto.setReserve_memo(reserve_memo);
	
	CondoReserveDao cdDao = new CondoReserveDao();
	
	cdDao.setCondoReserve(cdDto);
	
	/*--------------- 문자 발송 --------------*/
	condo_name = condo_name.replace("(P)","").replace("(PAR3)","");
	String message = "";
	message += "[" + condo_name + "]";
	in_date = in_date.substring(5,10).replace("-",".");
	message += in_date;
	message += " 예약되셨습니다";
	message += "(굿잡골프)";
	String sphone = "02-6670-0202";
	String reserveuid = user_Id;
	String reservephone = mobile;
	Map<String,String> params = new HashMap<String,String>();
	params.put("msg",message);
	params.put("sphone",sphone);
	params.put("mem_id",reserveuid);
	params.put("rphone",reservephone);

	SMSDao sDao = new SMSDao();
	boolean isSend = sDao.send(params);
	
	message = "계좌번호 : 국민 421737-04-015359\n";
	message += "예금주 : ㈜세이브코리아 입니다.\n";
	message += "(굿잡골프)";
	params.clear();
	params.put("msg",message);
	params.put("sphone",sphone);
	params.put("mem_id",reserveuid);
	params.put("rphone",reservephone);
	isSend = sDao.send(params);
%>
<script language="javascript" type="text/javascript">
var frm = top.document.exefrm;
frm.target =  "_self"; 
frm.action = "result.jsp";
frm.submit();
</script>