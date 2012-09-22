<%@page import="com.goodjob.order.dto.CondoDto"%>
<%@page import="com.goodjob.order.CondoDao"%>
<%@page import="com.goodjob.order.dto.PackageDto"%>
<%@page import="com.goodjob.order.PackageDao"%>
<%@page import="com.goodjob.order.dto.GolfLinkDto"%>
<%@page import="com.goodjob.order.GolfLinkDao"%>
<%@page import="com.goodjob.util.Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%@page import="com.goodjob.member.*"%>
<%
String reserveuid = "";
String reservephone = "";

String message = request.getParameter("message");
String sphone = StringUtils.trimToEmpty(request.getParameter("sphone"));
int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int seq = NumberUtils.toInt(request.getParameter("seq"),0);

if(menu == 1 || menu == 2){
	GolfLinkDao glList = new GolfLinkDao();
	List<GolfLinkDto> list = glList.getGolfLinkReserve(seq);
	if(list != null && list.size() == 1){
		reserveuid = list.get(0).getReserve_uid();
		reservephone = list.get(0).getReserve_phone();
	}
	else{
		out.print("<script>alert('잘못된 값입니다.');self.close();</script>");
		return;
	}
}

if(menu == 3){
	PackageDao pkList = new PackageDao();
	List<PackageDto> list = pkList.getPackageReserve(seq);
	if(list != null && list.size() == 1){
		reserveuid = list.get(0).getReserve_uid();
		reservephone = list.get(0).getReserve_phone();
	}
	else{
		out.print("<script>alert('잘못된 값입니다.');self.close();</script>");
		return;
	}
}

if(menu == 5){
	CondoDao cdList = new CondoDao();
	List<CondoDto> list = cdList.getCondoReserve(seq);
	if(list != null && list.size() == 1){
		reserveuid = list.get(0).getReserve_uid();
		reservephone = list.get(0).getReserve_phone();
	}
	else{
		out.print("<script>alert('잘못된 값입니다.');self.close();</script>");
		return;
	}
}

Map<String,String> params = new HashMap<String,String>();
params.put("msg",message);
if("ibyoo@koreahart.co.kr".equals(reserveuid)){
	params.put("sphone","02-6670-0279");
}else{
	params.put("sphone",sphone);
}
params.put("mem_id",reserveuid);
params.put("rphone",reservephone);

SMSDao sDao = new SMSDao();
boolean isSend = sDao.auth(params);
if(isSend){
%>
<script language="javascript" type="text/javascript">
alert("SMS 발송 되었습니다.");
//self.close();
</script>
<%
}else{
%>
<script language="javascript" type="text/javascript">
alert("SMS 발송 실패 했습니다.");
//self.close();
</script>
<%
}
%>