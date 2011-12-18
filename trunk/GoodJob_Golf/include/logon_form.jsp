<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ses_mem_id = (String)session.getAttribute("mem_id");
	String ses_mem_name = (String)session.getAttribute("mem_name");
	
	if(ses_mem_id != null && ses_mem_id.length() > 0){
%>
<script language="javascript" type="text/javascript">

	function go_modify() {
		document.location.href="/member/join_member_form.jsp";
   	}
//-->
</script>
<table border="0" cellpadding="0" cellspacing="0" width="235">
     <tr>
       <td></td>
     </tr>
     <tr>
       <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="207">
           <tr>
             <td><div class="white_b" style="padding-left:15px;"><%=ses_mem_id%></div></td>
           </tr>
           <tr>
             <td height="2" colspan="2"></td>
           </tr>
           <tr>
             <td><div class="white_b" style="padding-left:15px;"><%=ses_mem_name%></div></td>
           </tr>
	           <tr>
		       <td align="center"><a href="/logon/logout.jsp"><img src="/images/common/btn_log_out.gif"  border="0"></a></td>
		     </tr>
		     <tr>
		       <td height="5"></td>
		     </tr>
		     <tr>
		       <td align="center"><a href="javascript:go_modify();"><img src="/images/common/btn_modify_out.gif"  border="0"></a></td>
		     </tr>
		      <tr>
		       <td height="5"></td>
		     </tr>
         </table></td>
     </tr>
</table>
<%
	}
	else{
%>
<table border="0" cellpadding="0" cellspacing="0" width="235">
     <tr>
       <td><img src="/images/img_leftmenu/img_login_title.gif" width="235" height="49" border="0"></td>
     </tr>
  <form name="logonFrm" method="post">
     <tr>
       <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="207">
           <tr>
             <td width="103"><input id="mem_id" class="input_01" type="text" size="20" name="mem_id" value="<%=com.goodjob.util.Utils.getCookie(request,"golf.mem_id")%>"></td>
             <td align="right"><input type="checkbox" name="id_cookie" value="Y"/>
               <span class="white_s">아이디저장</span></td>
           </tr>
           <tr>
             <td height="2" colspan="2"></td>
           </tr>
           <tr>
             <td><input id="mem_pwd" class="input_01" type="password" size="20" name="mem_pwd" value=""></td>
             <td height="24" align="right"><a href="javascript:logon_ok();"><img src="/images/img_leftmenu/btn_login_confirm.jpg" width="70" height="22" border="0"></a></td>
           </tr>
	</form>
           <tr>
             <td width="207" colspan="2" height="40" align="right"><table border="0" cellpadding="0" cellspacing="0" width="170">
                 <tr>
                   <td width="104"><a href="/member/join_agreement.jsp"><img src="/images/img_leftmenu/btn_join_s.gif" width="55" height="13" border="0"></a></td>
             <td width="104"><a href="/member/id_pass_search.jsp"><img src="/images/img_leftmenu/btn_id_pw_s.gif" width="108" height="13" border="0"></a></td>
                 </tr>
               </table></td>
           </tr>
         </table></td>
     </tr>
</table>
<%
	}
%>
   