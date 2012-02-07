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

   		if(!$('#user_name1').val()) {
			alert('회원명을 입력해 주세요.');
			return;
		}
		/*
   		if(!$('#mobile0').val()) {
			alert('이통사를 선택해 주세요.');
			return;
		}
		*/
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

		var mobile = $('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val();
		var name = $('#user_name1').val();
		//var auth_no = $('#auth_no1').val();
		
		$.ajax({
			type: "POST",
			url: "/member/search_result.jsp",
			data: "type=id&mem_name="+name+"&mobile="+mobile,
			success: function(msg){
				$('#request_id').html($.trim(msg));
				/*if($.trim(msg) == '0'){
					alert("아이디가   핸드폰/이메일로  발송 되었습니다.");
				}
				else if($.trim(msg) == '1'){
					alert("인증 번호가 일치하지 않습니다.다시 인증을 시도해 주세요.");
				}
				else if($.trim(msg) == '2'){
					alert("요청한 이름과 핸드폰 정보가 고객님의 정보와 일치 하지 않습니다.");
				}
				else{
					alert("인증중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
				}*/
		}});
	}

   	function search_pwd(){

   		if(!$('#user_name2').val()) {
			alert('회원명을 입력해 주세요.');
			return;
		}

   		if(!$('#mem_id').val()) {
			alert('아이디를 입력해 주세요');
			$('#mem_id').focus();
			return;
		}

		if(!$('#mem_domain').val()) {
			alert('도메인을 입력해 주세요');
			$('#mem_domain').focus();
			return;
		}
		
		var id = $('#mem_id').val() + "@" + $('#mem_domain').val();
		var name = $('#user_name2').val();
		
		$.ajax({
			type: "POST",
			url: "/member/search_result.jsp",
			data: "type=pwd&mem_name="+name+"&mem_id="+id,
			success: function(msg){
				//$('#request_pwd').html($.trim(msg));
				if($.trim(msg) == '0'){
					alert("비밀번호가  이메일로  발송 되었습니다.");
				}
				else if($.trim(msg) == '1'){
					alert("인증 번호가 일치하지 않습니다.다시 인증을 시도해 주세요.");
				}
				else if($.trim(msg) == '2'){
					alert("요청한 회원명과 아이디  정보가 고객님의 정보와 일치 하지 않습니다.");
				}
				else{
					alert("메일 발송중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
				}
		}});
		
	}

	function domainChange(val){
		if(val == 'self'){
			document.getElementById("mem_domain").readOnly = false;
			$('#mem_domain').val("");
		}
		else{
			document.getElementById("mem_domain").readOnly = true;
			$('#mem_domain').val(val);
		}
		$('#auth_yn').val("N");
	}
	
   	function send_email(){

   		if(!$('#user_name2').val()) {
			alert('회원명을 입력해 주세요.');
			return;
		}

   		if(!$('#mem_id').val()) {
			alert('아이디를 입력해 주세요');
			$('#mem_id').focus();
			return;
		}

		if(!$('#mem_domain').val()) {
			alert('도메인을 입력해 주세요');
			$('#mem_domain').focus();
			return;
		}
		
		var id = $('#mem_id').val() + "@" + $('#mem_domain').val();
		var name = $('#user_name2').val();
		
		$.ajax({
			type: "POST",
			url: "/member/search_result.jsp",
			data: "type=send&mem_name="+name+"&mem_id="+id,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("비밀번호가 이메일로 발송 되었습니다.");
				}
				else{
					alert("메일 발송중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
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
<form name="shForm" method="post">
<input type="hidden" id="type" name="type" value=""/>
<input type="hidden" id="mem_name" name="mem_name" value=""/>
<input type="hidden" id="auth_no" name="auth_no" value=""/>
</form>
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
                                                          <td align="center">
                                                          
                                                          <table align="center" border="0" cellpadding="2" cellspacing="1" width="600" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="594"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject width="142">회원명</td>
                                                                <td bgcolor="white" style="padding-left:10px;" width="431"><input id="user_name1" class="mem_input" type="text" size="30" name="user_name1"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" width="142" height="25">핸드폰번호</td>
                                                                <td bgcolor="white" style="padding-left:10px;">
                                                                <!--
                                                                <select id="mobile0" name="mobile0" size="1">
                                                                            <option value="">통신사선택</option>
                                                                            <option value="SKT">SKT</option>
                                                                            <option value="KT">KT</option>
                                                                            <option value="LG">LG</option>
                                                                          </select>
                                                                          -->
                                                                        <select id="mobile1" name="mobile1" size="1">
                                                                            <option value="010">010</option>
                                                                            <option value="011">011</option>
                                                                            <option value="016">016</option>
                                                                            <option value="017">017</option>
                                                                            <option value="018">018</option>
                                                                            <option value="019">019</option>
                                                                          </select>
                                                                          -
                                                                          <input id="mobile2" class="mem_input" type="text" size="8" name="mobile2" maxlength="4">
                                                                          -
                                                                          <input id="mobile3" class="mem_input" type="text" size="8" name="mobile3" maxlength="4">
                                                                  <a href="javascript:search_id();"><img align="absmiddle" src="../../images/mem_join/btn_send_confirm.gif" border="0"></a></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" width="142" height="30">아이디확인</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><p id="request_id"></p></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="594"></td>
                                                              </tr>
                                                            </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                          <td><p>&nbsp;</p></td>
                                                        </tr>
                                                        <tr>
                                                          <td><img src="../../images/mem_join/img_pw_search_title.gif" width="640" height="115" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center">
                                                          
                                                          <table align="center" border="0" cellpadding="2" cellspacing="1" width="600" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="594"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject width="142">회원명</td>
                                                                <td bgcolor="white" style="padding-left:10px;" width="431"><input id="user_name2" class="mem_input" type="text" size="30" name="user_name2"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">아이디</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="27"><p>
                                                                          <input id="mem_id" class="mem_input" type="text" size="15" name="mem_id"/>
                                                                        @
                                                                        <input id="mem_domain" class="mem_input" type="text" size="15" name="mem_domain" readonly/>
                                                                        <select id="domain_sel" name="domain_sel" size="1" onchange="domainChange(this.value);">
                                                                          <option value="" selected>선택하세요</option>
                                                                          <option value="naver.com">naver.com</option>
                                                                          <option value="hanmail.net">hanmail.net</option>
                                                                          <option value="dreamwiz.com">dreamwiz.com</option>
                                                                          <option value="empal.com">empal.com</option>
                                                                          <option value="hanmir.com">hanmir.com</option>
                                                                          <option value="hanafos.com">hanafos.com</option>
                                                                          <option value="nate.com">nate.com</option>
                                                                          <option value="paran.com">paran.com</option>
                                                                          <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                                          <option value="gmail.com">gmail.com</option>
                                                                          <option value="self">직접입력하기</option>
                                                                        </select>
                                                                        <a href="javascript:search_pwd();"><img align="absmiddle" src="../../images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></a></p></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="20"><span class=mem_notice>아이디를 입력하시면 회원님의 비밀번호를 메일로 전송해 드립니다..</span></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="594"></td>
                                                              </tr>
                                                            </table>
                                                            
                                                          </td>
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
					<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe>
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
