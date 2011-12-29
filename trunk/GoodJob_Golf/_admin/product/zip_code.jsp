<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.zipcode.*"%>
<%@ page import="java.util.*" %>
<%

	String dong = StringUtils.trimToEmpty(request.getParameter("dong"));
	ZipCodeDao zDao = new ZipCodeDao();
	
	List<ZipCodeDto> zipList = zDao.getAddress(dong);
	
%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>우편번호 찾기</title>
<link rel="stylesheet" href="../style.css" type="text/css">
<script language="javascript" type="text/javascript">

	function go_search(){
		document.frm.action="zip_code.jsp";
		document.frm.submit();
	}

	function go_address(val){
		opener.frm.address1.value=val;
		self.close();
	}
</script>
</head>
<body bgcolor="gray" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="400">
  <tr>
    <td width="400"><table border="0" cellpadding="0" cellspacing="0" width="400">
        <tr>
          <td width="370"><img src="../images/inc/zip_search_title.gif" width="370" height="31" border="0"></td>
          <td width="30"><a href="javascript:self.close();"><img src="../images/inc/zip_search_close.gif" width="30" height="31" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" bgcolor="gray">&nbsp;</td>
  </tr>
<form name="frm" method="post">
  <tr>
    <td align="center" bgcolor="gray"><table border="0" cellpadding="0" cellspacing="0" width="360">
        <tr>
          <td width="360" bgcolor="#F1F1F1">&nbsp;</td>
        </tr>
        <tr>
          <td align="center" bgcolor="#F1F1F1"><span class=normal_b>찾고자 하는 동/읍/면의 이름을 입력하세요.</span><br>
            (예:종로구, 혜화동)</td>
        </tr>
        <tr>
          <td bgcolor="#F1F1F1" align="center"><input type="text" id="dong" name="dong" class="mem_input" size="24">
            <input type="image" src="../images/inc/btn_zip_search.gif" align="absmiddle" border="0" width="63" height="19"></td>
        </tr>
        <tr>
          <td bgcolor="#F1F1F1">&nbsp;</td>
        </tr>
<%
	if(zipList != null && !zipList.isEmpty()){
		
		int size = zipList.size();
		ZipCodeDto zipDto;
		for(int i = 0 ; i < size ; i++){
			
			zipDto = zipList.get(i);
%>
        <tr>
          <td bgcolor="#F1F1F1">
          [<%=zipDto.getZipcode()%>] <%=zipDto.getSido()%> <%=zipDto.getGugun()%> <%=zipDto.getDong()%> <%=zipDto.getBunji()%>
          &nbsp;<a href="javascript:go_address('<%=zipDto.getSido()%> <%=zipDto.getGugun()%> <%=zipDto.getDong()%> <%=zipDto.getBunji()%>');">[사용]</a>
          </td>
        </tr>
<%
		}
	}
%>
      </table></td>
  </tr>
  </form>
  <tr>
    <td align="center" bgcolor="gray">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" bgcolor="gray"></td>
  </tr>
  <tr>
    <td align="center" bgcolor="gray" height="80">&nbsp;</td>
  </tr>
</table>
</body>
</html>
