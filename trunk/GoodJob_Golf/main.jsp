<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
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
                                  <td width="751">
                                  <table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                         <tr>
                                             <td align="center" bgcolor="white" width="745" style="padding-top:10px;padding-bottom:10px;">
                                                 <table border="0" cellpadding="0" cellspacing="0" width="730">
                                                     <tr>
                                                         <td height="200" bgcolor="#CCCCCC" align="center" colspan="3" width="729">메인비쥬얼</td>
                                                     </tr>
                                                     <tr>
                                                         <td bgcolor="white" colspan="3" width="730">&nbsp;</td>
                                                     </tr>
                                                     <tr>
                                                         <td height="170" width="360" align="center" bgcolor="#CCCCCC">실시간 그린피할인</td>
                                                         <td height="170" width="10">&nbsp;</td>
                                                         <td height="170" width="360" align="center" bgcolor="#CCCCCC">사전신청 그린피할인</td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="3" width="730">&nbsp;</td>
                                                     </tr>
                                                     <tr>
                                                         <td height="170" width="360" align="center" bgcolor="#CCCCCC">국내 골프패키지</td>
                                                         <td height="170" width="10">&nbsp;</td>
                                                         <td height="170" width="360" align="center" bgcolor="#CCCCCC">콘도예약</td>
                                                     </tr>
                                                 </table>
                                             </td>
                                         </tr>
                                    </table>
                                 </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="343" valign="top"><table width="341" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td width="340" align="center" background="images/common/img_board_list_bg.gif" height="35"><table cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td width="69"><img src="images/common/img_notice_title.gif" width="69" height="19" alt="공지사항"></td>
                                              <td width="254" align="right"><a href="sub/board/notice_list.html"><img src="images/common/btn_more.gif" width="38" height="11"></a></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr>
                                        <td align="center"><table cellpadding="0" cellspacing="0" width="325">
                                            <tr>
                                              <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
                                              <td width="262"><a href="#" class=board_list>하우이즈골프 홈페이지 준비중입니다</a> <img align="absmiddle" src="images/common/icon_new.gif" width="14" height="11"></td>
                                              <td width="63" align="right"><span class=board_date>2011.12.31</span></td>
                                            </tr>
                                            <tr>
                                              <td colspan="3" width="325"><img src="images/common/img_board_dot.gif" width="325" height="1"></td>
                                            </tr>
                                          </table>
                                          <table cellpadding="0" cellspacing="0" width="325">
                                            <tr>
                                              <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
                                              <td width="262"><a href="#" class=board_list>하우이즈골프 홈페이지 준비중입니다</a></td>
                                              <td width="63" align="right"><span class=board_date>2011.12.31</span></td>
                                            </tr>
                                            <tr>
                                              <td colspan="3" width="325"><img src="images/common/img_board_dot.gif" width="325" height="1"></td>
                                            </tr>
                                          </table>
                                          <table cellpadding="0" cellspacing="0" width="325">
                                            <tr>
                                              <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
                                              <td width="262"><a href="#" class=board_list>하우이즈골프 홈페이지 준비중입니다</a></td>
                                              <td width="63" align="right"><span class=board_date>2011.12.31</span></td>
                                            </tr>
                                            <tr>
                                              <td colspan="3" width="325"><img src="images/common/img_board_dot.gif" width="325" height="1"></td>
                                            </tr>
                                          </table>
                                          <table cellpadding="0" cellspacing="0" width="325">
                                            <tr>
                                              <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
                                              <td width="262"><a href="#" class=board_list>하우이즈골프 홈페이지 준비중입니다</a></td>
                                              <td width="63" align="right"><span class=board_date>2011.12.31</span></td>
                                            </tr>
                                            <tr>
                                              <td colspan="3" width="325"><img src="images/common/img_board_dot.gif" width="325" height="1"></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                  <td width="15">&nbsp;</td>
                                  <td width="393" valign="top"><table width="395" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td align="center" background="images/common/img_board_list_bg.gif" height="35"><table cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td width="70"><img src="images/common/img_join_title.gif" width="79" height="19" alt="이용후기"></td>
                                              <td width="306" align="right"><a href="sub/board/join_list.html"><img src="images/common/btn_more.gif" width="38" height="11"></a></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr>
                                        <td align="center"><table cellpadding="0" cellspacing="0" width="377">
                                            <tr>
                                              <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
                                              <td width="70"><span class=board_date>[대영베이스]</span></td>
                                              <td width="232"><a href="#" class=board_list>하우이즈골프 홈페이지 준비중입니다</a> <img align="absmiddle" src="images/common/icon_new.gif" width="14" height="11"></td>
                                              <td width="65" align="right"><span class=board_date>2011.12.31</span></td>
                                            </tr>
                                            <tr>
                                              <td colspan="4" width="377"><img src="images/common/img_board_dot2.gif" width="377" height="1"></td>
                                            </tr>
                                          </table>
                                          <table cellpadding="0" cellspacing="0" width="377">
                                            <tr>
                                              <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
                                              <td width="70"><span class=board_date>[대영베이스]</span></td>
                                              <td width="232"><a href="#" class=board_list>하우이즈골프 홈페이지 준비중입니다</a></td>
                                              <td width="65" align="right"><span class=board_date>2011.12.31</span></td>
                                            </tr>
                                            <tr>
                                              <td colspan="4" width="377"><img src="images/common/img_board_dot2.gif" width="377" height="1"></td>
                                            </tr>
                                          </table>
                                          <table cellpadding="0" cellspacing="0" width="377">
                                            <tr>
                                              <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
                                              <td width="70"><span class=board_date>[대영베이스]</span></td>
                                              <td width="232"><a href="#" class=board_list>하우이즈골프 홈페이지 준비중입니다</a></td>
                                              <td width="65" align="right"><span class=board_date>2011.12.31</span></td>
                                            </tr>
                                            <tr>
                                              <td colspan="4" width="377"><img src="images/common/img_board_dot2.gif" width="377" height="1"></td>
                                            </tr>
                                          </table>
                                          <table cellpadding="0" cellspacing="0" width="377">
                                            <tr>
                                              <td width="10" height="27"><img align="absmiddle" src="images/common/img_board_list_bullet.gif" width="3" height="3"></td>
                                              <td width="70"><span class=board_date>[대영베이스]</span></td>
                                              <td width="232"><a href="#" class=board_list>하우이즈골프 홈페이지 준비중입니다</a></td>
                                              <td width="65" align="right"><span class=board_date>2011.12.31</span></td>
                                            </tr>
                                            <tr>
                                              <td colspan="4" width="377"><img src="images/common/img_board_dot2.gif" width="377" height="1"></td>
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
                          <!-- 하단  회사 소개 부분  -->
                          <%@ include file="/include/copyright.jsp" %>
                          <!-- 하단  회사 소개 부분  -->
                        </table>
                        
                        <!--############### 중앙 컨텐츠 영역 #################-->
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
