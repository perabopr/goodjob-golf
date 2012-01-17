<%@page import="com.goodjob.product.GolfLinkDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String golflinkseq = request.getParameter("golflinkseq");
if(golflinkseq.length() > 0){
	String[] arrGolflinkseq = golflinkseq.split(",");
		for(int i = 0; i < arrGolflinkseq.length;i++){
		int gl_seq = NumberUtils.toInt(arrGolflinkseq[i]);
		GolfLinkDao gldao = new GolfLinkDao();
		gldao.setGolfLinkCourseDelete2(gl_seq);
		gldao.setGolfLinkPriceDelete(gl_seq);
		gldao.setGolfLinkPromiseDelete(gl_seq);
		//gldao.setGolfLinkReserveDelete(gl_seq);
		gldao.setGolfLinkDelete(gl_seq);
	}
}
%>
<script type="text/javascript">
location.href='pre_list.jsp?menu=1';
</script>