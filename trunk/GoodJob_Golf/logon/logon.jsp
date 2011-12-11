<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@page import="com.goodjob.util.Utils"%>
<%@page import="com.goodjob.member.MemberDto"%>
<%@page import="com.goodjob.member.MemberDao"%>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String mem_id = StringUtils.defaultString(request.getParameter("mem_id"), "");
	String mem_pwd = StringUtils.defaultString(request.getParameter("mem_pwd"), "");
	String return_url = StringUtils.defaultString(request.getParameter("return_url"), "");
	
	MemberDao mDao = new MemberDao();
	
	MemberDto mDto = mDao.logon(mem_id , mem_pwd);
	
	if(mDto == null){
%>
	<script language="javascript" type="text/javascript">
		alert("입력한 아이디가 존재 하지 않습니다.");
		history.go(-1);
	</script>
<%
		return;
	}
	else{
		
		if(!mDto.getMem_pwd().equals(mDto.getInput_pwd())){
%>
	<script language="javascript" type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
<%
			return;
		}
		
		session.setAttribute("mem_id",mDto.getMem_id());
		session.setAttribute("mem_mtel",mDto.getMem_mtel());
		session.setAttribute("mem_name",mDto.getMem_name());
		
		response.sendRedirect("/main.jsp");
		
	}
	
%>
