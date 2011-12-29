<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.CondoReserveDao"%>
<%@page import="com.goodjob.reserve.dto.*"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="com.goodjob.util.Utils"%>
<%

	String menu = StringUtils.trimToEmpty(request.getParameter("menu"));
	int condo_seq = NumberUtils.toInt(request.getParameter("condo_seq"),1);
	String condo_name = StringUtils.trimToEmpty(request.getParameter("condo_name"));
	String in_date = StringUtils.trimToEmpty(request.getParameter("in_date"));
	String out_date = StringUtils.trimToEmpty(request.getParameter("out_date"));
	String condoroom_seq = StringUtils.trimToEmpty(request.getParameter("condoroom_seq"));
	String roomtype = StringUtils.trimToEmpty(request.getParameter("roomtype"));
	String room_num = StringUtils.trimToEmpty(request.getParameter("room_num"));
	String per_num = StringUtils.trimToEmpty(request.getParameter("per_num"));
	String reserve_name = StringUtils.trimToEmpty(request.getParameter("reserve_name"));
	String mobile = StringUtils.trimToEmpty(request.getParameter("mobile"));
	String reserve_memo = StringUtils.trimToEmpty(request.getParameter("reserve_memo"));
	
	CondoReserveDto cdDto = new CondoReserveDto();
	cdDto.setCondo_name(condo_name);
	cdDto.setCondo_seq(condo_seq);
	cdDto.setIn_date(in_date);
	cdDto.setOut_date(out_date);
	cdDto.setCondoroom_seq(NumberUtils.toInt(condoroom_seq));
	cdDto.setRoom_num(NumberUtils.toInt(room_num));
	cdDto.setRoomtype(roomtype);
	cdDto.setPer_num(NumberUtils.toInt(per_num));
	cdDto.setReserve_name(reserve_name);
	cdDto.setReserve_uid(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
	cdDto.setReserve_phone(mobile);
	cdDto.setReserve_memo(reserve_memo);
	
	CondoReserveDao cdDao = new CondoReserveDao();
	
	cdDao.setCondoReserve(cdDto);
%>

<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>콘도예약</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">콘도예약</td>
                                            </tr>
                                            <tr>
                                              <td><p>&nbsp;</p></td>
                                            </tr>
                                            <tr>
                                              <td align="center"><img src="../../images/condo/img_condo_finished.gif" width="640" height="106" border="0"></td>
                                            </tr>
                                            <tr>
                                              <td align="center"><table align="center" border="0" cellpadding="2" cellspacing="1" width="600" bgcolor="#D1D3D4">
                                                  <tr>
                                                    <td bgcolor="#AED247" colspan="2" width="594"></td>
                                                  </tr>
                                                  <tr>
                                                    <td bgcolor="#F1F1F1" height="30" align="right" style="padding-right:10px;" class=mem_subject width="122">콘도명</td>
                                                    <td bgcolor="white" style="padding-left:10px;" width="451"><span class=normal_b><%=condo_name%></span></td>
                                                  </tr>
                                                  <tr>
                                                    <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="30">이용일자</td>
                                                    <td bgcolor="white" style="padding-left:10px;"> <%=in_date%> ~ <%=out_date%></td>
                                                  </tr>
                                                  <tr>
                                                    <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="30">객실선택</td>
                                                    <td bgcolor="white" style="padding-left:10px;" class=red_ss><%=roomtype%></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="30" align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">객실수</td>
                                                    <td height="25" bgcolor="white" style="padding-left:10px;"><%=room_num%>실</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="30" align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">이용인원</td>
                                                    <td height="25" bgcolor="white" style="padding-left:10px;"><%=per_num%>인</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="30" align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">예약자이름</td>
                                                    <td height="25" bgcolor="white" style="padding-left:10px;"><%=reserve_name%></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="30" align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;">핸드폰</td>
                                                    <td height="25" bgcolor="white" style="padding-left:10px;"><%=mobile%></td>
                                                  </tr>
                                                  <!--tr>
                                                    <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="30">이용요금</td>
                                                    <td bgcolor="white" style="padding-left:10px;" class="red">150,000원</td>
                                                  </tr>-->
                                                  <tr>
                                                    <td align="right" bgcolor="#F1F1F1" class="mem_subject" style="padding-right:10px;" height="30">요청사항</td>
                                                    <td bgcolor="white" style="padding-left:10px;"><%=StringUtils.replace(reserve_memo,"\n","<br/>")%></td>
                                                  </tr>
                                                  <tr>
                                                    <td bgcolor="#AED247" colspan="2" width="594"></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                            <tr>
                                              <td align="center" height="115">&nbsp;</td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>