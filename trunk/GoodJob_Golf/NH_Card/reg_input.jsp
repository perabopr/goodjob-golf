<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 상단 영역 -->
<%@ include file="/include/header_nhcard.jsp" %>
<script type="text/javascript">
<!---//

function sel_phone1(){
	$("#phone2").focus();
}

function sel_phone2(){
	var ph_num = $("#phone2").val();
	if(ph_num.length >= 4){
		$("#phone3").focus();
	}
}

function on_submit() {

	var frm = document.frm;
	if(!$('#reserve_name').val()) {
		alert('예약자명을 입력하시기 바랍니다.');
		$('#reserve_name').focus();
		return;
	}

	if(!$('#phone1').val()) {
		alert('핸드폰을 입력하시기 바랍니다.');
		$('#phone1').focus();
		return;
	} 

	if(!$('#phone2').val()) {
		alert('핸드폰을 입력하시기 바랍니다.');
		$('#phone2').focus();
		return;
	} 

	if(!$('#phone3').val()) {
		alert('핸드폰을 입력하시기 바랍니다.');
		$('#phone3').focus();
		return;
	} 
	frm.action="reg_list.jsp"
	frm.submit();
}

//--->
</script>

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
<form name="frm" method="post">
        <tr>
          <td width="129" height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>예약자명</td>
          <td width="1" bgcolor="#D1D3D4"></td>
          <td width="350"  style="padding-left: 10px;"><input class="input_01" type="text" size="14" name="reserve_name" id="reserve_name"/></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="500"></td>
        </tr>
        <tr>
          <td height="40" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b width="129">핸드폰</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" width="350">
          <SELECT size=1 id="phone1" name="phone1" onChange="sel_phone1();">
                 <OPTION value="" selected>선택</OPTION>
                           <OPTION value="010">010</OPTION>
                           <OPTION value="011">011</OPTION>
                           <OPTION value="016">016</OPTION>
                           <OPTION value="017">017</OPTION>
                           <OPTION value="018">018</OPTION>
                           <OPTION value="019">019</OPTION>
               </SELECT>
                         -
                         <INPUT class=mem_input id="phone2" name="phone2" onKeyup="sel_phone2();" maxLength=4 size=8>
                         -
                         <INPUT class=mem_input id="phone3" name="phone3" maxLength=4 size=8></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="500"></td>
        </tr>
      </table></td>
  </tr>
  </form>
  <tr>
    <td style="padding-bottom: 30px; padding-top: 30px" align=center>
    <a href="javascript:on_submit();"><img border=0 src="../images/booking/btn_next_page3.gif" width="150" height="39"></a></td>
  </tr>
</table>
<!-- 하단 footer  -->
<%@ include file="/include/footer_nhcard.jsp" %>
<!-- 하단 footer  -->