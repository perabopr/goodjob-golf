<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@page import="com.goodjob.reserve.dto.GolfLinkCourseDto"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%
	String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));
	GolfLinkDao gfdao = new GolfLinkDao(); 
	List<GolfLinkCourseDto> glcDto = gfdao.getGolfLinkCourseSelect(Integer.parseInt(glSeq));
%>
<html>
<head>
<title>코스입력</title>
<link rel="stylesheet" href="../../style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">
	function reg_submit() {
		if(!$("#course").val()){
			alert('코스를 입력하세요.');
			$("#course").focus();
			return;
		}
		
		frm1.submit();			
	}

	function del_submit(seq){
		if(confirm("삭제 하겠습니까?")){
			$("#courseSeq").val(seq);
			frm2.submit();
		}
	}
</script>
</head>
<body>
	<table align="center" border="0" cellpadding="0" cellspacing="0" width="360">
	<tr>
		<td align="center" width="360" class=title>★ 실시간 골프장 코스입력 ★</td>
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	<tr>
		<td align="center">
			<form NAME="frm1" METHOD="post" ACTION="pop_course_reg.jsp">
			<input type="hidden" id="glSeq1" name="glSeq1" value="<%=glSeq %>" />
		  	<table width="320" cellpadding="0" cellspacing="0" bgcolor="#D1D3D4">
		    <tr>
		    	<td bgcolor="white" width="279"><input class="input_box" size="40" id="course" name="course"></td>
		        <td align="center" bgcolor="white" width="60"><img align="absmiddle" src="../../images/inc/btn_plus.gif" width="32" height="16" border="0" onclick="reg_submit();return false;"></td>
		    </tr>
		    </table>
		    </form>
		</td>
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	<tr>
		<td align="center">
			<form NAME="frm2" METHOD="post" ACTION="pop_course_del.jsp">
			<input type="hidden" id="glSeq2" name="glSeq2" value="<%=glSeq %>" />
			<input type="hidden" id="courseSeq" name="courseSeq" value="" />
			<table width="320" cellpadding="0" cellspacing="0">
			<%
				for(int i = 0; i < glcDto.size();i++){
			%>
			<tr>
				<td><%= glcDto.get(i).getCourse_name()%></td>
				<td align="right"><a href="javascript:del_submit('<%= glcDto.get(i).getGolflink_course_seq()%>');"><img align="absmiddle" src="../../images/inc/btn_del.gif" width="13" height="14" border="0"></a></td>
			</tr>
			<%
				}
			%>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><img align="absmiddle" src="../../images/inc/btn_regist2.gif" width="74" height="26" border="0" onclick="self.close();"></td>
	</tr>
	</table>
</body>
</html>