
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	BoardDao dao = new BoardDao();
	 
	String seq = StringUtils.trimToEmpty(request.getParameter("seq"));
	String thread = StringUtils.trimToEmpty(request.getParameter("thread"));
	
	BoardDto dto = dao.getView("TB_NOTICE_BBS" , NumberUtils.toInt(seq,0));
	
%>
<html>
<head>
<title>공지 게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

td { color:#545454 ; font-family:; font-size:8pt; font-family:돋움; line-height:18px}
img {border:0}
a:link    {color:#555555;text-decoration:none; font-family:돋움,Dotum,arial,verdana;}
a:visited {color:#555555;text-decoration:none; font-family:돋움,Dotum,arial,verdana;}
a:active  {color:#555555;text-decoration:none; font-family:돋움,Dotum,arial,verdana;}
a:hover   {color:#415181;text-decoration:underline; font-family:돋움,Dotum,arial,verdana;}
input,
select,
textarea {color:#555555;background-color:#FFFFFF;border:1 solid #CDCDCD ; font-size:9pt; font-family:돋움}

.btable1 {color:#ffffff ;text-align:center;font-weight:bold}
.btable2 {width:"1px"}
.btable3 {background:#efefef;text-align:center}
.btable4 {background:#bebebe;height:1px}

.ptable1 {border:1px solid #c0c0c0;margin-top:12px;margin-bottom:12px}
.ptable2 {padding-left:5px;width:200px;color:#515151;text-align:center;font-weight:bold;background:"#efefef"}
.ptable3 {padding:7px 10px;background:"#ffffff"}

</style>
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/js/wysiwyg.js"></script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table  width="550"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td></td>
	</tr>
	<tr>
		<td>
			<table width="500" border="0" cellpadding="0" cellspacing="0" align="center" class="ptable1">
				<tr>
					<td class="ptable2" >제목</td>
					<td class="ptable3"><%=StringUtils.trimToEmpty(dto.getSubject())%></td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2" >이름</td>
					<td class="ptable3"><%=StringUtils.trimToEmpty(dto.getName())%></td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2" >이메일</td>
					<td class="ptable3"><%=StringUtils.trimToEmpty(dto.getEmail())%></td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2">내용</td>
					<td class="ptable3" height="270">
					<%=StringUtils.trimToEmpty(dto.getContent())%>
					</td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2">파일<br/></td>
					<td class="ptable3" colspan="3"><%=StringUtils.trimToEmpty(dto.getFilename())%></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr height="50">
		<td align="center"><input type="button" value="목록" onclick="location.href='./list.jsp'"/>
		</td>
	</tr>
</table>
</body>
</html>