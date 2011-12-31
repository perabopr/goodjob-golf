<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>굳잡골프 통합 관리자.</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script src="/js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">

	function logon_ok() {
		
		if(!$('#admin_id').val()) {
			alert('아이디를 입력하시기 바랍니다.');
			$('#admin_id').focus();
			return false;
		}

		if(!$('#admin_pwd').val()) {
			alert('비밀번호를 입력하시기 바랍니다.');
			$('#admin_pwd').focus();
			return false;
		} 
				
		var frm = document.forms["logonFrm"];
		frm.action = "/_admin/admin_login.jsp";
		frm.submit();
		return true;
   	}
//-->
</script>
</head>
<body leftmargin="0" marginwidth="0" topmargin="150" marginheight="150" bgcolor="#E4E4E4">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="601">
  <tr>
    <td width="100%" align="center"><p><img src="/_admin/images/common/img_login_top.gif" width="601" height="141" border="0"></p></td>
  </tr>
  <form name="logonFrm" method="post" onsubmit="return logon_ok();">
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="601">
        <tr>
          <td width="330"><p><img src="/_admin/images/common/img_login_id_title.gif" width="330" height="60" border="0"></p></td>
          <td width="271" bgcolor="#414042"><table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="261"><p>
                    <input class="insText" type="text" size="30" name="admin_id" id="admin_id" >
                  </p></td>
              </tr>
              <tr>
                <td height="10"><p></p></td>
              </tr>
              <tr>
                <td><p>
                    <input class="insText" type="password" size="30" name="admin_pwd" id="admin_pwd" >
                  </p></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="right" background="/_admin/images/common/img_login_bg.gif" height="120"  style="padding-right:100"><p>
        <input type="image" src="/_admin/images/common/btn_login.gif" width="185" height="45" border="0" name="a11"></p></td>
  </tr>
</form>
  <tr>
    <td align="center"><p><img src="/_admin/images/common/img_login_bottom.gif" width="601" height="44" border="0"></p></td>
  </tr>
</table>
</body>
</html>