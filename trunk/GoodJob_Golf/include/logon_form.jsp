<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<table border="0" cellpadding="0" cellspacing="0" width="207">
     <tr>
       <td width="103"><input class="input_01" type="text" size="20" name="id" value="아이디"></td>
       <td rowspan="3" align="right"><input type="image" name="formimage2" src="images/img_leftmenu/btn_login_confirm.gif" width="64" height="51" border="0"></td>
     </tr>
     <tr>
       <td height="2"></td>
     </tr>
     <tr>
       <td width="103"><input class="input_01" type="text" size="20" name="pw" value="비밀번호"></td>
     </tr>
     <tr>
       <td width="207" colspan="2" height="40" align="right"><table border="0" cellpadding="0" cellspacing="0" width="170">
           <tr>
             <td width="104"><a href="/member/join_agreement.jsp"><img src="images/img_leftmenu/btn_join_s.gif" width="55" height="13" border="0"></a></td>
             <td width="104"><a href="/member/id_pass_search.jsp"><img src="images/img_leftmenu/btn_id_pw_s.gif" width="108" height="13" border="0"></a></td>
           </tr>
         </table></td>
     </tr>
   </table>