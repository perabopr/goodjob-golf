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
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>JOIN 커뮤니티</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">JOIN 커뮤니티</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                          <td background="../../images/board/img_main_title_bg.gif" height="31">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="109"><img align="absmiddle" src="../../images/board/img_board_title_writer.gif" width="33" height="15" border="0"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="26">&nbsp;</td>
                                                                <td width="110" class=blue>홍길동</td>
                                                                <td width="109" align="center"><img src="../../images/board/img_board_title_phone.gif" width="31" height="15" border="0"></td>
                                                                <td width="1" bgcolor="#D1D3D4"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="286"><p>
                                                                    <select name="formselect1" size="1">
                                                                      <option>선택</option>
                                                                      <option>010</option>
                                                                      <option>011</option>
                                                                      <option>016</option>
                                                                      <option>017</option>
                                                                      <option>018</option>
                                                                      <option>019</option>
                                                                    </select>
                                                                    -
                                                                    <input class="input_01" type="text" size="6" name="day">
                                                                    -
                                                                    <input class="input_01" type="text" size="6" name="day">
                                                                  </p></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="109" height="30"><img src="../../images/board/img_board_title_area.gif" width="31" height="15" border="0"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="110"><select name="formselect1" size="1">
                                                                    <option>선택하세요</option>
                                                                    <option>수도권</option>
                                                                    <option>강원권</option>
                                                                    <option>충청권</option>
                                                                    <option>전라권</option>
                                                                    <option>경상권</option>
                                                                    <option>제주권</option>
                                                                  </select></td>
                                                                <td width="109" align="center"><img align="absmiddle" src="../../images/board/img_board_title_cc.gif" width="42" height="15" border="0"></td>
                                                                <td width="1" bgcolor="#D1D3D4"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="287"><input class="input_01" type="text" size="32" name="day"></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="30" align="center" width="109"><img src="../../images/board/img_board_title_sex.gif" width="43" height="15" border="0"></td>
                                                                <td height="22" align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td height="22" width="25">&nbsp;</td>
                                                                <td height="22" width="110"><select name="formselect1" size="1">
                                                                    <option>선택하세요</option>
                                                                    <option>남성</option>
                                                                    <option>여성</option>
                                                                    <option>구분없음</option>
                                                                  </select></td>
                                                                <td height="22" align="center" width="109"><img src="../../images/board/img_board_title_age.gif" width="43" height="15" border="0"></td>
                                                                <td height="22" bgcolor="#D1D3D4" width="1"></td>
                                                                <td height="22" width="25">&nbsp;</td>
                                                                <td height="22" width="287"><select name="formselect1" size="1">
                                                                    <option>선택하세요</option>
                                                                    <option>20대</option>
                                                                    <option>30대</option>
                                                                    <option>40대</option>
                                                                    <option>50대</option>
                                                                    <option>60대</option>
                                                                    <option>구분없음</option>
                                                                  </select></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" width="109" height="30"><img src="../../images/board/img_board_title_people.gif" width="43" height="15" border="0"></td>
                                                                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="110"><select name="formselect1" size="1">
                                                                    <option>선택하세요</option>
                                                                    <option>1명</option>
                                                                    <option>2명</option>
                                                                    <option>3명</option>
                                                                  </select></td>
                                                                <td width="109" align="center"><img src="../../images/board/img_board_title_round.gif" width="52" height="15" border="0"></td>
                                                                <td width="1" bgcolor="#D1D3D4"></td>
                                                                <td width="25">&nbsp;</td>
                                                                <td width="287"><p>
                                                                    <select name="formselect1" size="1">
                                                                      <option>12월</option>
                                                                    </select>
                                                                    <select name="formselect1" size="1">
                                                                      <option>31일</option>
                                                                    </select>
                                                                    <select name="formselect1" size="1">
                                                                      <option>오전</option>
                                                                      <option>오후</option>
                                                                    </select>
                                                                    <input class="input_01" type="text" size="2" name="day">
                                                                    시
                                                                    <input class="input_01" type="text" size="2" name="day">
                                                                    분</p></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="30" align="center"><img src="../../images/board/img_board_title_price.gif" width="43" height="15" border="0"></td>
                                                                <td height="22" align="center" bgcolor="#D1D3D4"></td>
                                                                <td height="10">&nbsp;</td>
                                                                <td height="30" colspan="5"><img src="../../images/board/img_title_greenpee.gif" width="34" height="15" border="0">
                                                                  <input class="input_01" type="text" size="8" name="day">
                                                                  원 &nbsp;<img src="../../images/board/img_title_cartpee.gif" width="34" height="15" border="0">
                                                                  <input class="input_01" type="text" size="8" name="day">
                                                                  원 &nbsp;<img src="../../images/board/img_title_caddiepee.gif" width="34" height="15" border="0">
                                                                  <input class="input_01" type="text" size="8" name="day">
                                                                  원</td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td align="center" valign="top" width="109"><img src="../../images/board/img_board_title_write.gif" width="43" height="15" border="0"></td>
                                                                <td align="center" valign="top" bgcolor="#D1D3D4" width="1"></td>
                                                                <td valign="top" width="25">&nbsp;</td>
                                                                <td width="532" valign="top"><textarea name="content" rows="15" cols="80" class="box03"></textarea></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td background="../../images/board/img_board_ver.gif">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td width="88"><a href="join_list.html"><img src="../../images/board/btn_list.gif" width="71" height="24" border="0" alt="목록"></a></td>
                                                                <td width="480" align="right"><img align="absmiddle" src="../../images/board/btn_input.gif" width="71" height="24" border="0" alt="등록"></td>
                                                                <td width="99" align="right"><img src="../../images/board/btn_cancel.gif" width="71" height="24" border="0" align="absmiddle"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td height="50">&nbsp;</td>
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
