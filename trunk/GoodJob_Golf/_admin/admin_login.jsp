<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.util.Utils"%>
<%@ page import="com.goodjob.member.MemberDto"%>
<%@ page import="com.goodjob.member.MemberDao"%>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String mem_id = StringUtils.defaultString(request.getParameter("admin_id"), "");
	String mem_pwd = StringUtils.defaultString(request.getParameter("admin_pwd"), "");
	
	if(!"admin".equals(mem_id)){
%>
		<script language="javascript" type="text/javascript">
			alert("아이디가 존재 하지 않습니다.");
			history.go(-1);
		</script>
<%
		return;
	}
	
	if(!"admin".equals(mem_pwd)){
%>
		<script language="javascript" type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>
<%
		return;
	}
	
	session.setAttribute("admin_id",mem_id);
	session.setAttribute("admin_name","관리자");

	response.sendRedirect("/_admin/Main.jsp");
	
%>
