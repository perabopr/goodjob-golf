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
</head>
<body leftmargin="0" marginwidth="0" topmargin="150" marginheight="150" bgcolor="#E4E4E4">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="601">
  <tr>
    <td width="100%" align="center"><p><img src="/Admin/images/common/img_login_top.gif" width="601" height="141" border="0"></p></td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="601">
        <tr>
          <td width="330"><p><img src="/Admin/images/common/img_login_id_title.gif" width="330" height="60" border="0"></p></td>
          <td width="271" bgcolor="#414042"><table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="261"><p>
                    <input class="insText" type="text" size="30" name="m_id" >
                  </p></td>
              </tr>
              <tr>
                <td height="10"><p></p></td>
              </tr>
              <tr>
                <td><p>
                    <input class="insText" type="password" size="30" name="m_pass" >
                  </p></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="right" background="/Admin/images/common/img_login_bg.gif" height="120"  style="padding-right:100"><p>
        <input type="image" src="/Admin/images/common/btn_login.gif" width="185" height="45" onclick="location.href='/Admin/sub/';" border="0" name="a11">
        &gt;</p></td>
  </tr>
  <tr>
    <td align="center"><p><img src="/Admin/images/common/img_login_bottom.gif" width="601" height="44" border="0"></p></td>
  </tr>
</table>
</body>
</html>