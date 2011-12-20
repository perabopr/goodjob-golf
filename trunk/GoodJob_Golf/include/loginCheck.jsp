<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%
if(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")).length()==0){
%>
<script language="javascript" type="text/javascript">
	alert("로그인을 하셔야 합니다.");
	history.go(-1);
</script>
<%
	return;
}
%>