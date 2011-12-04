<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%
	
	
%>
<%@ include file="/include/header.jsp" %>
                      <table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>회원가입</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">회원가입</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="94%" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="640">
                                                        <tr>
                                                          <td width="640" style="padding-top:15px;"><img src="/images/mem_join/img_agree_title.gif" width="350" height="50" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td><iframe src="agreement.htm" style="border-right: dotted #6D6E71 1px;border-left: dotted #6D6E71 1px;border-top: dotted #6D6E71 1px;
						border-bottom: dotted #6D6E71 1px;" width="640" height="100" frameborder="0" vspace="0" hspace="0" marginwidth="0" marginheight="0"></iframe></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="right"> 위 사항을 확인하였으며 동의합니다 &nbsp;&nbsp;
                                                            <input type="radio" name="formradio1" checked>
                                                            예 &nbsp;&nbsp;
                                                            <input type="radio" name="formradio1">
                                                            아니오 </td>
                                                        </tr>
                                                        <tr>
                                                          <td><img src="/images/mem_join/img_provacy_title.gif" width="350" height="50" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td><iframe src="privacy.htm" style="border-right: dotted #6D6E71 1px;border-left: dotted #6D6E71 1px;border-top: dotted #6D6E71 1px;
						border-bottom: dotted #6D6E71 1px;" width="640" height="100" frameborder="0" vspace="0" hspace="0" marginwidth="0" marginheight="0"></iframe></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="right"> 위 사항을 확인하였으며 동의합니다 &nbsp;&nbsp;
                                                            <input type="radio" name="formradio2" checked>
                                                            예 &nbsp;&nbsp;
                                                            <input type="radio" name="formradio2">
                                                            아니오 </td>
                                                        </tr>
                                                        <tr>
                                                          <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td><img src="/images/mem_join/img_handphone_title.gif" width="350" height="50" border="0"></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" cellpadding="2" cellspacing="1" width="500" bgcolor="#D1D3D4">
                                                              <tr>
                                                                <td width="494" bgcolor="white" align="center" height="100"><table border="0" cellpadding="2" cellspacing="1" width="95%">
                                                                    <tr>
                                                                      <td height="40" align="center"><p>
                                                                          <select name="formselect1" size="1">
                                                                            <option>통신사선택</option>
                                                                            <option>SKT</option>
                                                                            <option>KT</option>
                                                                            <option>LG</option>
                                                                          </select>
                                                                          <select name="formselect1" size="1">
                                                                            <option>010</option>
                                                                            <option>011</option>
                                                                            <option>016</option>
                                                                            <option>017</option>
                                                                            <option>018</option>
                                                                            <option>019</option>
                                                                          </select>
                                                                          -
                                                                          <input class="mem_input" type="text" size="8" name="id" maxlength="4">
                                                                          -
                                                                          <input class="mem_input" type="text" size="8" name="id" maxlength="4">
                                                                          <img align="absmiddle" src="/images/mem_join/btn_number_send.gif" width="75" height="19" border="0"></p></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="40" align="center"><p><img align="absmiddle" src="/images/mem_join/btn_send_title.gif" width="81" height="19" border="0">
                                                                          <input class="mem_input" type="text" size="15" name="id">
                                                                          <img align="absmiddle" src="/images/mem_join/btn_send_confirm.gif" width="42" height="19" border="0"></p></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center" style="padding-top:30px;padding-bottom:30px;"><table border="0" cellpadding="0" cellspacing="0" width="60%">
                                                              <tr>
                                                                <td width="30%" align="center"><a href="join_mem_input.html"><img src="/images/mem_join/btn_join_mem.gif" width="130" height="39" border="0"></a></td>
                                                                <td width="30%" align="center"><img src="/images/mem_join/btn_join_cancel.gif" width="130" height="39" border="0"></td>
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
                              </table></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td><script>flashObject("/images/swf/bottom_menu.swf","","751","27")</script></td>
                          </tr>
                          <tr>
                            <td height="76"><img src="/images/common/img_copyright.gif" width="751" height="76"></td>
                          </tr>
                        </table>
<%@ include file="/include/footer.jsp" %>
