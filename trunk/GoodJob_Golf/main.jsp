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
                                  <td width="343" valign="top">
                                  
                                  <!-- 공지사항 -->
                                  <jsp:include page="/common/main_notice_list.jsp" flush="true"/>
                                    
                                  </td>
                                  <td width="15">&nbsp;</td>
                                  <td width="393" valign="top">
                                  
                                  <!-- 조인 커뮤니티 -->
                                  <jsp:include page="/common/main_join_list.jsp" flush="true"/>
                                  
                                  </td>
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
