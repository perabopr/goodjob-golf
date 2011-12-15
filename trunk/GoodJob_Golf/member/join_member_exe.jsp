
<%@page import="com.goodjob.member.MemberDao"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.member.MemberDto"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String mem_name 	= StringUtils.trimToEmpty(request.getParameter("mem_name"));
	String mem_id 		= StringUtils.trimToEmpty(request.getParameter("mem_id"));
	String mem_domain 	= StringUtils.trimToEmpty(request.getParameter("mem_domain"));
	String mem_pwd 		= StringUtils.trimToEmpty(request.getParameter("mem_pwd"));
	String mobile1 	= StringUtils.trimToEmpty(request.getParameter("mobile1"));
	String mobile2 	= StringUtils.trimToEmpty(request.getParameter("mobile2"));
	String mobile3 	= StringUtils.trimToEmpty(request.getParameter("mobile3"));
	
	String mem_jumin1 	= StringUtils.trimToEmpty(request.getParameter("mem_jumin1"));
	String mem_jumin2 	= StringUtils.trimToEmpty(request.getParameter("mem_jumin2"));
	
	String sms_yn 	= StringUtils.trimToEmpty(request.getParameter("sms_yn"));
	String email_yn 	= StringUtils.trimToEmpty(request.getParameter("email_yn"));


	MemberDao mDao = new MemberDao();
	
	boolean isDup = mDao.isDuplicate(mem_id+"@"+mem_domain);
	
	if(isDup){
%>
	<script language="javascript" type="text/javascript">
	alert("가입하려는 아이디가 존재 합니다. 다른 아이디로 가입해 주세요!");
	</script>
<%
		return;
	}
	else{
		
		
		MemberDto mDto = new MemberDto();
		mDto.setMem_id(mem_id+"@"+mem_domain);
		mDto.setMem_jumin(mem_jumin1+"-"+mem_jumin1);
		mDto.setMem_name(mem_name);
		mDto.setMem_pwd(mem_pwd);
		mDto.setMem_mtel(mobile1+"-"+mobile2+"-"+mobile3);
		mDto.setSms_yn(sms_yn);
		mDto.setEmail_yn(email_yn);
		
		mDao.memberRegist(mDto);

%>
	<script language="javascript" type="text/javascript">
	alert("회원 가입이 정상적으로 이루어 졌습니다. 감사합니다.");
	top.document.location.href="/main.jsp";
	</script>
<%
	}
%>