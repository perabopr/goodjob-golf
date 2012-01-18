<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.mypage.*"%>
<%@page import="com.goodjob.reserve.dto.*"%>
<%@ page import="com.goodjob.util.Utils" %>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@include file="/include/loginCheck.jsp" %>
<%
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	String type = StringUtils.defaultIfEmpty(request.getParameter("type"),"now");
	
	String mem_id = StringUtils.defaultString((String)session.getAttribute("mem_id"),"");
	
	String startDt = StringUtils.trimToEmpty(request.getParameter("startDt"));
	String endDt = StringUtils.trimToEmpty(request.getParameter("endDt"));
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , 20);
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("startDt",startDt);
	params.put("endDt",endDt);
	params.put("mem_id",mem_id);
	params.put("type",type);
	params.put("per_page","20");
	
	MyPageDao myDao = new MyPageDao();
	
	//골프장
	List<CouponDto> couponList = myDao.getMyCouponList(params);
	
	int totalCount = myDao.getMyCouponTotal(params);
	
	String strPage = paging.getPaging(totalCount, false);
	
	//params.put("type","E");
	//List<CouponDto> endList = myDao.getMyCouponList(params);
%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->

<script language="javascript">

var startDt = '<%=startDt%>';
var endDt = '<%=endDt%>';
var init = true;
function DisplayMenu(index) {

	//$('#tab').val(index);
	for (i=1; i<=4; i++){
		if (index == i) {
			thisMenu = eval("menu" + index + ".style");
			thisMenu.display = "";
			//document.getElementById("tab0"+i).src="/images/mypage/btn_tab_on_0"+i+".gif";
		} 
		else {
			otherMenu = eval("menu" + i + ".style"); 
			otherMenu.display = "none"; 
			//document.getElementById("tab0"+i).src="/images/mypage/btn_tab_off_0"+i+".gif";
		}
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
	frm.action="coupon_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="coupon_list.jsp"
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
                                              <td align="right" class="location" height="30" width="95%"><a href="/main.jsp">HOME</a> &gt; 상품권관리</td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">상품권관리</td>
                                            </tr>
                                            <tr>
                                              <td valign="top" style="padding-top:10px;padding-bottom:10px;" align="center"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                  <tr>
                                                    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                          <td align="center">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center">
                                                          
                                                  			<table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <tr>
                                                                <td width="426"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                                    <tr>
                                                                      <td style="cursor:hand" width="176"><a href="/mypage/coupon_list.jsp?type=now"><%if("now".equals(type)){ %><img src="/images/mypage/btn_tab_on_coupon_01.gif" width="173" height="25" alt="사용가능한 상품권"><%}else{ %><img src="/images/mypage/btn_tab_off_coupon_01.gif" width="173" height="25" alt="사용가능한 상품권"><%}%></a></td>
                                                                      <td style="cursor:hand" width="176"><a href="/mypage/coupon_list.jsp?type=past"><%if("past".equals(type)){ %><img src="/images/mypage/btn_tab_on_coupon_02.gif" width="173" height="25" alt="과거 상품권 내역"><%}else{ %><img src="/images/mypage/btn_tab_off_coupon_02.gif" width="173" height="25" alt="과거 상품권 내역"><%}%></a></td>
                                                                      <td style="cursor:hand" width="176">&nbsp;</td>
                                                                      <td style="cursor:hand" width="176">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                                    </tr>
                                                                  </table></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="20"></td>
                                                              </tr>
															<%if("past".equals(type)){ %>
															  <form name="frm" method="post">
															  <input type="hidden" name="type" value="<%=type%>"/>
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
                                                              <%}else{ %>
                                                              <tr>
                                                                <td height="20"><b>최근에 회원님이 등록하신 상품권 내역입니다.</b></td>
                                                              </tr>
                                                              <%} %>
                                                            </table>
                                                                    
                                                          <table border="0" width="704" cellpadding="0" cellspacing="0">
                                                              <tr>
                                                                <td valign="top" align="center">
                                                                
                                                                
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                      <tr>
                                                                        <td bgcolor="white" align="center"><table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                              <td height="30">&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
                                                                                  <tr>
                                                                                    <td bgcolor="#F1F1F1" align="center" height="25" class=normal_b width="104">상품권번호</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="92">쿠폰명</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="70">상품권금액</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="90">적용 골프장</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="167">제한사항</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="101">유효기간</td>
                                                                                    <td bgcolor="#F1F1F1" align="center" class=normal_b width="59">사용유무</td>
                                                                                  </tr>
				<%
						if(couponList != null && !couponList.isEmpty()){
							
							int size = couponList.size();
							CouponDto cpDto = null;
							for(int i = 0 ; i < size ; i++){
								
								cpDto = couponList.get(i);
				%>
                                                                                  <tr>
                                                                                    <td bgcolor="white" align="center" class=normal height="30"><p><%=cpDto.getCoupon_code()%></p></td>
                                                                                    <td bgcolor="white" align="center" class=normal>프리미엄 쿠폰</td>
                                                                                    <td bgcolor="white" align="center" class=orange><%=Utils.numberFormat(cpDto.getSale_price())%>원</td>
                                                                                    <td bgcolor="white" align="center" class=normal><%=myDao.getGolflinkName(cpDto.getMenu_seq(),cpDto.getReserve_seq())%></td>
                                                                                    <td bgcolor="white" align="center" class=normal>실시간/사전신청 예약시 적용</td>
                                                                                    <td bgcolor="white" align="center" class=normal><%=cpDto.getExpiredate_end().replaceAll("-",".")%> 까지</td>
                                                                                    <td bgcolor="white" align="center">
                                                                                    <%
                                                                                    if(cpDto.getReserve_seq()==0 && "now".equals(type))
                                                                                    	out.println("<span class=blue>가능</span>");
                                                                                    else
                                                                                    	out.println("<span class=red>불가능</span>");
                                                                                    %>
                                                                                    </td>
                                                                                  </tr>
				<%
							}
						}
				%>                                                                                  
                                                                                </table></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="60" align="center"><%=strPage%></td>
                                                                            </tr>
                                                                            <%if("now".equals(type)){ %>
                                                                            <tr>
                                                                              <td>※ 상품권은 중복하여 사용 불가합니다. 상품권금액에 따라 1개의 상품<span class=red_n>(실시간예약, 사전신청예약)</span>만 적용 가능합니다.<br>
                                                                                ※ 상품권은 적용가능 상품이 변경될 수 있습니다. <br>
                                                                                ※ <span class=red_n>일부 이벤트 적용 상품 및 특가 상품 등은 상품권 할인 적용대상에서 제외될 수 있습니다.</span><br>
                                                                                ※ 예약취소 시 사용한 상품권은 유효기간이 남아 있을 경우에만 재사용 가능합니다. &nbsp;&nbsp;&nbsp;<br>
                                                                                ※ 예약대기상태(미 입금), 입금완료 후 예약취소/변경 시 사용한 <span class=red_n>상품권 유효기간이 지났을 경우 재발급 되지 않습니다.</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td width="0" height="150">&nbsp;</td>
                                                                            </tr>
                                                                            <%} %>
                                                                          </table></td>
                                                                      </tr>
                                                                    </table>
                                                                  
                                                                  
                                                                  <!--
                                                                  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td height="30" align="center" span class=normal_b>최근 회원님이 사용하셨거나 상품권 사용 기간이 종료되어 더 이상 사용할 수 없는 상품권 내역입니다.</td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td bgcolor="white" align="center"><table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                                          <tr>
                                                                            <td><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
                                                                                <tr>
                                                                                  <td bgcolor="#F1F1F1" align="center" height="25" class=normal_b width="104">상품권번호</td>
                                                                                  <td bgcolor="#F1F1F1" align="center" class=normal_b width="92">쿠폰명</td>
                                                                                  <td bgcolor="#F1F1F1" align="center" class=normal_b width="80">상품권금액</td>
                                                                                  <td bgcolor="#F1F1F1" align="center" class=normal_b width="207">제한사항</td>
                                                                                  <td bgcolor="#F1F1F1" align="center" class=normal_b width="131">유효기간</td>
                                                                                  <td bgcolor="#F1F1F1" align="center" class=normal_b width="59">사용유무</td>
                                                                                </tr>
                                                                                <tr>
                                                                                  <td bgcolor="white" align="center" class=normal height="30">ABC123456789</td>
                                                                                  <td bgcolor="white" align="center" class=normal>프리미엄 쿠폰</td>
                                                                                  <td bgcolor="white" align="center" class=orange>100,000원</td>
                                                                                  <td bgcolor="white" align="center" class=normal>실시간/사전신청 예약시 적용</td>
                                                                                  <td bgcolor="white" align="center" class=normal>2012년 12월 31일까지</td>
                                                                                  <td bgcolor="white" align="center" class=blue>가능</td>
                                                                                </tr>
                                                                                <tr>
                                                                                  <td align="center" bgcolor="white" class="normal" height="30">ABC123456789</td>
                                                                                  <td align="center" bgcolor="white" class="normal">프리미엄 쿠폰</td>
                                                                                  <td align="center" bgcolor="white" class="orange">100,000원</td>
                                                                                  <td align="center" bgcolor="white" class="normal">실시간/사전신청 예약시 적용</td>
                                                                                  <td align="center" bgcolor="white" class="normal">2012년 12월 31일까지</td>
                                                                                  <td align="center" bgcolor="white" class="red">불가</td>
                                                                                </tr>
                                                                              </table></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td height="60" align="center"><p><img align="absmiddle" src="/images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="/images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I
                                                                                &nbsp;10 <img align="absmiddle"
src="/images/board/btn_next.gif" width="16" height="15" border="0"> <img align="absmiddle" src="/images/board/btn_next_dual.gif" width="16" height="15" border="0"></p></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td height="230">&nbsp;</td>
                                                                          </tr>
                                                                        </table></td>
                                                                    </tr>
                                                                  </table>
                                                                  -->
                                                                  
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
                        </table>
					
					<!-- 하단  회사 소개 부분  -->
                    <%@ include file="/include/copyright.jsp" %>
                    <!-- 하단  회사 소개 부분  -->
					<!--############### 중앙 컨텐츠 영역 #################-->
					
<!-- 하단 footer  -->
<%@ include file="/include/footer.jsp" %>
<!-- 하단 footer  -->
