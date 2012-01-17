<%@page import="com.goodjob.common.Utillity"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.PackageDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int packSeq = NumberUtils.toInt(request.getParameter("pkSeq"),1);

PackageDao pkDao = new PackageDao();
String strWhere = "AND a.package_seq = " + packSeq;
List<PackageDto> pkList = pkDao.getPackageList(strWhere);
PackageDto pkDto = new PackageDto();
if(pkList != null && pkList.size() == 1){
	pkDto = pkList.get(0);
}
else{
	out.print("<script>");
	out.print("location.href='/forGolfbooking/reserve.jsp?menu=4'");
	out.print("</script>");
}

Utillity myUtil = new Utillity();

%>
<script type="text/javascript">
function DisplayMenu(vIdx){
	$("#imgtap1").attr("src", "../../images/package/btn_tab_off_01.gif");
	$("#imgtap2").attr("src", "../../images/package/btn_tab_off_02.gif");
	$("#imgtap3").attr("src", "../../images/package/btn_tab_oversea_off_03.gif");
	$("#imgtap4").attr("src", "../../images/package/btn_tab_oversea_off_04.gif"); 
	$("#destap1").hide();
	$("#destap2").hide();
	$("#destap3").hide();
	$("#destap4").hide();
	
	switch(vIdx){
		case 1:
			$("#imgtap1").attr("src", "../../images/package/btn_tab_on_01.gif"); 
			$("#destap1").show();
			break;
		case 2:
			$("#imgtap2").attr("src", "../../images/package/btn_tab_on_02.gif");
			$("#destap2").show(); 
			break;
		case 3:
			$("#imgtap3").attr("src", "../../images/package/btn_tab_oversea_on_03.gif");
			$("#destap3").show(); 
			break;
		case 4:
			$("#imgtap4").attr("src", "../../images/package/btn_tab_oversea_on_04.gif");
			$("#destap4").show(); 
			break;
	}
}

function imgChange(objId){
	$("#imgmain").attr("src", objId.src);
}
</script>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>
<TR>
<TD bgColor=white vAlign=top width=745 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
<TBODY>
<TR>
<TD class=location height=30 width="95%" align=right><A href="/main.jsp">HOME</A> &gt; 골프패키지 &gt; <SPAN class=location_b>해외골프패키지</SPAN></TD></TR>
<TR>
<TD style="PADDING-LEFT: 15px; PADDING-TOP: 4px" class=sub_title bgColor=#d1d3d4 height=33>해외골프패키지</TD></TR>
<TR>
<TD vAlign=top>
<P>&nbsp;</P></TD></TR>
<TR>
<TD vAlign=top align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=300>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=274 bgColor=white>
<TBODY>
<TR>
<TD bgColor=white>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=274 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white width=270><IMG border=0 id="imgmain" name="imgmain" src="/upload/<%=pkDto.getImg_sub1()%>" width=270 height=202></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD bgColor=white height=10></TD></TR>
<TR>
<TD bgColor=white width=272>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="/upload/<%=pkDto.getImg_sub1()%>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="/upload/<%=pkDto.getImg_sub2()%>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="/upload/<%=pkDto.getImg_sub3()%>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD></TR></TBODY></TABLE></TD>
<TD width=62>
<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>
<TBODY>
<TR>
<TD bgColor=white><IMG border=0 name=img1 src="/upload/<%=pkDto.getImg_sub4()%>" width=63 height=47 onclick="imgChange(this);" style="cursor:hand;"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD vAlign=top width=407>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=407>
<TBODY>
<TR>
<TD class=cc_name height=25><%=pkDto.getPackage_name1() %></TD></TR>
<TR>
<TD>
	<%=pkDto.getPackage_type() %>
</TD></TR>
<TR>
<TD vAlign=top>
<TABLE border=0 cellSpacing=1 cellPadding=2 width="100%" bgColor=#d1d3d4>
<TBODY>
<TR>
<TD class=normal_b bgColor=#f1f1f1 height=18 align=center>출발일</TD>
<TD class=normal_b bgColor=#f1f1f1 width=250 align=center>상품가격</TD></TR>
<TR>
<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>월요일</TD>
<TD class=normal_s bgColor=white align=center><%=myUtil.commify(pkDto.getOff_n_mon()) %>원/인</TD></TR>
<TR>
<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>화요일</TD>
<TD class=normal_s bgColor=white align=center><%=myUtil.commify(pkDto.getOff_n_tue()) %>원/인</TD></TR>
<TR>
<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>수요일</TD>
<TD class=normal_s bgColor=white align=center><%=myUtil.commify(pkDto.getOff_n_wed()) %>원/인</TD></TR>
<TR>
<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>목요일</TD>
<TD class=normal_s bgColor=white align=center><%=myUtil.commify(pkDto.getOff_n_thu()) %>원/인</TD></TR>
<TR>
<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>금요일</TD>
<TD class=normal_s bgColor=white align=center><%=myUtil.commify(pkDto.getOff_n_fri()) %>원/인</TD></TR>
<TR>
<TD class=saturday bgColor=#f1f1f1 height=18 align=center>토요일</TD>
<TD class=saturday bgColor=white align=center><%=myUtil.commify(pkDto.getOff_n_sat()) %>원/인</TD></TR>
<TR>
<TD class=sunday bgColor=#f1f1f1 height=18 align=center>일요일</TD>
<TD class=sunday bgColor=white align=center><%=myUtil.commify(pkDto.getOff_n_sun()) %>원/인</TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD style="PADDING-TOP: 17px"><A href="rule.jsp?menu=4&pkSeq=<%=packSeq %>"><IMG border=0 src="../../images/package/btn_domestic_regist.gif" width=407 height=39></A></TD></TR>
<TR>
<TD></TD></TR>
<TR>
<TD></TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD vAlign=top width=707 colSpan=2></TD></TR>
<TR>
<TD width=707 colSpan=2>&nbsp;</TD></TR>
<TR>
<TD width=707 colSpan=2 align=center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>
<TBODY>
<TR>
<TD></TD></TR>
<TR>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR><TD>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
	<TBODY>
	<TR>
	<TD style="CURSOR: hand" onclick=DisplayMenu(1) width=176><IMG id="imgtap1" alt=상품안내 src="../../images/package/btn_tab_on_01.gif" width=173 height=25></TD>
	<TD style="CURSOR: hand" onclick=DisplayMenu(2) width=176><IMG id="imgtap2" alt=이용안내 src="../../images/package/btn_tab_off_02.gif" width=173 height=25></TD>
	<TD style="CURSOR: hand" onclick=DisplayMenu(3) width=176><IMG id="imgtap3" alt=상품정보 src="../../images/package/btn_tab_oversea_off_03.gif" width=173 height=25></TD>
	<TD style="CURSOR: hand" onclick=DisplayMenu(4) width=176><IMG id="imgtap4" alt=일정표 src="../../images/package/btn_tab_oversea_off_04.gif" width=173 height=25></TD></TR>
	<TR>
	<TD bgColor=#91b500 height=1 width=704 colSpan=4></TD></TR></TBODY></TABLE></TD></TR>
<TR><TD height=10></TD></TR>
<TR><TD bgColor=white align=center>
<div id="destap1"><%=pkDto.getPackage_guide() %></div>
<div id="destap2" style="display:none;"><%=pkDto.getUse_guide() %></div>
<div id="destap3" style="display:none;"><%=pkDto.getGolflink_guide() %></div>
<div id="destap4" style="display:none;"><%=pkDto.getWay_map() %></div>
</TD></TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD width=707 colSpan=2>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>