<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.dto.PackageDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));
int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"),0);

PackageDao pkDao = new PackageDao();
String strWhere = "AND a.package_seq = '" + pkSeq + "'";
List<PackageDto> pkList = pkDao.getPackageList(strWhere);
PackageDto pkDto = new PackageDto();
if(pkList != null && pkList.size() == 1){
	pkDto = pkList.get(0);
}
%>
<script type="text/javascript">
<!--
$(function() {
	$( "#reserveDate" ).datepicker({
		dateFormat:'yy-mm-dd',
		onSelect : function(dateText, inst){		
			var nowDate = ("<%=headDate_now%>").replace('-','').replace('-','');
			var arrDate = dateText.split("-");
			arrDate = arrDate[0] + arrDate[1] + arrDate[2];
			if(nowDate > arrDate){
				alert("오늘보다 이전날짜를 선택할 수 없습니다.");
				$( "#reserveDate" ).val("<%=headDate_now%>");
				return;
		}
	}
	});
	$( "#reserveDate" ).change(
		function(){
			var arrDate = this.value.split("-");
			var week = new Array('일', '월', '화', '수', '목', '금', '토');
			var rDate = new Date(arrDate[1]+"/"+arrDate[2]+"/"+arrDate[0]);
			$("#weekname").text(week[rDate.getDay()] + "요일");
		}
	);
	$("#btnReserveDate").click(
		function(){
			$( "#reserveDate" ).datepicker("show");
		}
	);
});

function emaildomain(){
	$("#eMail2").val($("#ddlEmail").val());
}

function billok(){
	if(!$('#reserveName').val()) {
		alert('예약자이름을 입력하시기 바랍니다.');
		$('#reserveName').focus();
		return;
	} 
	if($('#phone1').val() == "" || $('#phone2').val().length < 3 || $('#phone3').val().length < 4) {
		alert('핸드폰을 입력하시기 바랍니다.');
		return;
	} 
	if($('#reserveDate').val().length == "0") {
		alert('출발일을 입력하시기 바랍니다.');
		return;
	} 
	if($('#reservePerson').val().length == "0") {
		alert('인원을 입력하시기 바랍니다.');
		return;
	} 
	frm.submit();
}
//-->
</script>
<FORM NAME="frm" METHOD="post" ACTION="result.jsp">
<input type="hidden" id="menu" name="menu" value="3" >
<input type="hidden" id="pkSeq" name="pkSeq" value="<%=pkSeq %>" >
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프패키지 &gt; <SPAN class=location_b>국내골프패키지</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>국내골프패키지</TD></TR>
<TR>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD align=center>
<P><IMG border=0 src="../../images/package/img_domestic_regist_title.gif" width=640 height=108></P></TD></TR>
<TR>
<TD align=center>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=600 bgColor=white align=center>
<TBODY>
<TR>
<TD bgColor=#aed247 width=594 colSpan=2></TD></TR>
<TR>
<% 
	String packName = "";
	if(pkDto.getPackage_name1().trim().length() > 0 && pkDto.getPackage_name2().trim().length() > 0){
		packName = pkDto.getPackage_name1() + " + " + pkDto.getPackage_name2();
	}else{
		packName = pkDto.getPackage_name1() + pkDto.getPackage_name2();
	}
%>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>패키지명</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><SPAN class=normal_b><%=packName %></SPAN>
<input type="hidden" id="packageName" name="packageName" value="<%=packName %>">
</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=13 width=122 align=right>예약자이름</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><INPUT class=input_01 id="reserveName" name="reserveName" size=15></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 align=right>핸드폰</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><SELECT size=1 id="phone1" name="phone1"> 
<OPTION value="" selected>선택</OPTION> 
<OPTION value="010">010</OPTION> 
<OPTION value="011">011</OPTION> 
<OPTION value="016">016</OPTION> 
<OPTION value="017">017</OPTION> 
<OPTION value="018">018</OPTION> 
<OPTION value="019">019</OPTION></SELECT> - <INPUT class=input_01 id="phone2" name="phone2" size=8 maxlength="4"> - <INPUT class=input_01 id="phone3" name="phone3" size=8 maxlength="4"></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>E-Mail</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><INPUT class=input_01 id="eMail1" name="eMail1" size=15> @ <INPUT class=input_01 id="eMail2" name="eMail2" size=15> 
<SELECT size=1 id="ddlEmail" name="ddlEmail" onchange="emaildomain();"> 
	<OPTION value="" SELECTED>직접입력하기</OPTION> 
	<OPTION value="naver.com">naver.com</OPTION> 
	<OPTION value="hanmail.net">hanmail.net</OPTION>
	<OPTION value="dreamwiz.com">dreamwiz.com</OPTION> 
	<OPTION value="empal.com">empal.com</OPTION> 
	<OPTION value="hanmir.com">hanmir.com</OPTION> 
	<OPTION value="hanafos.com">hanafos.com</OPTION> 
	<OPTION value="nate.com">nate.com</OPTION>
	<OPTION value="paran.com">paran.com</OPTION> 
	<OPTION value="yahoo.co.kr">yahoo.co.kr</OPTION> 
	<OPTION value="gmail.com">gmail.com</OPTION></SELECT></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=12 width=122 align=right>출발일</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><IMG id="btnReserveDate" name="btnReserveDate" border=0 align=absMiddle src="../../images/package/img_calendar.gif" width=15 height=16  style="cursor:hand"> <INPUT class=input_01 id="reserveDate" name="reserveDate" size=10 maxlength="10" readonly /> <span id="weekname" name="weekname"></span></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=12 width=122 align=right>인원</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white height=25 width=451><INPUT class=input_01 id="reserveTeam" name="reserveTeam" size=4 value="1" readonly="readonly"> 팀 <INPUT class=input_01 id="reservePerson" name="reservePerson" size=4 maxlength="2"> 인 </TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 width=122 align=right>요청사항</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><TEXTAREA class=box_01 cols=70 rows=8 id="content" name="content"></TEXTAREA></TD></TR>
<TR>
<TD bgColor=#aed247 width=594 colSpan=2></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD style="PADDING-BOTTOM: 60px; PADDING-TOP: 40px" align=center><A href="javascript:;" onclick="billok();"><IMG border=0 align=absMiddle src="../../images/package/btn_domestic_regist3.gif" width=150 height=39></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</FORM>