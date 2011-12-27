<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.member.MemberDao"%>
<%

	
	String mem_id 		= StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));
	String memo 		= StringUtils.trimToEmpty(request.getParameter("memo"));
	
	MemberDao mDao = new MemberDao();
	
	boolean isUpdate = mDao.userSeccesstion(mem_id , memo);
	
%>
<script language="javascript" type="text/javascript">
alert("회원 탈퇴를 요청 하셨습니다.\n탈퇴 철회는 고객센터로 문의 바랍니다.");
top.document.location.href="/logon/logout.jsp";
</script>
