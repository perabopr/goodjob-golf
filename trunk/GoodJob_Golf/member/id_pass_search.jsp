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

		var rphone = $('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val();
		var name = $('#mem_name').val();
		$.ajax({
			type: "POST",
			url: "/member/search_result.jsp",
			data: "type=id&mem_name="+name+"&mobile="+rphone,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("아이디가   핸드폰으로  발송 되었습니다.");
				}
				else if($.trim(msg) == '1'){
					alert("일치하는 회원 정보가 없습니다.");
				}
				else{
					alert("인증중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
				}
		}});
	}

   	function search_pwd(){
		
   		if(!$('#mobile00').val()) {
			alert('이통사를 선택해 주세요.');
			return;
		}

   		if(!$('#mobile01').val()) {
			alert('핸드폰 앞자리를 선택해 주세요.');
			$('#mobile01').focus();
			return;
		}

   		if(!$('#mobile02').val()) {
			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile02').focus();
			return;
		}

   		if(!$('#mobile03').val()) {
   			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile03').focus();
			return;
		}

		var rphone = $('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val();
		var id = $('#mem_id').val();
		$.ajax({
			type: "POST",
			url: "/member/search_result.jsp",
			data: "type=pwd&mem_id="+id+"&mobile="+rphone,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("비밀번호가   핸드폰으로  발송 되었습니다.");
				}
				else if($.trim(msg) == '1'){
					alert("일치하는 회원 정보가 없습니다.");
				}
				else{
					alert("인증중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
				}
		}});
	}

   	function sms_auth(val){

   		if(!$('#mobile0_'+val).val()) {
			alert('이통사를 선택해 주세요.');
			return;
		}

   		if(!$('#mobile1_'+val).val()) {
			alert('핸드폰 앞자리를 선택해 주세요.');
			$('#mobile1_'+val).focus();
			return;
		}

   		if(!$('#mobile2_'+val).val()) {
			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile2_'+val).focus();
			return;
		}

   		if(!$('#mobile3_'+val).val()) {
   			alert('핸드폰 번호를 입력해 주세요.');
			$('#mobile3_'+val).focus();
			return;
		}

		var rphone = $('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val();
		$.ajax({
			type: "POST",
			url: "/common/authSMS.jsp",
			data: "rphone="+rphone,
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
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; 아이디/비밀번호찾기</td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">아이디 / 비밀번호찾기</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="640">
                                                        <tr>
                                                          <td align="center" width="640"><img src="../../images/mem_join/img_id_search_title.gif" width="640" height="100" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="2" cellspacing="1" width="500" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td width="494" bgcolor="white" align="center" height="100"><table border="0" cellpadding="2" cellspacing="1" width="95%">
                                                                    <tr>
                                                                      <td height="35" align="left" style="padding-left:55px;">이름&nbsp;&nbsp;:&nbsp;&nbsp;<input id="mem_name" class="mem_input" type="text" size="30" name="mem_name">
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="40" align="center">
                                                                      <select id="mobile0_i" name="mobile0_i" size="1">
                                                                            <option value="">통신사선택</option>
                                                                            <option value="SKT">SKT</option>
                                                                            <option value="KT">KT</option>
                                                                            <option value="LG">LG</option>
                                                                          </select>
                                                                        <select id="mobile1_i" name="mobile1_i" size="1">
                                                                            <option value="010">010</option>
                                                                            <option value="011">011</option>
                                                                            <option value="016">016</option>
                                                                            <option value="017">017</option>
                                                                            <option value="018">018</option>
                                                                            <option value="019">019</option>
                                                                          </select>
                                                                          -
                                                                          <input id="mobile2_i" class="mem_input" type="text" size="8" name="mobile2_i" maxlength="4">
                                                                          -
                                                                          <input id="mobile3_i" class="mem_input" type="text" size="8" name="mobile3_i" maxlength="4">
                                                                        <a href="javascript:sms_auth('i');"><img align="absmiddle" src="../../images/mem_join/btn_number_send.gif" width="75" height="19" border="0"></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="40" align="center"><p><img align="absmiddle" src="../../images/mem_join/btn_send_title.gif" width="81" height="19" border="0">
                                                                          <input id="auth_no1" class="mem_input" type="text" size="15" name="auth_no1"/>
                                                                          <img align="absmiddle" src="../../images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></p></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td><p>&nbsp;</p></td>
                                                        </tr>
                                                        <tr>
                                                          <td><img src="../../images/mem_join/img_pw_search_title.gif" width="640" height="115" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="2" cellspacing="1" width="500" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td width="494" bgcolor="white" align="center" height="100"><table border="0" cellpadding="2" cellspacing="1" width="95%">
                                                                    <tr>
                                                                      <td height="35" align="left" style="padding-left:55px;">아이디&nbsp;&nbsp;:&nbsp;&nbsp;<input id="mem_id" class="mem_input" type="text" size="30" name="mem_id">
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="40" align="center">
                                                                      <select id="mobile0_p" name="mobile0_p" size="1">
                                                                            <option value="">통신사선택</option>
                                                                            <option value="SKT">SKT</option>
                                                                            <option value="KT">KT</option>
                                                                            <option value="LG">LG</option>
                                                                          </select>
                                                                        <select id="mobile1_p" name="mobile1_p" size="1">
                                                                            <option value="010">010</option>
                                                                            <option value="011">011</option>
                                                                            <option value="016">016</option>
                                                                            <option value="017">017</option>
                                                                            <option value="018">018</option>
                                                                            <option value="019">019</option>
                                                                          </select>
                                                                          -
                                                                          <input id="mobile2_p" class="mem_input" type="text" size="8" name="mobile2_p" maxlength="4">
                                                                          -
                                                                          <input id="mobile3_p" class="mem_input" type="text" size="8" name="mobile3_p" maxlength="4">
                                                                        <a href="javascript:sms_auth('p');"><img align="absmiddle" src="../../images/mem_join/btn_number_send.gif" width="75" height="19" border="0"></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="40" align="center"><p>
                                                                      <a href="javascript:sms_auth(2);"><img align="absmiddle" src="../../images/mem_join/btn_send_title.gif" width="81" height="19" border="0"></a>
                                                                          <input id="auth_no2" class="mem_input" type="text" size="15" name="auth_no2"/>
                                                                          <img align="absmiddle" src="../../images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></p></td>
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
                              </table></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                        </table>
                        
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
