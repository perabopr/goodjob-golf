
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	BoardDao dao = new BoardDao();
	 
	String idx = StringUtils.trimToEmpty(request.getParameter("idx"));
	String thread = StringUtils.trimToEmpty(request.getParameter("thread"));
	
	BoardDto dto = dao.getView("TB_NOTICE_BBS" , NumberUtils.toInt(idx,0));
	
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
<script type="text/javascript" src="/js/highgardenEditor.js"></script>
<script language="javascript" type="text/javascript">
	
function bbs_submit() {
	
	if(!$('#subject').val()) {
		alert('제목을 입력하시기 바랍니다.');
		$('#subject').focus();
		return;
	} 

	if(!$('#name').val()) {
		alert('이름을 입력하시기 바랍니다.');
		$('#name').focus();
		return;
	}
	
	if(!$('#content').val()) {
		alert('내용을 입력하시기 바랍니다.');
		$('#content').focus();
		return;
	}

	if(!$('#password').val()) {
		alert('비밀번호를 입력하시기 바랍니다.');
		$('#password').focus();
		return;
	} 
	
	 
	if($('#upfile').val()) {
		var src = getFileExtension($('#upfile').val());
		if ( !((src.toLowerCase() == "png") || (src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg")) ) {
			alert('gif , jpg , png 파일만 지원합니다.');
			return;
		}
	}
	
	frm.submit();
}

function getFileExtension(filePath)
{
  var lastIndex = -1;
  lastIndex = filePath.lastIndexOf('.');
  var extension = "";
  if ( lastIndex != -1 ) {
    extension = filePath.substring( lastIndex+1, filePath.len );
  }
  else {
    extension = "";
  }
  return extension;
}

//-->
</script>
<script language="JavaScript" type="text/javascript">
//<![CDATA[

/** 자바 스크립트 전역변수 설정 **/
var rootDir = '.';

 //]]>
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table  width="550"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td></td>
	</tr>
	<tr>
<FORM NAME="frm" METHOD="post" ACTION="write.jsp"  enctype="multipart/form-data">
<input type="hidden" name="idx" values="<%=idx%>"/>
<input type="hidden" name="thread" values="<%=thread%>"/>
		<td>
			<table width="500" border="0" cellpadding="0" cellspacing="0" align="center" class="ptable1">
				<tr>
					<td class="ptable2" >제목</td>
					<td class="ptable3"><input id="subject" type="text" name="subject" value="<%=StringUtils.trimToEmpty(dto.getSubject())%>" maxlength="100" size="55" /></td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2" >이름</td>
					<td class="ptable3"><input id="name" type="text" name="name" value="<%=StringUtils.trimToEmpty(dto.getName())%>" maxlength="100" size="55" /></td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2" >이메일</td>
					<td class="ptable3"><input id="email" type="text" name="email" value="<%=StringUtils.trimToEmpty(dto.getEmail())%>" maxlength="100" size="55" /></td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2">내용</td>
					<td class="ptable3">
					<textarea cols="60" rows="5" name="content" id="content" title="higheditor_simple" style="width:400px;height:300px;">
					<%=StringUtils.trimToEmpty(dto.getContent())%>
					</textarea>
					</td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2" >비밀번호</td>
					<td class="ptable3"><input id="password" type="password" name="password" maxlength="100" size="55" /></td>
				</tr>
				<tr>
					<td class="btable4" colspan="2"></td>
				</tr>
				<tr>
					<td class="ptable2">파일<br/>첨부</td>
					<td class="ptable3" colspan="3">
					<input id="upfile" type="file" name="upfile" class="inputb" size="30"> (선택사항)<br/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr height="50">
		<td align="center"><input type="button" value="글쓰기" onclick="bbs_submit();"/>
		&nbsp;<input type="button" value="목록" onclick="location.href='./list.jsp'"/>
		</td>
	</tr>
</FORM>
</table>
</body>
</html>