<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%

	String menu = StringUtils.trimToEmpty(request.getParameter("menu"));
	String condo_seq = StringUtils.trimToEmpty(request.getParameter("condo_seq"));
	String condo_name = StringUtils.trimToEmpty(request.getParameter("condo_name"));
	
	String in_date = StringUtils.trimToEmpty(request.getParameter("in_date"));
	String out_date = StringUtils.trimToEmpty(request.getParameter("out_date"));
	String condoroom_seq = StringUtils.trimToEmpty(request.getParameter("condoroom_seq"));
	String roomtype = StringUtils.trimToEmpty(request.getParameter("roomtype"));
	String room_num = StringUtils.trimToEmpty(request.getParameter("room_num"));
	String per_num = StringUtils.trimToEmpty(request.getParameter("per_num"));
	String reserve_name = StringUtils.trimToEmpty(request.getParameter("reserve_name"));
	String mobile = StringUtils.trimToEmpty(request.getParameter("mobile1"))+"-"+StringUtils.trimToEmpty(request.getParameter("mobile2"))+"-"+StringUtils.trimToEmpty(request.getParameter("mobile3"));
	String reserve_memo = StringUtils.trimToEmpty(request.getParameter("reserve_memo"));

%>
<script type="text/javascript">
function reserveAgree(){
	if(!$("#chkAgree1").attr("checked")){
		alert("위약처리규정에 동의하세요.");
		$("#chkAgree1").select();
		return;
	}
	if(!$("#chkAgree2").attr("checked")){
		alert("이용약관에 동의하세요.");
		$("#chkAgree2").select();
		return;		
	}

	frm.submit();
}
</script>
<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; 골프장부킹 &gt; <span class=location_b>실시간예약</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">콘도예약</td>
                                            </tr>
                                            <tr>
                                              <td valign="top"><p>&nbsp;</p></td>
                                            </tr>
<form name="frm" method="post" action="result.jsp">
<input type="hidden" name="menu" value="<%=menu%>"/>
<input type="hidden" name="condo_seq" value="<%=condo_seq%>"/>
<input type="hidden" name="condo_name" value="<%=condo_name%>"/>
<input type="hidden" name="in_date" value="<%=in_date%>"/>
<input type="hidden" name="out_date" value="<%=out_date%>"/>
<input type="hidden" name="condoroom_seq" value="<%=condoroom_seq%>"/>
<input type="hidden" name="roomtype" value="<%=roomtype%>"/>
<input type="hidden" name="room_num" value="<%=room_num%>"/>
<input type="hidden" name="per_num" value="<%=per_num%>"/>
<input type="hidden" name="reserve_name" value="<%=reserve_name%>"/>
<input type="hidden" name="mobile" value="<%=mobile%>"/>
<input type="hidden" name="reserve_memo" value="<%=reserve_memo%>"/>
                                            <tr>
                                              <td valign="top" align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td><p><img src="/images/booking/img_rule_title.gif" width="192" height="30" border="0"></p></td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center"><table border="0" cellpadding="2" cellspacing="1" width="630" bgcolor="#D1D3D4">
                                                        <tr>
                                                          <td width="50%" bgcolor="#F1F1F1" align="center" height="25" class=normal_b>구분</td>
                                                          <td width="50%" bgcolor="#F1F1F1" align="center" class=normal_b>위약처리규정</td>
                                                        </tr>
                                                        <tr>
                                                          <td width="50%" bgcolor="white" class=normal_b height="25" style="padding-left:20px;">7일전 취소</td>
                                                          <td width="50%" bgcolor="white" class=orange  style="padding-left:20px;">입금액 전액 환불</td>
                                                        </tr>
                                                        <tr>
                                                          <td width="50%" bgcolor="white" class=normal_b height="25"  style="padding-left:20px;">6일 ~ 1일전 취소</td>
                                                          <td width="50%" bgcolor="white" class=orange  style="padding-left:20px;">전액 환불불가</td>
                                                        </tr>
                                                        <tr>
                                                          <td width="50%" bgcolor="white" class=normal_b height="25"  style="padding-left:20px;">당일취소 및 No Show</td>
                                                          <td width="50%" bgcolor="white" class=orange  style="padding-left:20px;">전액 환불 불가 및 영구예약정지</td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                  <tr>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                    <td style="padding-left:40px;padding-right:40px;"> ※ 본 위약처리 규정은 예약취소 시 회원권의 이용제한이 발생하여, 다른 회원에게도 피해가 전가됩니다.<br>
                                                      이러한 피해를 막기 위하여 부득이 위와 같이 위약처리규정을 정하였으니, 반드시 준수하여 주시기 바랍니다. <br>
                                                      - 단, 예약 당일 천재지변(우천 및 폭설 등)으로 인한 예약 취소인 경우 위약처리 되지 않으며, 반드시 취소 가능 여부를 전화 (031-772-3000)로 확인 후 취소가 가능합니다.<br>
                                                      - Tee Off 40분 전까지 클럽에 도착하시지 않은 경우에도 위약 처리 되오니 이용에 착오 없으시기 바랍니다. <br>
                                                      - 기타 골프장 이용관련 약관은 양평TPC 골프클럽의 이용약관을 준합니다<br>
                                                      단, 예약 및 위약처리규정은 예약처 ㈜세이브코리아의 규정을 적용합니다 </td>
                                                  </tr>
                                                  <tr>
                                                    <td align="right" style="padding-right:40px;"><INPUT id="chkAgree1" value="" type=checkbox>
                                                      위약처리규정에 동의합니다 </td>
                                                  </tr>
                                                  <tr>
                                                    <td><img src="/images/booking/img_agree_title.gif" width="192" height="30" border="0"></td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center"><iframe src="agreement.html" style="border-right: dotted #6D6E71 1px;border-left: dotted #6D6E71 1px;border-top: dotted #6D6E71 1px;
						border-bottom: dotted #6D6E71 1px;" width="630" height="130" frameborder="0" vspace="0" hspace="0" marginwidth="0" marginheight="0"></iframe></td>
                                                  </tr>
                                                  <tr>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                    <td align="right" style="padding-right:40px;"><INPUT id="chkAgree2" value="" type=checkbox>
                                                      이용약관에 동의합니다 </td>
                                                  </tr>
</form>
                                                  <tr>
                                                    <td align="center" style="padding-top:30px;padding-bottom:30px;"><a href="javascript:reserveAgree();"><img src="/images/common/btn_regist_booking2.gif" border="0"></a></td>
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