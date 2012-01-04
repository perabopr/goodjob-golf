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

	function on_submit() {

		if(!$('#subject').val()) {
			alert('제목을 입력하시기 바랍니다.');
			$('#subject').focus();
			return;
		} 
		
		if(!$('#name').val()) {
			alert('고객명(회사명) 입력하시기 바랍니다.');
			$('#name').focus();
			return;
		}

		if(!$('#email').val() || !$('#email_domain').val()) {
			alert('이메일을  입력하시기 바랍니다.');
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

   		if(!$('#content').val()) {
			alert('내용을 입력하시기 바랍니다.');
			$('#content').focus();
			return;
		}
 	      
		var frm = document.frm;
		frm.target =  "ifr_hidden"; 
		frm.action = "partnership_reg.jsp";
		frm.submit();
   	}
	
	function domainChange(val){
		if(val == 'self'){
			document.getElementById("email_domain").readOnly = false;
			$('#email_domain').val("");
		}
		else{
			document.getElementById("email_domain").readOnly = true;
			$('#email_domain').val(val);
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
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/">HOME</a> &gt; <span class=location_b>제휴문의</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">제휴문의</td>
                                            </tr>
                                            <tr>
                                              <td valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center"><img src="/images/common/img_partner_title.gif" width="640" height="108" border="0"></td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center"><table align="center" border="0" cellpadding="2" cellspacing="1" width="600" bgcolor="#D1D3D4">
                                                        <tr>
                                                          <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                        </tr>
<form name="frm" method="post" enctype="multipart/form-data">
                                                        <tr>
                                                          <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject width="162">제목</td>
                                                          <td bgcolor="white" style="padding-left:10px;" width="410"><input class="input_01" type="text" size="60" id="subject" name="subject"></td>
                                                        </tr>
                                                        <tr>
                                                          <td height="25" align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">고객명(회사명)</td>
                                                          <td height="27" bgcolor="white" style="padding-left:10px;"><input class="input_01" type="text" size="30" id="name" name="name"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">E-Mail</td>
                                                          <td bgcolor="white" style="padding-left:10px;"><input class="input_01" type="text" size="15" id="email" name="email">
                                                            @
                                                            <input class="input_01" type="text" size="15" id="email_domain" name="email_domain" readonly />
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
                                                             </select></td>
                                                        </tr>
                                                        <tr>
                                                          <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject>핸드폰</td>
                                                          <td bgcolor="white" style="padding-left:10px;">
                                                          
                                                          <select id="mobile1" name="mobile1" size="1">
                                                               <option value="010">010</option>
                                                               <option value="011">011</option>
                                                               <option value="016">016</option>
                                                               <option value="017">017</option>
                                                               <option value="018">018</option>
                                                               <option value="019">019</option>
                                                             </select>
                                                             -
                                                             <input id="mobile2" class="mem_input" type="text" size="8" name="mobile2" maxlength="4" onkeyup="onlyNumber2(this.form.mobile2)">
                                                             -
                                                             <input id="mobile3" class="mem_input" type="text" size="8" name="mobile3" maxlength="4" onkeyup="onlyNumber2(this.form.mobile3)"></td>
                                                        </tr>
                                                        <tr>
                                                          <td bgcolor="#F1F1F1" align="right" style="padding-right:10px;" class=mem_subject>전달사항</td>
                                                          <td bgcolor="white" style="padding-left:10px;"><textarea id="content" name="content" rows="10" cols="64" class="box_01"></textarea></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">첨부파일</td>
                                                          <td bgcolor="white" style="padding-left:10px;"><input class="upload" name="upfile" type="file" size="50"></td>
                                                        </tr>
                                                        <tr>
                                                          <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center" style="padding-top:30px;padding-bottom:50px;">
                                                    <a href="javascript:on_submit();"><img src="/images/common/btn_confirm.gif" width="150" height="39" border="0"></a></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
</form>
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
