<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 상단 영역 -->
<%@ include file="/include/header_nhcard.jsp" %>
<!-- 상단 영역 -->
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">예약확인</td>
          <td width="50%" height="25" bgcolor="#DCDDDE" style="padding-top:4px; padding-right: 10px;" align="right"><a href="default.jsp"><img align="absmiddle" src="../img_nhcard/common/btn_home.gif" width="60" height="19" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" height="60"><img align="absmiddle" src="../images/mypage/img_search_title_s.gif" width="50" height="19" border="0"> <a href="#"><img align="absmiddle" id="istartDt" src="../images/common/btn_calendar_left.gif" width="22" height="21"></a>&nbsp;
      <input type="text" class="input_01" size="13" id="startDt" name="startDt" readonly/>
      &nbsp;&nbsp;~&nbsp;&nbsp; <a href="#"><img align="absmiddle" id="iendDt" src="../images/common/btn_calendar_right.gif" width="22" height="21"></a>&nbsp;
      <input type="text" class="input_01" size="13" id="endDt" name="endDt" readonly/>
      <a href="javascript:mypage_search();"><img align="absmiddle" src="../images/mypage/btn_search.gif" width="38" height="19" border="0"></a></td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
        <tr>
          <td bgcolor="#F1F1F1" align="center" height="25" class=m_title_b width="75">예약신청일</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="92">부킹날짜/시간</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="215">골프장명</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="53">코스</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="71">금액</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="51">인원/팀</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="56">예약구분</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="59">처리상태</td>
        </tr>
        <tr>
          <td height="25" bgcolor="white" align="center" class=m_title>2012.12.31</td>
          <td bgcolor="white" align="center" class=blue_ss>2012.12.25 12:15</td>
          <td bgcolor="white" class=m_title_blue style="padding-left:7px;padding-right:7px;">대영힐스 CC</td>
          <td bgcolor="white" align="center" class=m_title>스텔라</td>
          <td bgcolor="white" align="center" class=m_title_red>500,000원<br></td>
          <td bgcolor="white" align="center" class=m_title>3명/1팀</td>
          <td bgcolor="white" align="center" class=m_title_pink>실시간</td>
          <td bgcolor="white" align="center" class=m_title_blue>예약완료</td>
        </tr>
        <tr>
          <td height="25" align="center" bgcolor="white" class="m_title">2012.12.31</td>
          <td align="center" bgcolor="white" class="red_ss">2012.12.25 12:15</td>
          <td bgcolor="white" class="m_title_blue" style="padding-right:7px; padding-left:7px;">대영힐스 CC</td>
          <td align="center" bgcolor="white" class="m_title">스텔라</td>
          <td align="center" bgcolor="white" class="m_title_red">500,000원</td>
          <td align="center" bgcolor="white" class="m_title">3명/1팀</td>
          <td align="center" bgcolor="white" class="m_title_green">사전신청</td>
          <td align="center" bgcolor="white" class="m_title_red">예약취소</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td style="padding-top: 10px; padding-bottom: 20px"> 고객님께서 예약하신 내역입니다<br>
      변동사항이나 예약취소를 원하실 경우 <span class=blue_list>고객센터(02-6670-0110)</span>로 연락주시면 빠른시일내에 처리해 드리겠습니다. 감사합니다.</td>
  </tr>
  <tr>
    <td align="center" style="padding-top: 30px; padding-bottom: 30px"><img align="absmiddle" src="../images/board/btn_prev_dual.gif" width="16" height="15" border="0"> <img align="absmiddle" src="../images/board/btn_prev.gif" width="16" height="15" border="0"> <span class=normal_b>1 &nbsp;</span>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <img align="absmiddle"
src="../images/board/btn_next.gif" width="16" height="15" border="0"> <img align="absmiddle" src="../images/board/btn_next_dual.gif" width="16" height="15" border="0"></td>
  </tr>
</table>
<!-- 하단 footer  -->
<%@ include file="/include/footer_nhcard.jsp" %>
<!-- 하단 footer  -->