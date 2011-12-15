<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->

					<!--############### 중앙 컨텐츠 영역 #################-->
					
					<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>회원로그인</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">회원로그인</td>
                                            </tr>
                                            
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table border="0" cellpadding="0" cellspacing="0" width="600">
                                                        <tr>
                                                          <td align="center" width="600"><img src="../../images/mem_join/img_login_title.gif" width="600" height="132" border="0"></td>
                                                        </tr>
                                                    <form name="logonFrm" method="post" action="">
                                                        <tr>
                                                          <td height="30">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="502">
                                                              <tr>
                                                                <td width="116" align="right" style="padding-right:10px;" height="2"><span class=normal_b>아이디</span></td>
                                                                <td width="215">
                                                                    <input id="mem_id" class="mem_login" type="text" size="33" name="mem_id" value="<%=com.goodjob.util.Utils.getCookie(request,"golf.mem_id")%>">
                                                                  </td>
                                                                <td width="160" rowspan="2"><a href="javascript:logon_ok();"><img src="/images/mem_join/btn_login.gif" width="59" height="47" border="0"></a></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="116" align="right" style="padding-right:10px;" height="2"><span class=normal_b>비밀번호</span></td>
                                                                <td width="215">
                                                                    <input id="mem_pwd" class="mem_login" type="password" size="33" name="mem_pwd">
                                                                  </td>
                                                              </tr>
                                                              <tr>
                                                                <td width="116" align="right" style="padding-right:10px;">&nbsp;</td>
                                                                <td width="376" colspan="2">
                                                                    <input type="checkbox" name="id_cookie" value="Y"/>
                                                                    아이디 기억하기</td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="500">
                                                              <tr>
                                                                <td width="500" colspan="3" height="35">&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                <td height="25" width="122">&nbsp;</td>
                                                                <td width="78"><a href="/member/join_agreement.jsp"><img src="/images/mem_join/btn_mem_join.gif" width="56" height="20" border="0"></a></td>
                                                                <td width="300"><p><img src="/images/mem_join/img_join_text.gif" width="233" height="20" border="0"></p></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="25" width="122">&nbsp;</td>
                                                                <td width="378" height="20" colspan="2"><a href="/member/id_pass_search.jsp"><img src="../../images/mem_join/btn_id_search.gif" width="107" height="20" border="0"></a></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                     </form>
                                                        <tr>
                                                          <td height="200">&nbsp;</td>
                                                        </tr>
                                                      </table></td>
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
