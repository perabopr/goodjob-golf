<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<!-- 상단 영역 -->
<%@ include file="/include/header.jsp" %>
<!-- 상단 영역 -->
<script language="javascript">
//<!--
function DisplayMenu(index) {
        for (i=1; i<=4; i++)
        if (index == i) {
        thisMenu = eval("menu" + index + ".style");
        thisMenu.display = "";
        } 
        else {
        otherMenu = eval("menu" + i + ".style"); 
        otherMenu.display = "none"; 
        }
        }
//-->
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
                                              <td align="right" class="location" height="30" width="95%"><a href="/index.html">HOME</a> &gt; <span class=location_b>골프장 이용방법</span></td>
                                            </tr>
                                            <tr>
                                              <td bgcolor="#D1D3D4" height="33" class="sub_title" style="padding-left:15px;padding-top:4px">골프장 이용방법</td>
                                            </tr>
                                            <tr>
                                              <td valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center"><table border="0" width="704" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                          <td width="426"></td>
                                                        </tr>
                                                        <tr>
                                                          <td valign="top" width="100%"><div id="menu1" style="display:block;">
                                                              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                  <td width="100%"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                                      <tr>
                                                                        <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_on_01.gif" width="173" height="25" alt="서비스 이용안내"></td>
                                                                        <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_02.gif" width="173" height="25" alt="예약 및 위약규정"></td>
                                                                        <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_03.gif" width="173" height="25" alt="골프장 취소시한 및 위약금 안내"></td>
                                                                        <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_04.gif" width="173" height="25" alt="콘도 이용안내"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                                <tr>
                                                                  <td height="10">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white" align="center"><table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                                      <tr>
                                                                        <td align="center"><p><img src="/images/common/img_process.gif" width="700" height="590" border="0"></p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td>&nbsp;</td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                              </table>
                                                            </div>
                                                            <div id="menu2" style="display:none;">
                                                              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                  <td width="426" background="/renewal/images/inc/img_board_bg.gif"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                                      <tr>
                                                                        <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_01.gif" width="173" height="25" alt="서비스 이용안내"></td>
                                                                        <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_on_02.gif" width="173" height="25" alt="예약 및 위약규정"></td>
                                                                        <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_03.gif" width="173" height="25" alt="골프장 취소시한 및 위약금 안내"></td>
                                                                        <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_04.gif" width="173" height="25" alt="콘도 이용안내"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                                <tr>
                                                                  <td height="10">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                                      <tr>
                                                                        <td><table border="0" cellpadding="2" cellspacing="1" width="704" bgcolor="#D1D3D4">
                                                                            <tr>
                                                                              <td width="147" bgcolor="#F1F1F1" align="center" height="25" class="blue">구분</td>
                                                                              <td width="261" bgcolor="#F1F1F1" align="center"  class="blue">가능시한</td>
                                                                              <td width="280" bgcolor="#F1F1F1" align="center"  class="blue">비고</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td bgcolor="white" align="center" height="25" class="blue">예약</td>
                                                                              <td bgcolor="white" align="center">각 골프장별 가능 시한까지</td>
                                                                              <td bgcolor="white" align="center">예약시 각 골프장별 예약규정 적용</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td bgcolor="white" align="center" height="25" class="blue">취소</td>
                                                                              <td bgcolor="white" align="center">각 골프장별 가능 시한까지</td>
                                                                              <td bgcolor="white" align="center">취소시 각 골프장별 예약규정 적용</td>
                                                                            </tr>
                                                                          </table></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td>&nbsp;</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td><table border="0" cellpadding="2" cellspacing="1" width="704" bgcolor="#D1D3D4">
                                                                            <tr>
                                                                              <td width="352" bgcolor="#F1F1F1" height="25" align="center" class="blue">취소시한</td>
                                                                              <td width="352" bgcolor="#F1F1F1" align="center" class=blue>패널티내용</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td bgcolor="white" align="center" height="25">각 골프장별 가능시한 전</td>
                                                                              <td bgcolor="white" align="center">패널티 없음</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td bgcolor="white" align="center" height="25">부킹당일 제외 5일전 ~ 3일전 취소</td>
                                                                              <td bgcolor="white" align="center">1개월 예약정지(결제금액 1/2 환불 불가)</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="25" bgcolor="white" align="center">부킹당일 제외 2일전 취소</td>
                                                                              <td height="22" bgcolor="white" align="center">1개월 예약정지(결제금액 1/2 환불 불가)</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="25" bgcolor="white" align="center">부킹당일 제외 1일전 취소</td>
                                                                              <td height="22" bgcolor="white" align="center">1개월 예약정지(결제금액 1/2 환불 불가)</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="25" bgcolor="white" align="center">당일 취소 및 미내장</td>
                                                                              <td height="22" bgcolor="white" align="center">영구예약정지(결제금액 전액&nbsp;환불 불가)</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="25" bgcolor="white" align="center">임박취소 2회 시</td>
                                                                              <td height="22" bgcolor="white" align="center">모든 골프장 6개월 예약정지(결제금 1/2 환불 불가)</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="25" bgcolor="#F1F1F1" colspan="2" align="center" class="blue">그 외 패널티</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="25" bgcolor="white" align="center">예약자 미내장</td>
                                                                              <td height="22" bgcolor="white" align="center">3개월 예약정지</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td height="25" bgcolor="white" align="center">매너 불량</td>
                                                                              <td height="22" bgcolor="white" align="center">6개월 예약정지</td>
                                                                            </tr>
                                                                          </table></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="25" class="orange">※ 단, 취소시한은 17:00 까지 인정되며, 이후는 익일로 처리됩니다.</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="70">&nbsp;</td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                              </table>
                                                            </div>
                                                            <div id="menu3" style="display:none;">
                                                              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                  <td width="426" background="/renewal/images/inc/img_board_bg.gif"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                                      <tr>
                                                                        <td onClick="DisplayMenu(1)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_01.gif" width="173" height="25" alt="서비스 이용안내"></td>
                                                                        <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_02.gif" width="173" height="25" alt="예약 및 위약규정"></td>
                                                                        <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_on_03.gif" width="173" height="25" alt="골프장 취소시한 및 위약금 안내"></td>
                                                                        <td onClick="DisplayMenu(4)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_04.gif" width="173" height="25" alt="콘도 이용안내"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                                <tr>
                                                                  <td height="10">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                                      <tr>
                                                                        <td style="padding-left:20px;padding-right:20px;">천재지변에 의한 당일 플레이 가능여부는 골프장과 협의로 취소가 가능하며 당일 일기예보로 인한 개인적인 판단으로 무연락/미내장 하신 경우 패널티가 적용됩니다.<br>
                                                                          <br>
                                                                          <span class=blue>01. 일기예보로 인해 취소하시는 경우</span><br>
                                                                          - 취소시한이 지난 이후에 전화 등으로 취소하시는 경우는 임박취소로 처리되어 패널티가 부과됩니다.<br>
                                                                          <br>
                                                                          <span class=blue>02. 이용 당일 기상조건을 이유로 취소를 원하시는 경우</span><br>
                                                                          - 해당 골프장으로 문의하신 후 라운드 가능 여부를 확인하시고 라운드가 불가능할 상황일 경우 골프장에 취소 의사를 밝혀주시면, 별도의 패널티가 적용되지 않습니다.<br>
                                                                          (골프장 현장의 기상 상태는 출발지와 다를 수 있습니다.)<br>
                                                                          <br>
                                                                          <span class=blue>03. 고객님의 판단만으로 사전 연락 없이 골프장에 내장하지 않으신 경우(미내장) 무단 결장으로 처리되오니, 유의하시어 불이익을 받으시는 일이 없으시기 바랍니다.</span></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td>&nbsp;</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td><table border="0" cellpadding="2" cellspacing="1" width="704" bgcolor="#D1D3D4">
                                                                            <tr>
                                                                              <td width="207" align="center" bgcolor="#F1F1F1" height="25" class="blue">홀법</td>
                                                                              <td width="176" align="center" bgcolor="#F1F1F1" class="blue">요금정산</td>
                                                                              <td width="163" align="center" bgcolor="#F1F1F1" class="blue">카트비</td>
                                                                              <td width="137" align="center" bgcolor="#F1F1F1" class="blue">캐디피</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td align="center" bgcolor="white" width="207" height="25"><p>1홀 티샷 ~ 4홀 티샷</p></td>
                                                                              <td align="center" bgcolor="white"><p>정상요금의 1/3</p></td>
                                                                              <td align="center" bgcolor="white"><p>20,000원</p></td>
                                                                              <td align="center" bgcolor="white" rowspan="4">100% 정산</td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td align="center" bgcolor="white" width="207" height="25"><p>5홀 티샷 ~ 8홀 티샷</p></td>
                                                                              <td align="center" bgcolor="white"><p>정상요금의 1/2</p></td>
                                                                              <td align="center" bgcolor="white"><p>40,000원</p></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td align="center" bgcolor="white" width="207" height="25"><p>9홀 티샷 ~ 11홀 티샷</p></td>
                                                                              <td align="center" bgcolor="white"><p>정상요금의 70%</p></td>
                                                                              <td align="center" bgcolor="white"><p>60,000원</p></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td align="center" bgcolor="white" width="207" height="25"><p>11홀 티샷 ~ 18홀 티샷</p></td>
                                                                              <td align="center" bgcolor="white"><p>전액 정산</p></td>
                                                                              <td align="center" bgcolor="white"><p>80,000원(정상가)</p></td>
                                                                            </tr>
                                                                          </table></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="25" class=orange>※ 단, 시기별(성수기, 비수기)로 홀별 요금 정산이 차이가 있사오니 골프장별 이용안내 확인 요망</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="70">&nbsp;</td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                              </table>
                                                            </div>
                                                            <div id="menu4" style="display:none;">
                                                              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                  <td width="426" background="/renewal/images/inc/img_board_bg.gif"><table border="0" cellpadding="0" cellspacing="0" width="704">
                                                                      <tr>
                                                                        <td onClick="DisplayMenu(1)" style="cursor:hand" width="177"><img src="/images/common/btn_field_guide_off_01.gif" width="173" height="25" alt="서비스 이용안내"></td>
                                                                        <td onClick="DisplayMenu(2)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_02.gif" width="173" height="25" alt="예약 및 위약규정"></td>
                                                                        <td onClick="DisplayMenu(3)" style="cursor:hand" width="176"><img src="/images/common/btn_field_guide_off_03.gif" width="173" height="25" alt="골프장 취소시한 및 위약금 안내"></td>
                                                                        <td onClick="DisplayMenu(4)" style="cursor:hand" width="175"><img src="/images/common/btn_field_guide_on_04.gif" width="173" height="25" alt="콘도 이용안내"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="1" colspan="4" bgcolor="#91B500" width="704"></td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                                <tr>
                                                                  <td height="10">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white"><table border="0" cellpadding="2" cellspacing="1" width="704" bgcolor="#D1D3D4">
                                                                      <tr>
                                                                        <td width="116" bgcolor="#F1F1F1" rowspan="2" align="center" class=blue>지역</td>
                                                                        <td width="168" bgcolor="#F1F1F1" rowspan="2" align="center" class=blue>골프장명</td>
                                                                        <td width="171" bgcolor="#F1F1F1" align="center" height="25" class=blue>취소기한</td>
                                                                        <td width="228" bgcolor="#F1F1F1" align="center" colspan="2" class=blue>위약금(만원)</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="171" bgcolor="#F1F1F1" align="center" height="25" class=blue>주중/주말</td>
                                                                        <td width="112" bgcolor="#F1F1F1" align="center" class=blue>주중</td>
                                                                        <td width="111" align="center" bgcolor="#F1F1F1" class=blue>주말</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td bgcolor="white" align="center" width="0" height="23"><p>충북 </p></td>
                                                                        <td bgcolor="white" align="center"><p>대영베이스</p></td>
                                                                        <td bgcolor="white" align="center"><p>6일전 17:00까지</p></td>
                                                                        <td bgcolor="white" align="center">20</td>
                                                                        <td align="center" bgcolor="white">30</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td bgcolor="white" align="center" width="0" height="23"><p>충북</p></td>
                                                                        <td bgcolor="white" align="center"><p>대영힐스</p></td>
                                                                        <td bgcolor="white" align="center"><p>6일전 17:00까지</p></td>
                                                                        <td bgcolor="white" align="center">20</td>
                                                                        <td align="center" bgcolor="white">30</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>강원</p></td>
                                                                        <td align="center" bgcolor="white"><p>홍천CC</p></td>
                                                                        <td align="center" bgcolor="white"><p>7일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">20</td>
                                                                        <td align="center" bgcolor="white">30</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>충남</p></td>
                                                                        <td align="center" bgcolor="white"><p>태안비치CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">30</td>
                                                                        <td align="center" bgcolor="white">40</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경북</p></td>
                                                                        <td align="center" bgcolor="white"><p>한맥CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">25</td>
                                                                        <td align="center" bgcolor="white">35</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경기</p></td>
                                                                        <td align="center" bgcolor="white"><p>포레스트힐CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>8일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">25</td>
                                                                        <td align="center" bgcolor="white">35</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경기</p></td>
                                                                        <td align="center" bgcolor="white"><p>양평 TPC </p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">25</td>
                                                                        <td align="center" bgcolor="white">35</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경남</p></td>
                                                                        <td align="center" bgcolor="white"><p>에덴밸리CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">15</td>
                                                                        <td align="center" bgcolor="white">20</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>강원</p></td>
                                                                        <td align="center" bgcolor="white"><p>동강시스타 </p></td>
                                                                        <td align="center" bgcolor="white"><p>4일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">10</td>
                                                                        <td align="center" bgcolor="white">15</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>강원</p></td>
                                                                        <td align="center" bgcolor="white"><p>옥스필드CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>7일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">10</td>
                                                                        <td align="center" bgcolor="white">20</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>전북</p></td>
                                                                        <td align="center" bgcolor="white"><p>스파힐스 CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">10</td>
                                                                        <td align="center" bgcolor="white">20</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경북</p></td>
                                                                        <td align="center" bgcolor="white"><p>세븐밸리 CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">15</td>
                                                                        <td align="center" bgcolor="white">25</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경기</p></td>
                                                                        <td align="center" bgcolor="white"><p>레이크힐스 안성 </p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">15</td>
                                                                        <td align="center" bgcolor="white">15</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경북</p></td>
                                                                        <td align="center" bgcolor="white"><p>베네치아CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>7일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">30</td>
                                                                        <td align="center" bgcolor="white">40</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경기</p></td>
                                                                        <td align="center" bgcolor="white"><p>남양주 CC </p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">25</td>
                                                                        <td align="center" bgcolor="white">25</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>강원</p></td>
                                                                        <td align="center" bgcolor="white"><p>보광 휘닉스파크 </p></td>
                                                                        <td align="center" bgcolor="white"><p>4일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">5</td>
                                                                        <td align="center" bgcolor="white">10</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>강원</p></td>
                                                                        <td align="center" bgcolor="white"><p>대명리조트(홍천,설악)</p></td>
                                                                        <td align="center" bgcolor="white"><p>5일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">20</td>
                                                                        <td align="center" bgcolor="white">30</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>경기</p></td>
                                                                        <td align="center" bgcolor="white"><p>루이힐스 GC </p></td>
                                                                        <td align="center" bgcolor="white"><p>3일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white">5</td>
                                                                        <td align="center" bgcolor="white">10</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="center" bgcolor="white" width="0" height="23"><p>제주</p></td>
                                                                        <td align="center" bgcolor="white"><p>제주 골프장 </p></td>
                                                                        <td align="center" bgcolor="white"><p>7일전 17:00까지</p></td>
                                                                        <td align="center" bgcolor="white" colspan="2">골프장별 차이있음</td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white"><table border="0" cellpadding="2" cellspacing="1" width="704" bgcolor="#D1D3D4">
                                                                      <tr>
                                                                        <td width="147" bgcolor="#F1F1F1" align="center" height="25" class="blue">구분</td>
                                                                        <td width="261" bgcolor="#F1F1F1" align="center"  class="blue">가능시한</td>
                                                                        <td width="280" bgcolor="#F1F1F1" align="center"  class="blue">비고</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td bgcolor="white" align="center" height="25" class="blue">예약</td>
                                                                        <td bgcolor="white" align="center">각 콘도별 가능 시한까지</td>
                                                                        <td bgcolor="white" align="center">예약시 각 콘도별 예약규정 적용</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td bgcolor="white" align="center" height="25" class="blue">취소</td>
                                                                        <td bgcolor="white" align="center">각 콘도별 가능 시한까지</td>
                                                                        <td bgcolor="white" align="center">취소시 각 콘도별 예약규정 적용</td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white" height="40" class="orange"> ※ 단, 콘도는 비수기, 성수기 별로 취소 규정이 차이가 있사오니, <br>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;예약시 꼭~ 위약처리규정을 확인하시고 예약해 주시기 바랍니다. </td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white"><table border="0" cellpadding="2" cellspacing="1" width="704" bgcolor="#D1D3D4">
                                                                      <tr>
                                                                        <td width="173" bgcolor="#F1F1F1" align="center" class=blue height="25">구분</td>
                                                                        <td width="220" bgcolor="#F1F1F1" align="center" class=blue>취소시한</td>
                                                                        <td width="295" bgcolor="#F1F1F1" align="center" class=blue>패널티내용</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="173" bgcolor="#F1F1F1" rowspan="6" align="center" class=blue>비수기</td>
                                                                        <td bgcolor="white" height="23" align="center"><p>이용당일 제외 기준 5일전 </p></td>
                                                                        <td bgcolor="white" align="center"><p>패널티 없음 </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td bgcolor="white" height="23" align="center"><p>이용당일 제외 기준 4일전 </p></td>
                                                                        <td bgcolor="white" align="center"><p>3개월 예약정지(총 입금액의 80%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 3일전</p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>3개월 예약정지(총 입금액의 70%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 2일전</p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>3개월 예약정지(총 입금액의 50%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 1일전</p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>3개월 예약정지(총 입금액의 30%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>당일 취소 및 미내장 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>영구예약정지(100% 환불불가) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="173" bgcolor="#F1F1F1" rowspan="11" align="center"><span class=blue>성수기</span><br>
                                                                          연휴/연말<br>
                                                                          (2일 이상 연휴)<br>
                                                                          <br>
                                                                          벚꽃시즌(04/01~04/25)<br>
                                                                          <br>
                                                                          여름성수기<br>
                                                                          (7월 중순~8월말)<br>
                                                                          <br>
                                                                          단풍시즌(10.10~11/10)<br>
                                                                          <br>
                                                                          스키시즌<br>
                                                                          (개장일~폐장일)</td>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 10일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>패널티 없음 </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 9일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>1개월 예약정지(총 입금액의 90%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 8일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>1개월 예약정지(총 입금액의 80%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 7일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>2개월 예약정지(총 입금액의 70%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 6일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>2개월 예약정지(총 입금액의 60%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 5일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>3개월 예약정지(총 입금액의 50%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 4일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>3개월 예약정지(총 입금액의 40%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 3일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>4개월 예약정지(총 입금액의 30%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 2일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>4개월 예약정지(총 입금액의 20%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td height="23" bgcolor="white" align="center"><p>이용당일 제외 기준 1일전 </p></td>
                                                                        <td height="22" bgcolor="white" align="center"><p>6개월 예약정지(총 입금액의 10%만 환불) </p></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td bgcolor="white" height="23" align="center"><p>당일 취소 및 미내장 </p></td>
                                                                        <td bgcolor="white" align="center"><p>영구예약정지(100% 환불불가) </p></td>
                                                                      </tr>
                                                                    </table></td>
                                                                </tr>
                                                                <tr>
                                                                  <td bgcolor="white" height="40" class=orange>※ 단, 제주지역은 취소시한, 패널티 내용이 차이가 있사오니, 골프장 별로 확인 요망<br>
                                                                      ※ 성수기 시기는 콘도 별로 기간 차이가 있을 수 있사오니, 콘도 상세정보 확인 요망</td>
                                                                </tr>
                                                              </table>
                                                            </div></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                  <tr>
                                                    <td align="center">&nbsp;</td>
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
