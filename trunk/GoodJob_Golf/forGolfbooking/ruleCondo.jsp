<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.CondoReserveDao"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.dto.CondoPromiseDto"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
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

	CondoReserveDao reserveDao = new CondoReserveDao();
	
	List<CondoPromiseDto> listPromise = reserveDao.getCondoPromise(NumberUtils.toInt(condo_seq));
	if(listPromise.size() != 1){
		out.println("<script>alert('취소 규정이 없습니다.');location.href='reserve.jsp?menu=5'</script>");
		return;
	}
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
                                              <td valign="top" align="center">
                                              
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD>
<P><IMG border=0 src="../../images/booking/img_rule_title.gif" width=192 height=30></P></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=630 bgColor=#d1d3d4>
<TBODY>
<TR>
<TD class=normal_b bgColor=#f1f1f1 height=25 width="50%" align=center>구분</TD>
<TD class=normal_b bgColor=#f1f1f1 width="50%" align=center>위약처리규정</TD>
</TR>
<%
	if(listPromise != null && listPromise.size() == 1){
		if(listPromise.get(0).getPromise1_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise1_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise1() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise2_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise2_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise2() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise3_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise3_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise3() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise4_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise4_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise4() %></TD>
</TR>
<%
		}
		if(listPromise.get(0).getPromise5_type().length() > 0){
%>
<TR>
<TD style="PADDING-LEFT: 20px" class=normal_b bgColor=white height=25 width="50%"><%=listPromise.get(0).getPromise5_type() %></TD>
<TD style="PADDING-LEFT: 20px" class=orange bgColor=white width="50%"><%=listPromise.get(0).getPromise5() %></TD>
</TR>
<%
		}
	}
%>
</TBODY></TABLE></TD>
<TR><TD>&nbsp;</TD></TR>	
<TR>
<TD style="PADDING-LEFT: 40px; PADDING-RIGHT: 40px">
<%
	if(listPromise != null && listPromise.size() == 1){	
 		out.print(listPromise.get(0).getCancelrule());
	}
%>
</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 40px" align=right><INPUT id="chkAgree1" value="" type=checkbox> 위약처리규정에 동의합니다 </TD>
</TR>
<TR>
<TD><IMG border=0 src="../../images/booking/img_agree_title.gif" width=192 height=30></TD>
</TR>
<TR height="130px" valign="top">
<TD align=center>
<div style="overflow-x:hidden; overflow-y:auto; height:130px; width:630px;text-align:left;border: 1px solid; border-color:#D1D3D4">
<%
	if(listPromise != null && listPromise.size() == 1){	
		out.print(listPromise.get(0).getUse_rule());
	}
%>
</div>
</TD>
</TR>
<TR>
<TD>&nbsp;</TD>
</TR>
<TR>
<TD style="PADDING-RIGHT: 40px" align=right><INPUT id="chkAgree2" value="" type=checkbox> 이용약관에 동의합니다 </TD>
</TR>
<TR>
<TD style="PADDING-BOTTOM: 30px; PADDING-TOP: 30px" align=center><A href="javascript:;" onclick="reserveAgree();"><IMG border=0 src="../../images/common/btn_regist_booking2.gif"></A></TD>
</TR>
</TBODY>
</TABLE>
                                              </td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>