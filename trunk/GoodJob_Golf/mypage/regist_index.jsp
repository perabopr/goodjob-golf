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

var startDt = '<%=startDt%>';
var endDt = '<%=endDt%>';
var init = true;
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
	
	if(!init){
		$("#startDt").val("");
		$("#endDt").val("");
	}
	else{
		init = false;
	}
}

$(function() {
	$( "#startDt" ).datepicker({dateFormat:'yy-mm-dd'});
	$( "#endDt" ).datepicker({dateFormat:'yy-mm-dd'});
	
	$("#istartDt").click(
		function(){
			$( "#startDt" ).datepicker("show");
		}
	);
	$("#iendDt").click(
		function(){
			$( "#endDt" ).datepicker("show");
		}
	);
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

function card_order(process_status , menu , reserve_seq , good_price , good_name){

	<%
		if(!("gundallove@gmail.com".equals(mem_id) || "killkoo@naver.com".equals(mem_id))){
	%>
	alert("카드 결제는 준비 중 입니다.");
	return;
	<%
		}
	%>

	if(good_price == '' || good_price == '0'){
		alert("결제 금액이 없습니다.");
		return;
	}
	var frm = document.order_frm;
	
	$("#good_name").val(good_name);
	$('#good_price').val(good_price);
	$('#menu').val(menu);
	$('#reserve_seq').val(reserve_seq);
	$('#process_status').val(process_status);
	
	var win_pop = window.open("","order_pop","width=650,height=700,scrollbars=no");
	frm.target =  "order_pop"; 
	frm.action = "chk_plugin.jsp";
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
                                                                              <td style="cursor:hand" width="176"><a href="/mypage/regist_index.jsp?tab=1"><%if("1".equals(tab)){ %><img src="/images/mypage/btn_tab_on_01.gif" boarder="0"><%}else{ %><img src="/images/mypage/btn_tab_off_01.gif" boarder="0"><%}%></a></td>
                                                                              <td style="cursor:hand" width="176"><a href="/mypage/regist_index.jsp?tab=2"><%if("2".equals(tab)){ %><img src="/images/mypage/btn_tab_on_02.gif" boarder="0"><%}else{ %><img src="/images/mypage/btn_tab_off_02.gif" boarder="0"><%}%></a></td>
                                                                              <td style="cursor:hand" width="176"><a href="/mypage/regist_index.jsp?tab=3"><%if("3".equals(tab)){ %><img src="/images/mypage/btn_tab_on_03.gif" boarder="0"><%}else{ %><img src="/images/mypage/btn_tab_off_03.gif" boarder="0"><%}%></a></td>
                                                                              <td style="cursor:hand" width="176"><a href="/mypage/regist_index.jsp?tab=4"><%if("4".equals(tab)){ %><img src="/images/mypage/btn_tab_on_04.gif" boarder="0"><%}else{ %><img src="/images/mypage/btn_tab_off_04.gif" boarder="0"><%}%></a></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                                            </tr>
                                                                          </table></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="20"></td>
                                                                      </tr>
                                                        <form name="order_frm" method="post">
														<input type="hidden" id="good_name" name="good_name" value=""/>
														<input type="hidden" id="good_price" name="good_price" value=""/>
														<input type="hidden" id="menu" name="menu" value=""/>
														<input type="hidden" id="reserve_seq" name="reserve_seq" value=""/>
														<input type="hidden" id="process_status" name="process_status" value=""/>
														</form>
														<form name="frm" method="post">
														<input type="hidden" id="tab" name="tab" value="<%=tab%>"/>
                                                                      <tr>
                                                                        <td bgcolor="white" align="center">
                                                                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                              <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                  <tr>
                                                                                    <td width="669" align="center"><img align="absmiddle" src="/images/mypage/img_search_title_s.gif" width="50" height="19" border="0">
                                                                                    <a href="#"><img align="absmiddle" id="istartDt" src="/images/common/btn_calendar_left.gif" width="22" height="21"></a>&nbsp;
                                                                                    <input type="text" class="input_01" size="13" id="startDt" name="startDt" value="<%=startDt%>" readonly/>
                                                                                    &nbsp;&nbsp;~&nbsp;&nbsp;
                                                                                    <a href="#"><img align="absmiddle" id="iendDt" src="/images/common/btn_calendar_right.gif" width="22" height="21"></a>&nbsp;
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
                                                                <%if("1".equals(tab)){%>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                      <tr>
                                                                        <td bgcolor="white" align="center">
                                                                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                              <td><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
                                                                                  <tr>
                                                                                    <td bgcolor="#F1F1F1" align="center" height="25" class=m_title_b width="66">예약신청일</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="90">부킹날짜/시간</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="203">골프장명</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="60">코스</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="55">상품권</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="70">금액</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="50">인원/팀</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="55">예약구분</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="55">처리상태</td>
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
                                                                                    <td height="35" bgcolor="white" align="center" class=m_title><%=golfDto.getReserve_day()%></td>
                                                                                    <td bgcolor="white" align="center" class=m_title><%=Utils.dateFormat(golfDto.getBooking_day(),".")%> <%=booking_time%></td>
                                                                                    <td bgcolor="white" class=m_title_blue style="padding-left:7px;padding-right:7px;"><%=golfDto.getGolflink_name()%></td>
                                                                                    <td bgcolor="white" align="center" class=m_title><%=(StringUtils.defaultIfEmpty(golfDto.getGolflink_course(),"없음"))%></td>
                                                                                    <td bgcolor="white" align="center" class=m_title_blue><%=Utils.numberFormat(golfDto.getCoupon_price())%>원</td>
                                                                                    <td bgcolor="white" align="center" class=m_title_red><%=Utils.numberFormat(golfDto.getProduct_price())%>원<br>
                                                                                    <%if("0".equals(golfDto.getProcess_status())){%>
																					<a href="javascript:card_order('1','<%=golfDto.getMenu_seq()%>','<%=golfDto.getReserve_seq()%>','<%=golfDto.getProduct_price()%>','<%=golfDto.getGolflink_name()%>');"><img align="absmiddle" src="/images/mypage/btn_pay.gif" width="56" height="16" border="0"></a>
																					<%}%>
																					</td>
                                                                                    <td bgcolor="white" align="center" class=m_title><%=golfDto.getPer_num()%>명/1팀</td>
                                                                                    <td bgcolor="white" align="center">
                                                                                   <%=(golfDto.getMenu_seq()==1?"<span class=m_title_pink>실시간</span>":"<span class=m_title_green>사전신청</span>")%></td>
                                                                                  <td bgcolor="white" align="center">
                                                                           			<%
                                                                           			if("0".equals(golfDto.getProcess_status()))
                                                                           					out.println("<span class=m_title_b>예약대기</span>");
                                                                           			else if("1".equals(golfDto.getProcess_status()))
                                                                           				out.println("<span class=m_title_blue>예약완료</span>");
                                                                           			else if("2".equals(golfDto.getProcess_status()))
                                                                           				out.println("<span class=m_title_red>취소불가</span>");
                                                                           			else if("3".equals(golfDto.getProcess_status()))
                                                                           				out.println("<span class=m_title_red>예약취소</span>");
                                                                           			%></td>
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
                                                                  <%}else if("2".equals(tab)){%>
                                                                    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
														                <tr>
														                    <td width="100" bgcolor="#F1F1F1" align="center" height="25" class=m_title_b>예약신청일</td>
														                    <td width="269" bgcolor="#F1F1F1" align="center" class=m_title_b>패키지명</td>
														                    <td width="75" bgcolor="#F1F1F1" align="center" class=m_title_b>투어예정일</td>
														                    <td width="75" bgcolor="#F1F1F1" align="center" class=m_title_b>예약금</td>
														                    <td width="75" bgcolor="#F1F1F1" align="center" class=m_title_b>잔액금 </td>
														                    <td width="55" bgcolor="#F1F1F1" align="center" class=m_title_b>인원/팀</td>
														                    <td width="55" bgcolor="#F1F1F1" align="center" class=m_title_b>처리상태 </td>
														                </tr>
																	<%
																		PackageReserveDto pkDto;
																		if(packageList != null && !packageList.isEmpty()){
																			
																			int size = packageList.size();
																			
																			for(int i = 0 ; i < size ; i++){
																				
																				pkDto = packageList.get(i);
																	%>
														                <tr>
                                                                           <td height="35" bgcolor="white" align="center" class=m_title><%=pkDto.getReserve_day()%></td>
                                                                           <td bgcolor="white" align="center" class=m_title_blue><%=pkDto.getPackage_name1() + (StringUtils.trimToEmpty(pkDto.getPackage_name2()).length()>0?"<br/>+&nbsp;"+pkDto.getPackage_name2():"")%></td>
                                                                           <td bgcolor="white" align="center" class=m_title><%=pkDto.getTour_date().replaceAll("-",".")%></td>
                                                                           <td bgcolor="white" align="center" class=m_title_red><%=(pkDto.getPackage_price()==0?"":Utils.numberFormat(pkDto.getPackage_price())+"원")%><br>
                                                                            <%if("0".equals(pkDto.getProcess_status())){%>
																			<a href="javascript:card_order('0','<%=pkDto.getMenu_seq()%>','<%=pkDto.getReserve_seq()%>','<%=pkDto.getBalance_price()%>','<%=pkDto.getPackage_name1()%>');"><img align="absmiddle" src="/images/mypage/btn_pay.gif" width="56" height="16" border="0"></a>
																			<%}%>
                                                                           </td>
                                                                           <td bgcolor="white" align="center" class=m_title_red><%=(pkDto.getBalance_price()==0?"":Utils.numberFormat(pkDto.getBalance_price())+"원")%><br>
                                                                           <%if("0".equals(pkDto.getProcess_status())){%>
																			<a href="javascript:card_order('1','<%=pkDto.getMenu_seq()%>','<%=pkDto.getReserve_seq()%>','<%=pkDto.getBalance_price()%>','<%=pkDto.getPackage_name1()%>');"><img align="absmiddle" src="/images/mypage/btn_pay.gif" width="56" height="16" border="0"></a>
																			<%}%>
																			</td>
                                                                           <td bgcolor="white" align="center" class=m_title><%=pkDto.getPer_num()%>명/1팀</td>
                                                                           <td bgcolor="white" align="center">
                                                                  			<%
                                                                  			if("0".equals(pkDto.getProcess_status()))
                                                                  					out.println("<span class=m_title_b>예약대기</span>");
                                                                  			else if("1".equals(pkDto.getProcess_status()))
                                                                  				out.println("<span class=m_title_blue>예약완료</span>");
                                                                  			else if("2".equals(pkDto.getProcess_status()))
                                                                  				out.println("<span class=m_title_red>취소불가</span>");
                                                                  			else if("3".equals(pkDto.getProcess_status()))
                                                                  				out.println("<span class=m_title_red>예약취소</span>");
                                                                  			%></td>
                                                                         </tr>
														            <%
																			}
																		}
																	%>
														            </table>
                                                                  <%}else if("3".equals(tab)){%>
                                                                    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
														                <tr>
														                    <td bgcolor="#F1F1F1" align="center" height="25" class=m_title_b width="67">예약신청일</td>
														                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="212">콘도명</td>
														                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="120">평형/타입</td>
														                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="50">숙박일</td>
														                    <td align="center" bgcolor="#F1F1F1" class=m_title_b width="65">입실일</td>
														                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="65">퇴실일</td>
														                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="70">결제금액</td>
														                    <td bgcolor="#F1F1F1" align="center" class=m_title_b width="55">진행여부</td>
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
														                    <td height="35" bgcolor="white" align="center" class=m_title><%=cdDto.getReserve_day()%></td>
														                    <td bgcolor="white" align="center" class=m_title_blue><%=cdDto.getCondo_name()%></td>
														                    <td bgcolor="white" align="center" class=m_title_green style="word-break:break-all;"><%=cdDto.getRoomtype()%></td>
														                    <td bgcolor="white" align="center" class=m_title_pink><%=night_day%></td>
														                    <td align="center" bgcolor="white" class=m_title><%=Utils.dateFormat(cdDto.getIn_date(),".")%></td>
														                    <td bgcolor="white" align="center" class=m_title><%=Utils.dateFormat(cdDto.getOut_date(),".")%></td>
														                    <td bgcolor="white" align="center" class=m_title_red><%=(cdDto.getCondo_price()==0?"":Utils.numberFormat(cdDto.getCondo_price())+"원")%><br>
														                    <%if("0".equals(cdDto.getProcess_status())){%>
																			<a href="javascript:card_order('1','<%=cdDto.getMenu_seq()%>','<%=cdDto.getReserve_seq()%>','<%=cdDto.getCondo_price()%>','<%=cdDto.getCondo_name()%>');"><img align="absmiddle" src="/images/mypage/btn_pay.gif" width="56" height="16" border="0"></a>
																			<%}%>
																			</td>
														                    <td bgcolor="white" align="center">
                                                                  			<%
                                                                  			if("0".equals(cdDto.getProcess_status()))
                                                                  					out.println("<span class=m_title_b>예약대기</span>");
                                                                  			else if("1".equals(cdDto.getProcess_status()))
                                                                  				out.println("<span class=m_title_blue>예약완료</span>");
                                                                  			else if("2".equals(cdDto.getProcess_status()))
                                                                  				out.println("<span class=m_title_red>취소불가</span>");
                                                                  			else if("3".equals(cdDto.getProcess_status()))
                                                                  				out.println("<span class=m_title_red>예약취소</span>");
                                                                  			%></td>
														                </tr>
														            <%
																			}
																		}
																	%>
														            </table>
                                                                  <%}else if("4".equals(tab)){%>
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
                                                                  <%}%>
                                                                  </td>
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
