<%@page import="com.goodjob.product.CondoDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String condoSeq = request.getParameter("condoSeq");
if(condoSeq.length() > 0){
	String[] arrcondoSeq = condoSeq.split(",");
	for(int i = 0; i < arrcondoSeq.length;i++){
		int condo_Seq = NumberUtils.toInt(arrcondoSeq[i]);
		CondoDao cdDao = new CondoDao();
		cdDao.setCondoPromiseDelete(condo_Seq);
		cdDao.setCondoRoomDelete(condo_Seq);
		cdDao.setCondoGallery2Delete(condo_Seq);
		cdDao.setCondoDelete(condo_Seq);
	}
}
%>
<script type="text/javascript">
location.href='condo_list.jsp';
</script>