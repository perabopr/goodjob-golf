<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.goodjob.reserve.dto.RegionDto"%>
<%@ page import="java.util.List"%>
<%@ page import="com.goodjob.reserve.PackageDao"%>
<%@ page import="com.goodjob.util.Utils"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.net.URLEncoder"%>
<%!

%>
<%
	//사용자정보.
	String user_Name = StringUtils.trimToEmpty((String)session.getAttribute("mem_name"));
	String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));
	//request.setCharacterEncoding("utf-8");
	//농협 연동 정보
	String nhNum = StringUtils.trimToEmpty(request.getParameter("gr_cd"));
	System.out.println("nh test gr_cd=" + nhNum);
	String nhName = StringUtils.trimToEmpty(request.getParameter("username"));
	System.out.println("nh test name=" + nhName);

	String curr_url = StringUtils.trimToEmpty(request.getRequestURI());

	PackageDao listRegionDao = new PackageDao();
	List<RegionDto> listRegion = listRegionDao.getRegionList("1");

	String headDate_now = Utils.getDate("yyyy-MM-dd");
	String headDate_2week = Utils.getDate("yyyy-MM-dd" , 14);

	String ddlSearchRegion = StringUtils.trimToEmpty(request.getParameter("ddlSearchRegion"));
	String ddlSearchMenu = StringUtils.trimToEmpty(request.getParameter("ddlSearchMenu"));
	String txtSearchStartDate = StringUtils.defaultString(request.getParameter("txtSearchStartDate"),headDate_now);
	String txtSearchEndDate = StringUtils.defaultString(request.getParameter("txtSearchEndDate"),headDate_2week);
%>
<%!
	public String commify(int n) {
		return com.goodjob.util.Utils.numberFormat(n);
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>대한민국 넘버원 골프부킹 할인서비스 굿잡골프</title>
<link rel="stylesheet" href="/css/common.css" type="text/css">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<link rel="stylesheet" href="/css/jquery.ui.all.css">
<script src="/js/jquery-1.6.2.min.js"></script>
<script src="/js/jquery.ui.core.js"></script>
<script src="/js/jquery.ui.widget.js"></script>
<script src="/js/jquery.ui.datepicker.js"></script>
<script src="/js/jquery.ui.datepicker.kr.js"></script>
<%
String autoResizeDomain = request.getParameter("pagepath");
%>
<script type="text/javascript">
<!--
function subAutoResizeIFrame() {
	var ifr = document.getElementById("innerIFrameSub");
	var divWrap = document.getElementById("wrapperSub");
	//var height = Math.max(document.body.offsetHeight, document.body.scrollHeight);
	var height = document.body.scrollHeight;
	var strDomain = "http://www.eventlife.co.kr";
	//var strDomain = "http://<%=autoResizeDomain%>";
	
	//var strArr = strDomain.split("?");
	//var strBefore = strArr[1];
	//var strBeforeArr = strBefore.split("=");
	var url = strDomain + "/autoresize.html?height="+height;
	ifr.src = url;
}
//-->
</script>
<script language="javascript" type="text/javascript">
$(function() {
	$( "#txtSearchStartDate" ).datepicker({
		dateFormat:'yy-mm-dd',
		onSelect : function(dateText, inst){
			
			var nowDate = ("<%=headDate_now%>").replace('-','').replace('-','');
			var arrDate = dateText.split("-");
			arrDate = arrDate[0] + arrDate[1] + arrDate[2];
			if(nowDate > arrDate){
				alert("오늘보다 이전날짜를 선택할 수 없습니다.");
				$( "#txtSearchStartDate" ).val("<%=headDate_now%>");
				return;
			}
		}
	});
	$( "#txtSearchEndDate" ).datepicker({
		dateFormat:'yy-mm-dd',
		onSelect : function(dateText, inst){
			var startDate = $( "#txtSearchStartDate" ).val().replace('-','').replace('-','');
			var arrDate = dateText.split("-");
			arrDate = arrDate[0] + arrDate[1] + arrDate[2];
			if(startDate > arrDate){
				alert("시작날짜보다 이전날짜를 선택할 수 없습니다.");
				$( "#txtSearchEndDate" ).val("<%=headDate_2week%>");
				return;
			}
		}
	});
	$("#btnSearchStartDate").click(
		function(){
			$( "#txtSearchStartDate" ).datepicker("show");
		}
	);
	$("#btnSearchEndDate").click(
		function(){
			$( "#txtSearchEndDate" ).datepicker("show");
		}
	);
});
	function logon_ok() {
		
		if(!$('#login_id').val()) {
			alert('아이디를 입력하시기 바랍니다.');
			$('#login_id').focus();
			return false;
		}

		if(!$('#login_pwd').val()) {
			alert('비밀번호를 입력하시기 바랍니다.');
			$('#login_pwd').focus();
			return false;
		} 
				
		var frm = document.forms["logonFrm"];
		frm.action = "/logon/logon.jsp";
		frm.submit();
   	}

	function onClick_id(){
		if($('#login_id').val()=="아이디@메일주소"){
			$('#login_id').val("");
		}
	}
	
   	function golflinkSearch(){
   	   	if($("#ddlSearchRegion").val() == "" && $("#ddlSearchMenu").val() == ""){
   	   	   	alert("검색하려면 '지역'이나 '항목'을 선택해주세요.");
   	   	   	return;
   	   	}
   		frmSearch.submit();
   	}
//-->
</script>
</head>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" align="center">