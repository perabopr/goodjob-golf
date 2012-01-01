<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%
if(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")).length()==0){
%>
<script language="javascript" type="text/javascript">
	alert("로그인이 필요한 곳입니다.");
	//history.go(-1);
	location.href="/member/member_logon.jsp";
</script>
<%
	return;
}
%>