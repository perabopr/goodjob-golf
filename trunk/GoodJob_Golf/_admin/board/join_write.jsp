<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.util.Utils" %>
<%
	BoardDao dao = new BoardDao();
	 
	String join_seq = StringUtils.trimToEmpty(request.getParameter("join_seq"));
	String mode = StringUtils.trimToEmpty(request.getParameter("mode"));
	
	JoinBoardDto jDto = dao.getJoinView(NumberUtils.toInt(join_seq,0));
	
	String name = jDto.getJoin_name();
	if(name == null) name = StringUtils.defaultString((String)session.getAttribute("admin_name"),"관리자"); 
	
	
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript">

	function on_submit() {
		
		if(!$('#tel1').val()) {
			alert('연락처 앞자리를 선택');
			$('#tel1').focus();
			return;
		}

   		if(!$('#tel2').val()) {
			alert('연락처를 입력');
			$('#tel2').focus();
			return;
		}

   		if(!$('#tel3').val()) {
   			alert('연락처를 입력');
			$('#tel3').focus();
			return;
		}
		
		
		if(!$('#region').val()) {
			alert('지역을 선택~');
			$('#region').focus();
			return;
		}

		if(!$('#golflink_name').val()) {
			alert('골프장명을 입력');
			$('#golflink_name').focus();
			return;
		}

		if(!$('#sex').val()) {
			alert('성별 선택');
			$('#sex').focus();
			return;
		}

		if(!$('#age').val()) {
			alert('연령 선택');
			$('#age').focus();
			return;
		}

		if(!$('#join_person').val()) {
			alert('초대인원 선택');
			$('#join_person').focus();
			return;
		}

		if(!$('#rounding_dt1').val() || !$('#rounding_dt2').val() 
				|| !$('#rounding_dt3').val() || !$('#rounding_dt4').val()) {
			alert('라운딩 일시 입력');
			return;
		}
		
		if(!$('#price_info1').val()) {
			alert('그린피 입력!');
			$('#price_info1').focus();
			return;
		}

		if(!$('#price_info2').val()) {
			alert('카트비 입력!');
			$('#price_info2').focus();
			return;
		}

		if(!$('#price_info3').val()) {
			alert('캐디비 입력!');
			$('#price_info3').focus();
			return;
		}

		if(!$('#content').val()) {
			alert('초대 내용을 입력하시기 바랍니다.');
			$('#content').focus();
			return;
		}
		
		document.frm.submit();
	}

	function onlyNumber(loc) {
		if(/[^0123456789]/g.test(loc.value)) {
			alert("숫자가 아닙니다.");
			loc.value = "";
			loc.focus();
		}
	}
//-->
</script>
</head>
<body bgcolor="white">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ JOIN 커뮤니티 ★</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="667">
        <tr>
          <td background="/_admin/images/board/img_main_title_bg.gif" height="31">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
<FORM NAME="frm" METHOD="post" ACTION="join_write_reg.jsp">
<input type="hidden" id="join_no" name="join_no" value="<%=join_seq%>"/>
<input type="hidden" id="mode" name="mode" value="<%=mode%>"/>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109"><img align="absmiddle" src="/_admin/images/board/img_board_title_writer.gif" width="33" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="26">&nbsp;</td>
                <td width="110" class=blue><input id="join_name" name="join_name" type="text" size="20" value="<%=name%>"/></td>
                <td width="109" align="center"><img src="/_admin/images/board/img_board_title_phone.gif" width="31" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="286">
                	<select id="tel1" name="tel1" size="1">
                           <option value="010"<%=("010".equals(jDto.getTel1())?" selected":"")%>>010</option>
                           <option value="011"<%=("011".equals(jDto.getTel1())?" selected":"")%>>011</option>
                           <option value="016"<%=("016".equals(jDto.getTel1())?" selected":"")%>>016</option>
                           <option value="017"<%=("017".equals(jDto.getTel1())?" selected":"")%>>017</option>
                           <option value="018"<%=("018".equals(jDto.getTel1())?" selected":"")%>>018</option>
                           <option value="019"<%=("019".equals(jDto.getTel1())?" selected":"")%>>019</option>
                         </select>
                  -
                  <input class="input_01" type="text" size="6" id="tel2" maxlength="4" value="<%=StringUtils.trimToEmpty(jDto.getTel2())%>" name="tel2">
                  -
                  <input class="input_01" type="text" size="6" id="tel3" maxlength="4" value="<%=StringUtils.trimToEmpty(jDto.getTel3())%>" name="tel3"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109" height="30"><img src="/_admin/images/board/img_board_title_area.gif" width="31" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="25">&nbsp;</td>
                <td width="110"><select id="region" name="region" size="1">
                    <option value="">선택하세요</option>
                    <option value="1"<%=("1".equals(jDto.getRegion())?" selected":"")%>>수도권</option>
	              	<option value="2"<%=("2".equals(jDto.getRegion())?" selected":"")%>>강원권</option>
	              	<option value="3"<%=("3".equals(jDto.getRegion())?" selected":"")%>>충청권</option>
	              	<option value="4"<%=("4".equals(jDto.getRegion())?" selected":"")%>>경상권</option>
	              	<option value="5"<%=("5".equals(jDto.getRegion())?" selected":"")%>>전라권</option>
	              	<option value="6"<%=("6".equals(jDto.getRegion())?" selected":"")%>>제주권</option>
                  </select></td>
                <td width="109" align="center"><img align="absmiddle" src="/_admin/images/board/img_board_title_cc.gif" width="42" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="287"><input class="input_01" type="text" size="32" id="golflink_name" name="golflink_name" value="<%=StringUtils.trimToEmpty(jDto.getGolflink_name())%>"></td>
              </tr>
              <tr>
                <td height="30" align="center" width="109"><img src="/_admin/images/board/img_board_title_sex.gif" width="43" height="15" border="0"></td>
                <td height="22" align="center" bgcolor="#D1D3D4" width="1"></td>
                <td height="22" width="25">&nbsp;</td>
                <td height="22" width="110"><select id="sex" name="sex" size="1">
                    <option value="">선택하세요</option>
                    <option value="M"<%=("M".equals(jDto.getSex())?" selected":"")%>>남성</option>
              		<option value="F"<%=("F".equals(jDto.getSex())?" selected":"")%>>여성</option>
                    <option value="N"<%=("N".equals(jDto.getSex())?" selected":"")%>>구분없음</option>
                  </select></td>
                <td height="22" align="center" width="109"><img src="/_admin/images/board/img_board_title_age.gif" width="43" height="15" border="0"></td>
                <td height="22" bgcolor="#D1D3D4" width="1"></td>
                <td height="22" width="25">&nbsp;</td>
                <td height="22" width="287">
                <select id="age" name="age" size="1">
                    <option value=""<%=("".equals(jDto.getAge())?" selected":"")%>>선택하세요</option>
                    <option value="20"<%=("20".equals(jDto.getAge())?" selected":"")%>>20대</option>
		            <option value="30"<%=("30".equals(jDto.getAge())?" selected":"")%>>30대</option>
		            <option value="40"<%=("40".equals(jDto.getAge())?" selected":"")%>>40대</option>
		            <option value="50"<%=("50".equals(jDto.getAge())?" selected":"")%>>50대</option>
		            <option value="60"<%=("60".equals(jDto.getAge())?" selected":"")%>>60대</option>
                    <option value="99"<%=("99".equals(jDto.getAge())?" selected":"")%>>구분없음</option>
                  </select></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" width="109" height="30"><img src="/_admin/images/board/img_board_title_people.gif" width="43" height="15" border="0"></td>
                <td align="center" bgcolor="#D1D3D4" width="1"></td>
                <td width="25">&nbsp;</td>
                <td width="110"><select id="join_person" name="join_person" size="1">
                    <option value=""<%=(jDto.getJoin_person()==0?" selected":"")%>>선택하세요</option>
                    <option value="1"<%=(jDto.getJoin_person()==1?" selected":"")%>>1명</option>
                    <option value="2"<%=(jDto.getJoin_person()==2?" selected":"")%>>2명</option>
                    <option value="3"<%=(jDto.getJoin_person()==3?" selected":"")%>>3명</option>
                  </select></td>
                <td width="109" align="center"><img src="/_admin/images/board/img_board_title_round.gif" width="52" height="15" border="0"></td>
                <td width="1" bgcolor="#D1D3D4"></td>
                <td width="25">&nbsp;</td>
                <td width="287">
                <select id="rounding_dt1" name="rounding_dt1" size="1">
<%
	String[] rounding_dt = null;
	if(jDto.getRounding_dt() == null)
		rounding_dt = new String[5];
	else
		rounding_dt = StringUtils.trimToEmpty(jDto.getRounding_dt()).split("/");

	int curr_month = NumberUtils.toInt(rounding_dt[1],NumberUtils.toInt(Utils.getDate("MM")));
	
	for(int i = 1 ; i < 13 ; i++){
		
		if(i == curr_month){
%>
                    <option value="<%=(i<10?""+i:i)%>" selected><%=i%>월</option>
<%
		}
		else{
%>
            		<option value="<%=(i<10?""+i:i)%>"><%=i%>월</option>
<%
		}
	}
%>
                  </select>
                  <select id="rounding_dt2" name="rounding_dt2" size="1">
<%
	int curr_day = NumberUtils.toInt(rounding_dt[2],NumberUtils.toInt(Utils.getDate("dd")));

	for(int i = 1 ; i <= 31 ; i++){
		
		if(i == curr_day){
%>
                    <option value="<%=(i<10?"0"+i:i)%>" selected><%=i%>일</option>
<%
		}
		else{
%>
            		<option value="<%=(i<10?"0"+i:i)%>"><%=i%>일</option>
<%
		}
	}
%>
                  </select>
                  <select id="rounding_dt3" name="rounding_dt3" size="1">
<%
	int rd_dt = NumberUtils.toInt(rounding_dt[3],0);
	for(int i = 1 ; i <= 23 ; i++){
		if(i == rd_dt){
%>
    				<option value="<%=(i<10?"0"+i:i)%>" selected><%=i%></option>
<%
		}else{
%>
            		<option value="<%=(i<10?"0"+i:i)%>"><%=i%></option>
<%
		}
	}
%>
                  </select>시
                  
                  <select id="rounding_dt4" name="rounding_dt4" size="1">
<%
	rd_dt =NumberUtils.toInt(rounding_dt[4],0);
	for(int i = 0 ; i < 60 ; i+=10){
		if(i == rd_dt){
%>
				<option value="<%=(i<10?i+"0":i)%>" selected><%=(i<10?i+"0":i)%></option>
<%			
		}
		else{
%>
					<option value="<%=(i<10?i+"0":i)%>"><%=(i<10?i+"0":i)%></option>
<%
		}
	}
%>
                  </select>분</td>
              </tr>
              <tr>
                <td height="30" align="center"><img src="/_admin/images/board/img_board_title_price.gif" width="43" height="15" border="0"></td>
                <td height="22" align="center" bgcolor="#D1D3D4"></td>
                <td height="10">&nbsp;</td>
                <td height="30" colspan="5">
                    <img src="/_admin/images/board/img_title_greenpee.gif" width="34" height="15" border="0">
                    <input class="input_01" type="text" size="8" maxlength="8" id="price_info1" name="price_info1" value="<%=StringUtils.trimToEmpty(jDto.getPrice_info1())%>" onKeyDown="onlyNumber(this);"/>
                    원 &nbsp;<img src="/_admin/images/board/img_title_cartpee.gif" width="34" height="15" border="0">
                    <input class="input_01" type="text" size="8" maxlength="8" id="price_info2" name="price_info2" value="<%=StringUtils.trimToEmpty(jDto.getPrice_info2())%>" onKeyDown="onlyNumber(this);"/>
                    원 &nbsp;<img src="/_admin/images/board/img_title_caddiepee.gif" width="34" height="15" border="0">
                    <input class="input_01" type="text" size="8" maxlength="8" id="price_info3" name="price_info3" value="<%=StringUtils.trimToEmpty(jDto.getPrice_info3())%>" onKeyDown="onlyNumber(this);"/>
                    원
                  </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" valign="top" width="109"><img src="/_admin/images/board/img_board_title_write.gif" width="43" height="15" border="0"></td>
                <td align="center" valign="top" bgcolor="#D1D3D4" width="1"></td>
                <td valign="top" width="25">&nbsp;</td>
                <td width="532" valign="top"><textarea id="content" name="content" rows="15" cols="80" class="box03"><%=StringUtils.trimToEmpty(jDto.getContent())%></textarea></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td background="/_admin/images/board/img_board_ver.gif">&nbsp;</td>
        </tr>
</form>
        <tr>
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td width="88"><a href="join_list.jsp"><img src="/_admin/images/board/btn_list.gif" width="71" height="24" border="0" alt="목록"></a></td>
                <td width="480" align="right"><a href="javascript:on_submit();"><img align="absmiddle" src="/_admin/images/board/btn_input.gif" width="71" height="24" border="0" alt="등록"></a></td>
                <td width="99" align="right"><a href="javascript:document.frm.reset();"><img src="/_admin/images/board/btn_cancel.gif" width="71" height="24" border="0" align="absmiddle"></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="50">&nbsp;</td>
        </tr>
      </table></td>
  </tr>

  <tr>
    <td></td>
  </tr>
</table>
</body>
</html>