<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%
	
	String[] memSeq = request.getParameterValues("memSeq");
	String[] mem_email = request.getParameterValues("mem_email");
	String mobile = StringUtils.defaultIfEmpty(request.getParameter("mobile"), "");

	StringBuffer email = new StringBuffer();
	StringBuffer seq = new StringBuffer();
	int send_count = 0;
	if(memSeq != null){
		
		send_count = memSeq.length;
		for(int i = 0 ; i < send_count ; i++){
			if(i != 0){
				seq.append(",");
				email.append(";");
			}
			seq.append(memSeq[i]);
			email.append(mem_email[i]);
		}
	}
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/js/highgardenEditor.js"></script>
<script type="text/javascript">

	function go_send(){

		if(!$('#subject').val()){
			alert('제목 입력해 주세요.');
			$('#subject').focus();
			return;
		}

   		if(!$('#content').val()){
   			alert('내용  입력해 주세요.');
			$('#content').focus();
			return;
		}
		
		if(confirm("발송할까요?")){
			var frm = document.mailFrm;
			frm.target =  "ifr_hidden"; 
			frm.action = "mail_send.jsp";
			frm.submit();
		}	
	}
	
</script>
<script type="text/javascript">
//<![CDATA[
/** 자바 스크립트 전역변수 설정 **/
var rootDir = '.';
 //]]>
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="700">
  <tr>
    <td width="630" class=title>★ E-Mail 발송 ★</td>
    <td width="70" align="center"><a href="javascript:self.close();"><img src="/_admin/images/common/btn_close2.gif" width="18" height="19" border="0"></a></td>
  </tr>
<form name="mailFrm" method="post" action="">
<input type="hidden" name="mem_seq" value="<%=seq.toString()%>"/>
  <tr>
    <td align="center" colspan="2" width="700">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">
    <table border="0" cellpadding="2" cellspacing="1" width="698" bgcolor="silver">
        <tr>
          <td align="right" bgcolor="#E6E7E8" height="25" style="padding-right:10px;"><span class=normal_b>받는분 E-Mail</span></td>
          <td bgcolor="white" style="padding-left:10px;">
          <input id="mem_email" name="mem_email" value="<%=email.toString()%>" type="text" size="90" class="input_box">
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#E6E7E8" height="25" style="padding-right:10px;"><span class=normal_b>제목</span></td>
          <td bgcolor="white" style="padding-left:10px;"><input id="subject" name="subject" type="text" size="90" class="input_box"/></td>
        </tr>
        <tr>
          <td height="25" align="right" bgcolor="#E6E7E8" style="padding-right:10px;"><span class=normal_b>내용<br>
            </span></td>
          <td height="25" bgcolor="white" style="padding-left:10px;">
          <textarea rows="20" cols="90" name="content" id="content" title="higheditor_simple" class="box03"></textarea>
          </td>
        </tr>
      </table>
      </td>
  </tr>
</form>
  <tr>
    <td colspan="2" align="center" style="padding-top:20px;padding-bottom:20px;">
    <a href="javascript:go_send();"><img align="absmiddle" src="/_admin/images/inc/btn_send.gif" width="74" height="26" border="0"></a></td>
  </tr>
</table>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe> 
</body>
</html>