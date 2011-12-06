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

	function member_join() {

		if(!$('#agreemnt').is(':checked')) {
			alert("이용약관에 동의를 해야 합니다.");
			return;
		}
		
		if(!$('#privacy').is(':checked')) {
			alert("개인정보 취급 방침에 동의를 해야 합니다.");
			return;
		}

		if($('#auth_yn').val() != 'N') {
			alert('휴대폰 인증을 하지 않았습니다.');
			return;
		}
		
		location.href="/member/join_member_form.jsp";
   	}

   	function sms_send(){

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
		
		$.ajax({
			type: "POST",
			url: "/event/201112/",
			data: "fmoney="+$('#fmoney').val()+"&memo="+$('#memo').val(),
			success: function(msg){
				if($.trim(msg) == '1'){
					
				}
				else{
					
				}
		}});
	}
//-->
</script>
                      <table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>회원가입</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">회원가입</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="640">
                                                        <tr>
                                                          <td width="640" style="padding-top:15px;"><img src="/images/mem_join/img_agree_title.gif" width="350" height="50" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td><iframe src="agreement.html" style="border-right: dotted #6D6E71 1px;border-left: dotted #6D6E71 1px;border-top: dotted #6D6E71 1px;
						border-bottom: dotted #6D6E71 1px;" width="640" height="100" frameborder="0" vspace="0" hspace="0" marginwidth="0" marginheight="0"></iframe></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="right"> 위 사항을 확인하였으며 동의합니다 &nbsp;&nbsp;
                                                            <input id="agreemnt" type="checkbox" name="formradio1">
                                                        </tr>
                                                        <tr>
                                                          <td><img src="/images/mem_join/img_provacy_title.gif" width="350" height="50" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td><iframe src="privacy.html" style="border-right: dotted #6D6E71 1px;border-left: dotted #6D6E71 1px;border-top: dotted #6D6E71 1px;
						border-bottom: dotted #6D6E71 1px;" width="640" height="100" frameborder="0" vspace="0" hspace="0" marginwidth="0" marginheight="0"></iframe></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="right"> 위 사항을 확인하였으며 동의합니다 &nbsp;&nbsp;
                                                            <input id="privacy" type="checkbox" name="formradio2">
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><img src="/images/mem_join/img_handphone_title.gif" width="350" height="50" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center">
                                                          <table border="0" cellpadding="2" cellspacing="1" width="500" bgcolor="#D1D3D4">
                                                          <form name="authFrm" method="post">
                                                          <input type="hidden" id="auth_yn" name="auth_yn" value="N"/>
                                                              <tr>
                                                                <td width="494" bgcolor="white" align="center" height="100"><table border="0" cellpadding="2" cellspacing="1" width="95%">
                                                                    <tr>
                                                                      <td height="40" align="center"><p>
                                                                          <select id="mobile0" name="formselect1" size="1">
                                                                            <option value="">통신사선택</option>
                                                                            <option value="SKT">SKT</option>
                                                                            <option value="KT">KT</option>
                                                                            <option value="LG">LG</option>
                                                                          </select>
                                                                          <select id="mobile1" name="formselect1" size="1">
                                                                            <option value="010">010</option>
                                                                            <option value="011">011</option>
                                                                            <option value="016">016</option>
                                                                            <option value="017">017</option>
                                                                            <option value="018">018</option>
                                                                            <option value="019">019</option>
                                                                          </select>
                                                                          -
                                                                          <input id="mobile1" class="mem_input" type="text" size="8" name="id" maxlength="4">
                                                                          -
                                                                          <input id="mobile1" class="mem_input" type="text" size="8" name="id" maxlength="4">
                                                                          <img align="absmiddle" src="/images/mem_join/btn_number_send.gif" width="75" height="19" border="0"></p></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="40" align="center"><p><img align="absmiddle" src="/images/mem_join/btn_send_title.gif" width="81" height="19" border="0">
                                                                          <input id="auth_num" class="mem_input" type="text" size="15" name="id">
                                                                          <img align="absmiddle" src="/images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></p></td>
                                                                    </tr>
                                                                    
                                                                  </table></td>
                                                              </tr>
                                                              </form>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center" style="padding-top:30px;padding-bottom:30px;"><table border="0" cellpadding="0" cellspacing="0" width="60%">
                                                              <tr>
                                                                <td width="30%" align="center"><a href="javascript:member_join();"><img src="/images/mem_join/btn_join_mem.gif" width="130" height="39" border="0"></a></td>
                                                                <td width="30%" align="center"><img src="/images/mem_join/btn_join_cancel.gif" width="130" height="39" border="0"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                      </table></td>
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

