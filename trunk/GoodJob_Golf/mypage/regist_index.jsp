<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.mypage.*"%>
<%@page import="com.goodjob.reserve.dto.*"%>
<%@ page import="com.goodjob.util.Utils" %>
<%@include file="/include/loginCheck.jsp" %>
<%
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	String mem_id = StringUtils.defaultString((String)session.getAttribute("mem_id"),"");
	String tab = StringUtils.defaultString(request.getParameter("tab"),"1");
	
	String startDt = StringUtils.trimToEmpty(request.getParameter("startDt"));
	String endDt = StringUtils.trimToEmpty(request.getParameter("endDt"));
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , 20);
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("startDt",startDt);
	params.put("endDt",endDt);
	params.put("mem_id",mem_id);
	
	MyPageDao myDao = new MyPageDao();
	
	//골프장
	List<GolfLinkReserveDto> golfList = myDao.getGolfReserveList(params);
	
	//패키지
	List<PackageReserveDto> packageList = myDao.getPackageReserveList(params);
	
	//콘도
	List<CondoReserveDto> condoList = myDao.getCondoReserveList(params);
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<script language="javascript">

function DisplayMenu(index) {

	$('#tab').val(index);
	for (i=1; i<=4; i++){
		if (index == i) {
			thisMenu = eval("menu" + index + ".style");
			thisMenu.display = "";
			document.getElementById("tab0"+i).src="/images/mypage/btn_tab_on_0"+i+".gif";
		} 
		else {
			otherMenu = eval("menu" + i + ".style"); 
			otherMenu.display = "none"; 
			document.getElementById("tab0"+i).src="/images/mypage/btn_tab_off_0"+i+".gif";
		}
	}
}

$(function() {
	$( "#startDt" ).datepicker({dateFormat:'yy-mm-dd'});
	$( "#endDt" ).datepicker({dateFormat:'yy-mm-dd'});
	DisplayMenu(<%=tab%>);
});

function mypage_search() {

	if(!$('#startDt').val()) {
		alert('검색 시작일을 입력해주세요!');
		$('#startDt').focus();
		return;
	}

	if(!$('#endDt').val()) {
		alert('검색 종료일을 입력해주세요!');
		$('#endDt').focus();
		return;
	}

	var frm = document.frm;
	frm.action="regist_index.jsp"
	frm.submit();
}

</script>

					<!--############### 중앙 컨텐츠 영역 #################-->
					<table border="0" cellpadding="0" cellspacing="0" width="751">
                          <tr>
                            <td><table border="0" cellpadding="0" cellspacing="0" width="751">
                                <tr>
                                  <td width="751"><table border="0" cellpadding="2" cellspacing="1" width="751" bgcolor="#D2D2D2">
                                      <tr>
                                        <td align="center" bgcolor="white" width="745" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.jsp">HOME</a> &gt; 예약관리</td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">예약관리</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-top:10px;padding-bottom:10px;" align="center"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                  <tr>
                                                    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                          <td align="center">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><table border="0" width="704" height="500" cellpadding="0" cellspacing="0">
                                                              <tr>
                                                                <td valign="top" align="center">
                                                                	<table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                      <tr>
                                                                        <td width="426"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                                            <tr>
                                                                              <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img id="tab01" src="/images/mypage/btn_tab_on_01.gif" width="173" height="25" alt="골프장부킹 예약관리"></td>
                                                                              <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img id="tab02" src="/images/mypage/btn_tab_off_02.gif" width="173" height="25" alt="골프패키지 예약관리"></td>
                                                                              <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img id="tab03" src="/images/mypage/btn_tab_off_03.gif" width="173" height="25" alt="콘도 예약관리"></td>
                                                                              <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><img id="tab04" src="/images/mypage/btn_tab_off_04.gif" width="173" height="25" alt="개인정보수정"></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                                            </tr>
                                                                          </table></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="20"></td>
                                                                      </tr>
														<form name="frm" method="post">
														<input type="hidden" id="tab" name="tab" value="<%=tab%>"/>
                                                                      <tr>
                                                                        <td bgcolor="white" align="center">
                                                                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                              <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                  <tr>
                                                                                    <td width="669" align="center"><img align="absmiddle" src="/images/mypage/img_search_title_s.gif" width="50" height="19" border="0">
                                                                                    <img align="absmiddle" src="/images/common/btn_calendar_left.gif" width="22" height="21">&nbsp;
                                                                                    <input type="text" class="input_01" size="13" id="startDt" name="startDt" value="<%=startDt%>" readonly/>
                                                                                    &nbsp;&nbsp;~&nbsp;&nbsp;
                                                                                    <img align="absmiddle" src="/images/common/btn_calendar_right.gif" width="22" height="21">&nbsp;
                                                                                    <input type="text" class="input_01" size="13" id="endDt" name="endDt" value="<%=endDt%>" readonly/>
                                                                                    <a href="javascript:mypage_search();"><img align="absmiddle" src="/images/mypage/btn_search.gif" width="38" height="19" border="0"></a></td>
                                                                                  </tr>
                                                                                </table></td>
                                                                            </tr>
                                                                          </table>
                                                                         </td>
                                                                      </tr>
														</form>
                                                                      <tr>
                                                                        <td height="20"></td>
                                                                      </tr>
                                                                    </table>
                                                                <div id="menu1" style="display:block;">
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                      <tr>
                                                                        <td bgcolor="white" align="center">
                                                                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                              <td><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
                                                                                  <tr>
                                                                                    <td bgcolor="#F1F1F1" align="center" height="25" class=normal_b width="74">신청일</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="90">부킹일</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="184">골프장명</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="64">코스</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="109">금액</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="57">인원/팀</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="90">처리상태</td>
                                                                                  </tr>
																		<%
																			
																			GolfLinkReserveDto golfDto;
																			if(golfList != null && !golfList.isEmpty()){
																				
																				int size = golfList.size();
																				String booking_time = "";
																				for(int i = 0 ; i < size ; i++){
																					
																					golfDto = golfList.get(i);
																					
																					booking_time = golfDto.getBooking_time_s().substring(0,2)+":"+golfDto.getBooking_time_s().substring(2,4);
																		%>
                                                                                  <tr>
                                                                                    <td height="25" bgcolor="white" align="center" class=normal><%=golfDto.getReserve_day()%></td>
                                                                                    <td height="22" bgcolor="white" align="center" class=normal><%=Utils.dateFormat(golfDto.getBooking_day(),".")%> <%=booking_time%></td>
                                                                                    <td height="22" bgcolor="white" align="center" class=blue><%=golfDto.getGolflink_name()%></td>
                                                                                    <td height="22" bgcolor="white" align="center" class=normal><%=(StringUtils.defaultIfEmpty(golfDto.getGolflink_course(),"없음"))%></td>
                                                                                    <td height="22" bgcolor="white" align="center" class=normal><%=Utils.numberFormat(golfDto.getProduct_price())%>원</td>
                                                                                    <td height="22" bgcolor="white" align="center" class=normal><%=golfDto.getPer_num()%>명/1팀</td>
                                                                                    <td height="22" bgcolor="white" align="center" class=orange>
                                                                                    <%=(golfDto.getMenu_seq()==1?"실시간예약":"사전예약")%></td>
                                                                                  </tr>
																		<%
																				}
																			}
																		%>
                                                                                </table></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td>&nbsp;</td>
                                                                            </tr>
                                                                          </table></td>
                                                                      </tr>
                                                                    </table>
                                                                  </div>
                                                                  <div id="menu2" style="display:none;">
                                                                    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
														                <tr>
														                    <td width="100" bgcolor="#F1F1F1" align="center" height="25" class=normal_b>예약신청일</td>
														                    <td width="150" bgcolor="#F1F1F1" align="center" class=normal_b>패키지명</td>
														                    <td width="100" bgcolor="#F1F1F1" align="center" class=normal_b>투어예정일</td>
														                    <td width="80" bgcolor="#F1F1F1" align="center" class=normal_b>예약금</td>
														                    <td width="80" bgcolor="#F1F1F1" align="center" class=normal_b>잔액금 </td>
														                    <td width="80" bgcolor="#F1F1F1" align="center" class=normal_b>인원</td>
														                    <td width="100" bgcolor="#F1F1F1" align="center" class=normal_b>처리상태 </td>
														                </tr>
																	<%
																		PackageReserveDto pkDto;
																		if(packageList != null && !packageList.isEmpty()){
																			
																			int size = packageList.size();
																			
																			for(int i = 0 ; i < size ; i++){
																				
																				pkDto = packageList.get(i);
																	%>
														                <tr>
                                                                           <td height="25" bgcolor="white" align="center" class=normal><%=pkDto.getReserve_day()%></td>
                                                                           <td height="22" bgcolor="white" align="center" class=blue><%=pkDto.getPackage_name1()%></td>
                                                                           <td height="22" bgcolor="white" align="center" class=normal><%=pkDto.getTour_date().replaceAll("-",".")%></td>
                                                                           <td height="22" bgcolor="white" align="center" class=blue><%=(pkDto.getPackage_price()==0?"":Utils.numberFormat(pkDto.getPackage_price())+"원")%></td>
                                                                           <td height="22" bgcolor="white" align="center" class=normal><%=(pkDto.getBalance_price()==0?"":Utils.numberFormat(pkDto.getBalance_price())+"원")%></td>
                                                                           <td height="22" bgcolor="white" align="center" class=normal><%=pkDto.getPer_num()%>명/1팀</td>
                                                                           <td height="22" bgcolor="white" align="center" class=orange>
                                                                           <%=("0".equals(pkDto.getProcess_status())?"예약대기":"예약완료")%></td>
                                                                         </tr>
														            <%
																			}
																		}
																	%>
														            </table>
                                                                  </div>
                                                                  <div id="menu3" style="display:none;">
                                                                    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
														                <tr>
														                    <td bgcolor="#F1F1F1" align="center" height="25" class=normal_b width="67">예약신청일</td>
														                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="142">콘도명</td>
														                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="63">평형/타입</td>
														                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="40">숙박일</td>
														                    <td align="center" bgcolor="#F1F1F1" class="normal_b" width="91">입실일</td>
														                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="85">퇴실일</td>
														                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="65">결제금액</td>
														                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="62">진행여부</td>
														                </tr>
																	<%
																	
																		CondoReserveDto cdDto;
																		if(condoList != null && !condoList.isEmpty()){
																			
																			int size = condoList.size();
																			String night_day = "";
																			int night = 0;
																			for(int i = 0 ; i < size ; i++){
																				
																				cdDto = condoList.get(i);
																				
																				night = cdDto.getRoom_num() - 1;
																				night_day = (night<=0?"":night+"박 ")+cdDto.getRoom_num()+"일";
																	%>
																		<tr>
														                    <td height="35" bgcolor="white" align="center" class=normal><%=cdDto.getReserve_day()%></td>
														                    <td height="22" bgcolor="white" align="center" class=normal><%=cdDto.getCondo_name()%></td>
														                    <td height="22" bgcolor="white" align="center" class=normal><%=cdDto.getRoomtype()%>평형<br>패밀리</td>
														                    <td height="22" bgcolor="white" align="center" class=normal><%=night_day%></td>
														                    <td height="22" align="center" bgcolor="white" class="normal"><%=Utils.dateFormat(cdDto.getIn_date(),".")%></td>
														                    <td height="22" bgcolor="white" align="center" class=normal><%=Utils.dateFormat(cdDto.getOut_date(),".")%></td>
														                    <td height="22" bgcolor="white" align="center" class=orange><%=(cdDto.getCondo_price()==0?"":Utils.numberFormat(cdDto.getCondo_price())+"원")%></td>
														                    <td height="22" bgcolor="white" align="center" class=blue>
														                    <%=("0".equals(cdDto.getProcess_status())?"예약대기":"예약완료")%></td>
														                </tr>
														            <%
																			}
																		}
																	%>
														            </table>
                                                                  </div>
                                                                  <div id="menu4" style="display:none;">
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                      <tr>
                                                                        <td width="426" background="/renewal/images/inc/img_board_bg.gif"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="10"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td bgcolor="white" align="center"><table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                              <td align="center">준비 중입니다....</td>
                                                                            </tr>
                                                                          </table></td>
                                                                      </tr>
                                                                    </table>
                                                                  </div></td>
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
                        </table>
					
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
