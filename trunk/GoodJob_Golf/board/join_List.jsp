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
                                                          <td background="../../images/board/img_main_title_bg2.gif" height="50" align="center"><p> <img align="absmiddle" src="../../images/board/img_join_text.gif" width="130" height="19" border="0">
                                                              <select name="formselect1" size="1">
                                                                <option>지역선택</option>
                                                                <option value="1">전체보기</option>
                                                                <option value="2">수도권</option>
                                                                <option value="3">강원권</option>
                                                                <option value="4">충청권</option>
                                                                <option value="5">전라권</option>
                                                                <option value="6">제주권</option>
                                                              </select>
                                                              <select name="formselect1" size="1">
                                                                <option>성별선택</option>
                                                                <option value="1">전체보기</option>
                                                                <option value="2">남</option>
                                                                <option value="3">여</option>
                                                              </select>
                                                              <select name="formselect1" size="1">
                                                                <option>연령선택</option>
                                                                <option value="1">전체보기</option>
                                                                <option value="2">20대</option>
                                                                <option value="3">30대</option>
                                                                <option value="4">40대</option>
                                                                <option value="5">50대</option>
                                                                <option value="5">60대</option>
                                                              </select>
                                                              <input class="input_01" type="text" size="20" name="day">
                                                              <input name="imagefield" type="image" src="../../images/board/bt_search.gif" border="0" width="50" height="19" align="absmiddle">
                                                            </p></td>
                                                        </tr>
                                                        <tr>
                                                          <td><table border="0" cellpadding="0" cellspacing="0" width="666">
                                                              <tr>
                                                                <td align="center" height="27" width="36"><img src="../../images/board/img_board_title_no.gif" align="absmiddle" width="22" height="15" border="0"></td>
                                                                <td align="center" width="10"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td align="center" width="52"><img align="absmiddle" src="../../images/board/img_board_title_day.gif" width="31" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="52" align="center"><img align="absmiddle" src="../../images/board/img_board_title_in.gif" width="31" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="173" align="center"><img align="absmiddle" src="../../images/board/img_board_title_field.gif" width="31" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="46" align="center"><img align="absmiddle" src="../../images/board/img_board_title_booking.gif" width="31" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="47" align="center"><img align="absmiddle" src="../../images/board/img_board_title_in2.gif" width="41" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="40" align="center"><img align="absmiddle" src="../../images/board/img_board_title_age2.gif" width="43" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td width="39" align="center"><img align="absmiddle" src="../../images/board/img_board_title_regist.gif" width="21" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td align="center" width="38"><img align="absmiddle" src="../../images/board/img_board_title_hit.gif" width="21" height="15" border="0"></td>
                                                                <td width="10" align="center"><img src="../../images/board/img_board_blank.gif" align="absmiddle" width="3" height="14" border="0"></td>
                                                                <td align="center" width="53"><img align="absmiddle" src="../../images/board/img_board_title_process.gif" width="41" height="15" border="0"></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="19" bgcolor="#C8D290" width="666"></td>
                                                              </tr>
                                                            </table>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="669">
                                                              <tr>
                                                                <td align="center" height="30" width="41" class=normal_s>100</td>
                                                                <td align="center" width="62" class=normal_s>11/12/31</td>
                                                                <td width="62" align="center" class=normal_s>홍길동</td>
                                                                <td width="183" align="center"><a href="join_view.html" class=board_list>골프장명은 여기로</a></td>
                                                                <td width="57" align="center" class=normal_s>11/12/31</td>
                                                                <td width="56" align="center" class=normal_s>2명</td>
                                                                <td width="51" align="center" class=normal_s>30대</td>
                                                                <td width="49" align="center" class=normal_s>2건</td>
                                                                <td align="center" width="48" class=normal_s>100</td>
                                                                <td align="center" width="60" class=blue_s>진행중</td>
                                                              </tr>
                                                              <tr>
                                                                <td colspan="10" bgcolor="#E5E5E5" height="1"></td>
                                                              </tr>
                                                              <tr>
                                                                <td bgcolor="white" height="30" align="center" class=normal_s>99</td>
                                                                <td bgcolor="white" align="center" class=normal_s>11/12/31</td>
                                                                <td bgcolor="white" align="center" class=normal_s>홍길동</td>
                                                                <td bgcolor="white" align="center"><a href="join_view.html" class=board_list>골프장명은 여기로</a></td>
                                                                <td bgcolor="white" align="center" class=normal_s>11/12/31</td>
                                                                <td bgcolor="white" align="center" class=normal_s>3명</td>
                                                                <td bgcolor="white" align="center" class=normal_s>40대</td>
                                                                <td bgcolor="white" align="center" class=normal_s>3건</td>
                                                                <td bgcolor="white" align="center" class=normal_s>190</td>
                                                                <td bgcolor="white" align="center" class=orange_s>완료</td>
                                                              </tr>
                                                              <tr>
                                                                <td height="1" colspan="10" bgcolor="#E5E5E5"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td height="50" align="right" style="padding-right:20px;"><a href="join_write.html"><img src="../../images/board/btn_write.gif" width="71" height="24" border="0" alt="글쓰기"></a></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="668">
                                                              <tr>
                                                                <td width="668" align="center"><p><img align="absmiddle" src="/images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="/images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <img align="absmiddle"
src="/images/board/btn_next.gif" width="16" height="15" border="0"> <img align="absmiddle" src="/images/board/btn_next_dual.gif" width="16" height="15" border="0"></p></td>
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
