﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>공지사항</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">공지사항</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                          <td background="../../images/board/img_main_title_bg.gif" height="31"><p>&nbsp;</p></td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
                                                              <tr>
                                                                <td align="center" height="27" width="65"><img src="../../images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                                                                <td align="center" width="10"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td align="center" width="450"><img src="../../images/board/img_board_title_subject.gif" width="23" height="15" border="0" align="absmiddle"></td>
                                                                <td align="center" width="10"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td align="center" width="131"><img src="../../images/board/img_board_title_date.gif" width="21" height="15" border="0" align="absmiddle"></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="5" bgcolor="#C8D290" width="666"></td>
                                                              </tr>
                                                            </table>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="669">
                                                              <tr>
                                                                <td align="center" height="30" width="65">100</td>
                                                                <td align="center" width="10"></td>
                                                                <td width="450"><a href="notice_view.html" class=b_list>공지사항 게시판 제목입니다</a> <img align="absmiddle" src="../../images/board/icon_new.gif" width="10" height="9" border="0"></td>
                                                                <td align="center" width="11"></td>
                                                                <td align="center" width="133">2011-12-31</td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="5" bgcolor="#E5E5E5" width="669"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td height="30"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="668">
                                                              <tr>
                                                                <td width="420"><p><img align="absmiddle" src="/images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="/images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <img align="absmiddle"
src="/images/board/btn_next.gif" width="16" height="15" border="0"> <img align="absmiddle" src="/images/board/btn_next_dual.gif" width="16" height="15" border="0"></p></td>
                                                                <td align="right" width="248"><table border="0" cellpadding="0" cellspacing="0" width="230">
                                                                    <tr>
                                                                      <td><select name="formselect1" size="1">
                                                                          <option>제목</option>
                                                                          <option>내용</option>
                                                                        </select></td>
                                                                      <td><input class="input_01" type="text" size="18" name="day"></td>
                                                                      <td><input name="imagefield" type="image" src="../../images/board/bt_search.gif" border="0" width="50" height="19"></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td height="250" align="center"></td>
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
