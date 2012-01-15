<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%
	String ses_mem_id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));
	String ses_mem_name = StringUtils.trimToEmpty((String)session.getAttribute("mem_name"));
	String cookie_id = StringUtils.trimToEmpty(com.goodjob.util.Utils.getCookie(request,"golf.mem_id"));
	
	if(ses_mem_id.length() > 0){
%>
<script language="javascript" type="text/javascript">

	function go_modify() {
		document.location.href="/member/join_mem_edit.jsp";
   	}
//-->
</script>
<table border="0" cellpadding="0" cellspacing="0" width="235" bgcolor="#052B48">
    <tr>
        <td align="center" width="235" height="146">
            <table border="0" cellpadding="0" cellspacing="0" width="207">
                <tr>
                    <td align="center"><span class=yellow_b><%=ses_mem_name%></span><span class=white>님 로그인 중입니다</span>
                    </td>
                </tr>
                <tr>
                    <td align="center" height="100" width="0">
                        <table border="0" cellpadding="2" cellspacing="2" width="207" bgcolor="#3F83B7">
                            <tr>
                                <td bgcolor="#052B48" height="80" align="center" width="207">
                                    <table border="0" cellpadding="0" cellspacing="0" width="90%">
                                        <tr>
                                            <td width="90" height="30"><img align="absmiddle" src="/images/common/img_nemo.gif" width="5" height="7" border="0"> <a href="/mypage/regist_index.jsp" class=login>예약관리</a></td>
                                            <td width="89"><img align="absmiddle" src="/images/common/img_nemo.gif" width="5" height="7" border="0"> <a href="javascript:go_modify();" class=login>회원정보수정</a></td>
                                        </tr>
                                        <tr>
                                            <td height="30"><img align="absmiddle" src="/images/common/img_nemo.gif" width="5" height="7" border="0"> <a href="/mypage/coupon_list.jsp" class=login>상품권관리</a></td>
                                            <td><img align="absmiddle" src="/images/common/img_nemo.gif" width="5" height="7" border="0"> <a href="/logon/logout.jsp" class=logout>로그아웃</a></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
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
  <form name="logonFrm" method="post" onsubmit="return logon_ok();">
     <tr>
       <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="207">
           <tr>
             <td width="103"><input id="login_id" class="input_01" type="text" size="20" name="login_id" onclick="onClick_id();" value="<%=(cookie_id.length()>0?cookie_id:"아이디@메일주소")%>"></td>
             <td align="right"><input type="checkbox" name="id_cookie" value="Y"<%=(cookie_id.length()>0?" checked":"")%>/>
               <span class="white_s">아이디저장</span></td>
           </tr>
           <tr>
             <td height="2" colspan="2"></td>
           </tr>
           <tr>
             <td><input id="login_pwd" class="input_01" type="password" size="20" name="login_pwd" value=""></td>
             <td height="24" align="right"><input type="image" src="/images/img_leftmenu/btn_login_confirm.jpg" width="70" height="22" border="0"/></td>
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
   