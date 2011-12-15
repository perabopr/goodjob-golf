<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<script language="javascript" type="text/javascript">

   	function search_id(){

   		if(!$('#mobile0').val()) {
			alert('이통사를 선택해 주세요.');
			return;
		}

   		if(!$('#mobile1').val()) {
			alert('핸드폰 앞자리를 선택해 주세요.');
			$('#mobile1').focus();
			return;
		}

   		if(!$('#mobile2').val()) {
			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile2').focus();
			return;
		}

   		if(!$('#mobile3').val()) {
   			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile3').focus();
			return;
		}

		var sphone = $('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val();
		$.ajax({
			type: "POST",
			url: "/common/authSMS.jsp",
			data: "sphone="+sphone,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("인증 번호가 발송 되었습니다.");
				}
				else{
					alert("인증 번호가 발송중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
				}
		}});
	}

   	function search_pwd(){

   		if(!$('#mem_id').val()) {
			alert('아이디를 입력해 주세요');
			$('#mem_id').focus();
			return;
		}

   		if(!$('#mem_name').val()) {
			alert('회원명을 입력해 주세요');
			$('#mem_name').focus();
			return;
		}

   		if(!$('#mem_jumin1').val() || $('#mem_jumin2').val()) {
			alert('비밀번호를 입력해 주세요');
			$('#mem_jumin').focus();
		
			return;
		}
		else{
			var resno = $('#mem_jumin1').val()+"-"+$('#mem_jumin2').val();
			chkresno(resno);
		}
		
   		if(!$('#mobile0').val()) {
			alert('이통사를 선택해 주세요.');
			return;
		}

   		if(!$('#mobile1').val()) {
			alert('핸드폰 앞자리를 선택해 주세요.');
			$('#mobile1').focus();
			return;
		}

   		if(!$('#mobile2').val()) {
			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile2').focus();
			return;
		}

   		if(!$('#mobile3').val()) {
   			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile3').focus();
			return;
		}

		var sphone = $('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val();
		$.ajax({
			type: "POST",
			url: "/common/authSMS.jsp",
			data: "sphone="+sphone,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("인증 번호가 발송 되었습니다.");
				}
				else{
					alert("인증 번호가 발송중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
				}
		}});
	}
//-->
</script>
					<!--############### 중앙 컨텐츠 영역 #################-->
					<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/main.jsp">HOME</a> &gt; 아이디/비밀번호찾기</td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">아이디 / 비밀번호찾기</td>
                                            </tr>
                                            <form name="idFrm">
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="640">
                                                        <tr>
                                                          <td align="center" width="640"><img src="/images/mem_join/img_id_search_title.gif" width="640" height="100" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center">
                                                          
                                                          <table border="0" cellpadding="2" cellspacing="1" width="500" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td width="494" bgcolor="white" align="center" height="100">
                                                                <table border="0" cellpadding="2" cellspacing="1" width="95%">
                                                                    <tr>
                                                                      <td height="35" align="left" style="padding-left:55px;">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="mem_name" class="mem_input" type="text" size="15" name="mem_name">
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="35" align="left" style="padding-left:55px;">주민등록번호&nbsp;&nbsp;<input id="mem_jumin1" class="mem_input" type="text" size="15" name="mem_jumin1"> - <input id="mem_jumin2" class="mem_input" type="text" size="15" name="mem_jumin2"> 
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="35" align="center">
                                                                      <select name="formselect1" size="1">
                                                                          <option>통신사선택</option>
                                                                          <option>SKT</option>
                                                                          <option>KT</option>
                                                                          <option>LG</option>
                                                                        </select>
                                                                        <select name="formselect1" size="1">
                                                                          <option>010</option>
                                                                          <option>011</option>
                                                                          <option>016</option>
                                                                          <option>017</option>
                                                                          <option>018</option>
                                                                          <option>019</option>
                                                                        </select>
                                                                        -
                                                                        <input class="mem_input" type="text" size="8" name="id" maxlength="4">
                                                                        -
                                                                        <input class="mem_input" type="text" size="8" name="id" maxlength="4">
                                                                        <img align="absmiddle" src="/images/mem_join/btn_number_send.gif" width="75" height="19" border="0"></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="35" align="center"><p><img align="absmiddle" src="/images/mem_join/btn_send_title.gif" width="81" height="19" border="0">
                                                                          <input class="mem_input" type="text" size="15" name="id">
                                                                          <img align="absmiddle" src="/images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></p></td>
                                                                    </tr>
                                                                  </table>
                                                                 </td>
                                                              </tr>
                                                            </table>
                                                           </td>
                                                        </tr>
                                                        <tr>
                                                          <td><p>&nbsp;</p></td>
                                                        </tr>
                                                        </form>
                                                        <tr>
                                                          <td><img src="/images/mem_join/img_pw_search_title.gif" width="640" height="115" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="2" cellspacing="1" width="500" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td width="494" bgcolor="white" align="center" height="100">
                                                                <table border="0" cellpadding="2" cellspacing="1" width="95%">
                                                                	<tr>
                                                                      <td height="35" align="left" style="padding-left:55px;">아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="mem_id" class="mem_input" type="text" size="15" name="mem_id">
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="35" align="left" style="padding-left:55px;">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="mem_name" class="mem_input" type="text" size="15" name="mem_name">
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="35" align="left" style="padding-left:55px;">주민등록번호&nbsp;&nbsp;<input id="mem_jumin1" class="mem_input" type="text" size="15" name="mem_jumin1"> - <input id="mem_jumin2" class="mem_input" type="text" size="15" name="mem_jumin2"> 
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="40" align="center"><select name="formselect1" size="1">
                                                                          <option>통신사선택</option>
                                                                          <option>SKT</option>
                                                                          <option>KT</option>
                                                                          <option>LG</option>
                                                                        </select>
                                                                        <select name="formselect1" size="1">
                                                                          <option>010</option>
                                                                          <option>011</option>
                                                                          <option>016</option>
                                                                          <option>017</option>
                                                                          <option>018</option>
                                                                          <option>019</option>
                                                                        </select>
                                                                        -
                                                                        <input class="mem_input" type="text" size="8" name="id" maxlength="4">
                                                                        -
                                                                        <input class="mem_input" type="text" size="8" name="id" maxlength="4">
                                                                        <img align="absmiddle" src="/images/mem_join/btn_number_send.gif" width="75" height="19" border="0"></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="40" align="center"><p><img align="absmiddle" src="/images/mem_join/btn_send_title.gif" width="81" height="19" border="0">
                                                                          <input class="mem_input" type="text" size="15" name="id">
                                                                          <img align="absmiddle" src="/images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></p></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                  <tr>
                                                   <td height="100">&nbsp;</td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table>
					
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
