<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%
	
	
%>
<%@ include file="/include/header.jsp" %>
                <table border="0" width="1000" cellpadding="0" cellspacing="0">
                    <tr>
                      <td colspan="3" background="images/common/img_top_bg.jpg" height="50" valign="top" width="1000" align="right">
                      	<table cellpadding="0" cellspacing="0" width="749" bgcolor="#052B48">
                          <tr>
                            <td width="120"><img src="/images/common/img_search_title.gif" width="120" height="40" alt="골프장 빠른검색"></td>
                            <td align="center" width="180"><select name="number"  onchange="f_select(this.selectedIndex);">
                                <option value="">지역선택------------</option>
                                <option value="1">전체보기</option>
                                <option value="2">수도권</option>
                                <option value="3">강원권</option>
                                <option value="4">충청권</option>
                                <option value="5">전라권</option>
                                <option value="6">제주권</option>
                              </select></td>
                            <td width="175"><select name="number"  onchange="f_select(this.selectedIndex);">
                                <option value="">항목선택-------------</option>
                                <option value="1">전체보기</option>
                                <option value="2">실시간부킹 골프장</option>
                                <option value="3">사전신청 골프장</option>
                                <option value="4">국내패키지</option>
                                <option value="5">해외패키지</option>
                              </select></td>
                            <td width="198"><input class="input_01" type="text" size="28" name="day">
                            <td width="76"><input type="image" name="formimage1" src="/images/common/btn_top_search.gif" width="52" height="22"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td width="235" valign="top"><table border="0" width="235" cellpadding="0" cellspacing="0">
                          <tr>
                            <td background="images/img_leftmenu/img_left_bg.jpg" width="235"><table border="0" cellpadding="0" cellspacing="0" width="235" bgcolor="#052B48">
                                <tr>
                                  <td width="235" height="146" align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="235">
                                      <tr>
                                        <td><img src="images/img_leftmenu/img_login_title.gif" width="235" height="49" border="0"></td>
                                      </tr>
                                      <tr>
                                        <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="207">
                                            <tr>
                                              <td width="103"><input class="input_01" type="text" size="20" name="id" value="아이디"></td>
                                              <td rowspan="3" align="right"><input type="image" name="formimage2" src="images/img_leftmenu/btn_login_confirm.gif" width="64" height="51" border="0"></td>
                                            </tr>
                                            <tr>
                                              <td height="2"></td>
                                            </tr>
                                            <tr>
                                              <td width="103"><input class="input_01" type="text" size="20" name="pw" value="비밀번호"></td>
                                            </tr>
                                            <tr>
                                              <td width="207" colspan="2" height="40" align="right"><table border="0" cellpadding="0" cellspacing="0" width="170">
                                                  <tr>
                                                    <td width="104"><a href="sub/mem_join/join_agreement.html"><img src="images/img_leftmenu/btn_join_s.gif" width="55" height="13" border="0"></a></td>
                                                    <td width="104"><a href="sub/mem_join/id_pass_search.html"><img src="images/img_leftmenu/btn_id_pw_s.gif" width="108" height="13" border="0"></a></td>
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
                            <td height="10"></td>
                          </tr>
                                                    <tr>
                                                        <td bgcolor="#F7F5F6">
                                                            <table border="0" width="235" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="235"><a href="#"><img src="images/img_leftmenu/img_customer_center.gif" width="235" height="139" border="0"></a></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="#"><img src="images/img_leftmenu/btn_user_guide.gif" width="235" height="86" border="0"></a></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="sub/board/faq_list.html"><img src="images/img_leftmenu/btn_faq.gif" width="235" height="86" border="0"></a></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="#"><img src="images/img_leftmenu/btn_event.gif" width="235" height="86" border="0"></a></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                        </table></td>
                      <td width="15" valign="top"></td>
                      <td width="750" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
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
                                    </table></td>
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
                          <tr>
                            <td><script>flashObject("images/swf/bottom_menu.swf","","751","27")</script></td>
                          </tr>
                          <tr>
                            <td height="76"><img src="/images/common/img_copyright.gif" width="751" height="76"></td>
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
    <td height="198" background="/images/common/img_copyright_bg.jpg">&nbsp;</td>
  </tr>
</table>
</body>
</html>