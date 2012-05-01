<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751>
<TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
	<TBODY>
	<TR>
	<TD>
	<P>&nbsp;</P></TD>
	</TR>
	<TR>
	<TD align=center><IMG src="../../images/nh_golf/img_without_title.gif" width="556" height="91" border="0"></TD>
	</TR>
	<TR>
	<TD align=center>
	<P><IMG src="../../images/nh_golf/img_without_message.gif" width="640" height="298" border="0"></P></TD>
	</TR>
	<TR>
	<TD height=100 align=center></TD>
	</TR>
	</TBODY>
	</TABLE>
</TD>
</TR>
<tr>
<td><div id="wrapperHome" style="display:none;">
<iframe id="innerIFrameHome" width="10" height="10"></iframe>
</div></td>
</tr>
</TBODY>
</TABLE>
<script type="text/javascript">
<!--
function goToHome() {
	var ifr = document.getElementById("innerIFrameHome");
	var divWrap = document.getElementById("wrapperHome");
	var strDomain = "http://183.109.124.19";
	var url = strDomain + "/gohome.html?gr_cd=<%=nhNum%>";
	ifr.src = url;
}
//-->
</script>
