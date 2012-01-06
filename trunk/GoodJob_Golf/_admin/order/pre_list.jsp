<%@page import="java.text.DecimalFormat"%>
<%@page import="com.goodjob.sql.ORDER"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.goodjob.order.dto.GolfLinkDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.order.GolfLinkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
String field = StringUtils.trimToEmpty(request.getParameter("field"));
String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));

PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , ORDER.per_page );

Map<String,String> params = new HashMap<String,String>();
params.put("menu_seq", "2");
params.put("npage",npage);
params.put("field",field);
params.put("keyword",keyword);

GolfLinkDao glList = new GolfLinkDao();
List<GolfLinkDto> list = glList.getList("tb_golflink_reserve",params);

int totalCount = glList.getTotalCount("tb_golflink_reserve" , params);

String strPage = paging.getPaging(totalCount, false);
%>
<%!
public String commify(int n) {
	DecimalFormat formater = new DecimalFormat("###,###,###,###,###,###,###");
	return formater.format(n);
}
%>
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

function updateBookingDate(reserveseq){
	var status = $("#bookingDate").val();

	$.ajax({
	  url: "/_admin/order/ajax/ajax_status_update.jsp?tablename=tb_golflink_reserve&reserveseq="+reserveseq+"&colname=booking_date&status="+status,
	  cache: false,
	  async: false,
	  success: function(html){
		var evalData = eval("("+html+")");
		if(evalData.reserveResult.length == 1){
			if(evalData.reserveResult[0].a == "1"){
				alert("수정 되었습니다.");
			}else if(evalData.reserveResult[0].a == "0"){
				alert("수정 실패 했습니다.");
			}			
		}
	  }
	});
}

function updatePerCnt(reserveseq){
	var status = $("#perCnt").val();

	$.ajax({
	  url: "/_admin/order/ajax/ajax_status_update.jsp?tablename=tb_golflink_reserve&reserveseq="+reserveseq+"&colname=per_num&status="+status,
	  cache: false,
	  async: false,
	  success: function(html){
		var evalData = eval("("+html+")");
		if(evalData.reserveResult.length == 1){
			if(evalData.reserveResult[0].a == "1"){
				alert("수정 되었습니다.");
			}else if(evalData.reserveResult[0].a == "0"){
				alert("수정 실패 했습니다.");
			}			
		}
	  }
	});
}

function updatePrice(reserveseq){
	var status = $("#Price").val();

	$.ajax({
	  url: "/_admin/order/ajax/ajax_status_update.jsp?tablename=tb_golflink_reserve&reserveseq="+reserveseq+"&colname=product_price&status="+status,
	  cache: false,
	  async: false,
	  success: function(html){
		var evalData = eval("("+html+")");
		if(evalData.reserveResult.length == 1){
			if(evalData.reserveResult[0].a == "1"){
				alert("수정 되었습니다.");
			}else if(evalData.reserveResult[0].a == "0"){
				alert("수정 실패 했습니다.");
			}			
		}
	  }
	});
}

function updateStatus(reserveseq){
	var status = $("#ddlStatus").val();

	$.ajax({
	  url: "/_admin/order/ajax/ajax_status_update.jsp?tablename=tb_golflink_reserve&reserveseq="+reserveseq+"&colname=process_status&status="+status,
	  cache: false,
	  async: false,
	  success: function(html){
		var evalData = eval("("+html+")");
		if(evalData.reserveResult.length == 1){
			if(evalData.reserveResult[0].a == "1"){
				alert("수정 되었습니다.");
			}else if(evalData.reserveResult[0].a == "0"){
				alert("수정 실패 했습니다.");
			}			
		}
	  }
	});
}

function on_search() {

	var frm = document.frm;
	if(!$('#keyword').val()) {
		alert('검색어를 입력하시기 바랍니다.');
		$('#keyword').focus();
		return;
	} 
	frm.action="pre_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="pre_list.jsp"
	frm.submit();
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 사전예약현황 ★</td>
  </tr>
  <tr>
    <td><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center" width="1851"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" align="center" width="120" height="25"><span class=normal_b>예약신청일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="100"><span class=normal_b>예약자</span></td>
          <td bgcolor="#e6e7e8" align="center" width="195"><span class=normal_b>아이디</span></td>
          <td bgcolor="#E6E7E8" align="center" width="223"><span class=normal_b>골프장명</span></td>
          <td bgcolor="#e6e7e8" align="center" width="200"><span class=normal_b>부킹일시</span></td>
          <td bgcolor="#E6E7E8" align="center" width="130"><span class=normal_b>인원/팀</span></td>
          <td bgcolor="#e6e7e8" align="center" width="103"><span class=normal_b>연락처</span></td>
          <td bgcolor="#e6e7e8" align="center" width="150"><span class=normal_b>금액</span></td>
          <td bgcolor="#E6E7E8" align="center" width="150"><span class=normal_b>처리상태</span></td>
          <td bgcolor="#E6E7E8" align="center" width="199"><span class=normal_b>SMS</span></td>
        </tr>
<%
if(list != null){
	for(int i = 0; i < list.size();i++){
		String vbookingDate = list.get(i).getBooking_day() + list.get(i).getBooking_time();
		vbookingDate = vbookingDate.substring(0,4)
				+ "-" + vbookingDate.substring(4,6)
				+ "-" + vbookingDate.substring(6,8)
				+ " " + vbookingDate.substring(8,10)
				+ "~" + vbookingDate.substring(10,12);				 
%>
        <tr>
          <td bgcolor="white" align="center" height="45"><%=list.get(i).getReserve_day() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_name() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_uid() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getGolflink_name() %></td>
          <td align="center" bgcolor="white">
          	<input id="bookingDate" name="bookingDate" type="text" size="16" value="<%=vbookingDate %>" class="input_box">
          	<img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0" style="cursor:pointer" onclick="updateBookingDate('<%=list.get(i).getReserve_seq()%>');">
          </td>
          <td align="center" bgcolor="white">
          	<input type="text" id="perCnt" name="perCnt" size="1" maxlength="2" value="<%=list.get(i).getPer_num() %>" class="input_box">명/<input type="text" id="perTeam" name="perTeam" size="1" maxlength="2" readonly value="1" class="input_box">팀
          	<img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0" style="cursor:pointer" onclick="updatePerCnt('<%=list.get(i).getReserve_seq()%>');">
          </td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_phone() %></td>
          <td align="center" bgcolor="white">
          	<input id="Price" name="Price" type="text" size="10" value="<%=commify(list.get(i).getProduct_price()) %>" class="input_box">
          	<img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0" style="cursor:pointer" onclick="updatePrice('<%=list.get(i).getReserve_seq()%>');">
          </td>
          <td align="center" bgcolor="white">
              <select id="ddlStatus" name="ddlStatus" size="1">
				<option value="0" <%=("0".equals(list.get(i).getProcess_status())?" selected":"")%>>예약대기</option>
				<option value="1" <%=("1".equals(list.get(i).getProcess_status())?" selected":"")%>>예약완료</option>
				<option value="2" <%=("2".equals(list.get(i).getProcess_status())?" selected":"")%>>취소불가</option>
				<option value="3" <%=("3".equals(list.get(i).getProcess_status())?" selected":"")%>>예약취소</option>
              </select>
              <img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0" style="cursor:pointer" onclick="updateStatus('<%=list.get(i).getReserve_seq()%>');"></td>
          <td align="center" bgcolor="white" width="199"><img align="absmiddle" src="../images/common/btn_r_finished.gif" width="50" height="16" border="0"> &nbsp;<img align="absmiddle" src="../images/common/btn_cancel.gif" width="34" height="16" border="0"> &nbsp;<img align="absmiddle" src="../images/common/btn_oneday.gif" width="59" height="16" border="0"></td>
        </tr>
<%
	}
}
%>
      </table></td>
  </tr>  
  <tr>
    <td align="center" style="padding-top:50px;padding-bottom:40px;">
		<table border="0" cellpadding="0" cellspacing="0" width="50%">
		<tr>
		  <td height="50" align="center"><p><span class=normal_b><%=strPage%></span></p></td>
		</tr>
		<tr>
		  <td height="4" align="center">&nbsp;</td>
		</tr>
		<form name="frm" method="post" action="pre_list.jsp">
		<input type="hidden" name="npage" value="<%=npage%>"/>
		<tr>
		  <td height="4" align="center"><select id="field" name="field" size="1">
		      <option>선택하세요</option>
              <option value="golflink_name"<%=("golflink_name".equals(field)?" selected":"")%>>골프장</option>
              <option value="reserve_day"<%=("reserve_day".equals(field)?" selected":"")%>>부킹일</option>
              <option value="reserve_name"<%=("reserve_name".equals(field)?" selected":"")%>>예약자</option>
              <option value="product_price"<%=("product_price".equals(field)?" selected":"")%>>금액</option>
              <option value="process_status"<%=("process_status".equals(field)?" selected":"")%>>처리상태</option>
		    </select>
            <input id="keyword" name="keyword" value="<%=keyword%>" type="text" size="15" class="input_box">
		    <input id="searchOk" name="searchOk" type="image" src="../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle" onclick="on_search();"></td>
		</tr>
		</form>
		 </table>
	</td>
  </tr>
</table>
</body>
</html>