<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	//통합 게시판 
	BoardDao dao = new BoardDao();
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("field",field);
	params.put("keyword",keyword);
	
	List<BoardDto> bbsList = dao.getList("TB_NOTICE_BBS" , params);
	
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
            <td align="center" height="30" width="40" class=normal_s>번호</td>
            <td align="center" width="350" class=normal_s>제 목</td>
            <td align="center" width="80" class=normal_s>글쓴이</td>
            <td align="center" width="80" class=normal_s>작성일</td>
            <td align="center" width="50" class=normal_s>조회</td>
          </tr>
          <tr>
            <td colspan="5" bgcolor="#E5E5E5" height="1"></td>
          </tr>
<%
	if(bbsList != null && !bbsList.isEmpty()){
		
		int size = bbsList.size();
		BoardDto dto;
		for(int i = 0 ; i < size ; i++){
			
			dto = bbsList.get(i);
			
%>
          <tr>
            <td align="center" height="30" width="40" class=normal_s><%=dto.getSeq()%></td>
            <td align="center" width="350" class=normal_s><a href="./view.jsp?seq=<%=dto.getSeq()%>"><%=dto.getSubject()%></a></td>
            <td align="center" width="80" class=normal_s><%=dto.getName()%></td>
            <td align="center" width="80" class=normal_s><%=dto.getWrite_date()%></td>
            <td align="center" width="50" class=normal_s><%=dto.getReadcount()%></td>
          </tr>
          <tr>
            <td colspan="5" bgcolor="#E5E5E5" height="1"></td>
          </tr>
<%
		}
	}
%>
         </table>
		</td>
    </tr>
    <tr>
      <td height="30"></td>
    </tr>
    
    <tr>
      <td align="center"><input type="button" value="글쓰기" onclick="location.href='form.jsp';"/></td>
    </tr>
  </table>
  </td>
	</tr>
</table>
  </body>
</html>