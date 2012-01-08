<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="com.goodjob.member.*"%><%
	
	String ses_mem_id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));

	MemberDao mDao = new MemberDao();
	
	if(ses_mem_id.length()==0){
%>
<script language="javascript" type="text/javascript">
alert("로그인 이후 회원 정보를 수정할 수 있습니다.");
location.href="/main.jsp";
</script>
<%
		return;
	}
	
	MemberDto mDto = mDao.getMember(ses_mem_id);
	
	String[] mobile = mDto.getMem_mtel().split("-");
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<script language="javascript" type="text/javascript">

	function on_submit() {
		
		if($('#org_pwd').val().length > 0) {

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
		if(val == ''){
			$("input[name=mem_domain]").attr("readonly",false);
			$('#mem_domain').val("");
		}
		else{
			$("input[name=mem_domain]").attr("readonly",true);
			$('#mem_domain').val(val);
		}
	}

	function onlyNumber2(loc) {
		if(/[^0123456789]/g.test(loc.value)) {
			alert("숫자가 아닙니다.");
			loc.value = "";
			loc.focus();
		}
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
                                        <td align="center" bgcolor="white" width="745" height="600" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/">HOME</a> &gt; <span class=location_b>회원정보수정</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">회원정보수정</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="640">
                                                        <tr>
                                                          <td width="640" style="padding-top:15px;"><img src="/images/mem_join/img_edit_title.gif" width="640" height="89" border="0" usemap="#ImageMap1"></td>
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
<form name="joinForm" method="post">
                                                        <tr>
                                                          <td><img src="/images/mem_join/img_edit_message.gif" width="560" height="33" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table align="center" border="0" cellpadding="2" cellspacing="1" width="600" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject width="162">회원명</td>
                                                                <td bgcolor="white" style="padding-left:10px;" width="410" class=normal_b><%=mDto.getMem_name()%></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">아이디</td>
                                                                <td bgcolor="white" style="padding-left:10px;" class=blue><%=mDto.getMem_id()%></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>기존 비밀번호 입력</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input class="mem_input" type="password" size="20" id="org_pwd" name="org_pwd"> </td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>변경할 비밀번호</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input class="mem_input" type="password" size="20" id="mem_pwd" name="mem_pwd">
                                                                  4~12자리의 영문이나 숫자 </td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>변경할 비밀번호확인</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><input class="mem_input" type="password" size="20" id="mem_pwd_re" name="mem_pwd_re"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>핸드폰</td>
                                                                <td bgcolor="white" style="padding-left:10px;">
                                                                <select id="mobile1" name="mobile1" size="1">
                                                                            <option value="010"<%=("010".equals(mobile[0])?" selected":"")%>>010</option>
												                           <option value="011"<%=("011".equals(mobile[0])?" selected":"")%>>011</option>
												                           <option value="016"<%=("016".equals(mobile[0])?" selected":"")%>>016</option>
												                           <option value="017"<%=("017".equals(mobile[0])?" selected":"")%>>017</option>
												                           <option value="018"<%=("018".equals(mobile[0])?" selected":"")%>>018</option>
												                           <option value="019"<%=("019".equals(mobile[0])?" selected":"")%>>019</option>
                                                                          </select>
                                                                  -
                                                                  <input id="mobile2" class="mem_input" type="text" size="8" name="mobile2" value="<%=mobile[1]%>" maxlength="4">
                                                                  -
                                                                  <input id="mobile3" class="mem_input" type="text" size="8" name="mobile3" value="<%=mobile[2]%>" maxlength="4"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>SMS 수신여부</td>
                                                                <td bgcolor="white" style="padding-left:10px;"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="23"> 수신
                                                                        <input type="radio" id="sms_yn" name="sms_yn" value="Y"<%=("Y".equals(mDto.getSms_yn())?" checked":"")%>>
                                                                        &nbsp;&nbsp;수신거부
                                                                        <input type="radio" id="sms_yn" name="sms_yn" value="N"<%=("N".equals(mDto.getSms_yn())?" checked":"")%>></td>
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
                                                                        <input type="radio" id="email_yn" name="email_yn" value="Y"<%=("Y".equals(mDto.getEmail_yn())?" checked":"")%>>
                                                                        &nbsp;&nbsp;수신거부
                                                                        <input type="radio" id="email_yn" name="email_yn" value="N"<%=("N".equals(mDto.getEmail_yn())?" checked":"")%>></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td class="mem_notice" height="23">수신거부 시 예약확인 및 취소와 관련된 알림메세지 서비스를 받으실 수 없습니다. </td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
</form>
                                                        <tr>
                                                          <td align="center" style="padding-top:30px;padding-bottom:40px;"><a href="javascript:on_submit();"><img src="/images/mem_join/btn_mem_edit.gif" width="130" height="39" border="0"></a></td>
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
                        
					<map name="ImageMap1"><area shape="rect" coords="515,54,572,77" href="mem_out.jsp"></map>
					<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe>
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
