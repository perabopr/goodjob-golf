<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/_admin/css/style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.6.2.min.js"></script>
<title></title>
<script language="javascript">
<!-- 
function NewWindow(mypage, myname, w, h, scroll) { 
var winl = (screen.width - w) / 2; 
var wint = (screen.height - h) / 2; 
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
win = window.open(mypage, myname, winprops) 
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
} 
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD class=title align=center>★ 통합검색 ★</TD></TR>
<TR>
<TD align=center>&nbsp;</TD></TR>
<TR>
<TD align=center><INPUT name=formcheckbox1 value="" type=checkbox> 아이디 &nbsp;&nbsp; <INPUT name=formcheckbox1 value="" type=checkbox> 핸드폰&nbsp;&nbsp;&nbsp; <INPUT name=formcheckbox1 value="" type=checkbox> 이름 &nbsp;&nbsp; <INPUT class=input_01 name=day> <INPUT border=0 name=imagefield align=absMiddle src="../images/board/bt_search.gif" width=43 height=19 type=image></TD>
</TR>
<TR>
<TD align=center>&nbsp;</TD></TR>
<TR>
<TD align=center>
	<TABLE border=0 cellSpacing=1 cellPadding=2 width="100%" bgColor=silver>
	<TBODY>
	<TR>
	<TD bgColor=#e6e7e8 height=25 width=132 align=center><SPAN class=normal_b>예약신청일</SPAN></TD>
	<TD bgColor=#e6e7e8 width=80 align=center><SPAN class=normal_b>예약자</SPAN></TD>
	<TD bgColor=#e6e7e8 width=169 align=center><SPAN class=normal_b>아이디</SPAN></TD>
	<TD bgColor=#e6e7e8 width=255 align=center><SPAN class=normal_b>골프장명</SPAN></TD>
	<TD bgColor=#e6e7e8 width=194 align=center><SPAN class=normal_b>부킹일시</SPAN></TD>
	<TD bgColor=#e6e7e8 width=206 align=center><SPAN class=normal_b>코스</SPAN></TD>
	<TD bgColor=#e6e7e8 width=206 align=center><SPAN class=normal_b>연락처</SPAN></TD>
	<TD bgColor=#e6e7e8 width=219 align=center><SPAN class=normal_b>예약종류</SPAN></TD>
	<TD bgColor=#e6e7e8 width=164 align=center><SPAN class=normal_b>입금액</SPAN></TD>
	<TD bgColor=#e6e7e8 width=176 align=center><SPAN class=normal_b>처리상태</SPAN></TD>
	</TR>
	<TR>
	<TD bgColor=white height=25 align=center>2011-12-31 12:30</TD>
	<TD bgColor=white align=center>홍길동</TD>
	<TD bgColor=white align=center>abc@naver.com</TD>
	<TD bgColor=white align=center>레이크힐스</TD>
	<TD bgColor=white align=center>2011-08-01 06:36 </TD>
	<TD bgColor=white align=center>코스명</TD>
	<TD bgColor=white align=center>011-123-4567</TD>
	<TD bgColor=white align=center>실시간예약</TD>
	<TD bgColor=white align=center><SPAN class=orange>10,000 원</SPAN></TD>
	<TD bgColor=white align=center>
		<P>
		<SELECT size=1 name=formselect1> 
		<OPTION selected>예약대기</OPTION> 
		<OPTION>예약완료</OPTION> 
		<OPTION>취소불가</OPTION> 
		<OPTION>예약취소</OPTION>
		</SELECT> <IMG border=0 align=absMiddle src="../images/common/btn_save2.gif" width=32 height=16>
		</P>
	</TD>
	</TR>
	</TBODY>
	</TABLE>
</TD>
</TR>
<TR>
<TD height=2 align=center>&nbsp;</TD>
</TR>
<TR>
<TD height=2 align=center>
<P><IMG border=0 align=absMiddle src="../images/board/btn_prev_dual.gif" width=16 height=15> <IMG border=0 align=absMiddle src="../images/board/btn_prev.gif" width=16 height=15> <SPAN class=normal_b>1 &nbsp;</SPAN>I &nbsp;2 &nbsp;I &nbsp;3 &nbsp;I &nbsp;4 &nbsp;I &nbsp;5 &nbsp;I &nbsp;6 &nbsp;I &nbsp;7 &nbsp;I &nbsp;8 &nbsp;I &nbsp;9 &nbsp;I &nbsp;10 <IMG border=0 align=absMiddle src="../images/board/btn_next.gif" width=16 height=15> <IMG border=0 align=absMiddle src="../images/board/btn_next_dual.gif" width=16 height=15></P>
</TD>
</TR>
<TR>
<TD height=2 align=center>&nbsp;</TD>
</TR>
</TBODY>
</TABLE>
</body>
</html>