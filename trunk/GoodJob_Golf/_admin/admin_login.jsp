<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.util.Utils"%>
<%@page import="com.goodjob.member.*"%>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String admin_id = StringUtils.defaultString(request.getParameter("admin_id"), "");
	String admin_pwd = StringUtils.defaultString(request.getParameter("admin_pwd"), "");
	
	AdminDao adminDao = new AdminDao();
	
	AdminDto dto = adminDao.login(admin_id);
	
	if(dto == null || dto.getAdmin_pwd() == null){
%>
		
<script language="javascript" type="text/javascript">
			alert("아이디가 존재 하지 않습니다.");
			history.go(-1);
		</script>
<%
		return;
	}
	
	if(!admin_pwd.equals(dto.getAdmin_pwd())){
%>
		<script language="javascript" type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>
<%
		return;
	}
	
	session.setAttribute("admin_id",admin_id);
	session.setAttribute("admin_type",dto.getType());
	session.setAttribute("admin_name",dto.getAdmin_name());
	
	response.sendRedirect("/_admin/Main.jsp");
	
%>
