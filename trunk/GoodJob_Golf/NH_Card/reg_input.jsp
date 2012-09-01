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
    <td align="center" width="0" height="120"><img src="../img_nhcard/common/img_reg_list_title.gif" width="556" height="97" border="0"></td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="500" cellpadding="0" cellspacing="0">
        <tr>
          <td width="500" colspan="3" bgcolor="#D1D3D4" height="1"></td>
        </tr>
        <tr>
          <td width="129" height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>예약자명</td>
          <td width="1" bgcolor="#D1D3D4"></td>
          <td width="350"  style="padding-left: 10px;"><input class="input_01" type="text" size="14" name="day"></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="500"></td>
        </tr>
        <tr>
          <td height="40" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="129">핸드폰</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="350"><select name="formselect1" size="1">
              <option>선택</option>
              <option>010</option>
              <option>011</option>
              <option>016</option>
              <option>017</option>
              <option>018</option>
              <option>019</option>
            </select>
            -
            <input class="input_01" type="text" size="6" name="day">
            -
            <input class="input_01" type="text" size="6" name="day"></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="500"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td style="padding-bottom: 30px; padding-top: 30px" align=center><a href="reg_list.jsp"><img border=0 src="../images/booking/btn_next_page3.gif" width="150" height="39"></a></td>
  </tr>
</table>
<!-- 하단 footer  -->
<%@ include file="/include/footer_nhcard.jsp" %>
<!-- 하단 footer  -->