<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.member.*"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.sql.MEMBER"%>
<%
	
	AdminDao aDao = new AdminDao();
	
	List<AdminDto> aList = aDao.getAdminList();
	
%>
<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<title></title>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 어드민 ★</td>
  </tr>
  <tr>
    <td align="center" width="1852">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" width="1850">
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" align="center" width="310"><span class=normal_b>아이디</span></td>
          <td width="230" align="center" bgcolor="#E6E7E8"><span class=normal_b>비밀번호</span></td>
          <td bgcolor="#e6e7e8" align="center" width="300"><span class=normal_b>이름</td>
        </tr>
<%
	int mSize = aList.size();
	AdminDto aDto;
	for(int i = 0 ; i < mSize ; i++){ 
		aDto = aList.get(i);
%>
        <tr>
          <td bgcolor="white" align="center" height="25"><input type="text" name="admin_id" id="admin_id" value="<%=aDto.getAdmin_id()%>"/></td>
          <td bgcolor="white" align="center" height="25"><input type="text" name="admin_id" id="admin_pwd" value="<%=aDto.getAdmin_pwd()%>"/></td>
          <td bgcolor="white" align="center" height="25"><input type="text" name="admin_id" id="admin_name" value="<%=aDto.getAdmin_name()%>"/></td>
        </tr>
<%
	}
%>
      </table>
     </td>
  </tr>
</table>
</body>
</html>