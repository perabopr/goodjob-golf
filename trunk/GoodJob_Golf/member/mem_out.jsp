<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/loginCheck.jsp" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<script type="text/javascript">
	function on_submit() {

		if(confirm("정말 회원 탈퇴를 하시겠습니까?")){
			var frm = document.frm;
			frm.target =  "ifr_hidden"; 
			frm.action = "secession.jsp";
			frm.submit();
		}
   	}
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
                                              <td align="right" class="location" height="30" width="95%"><a href="/">HOME</a> &gt; <span class=location_b>회원탈퇴</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">회원탈퇴</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="640">
                                                        <tr>
                                                          <td width="640" style="padding-top:15px;"><img src="/images/mem_join/img_mem_out.gif" width="640" height="80" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                <form name="frm" method="post">
                                                        <tr>
                                                          <td align="center"><table align="center" border="0" cellpadding="2" cellspacing="1" width="600" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="#F1F1F1" height="25" align="right" style="padding-right:10px;" class=mem_subject width="162">회원명</td>
                                                                <td bgcolor="white" style="padding-left:10px;" width="410" class=normal_b><%=StringUtils.trimToEmpty((String)session.getAttribute("mem_name"))%></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">아이디</td>
                                                                <td bgcolor="white" style="padding-left:10px;" class=blue><%=StringUtils.trimToEmpty((String)session.getAttribute("mem_id"))%></td>
                                                              </tr>
                                                                <tr>
                                                                <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="25">남기고 싶으신 말씀</td>
                                                                 <td bgcolor="white" style="padding-left:10px;"><textarea class="box_01" rows="12" cols="70" name="memo"></textarea></td>
                                                                </tr>
                                                              <tr>
                                                                <td bgcolor="#AED247" colspan="2" width="593"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                  </form>
                                                        <tr>
                                                          <td align="center" style="padding-top:30px;padding-bottom:40px;"><a href="javascript:on_submit();"><img src="/images/mem_join/btn_mem_out.gif" width="150" height="39" border="0"></a></td>
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
					<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe> 
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
