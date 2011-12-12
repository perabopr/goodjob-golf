<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.goodjob.board.*" %>
<%
	BoardDao dao = new BoardDao();
	 
	String idx = StringUtils.trimToEmpty(request.getParameter("idx"));
	String thread = StringUtils.trimToEmpty(request.getParameter("thread"));
	
	BoardDto dto = dao.getView("TB_NOTICE_BBS" , NumberUtils.toInt(idx,0));
	
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="../../style.css" type="text/css">
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
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 공지사항 ★</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="70"><img src="../../images/board/if_sbj.gif" width="48" height="20"></td>
                <td><input id="subject" class="input_box" size="86" type="text" name="subject" value="<%=StringUtils.trimToEmpty(dto.getSubject())%>" maxlength="100" size="55" /></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><img src="../../images/board/line05.gif" width="600" height="7"></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="70" valign="top"><img src="../../images/board/if_cts.gif" width="48" height="20"></td>
                <td>
				<textarea cols="85" rows="18" name="content" id="content" title="higheditor_simple" class="box03" style="width:530px;height:350px;"><%=StringUtils.trimToEmpty(dto.getContent())%></textarea>
                </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td>&nbsp;<img src="../../images/board/line05.gif" width="600" height="7"></td>
        </tr>
        <tr>
          <td><p>&nbsp;</p></td>
        </tr>
        <tr>
          <td align="center"><table width="500" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="200">&nbsp;</td>
                <td align="center" width="100"><input type="image" src="../../images/board/bbs_reg.gif"  border="0"></td>
                <td align="center" width="100"><a href="notice_list.asp"><img src="../../images/board/bbs_cancel.gif"  border="0"></a></td>
                <td width="200" align="right">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center"><p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>