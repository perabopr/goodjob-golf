<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.member.MemberDao"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String mem_id 		= StringUtils.trimToEmpty(request.getParameter("mem_id"));
	String memo 		= StringUtils.trimToEmpty(request.getParameter("memo"));
	
	MemberDao mDao = new MemberDao();
	
	boolean isUpdate = mDao.memberMemoUpdate(mem_id , memo);
	
%>
<script language="javascript" type="text/javascript">
alert("저장 되었습니다.");
top.document.location.href="mem_detail.jsp?mem_id=<%=mem_id%>";
</script>
