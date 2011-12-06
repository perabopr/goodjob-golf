<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script language="javascript" type="text/javascript">

	function logon_ok() {
		
		if(!$('#mem_id').val()) {
			alert('아이디를 입력하시기 바랍니다.');
			$('#mem_id').focus();
			return;
		}

		if(!$('#mem_pwd').val()) {
			alert('비밀번호를 입력하시기 바랍니다.');
			$('#mem_pwd').focus();
			return;
		} 
				
		var lo_form = document.forms["logonFrm"];

		/*
		if(!$('#privacy_chk').is(':checked')) {
			alert("개인보수집동의해야 \n저장 할 수 있습니다.");
			return;
		}
		*/
		lo_form.action = "/logon/logon.jsp";
		lo_form.submit();
   	}
//-->
</script>
<table border="0" cellpadding="0" cellspacing="0" width="207">
<form name="logonFrm" method="post" action="">
     <tr>
       <td width="103"><input id="mem_id" class="input_01" type="text" size="20" name="mem_id" value=""></td>
       <td rowspan="3" align="right"><a href="javascript:logon_ok();"><img src="/images/img_leftmenu/btn_login_confirm.gif" width="64" height="51" border="0"></a></td>
     </tr>
     <tr>
       <td height="2"></td>
     </tr>
     <tr>
       <td width="103"><input id="mem_pwd" class="input_01" type="text" size="20" name="mem_pwd" value=""></td>
     </tr>
     <tr>
       <td width="207" colspan="2" height="40" align="right"><table border="0" cellpadding="0" cellspacing="0" width="170">
           <tr>
             <td width="104"><a href="/member/join_agreement.jsp"><img src="/images/img_leftmenu/btn_join_s.gif" width="55" height="13" border="0"></a></td>
             <td width="104"><a href="/member/id_pass_search.jsp"><img src="/images/img_leftmenu/btn_id_pw_s.gif" width="108" height="13" border="0"></a></td>
           </tr>
         </table></td>
     </tr>
</form>
   </table>
   