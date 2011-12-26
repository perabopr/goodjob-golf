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
<link rel="stylesheet" href="../css/jquery.ui.all.css">
<script src="../js/jquery-1.6.2.min.js"></script>
<script src="../js/jquery.ui.core.js"></script>
<script src="../js/jquery.ui.widget.js"></script>
<script src="../js/jquery.ui.datepicker.js"></script>
<script type="text/javascript">
<!--
$(function() {
	$( "#reserveDate" ).datepicker({dateFormat:'yy-mm-dd'});
});
//-->
</script>
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
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>패키지명</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><SPAN class=normal_b><%= pkDto.getPackage_name1() + " + " + pkDto.getPackage_name2() %></SPAN></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=13 width=122 align=right>예약자이름</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><INPUT class=input_01 id="reserveName" name="reserveName" size=15></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 align=right>핸드폰</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white><SELECT size=1 id="phone1" name="phone1"> <OPTION selected>선택</OPTION> <OPTION>010</OPTION> <OPTION>011</OPTION> <OPTION>016</OPTION> <OPTION>017</OPTION> <OPTION>018</OPTION> <OPTION>019</OPTION></SELECT> - <INPUT class=input_01 id="phone2" name="phone2" size=8> - <INPUT class=input_01 id="phone3" name="phone3" size=8></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>E-Mail</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><INPUT class=input_01 id="eMail1" name="eMail1" size=15> @ <INPUT class=input_01 name=id size=15> <SELECT size=1 id="eMail2" name="eMail2"> <OPTION selected>선택하세요</OPTION> <OPTION>naver.com</OPTION> <OPTION>hanmail.net</OPTION> <OPTION>dreamwiz.com</OPTION> <OPTION>empal.com</OPTION> <OPTION>hanmir.com</OPTION> <OPTION>hanafos.com</OPTION> <OPTION>nate.com</OPTION> <OPTION>paran.com</OPTION> <OPTION>yahoo.co.kr</OPTION> <OPTION>gmail.com</OPTION> <OPTION>직접입력하기</OPTION></SELECT></TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=12 width=122 align=right>출발일</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><IMG border=0 align=absMiddle src="../../images/package/img_calendar.gif" width=15 height=16> <INPUT class=input_01 id="reserveDate" name="reserveDate" size=10> 월요일</TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 height=12 width=122 align=right>인원</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white height=25 width=451><INPUT class=input_01 id="reserveTeam" name="reserveTeam" size=4> 팀 <INPUT class=input_01 id="reservePerson" name="reservePerson" size=4> 인 </TD></TR>
<TR>
<TD style="PADDING-RIGHT: 10px" class=mem_subject bgColor=#f1f1f1 width=122 align=right>요청사항</TD>
<TD style="PADDING-LEFT: 10px" bgColor=white width=451><TEXTAREA class=box_01 cols=70 rows=8 id="content" name="content"></TEXTAREA></TD></TR>
<TR>
<TD bgColor=#aed247 width=594 colSpan=2></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD style="PADDING-BOTTOM: 60px; PADDING-TOP: 40px" align=center><A href="domestic_regist_finished.html"><IMG border=0 align=absMiddle src="../../images/package/btn_domestic_regist3.gif" width=150 height=39></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>