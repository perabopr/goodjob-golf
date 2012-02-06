<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.member.*"%>
<%

	//String ses_joinAuth = StringUtils.trimToEmpty((String)session.getAttribute("joinAuth"));
	//String joinAuth 	= StringUtils.trimToEmpty(request.getParameter("joinAuth"));
	String ses_joinAuth = "Y";
	String joinAuth 	= "Y";
	//session.setAttribute("joinAuth","");
	
	if(ses_joinAuth.length()==0 || joinAuth.length()==0){
		
%>
<script language="javascript" type="text/javascript">
alert("인증없이는 회원 가입을 하실 수 없습니다.");
location.href="/member/join_agreement.jsp";
</script>
<%
		return;
	}
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<script language="javascript" type="text/javascript">
	function on_submit() {

		if(!$('#mem_name').val()) {
			alert('회원명을 입력해 주세요');
			$('#mem_name').focus();
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

		/*
		if(!$('#mem_jumin1').val() || !$('#mem_jumin2').val()) {
			alert('주민번호를 입력해 주세요');
			$('#mem_jumin').focus();
		
			return;
		}
		else{
			var resno = $('#mem_jumin1').val()+"-"+$('#mem_jumin2').val();
			chkresno(resno);
		}
		*/
		if(!$('#mem_pwd').val()) {
			alert('비밀번호를 입력해 주세요');
			$('#mem_pwd').focus();
			return;
		}

		if($('#mem_pwd').val().length < 4) {
			alert('비밀번호가 너무 짧습니다.');
			$('#mem_pwd').focus();
			return;
		}

		if(!$('#mem_pwd_re').val()) {
			alert('비밀번호 확인을 입력해 주세요');
			$('#mem_pwd_re').focus();
			return;
		}

		if($('#mem_pwd').val() != $('#mem_pwd_re').val()) {
			alert('두개의 비밀번호가 일치하지 않습니다.');
			$('#mem_pwd_re').focus();
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

   		if($('#auth_yn').val() != 'Y') {
			alert('휴대폰 인증을 하지 않았습니다.');
			return;
		}
		
   		if($('#idcheck_yn').val() == 'Y') {
			alert('아이디 중복체크를 하지 않았습니다.');
			return;
		}
		
		var frm = document.joinForm;
		frm.target =  "ifr_hidden"; 
		frm.action = "join_member_exe.jsp";
		frm.submit();
   	}

	function chkresno(resno) {

		  // 주민번호의 형태와 7번째 자리(성별) 유효성 검사
		  fmt = /^\d{6}-[1234]\d{6}$/;
		  if (!fmt.test(resno)) {
		    alert("잘못된 주민등록번호입니다."); return;
		  }

		  // 날짜 유효성 검사
		  birthYear = (resno.charAt(7) <= "2") ? "19" : "20";
		  birthYear += resno.substr(0, 2);
		  birthMonth = resno.substr(2, 2) - 1;
		  birthDate = resno.substr(4, 2);
		  birth = new Date(birthYear, birthMonth, birthDate);

		  if ( birth.getYear() % 100 != resno.substr(0, 2) ||
		       birth.getMonth() != birthMonth ||
		       birth.getDate() != birthDate) {
		    alert("잘못된 주민등록번호입니다."); return;
		  }

		  // Check Sum 코드의 유효성 검사
		  buf = new Array(13);
		  for (i = 0; i < 6; i++) buf[i] = parseInt(resno.charAt(i));
		  for (i = 6; i < 13; i++) buf[i] = parseInt(resno.charAt(i + 1));

		  multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
		  for (i = 0, sum = 0; i < 12; i++) sum += (buf[i] *= multipliers[i]);

		  if ((11 - (sum % 11)) % 10 != buf[12]) {
		    alert("잘못된 주민등록번호입니다."); return;
		  }
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
		//$('#auth_yn').val("N");
	}

	function onlyNumber2(loc) {
		if(/[^0123456789]/g.test(loc.value)) {
			alert("숫자가 아닙니다.");
			loc.value = "";
			loc.focus();
		}
	}

	function email_auth(){

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
		
		var email = $('#mem_id').val() + "@" + $('#mem_domain').val();
		$.ajax({
			type: "POST",
			url: "/common/auth.jsp",
			data: "type=send&email="+email,
			success: function(msg){
				if($.trim(msg) == '0'){
					alert("인증 번호가 입력한 이메일로 발송 되었습니다.");
				}
				else{
					alert("발송중 오류가 발생 했습니다. 잠시후 다시 시도해 주세요!");
				}
		}});
	}

	/*
   	function auth_check(){
   	   	
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
		
		var email = $('#mem_id').val() + "@" + $('#mem_domain').val();
		var auth_no = $('#auth_no').val();
		
		$.ajax({
			type: "POST",
			url: "/common/auth.jsp",
			data: "type=auth&email="+email+"&auth_no="+auth_no,
			success: function(msg){
				//0 : 인증 성공  , 1 : 일치하는 인증값 없음 , 2 : 인증번호 시간 초과 
				if($.trim(msg) == '0'){
					$('#auth_yn').val("Y");
					alert("인증이 정상적으로 완료 되었습니다.");
				}
				else if($.trim(msg) == '1'){
					alert("일치하는 인증값 없습니다. 잠시후 다시 시도해 주세요!");
				}
				else if($.trim(msg) == '2'){
					alert("입력하신 인증번호는 시간이 초과되었습니다.잠시후 다시 시도해 주세요!");
				}
		}});
	}
	*/

	function sms_auth(){

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
	
	function auth_check(){
   	   	
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
		var auth_no = $('#auth_no').val();
		$.ajax({
			type: "POST",
			url: "/common/authCheckSMS.jsp",
			data: "rphone="+rphone+"&auth_no="+auth_no,
			success: function(msg){
			//0 : 인증 성공  , 1 : 일치하는 인증값 없음 , 2 : 인증번호 시간 초과 
				if($.trim(msg) == '0'){
					$('#auth_yn').val("Y");
					alert("인증이 정상적으로 완료 되었습니다.");
				}
				else if($.trim(msg) == '1'){
					alert("일치하는 인증값 없습니다. 잠시후 다시 시도해 주세요!");
				}
				else if($.trim(msg) == '2'){
					alert("입력하신 인증번호는 시간이 초과되었습니다. 잠시후 다시 시도해 주세요!");
				}
		}});
	}
	
	function idcheck(){
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
		
		var email = $('#mem_id').val() + "@" + $('#mem_domain').val();
		$.ajax({
			type: "POST",
			url: "/common/auth.jsp",
			data: "type=check&email="+email,
			success: function(msg){
				if($.trim(msg) == '0'){
					$('#idcheck_yn').val("N");
					alert("중복되는 이메일이  없습니다.");
				}
				else{
					$('#idcheck_yn').val("Y");
					alert("중복되는 이메일이 존재 합니다.");
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
                                                          <td width="640" style="padding-top:15px;"><img src="../../images/mem_join/img_join_title_input.gif" width="640" height="80" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
		<form name="joinForm" method="post">
		<input type="hidden" id="auth_yn" name="auth_yn" value="N"/>
		<input type="hidden" id="idcheck_yn" name="idcheck_yn" value="Y"/>
                                                        <tr>
                                                          <td><img src="../../images/mem_join/img_join_message.gif" width="560" height="50" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table align="center" border="0" cellpadding="2" cellspacing="1" width="610" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject width="162">회원명</td>
                                                                <td bgcolor="white" style="padding-left:10px;" width="410">
                                                                <input id="mem_name" class="mem_input" type="text" size="15" name="mem_name" value=""></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">아이디</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="27"><input id="mem_id" class="mem_input" type="text" size="15" name="mem_id"/>
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
                                                                        <a href="javascript:idcheck();"><img align="absmiddle" src="/images/mem_join/btn_mail_dup.gif" width="47" height="19" border="0"></a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="25"><span class=mem_notice>자주 사용하시는 E-mail계정을 입력하시기 바랍니다.</span></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">휴대폰 회원인증</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="27" width="100%">
                                                                      <select id="mobile1" name="mobile1" size="1">
                                                                            <option value="010" selected>010</option>
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
                                                                      <a href="javascript:sms_auth();"><img align="absmiddle" src="../../images/mem_join/btn_number_send.gif" width="75" height="19" border="0"></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td><span class=mem_notice>입력하신 휴대폰으로 인증번호를 전송해 드립니다.</span></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="30"><img align="absmiddle" src="../../images/mem_join/btn_send_title.gif" width="68" height="19" border="0">
                                                                          <input id="auth_no" class="mem_input" type="text" size="15" name="auth_no">
                                                                          <a href="javascript:auth_check();"><img align="absmiddle" src="../../images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></a> <span class=mem_notice>전송받은 인증번호를 입력해 주시기 바랍니다</span></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <!--
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">E-Mail 회원인증</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="30">
                                                                      <a href="javascript:email_auth();"><img align="absmiddle" src="/images/mem_join/btn_mail_send.gif" border="0"></a>
                                                                      <img align="absmiddle" src="/images/mem_join/btn_send_title.gif" border="0">
                                                                      		<input id="auth_no" class="mem_input" type="text" size="15" name="auth_no">
                                                                          <a href="javascript:auth_check();"><img align="absmiddle" src="/images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></a>
																		</td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="20" colspan="2" width="411"><span class=mem_notice>아이디로 입력하신 E-Mail로 인증번호를 전송해 드립니다.</span></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                               <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>주민등록번호</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input id="mem_jumin1" class="mem_input" type="text" size="15" name="mem_jumin1">-
                                                                <input id="mem_jumin2" class="mem_input" type="password" size="15" name="mem_jumin2"></td>
                                                              </tr-->
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>비밀번호</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input id="mem_pwd" class="mem_input" type="password" size="20" name="mem_pwd">
                                                                  4~12자리의 영문이나 숫자 </td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>비밀번호확인</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input id="mem_pwd_re" class="mem_input" type="password" size="20" name="mem_pwd_re"></td>
                                                              </tr>
                                                              <!--
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>핸드폰</td>
                                                                <td bgcolor="white" style="padding-left:10px;">
                                                                <select id="mobile1" name="mobile1" size="1">
                                                                            <option value="010" selected>010</option>
                                                                            <option value="011">011</option>
                                                                            <option value="016">016</option>
                                                                            <option value="017">017</option>
                                                                            <option value="018">018</option>
                                                                            <option value="019">019</option>
                                                                          </select>
                                                                  -
                                                                  <input id="mobile2" class="mem_input" type="text" size="8" name="mobile2" maxlength="4">
                                                                  -
                                                                  <input id="mobile3" class="mem_input" type="text" size="8" name="mobile3" maxlength="4"></td>
                                                              </tr>
                                                              -->
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>SMS 수신여부</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="23"> 수신
                                                                        <input type="radio" name="sms_yn" value="Y" checked>
                                                                        &nbsp;&nbsp;수신거부
                                                                        <input type="radio" name="sms_yn" value="N"></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td class="mem_notice" height="23">수신거부 시 예약확인 및 취소와 관련된 알림메세지 서비스를 받으실 수 없습니다. </td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="31" align="right" style="padding-right:10px;" class=mem_subject>E-mail수신여부</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="23"> 수신
                                                                        <input type="radio" name="email_yn" value="Y" checked>
                                                                        &nbsp;&nbsp;수신거부
                                                                        <input type="radio" name="email_yn" value="N"></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td class="mem_notice" height="23">수신거부 시 예약확인 및 취소와 관련된 알림메세지 서비스를 받으실 수 없습니다. </td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <!--tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">추천인 아이디</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input id="recom_id" class="mem_input" type="text" size="15" name="recom_id">
                                                                  @
                                                                  <input id="recom_domain" class="mem_input" type="text" size="15" name=""recom_domain"">
                                                                  <select name="formselect1" size="1" onchange="domainChange2(this.value);">
                                                                          <option value="">선택하세요</option>
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
                                                                          <option value="">직접입력하기</option>
                                                                        </select></td>
                                                              </tr-->
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
			</form>
                                                        <tr>
                                                          <td align="center" style="padding-top:30px;padding-bottom:40px;"><a href="javascript:on_submit();"><img src="/images/mem_join/btn_join_mem.gif" width="130" height="39" border="0"></a></td>
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
				  
				  <!--실시간 테이블 시작--> 
                  <iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe> 
                  <!--실시간 테이블  끝-->
                  
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
