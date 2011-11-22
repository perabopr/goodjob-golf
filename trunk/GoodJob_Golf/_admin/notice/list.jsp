<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	BoardDao dao = new BoardDao();
	
	Map<String,String> params = new HashMap<String,String>();
	
	List<BoardDto> bbsList = dao.getList("" , params);
	
%>
<html>
<head>
<title>공지 게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<link rel="stylesheet" href="/css/common.css" type="text/css">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table  width="550"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="10" ></td>
	</tr>
	
	<tr>
		<td height="1" bgcolor="#C8D290" ></td>
	</tr>
	<tr>
	<td>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>
        <table border="0" cellpadding="0" cellspacing="0" width="669">
         <tr>
            <td align="center" height="30" width="41" class=normal_s>번호</td>
            <td align="center" width="300" class=normal_s>제 목</td>
            <td align="center" class=normal_s>글쓴이</td>
            <td align="center" class=normal_s>작성일</td>
            <td align="center" class=normal_s>조회</td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="#E5E5E5" height="1"></td>
          </tr>
          <tr>
            <td align="center" height="30" width="41" class=normal_s>100</td>
            <td align="center" width="62" class=normal_s>11/12/31</td>
            <td width="62" align="center" class=normal_s>홍길동</td>
            <td width="183" align="center" class=blue_ss>골프장명은 여기로</td>
            <td width="57" align="center" class=normal_s>11/12/31</td>
            <td width="56" align="center" class=normal_s>2명</td>
            <td width="51" align="center" class=normal_s>30대</td>
            <td width="49" align="center" class=normal_s>2건</td>
            <td align="center" width="48" class=normal_s>100</td>
            <td align="center" width="60" class=blue_s>진행중</td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="#E5E5E5" height="1"></td>
          </tr>
          <tr>
            <td bgcolor="white" height="30" align="center" class=normal_s>99</td>
            <td bgcolor="white" align="center" class=normal_s>11/12/31</td>
            <td bgcolor="white" align="center" class=normal_s>홍길동</td>
            <td bgcolor="white" align="center" class=blue_ss>골프장명은 여기로</td>
            <td bgcolor="white" align="center" class=normal_s>11/12/31</td>
            <td bgcolor="white" align="center" class=normal_s>3명</td>
            <td bgcolor="white" align="center" class=normal_s>40대</td>
            <td bgcolor="white" align="center" class=normal_s>3건</td>
            <td bgcolor="white" align="center" class=normal_s>190</td>
            <td bgcolor="white" align="center" class=orange_s>완료</td>
          </tr>
          <tr>
            <td height="1" colspan="10" bgcolor="#E5E5E5"></td>
          </tr>
         </table>
		</td>
    </tr>
    <tr>
      <td height="30"></td>
    </tr>
    
    <tr>
      <td height="250" align="center"></td>
    </tr>
  </table>
  </td>
	</tr>
</table>
  </body>
</html>