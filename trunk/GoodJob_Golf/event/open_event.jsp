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
                                              <td align="right" class="location" height="30" width="95%"><a href="/main.jsp">HOME</a> &gt; <span class=location_b>이벤트</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">이벤트</td>
                                            </tr>
                                            <tr>
                                              <td valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center">
                                                     <img src="../../images/common/img_open_event.jpg" width="707" height="643" border="0" usemap="#ImageMap1"></td>
                                                  </tr>
                                                  <tr>
                                                   <td>&nbsp;</td>
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
                        <map name="ImageMap1">
<area shape="rect" coords="107, 493, 309, 555" href="/forGolfbooking/reserve.jsp?menu=1">
<area shape="rect" coords="385, 495, 588, 556" href="/forGolfbooking/reserve.jsp?menu=2">
</map>
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
