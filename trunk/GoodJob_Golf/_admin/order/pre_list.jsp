<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.util.Utils"%>
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
<%
String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
String field = StringUtils.trimToEmpty(request.getParameter("field"));
String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));

PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , ORDER.per_page );

com.goodjob.member.MemberDao mDao = new com.goodjob.member.MemberDao();

Map<String,String> params = new HashMap<String,String>();
params.put("menu_seq", "2");
params.put("npage",npage);
params.put("field",field);
params.put("keyword",keyword);

GolfLinkDao glList = new GolfLinkDao();
List<GolfLinkDto> list = glList.getList("tb_golflink_reserve",params);

int totalCount = glList.getTotalCount("tb_golflink_reserve" , params);

String strPage = paging.getPaging(totalCount, false);

if(field.equals("reserve_seq")){
	keyword = "";
}
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
	var status = $("#bookingDate"+ reserveseq).val() + " "
			+$("#bookingTime_s_h"+reserveseq).val() + $("#bookingTime_s_t"+reserveseq).val()
			+":"+$("#bookingTime_e_h"+reserveseq).val()+$("#bookingTime_e_t"+reserveseq).val();

	$.ajax({
	  url: "/_admin/order/ajax/ajax_status_update.jsp?tablename=tb_golflink_reserve&reserveseq="+reserveseq+"&colname=booking_time&status="+status,
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
	var status = $("#perCnt"+reserveseq).val();

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
	var status = $("#Price"+reserveseq).val();

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
	var status = $("#ddlStatus"+reserveseq).val();

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
<table align="center" border="0" cellpadding="0" cellspacing="0" width="1520">
  <tr>
    <td class=title>★ 사전예약현황 ★</td>
  </tr>
  <tr>
    <td><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center" width="1520"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" align="center" width="130" height="25"><span class=normal_b>예약신청일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="100"><span class=normal_b>예약자</span></td>
          <td bgcolor="#e6e7e8" align="center" width="130"><span class=normal_b>아이디</span></td>
          <td bgcolor="#E6E7E8" align="center" width="180"><span class=normal_b>골프장명</span></td>
          <td bgcolor="#e6e7e8" align="center" width="180"><span class=normal_b>부킹일시</span></td>
          <td bgcolor="#E6E7E8" align="center" width="130"><span class=normal_b>인원/팀</span></td>
          <td bgcolor="#e6e7e8" align="center" width="100"><span class=normal_b>연락처</span></td>
          <td bgcolor="#e6e7e8" align="center" width="100"><span class=normal_b>상품권</span></td>
          <td bgcolor="#e6e7e8" align="center" width="150"><span class=normal_b>금액</span></td>
          <td bgcolor="#E6E7E8" align="center" width="150"><span class=normal_b>처리상태</span></td>
          <td bgcolor="#E6E7E8" align="center" width="60"><span class=normal_b>SMS</span></td>
          <td align="center" bgcolor="#E6E7E8" width="120"><span class=normal_b>추천인</span></td>
        </tr>
<%
if(list != null){
	for(int i = 0; i < list.size();i++){
		String vbookingDate = list.get(i).getBooking_day();
		vbookingDate = vbookingDate.substring(0,4)
				+ "-" + vbookingDate.substring(4,6)
				+ "-" + vbookingDate.substring(6,8);	
		
		String vbookingTime_s = "";
		String vbookingTime_s_1 = "";
		String vbookingTime_s_2 = "";
		if(list.get(i).getBooking_time_s() != null) {
			vbookingTime_s = list.get(i).getBooking_time_s();
			if(vbookingTime_s.length() > 0){
				vbookingTime_s_1 = vbookingTime_s.substring(0,2);
				vbookingTime_s_2 = vbookingTime_s.substring(2,4);
			}
		}
		
		String vbookingTime_e = "";
		String vbookingTime_e_1 = "";
		String vbookingTime_e_2 = "";
		if(list.get(i).getBooking_time_e() != null){
			vbookingTime_e = list.get(i).getBooking_time_e();
			if(vbookingTime_e.length() > 0){
				vbookingTime_e_1 = vbookingTime_e.substring(0,2);
				vbookingTime_e_2 = vbookingTime_e.substring(2,4);
			}
		}
%>
        <tr>
          <td bgcolor="white" align="center" height="45"><%=list.get(i).getReserve_day() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_name() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_uid() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getGolflink_name() %></td>
          <td align="center" bgcolor="white">
          	<table width="100%">
          	<tr>
          	<td>
          		<input id="bookingDate<%=list.get(i).getReserve_seq()%>" name="bookingDate" type="text" size="16" value="<%=vbookingDate %>" class="input_box">
          	</td>
          	<td>
          		<img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0" style="cursor:pointer" onclick="updateBookingDate('<%=list.get(i).getReserve_seq()%>');">
          	</td>
          	</tr>          	
          	<td colspan="2">
          		<input id="bookingTime_s_h<%=list.get(i).getReserve_seq()%>" name="bookingTime_s_h" type="text" size="2" value="<%=vbookingTime_s_1 %>" class="input_box" maxlength="2">시
          		<input id="bookingTime_s_t<%=list.get(i).getReserve_seq()%>" name="bookingTime_s_t" type="text" size="2" value="<%=vbookingTime_s_2 %>" class="input_box" maxlength="2">분
          		~
          		<input id="bookingTime_e_h<%=list.get(i).getReserve_seq()%>" name="bookingTime_e_h" type="text" size="2" value="<%=vbookingTime_e_1 %>" class="input_box" maxlength="2">시
          		<input id="bookingTime_e_t<%=list.get(i).getReserve_seq()%>" name="bookingTime_e_t" type="text" size="2" value="<%=vbookingTime_e_2 %>" class="input_box" maxlength="2">분
          	</td>
          	<tr>
          	</tr>
          	</table>
          </td>
          <td align="center" bgcolor="white">
          	<input type="text" id="perCnt<%=list.get(i).getReserve_seq()%>" name="perCnt" size="1" maxlength="2" value="<%=list.get(i).getPer_num() %>" class="input_box">명/<input type="text" id="perTeam" name="perTeam" size="1" maxlength="2" readonly value="1" class="input_box">팀
          	<img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0" style="cursor:pointer" onclick="updatePerCnt('<%=list.get(i).getReserve_seq()%>');">
          </td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_phone() %></td>
          <td align="right" bgcolor="white"><span class=blue><%=commify(list.get(i).getCoupon_price()) %> 원</span></td>
          <td align="center" bgcolor="white">
          	<input id="Price<%=list.get(i).getReserve_seq()%>" name="Price" type="text" size="10" value="<%=commify(list.get(i).getProduct_price()) %>" class="input_box">
          	<img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0" style="cursor:pointer" onclick="updatePrice('<%=list.get(i).getReserve_seq()%>');">
          </td>
          <td align="center" bgcolor="white">
              <select id="ddlStatus<%=list.get(i).getReserve_seq()%>" name="ddlStatus" size="1">
				<option value="0" <%=("0".equals(list.get(i).getProcess_status())?" selected":"")%>>예약대기</option>
				<option value="1" <%=("1".equals(list.get(i).getProcess_status())?" selected":"")%>>예약완료</option>
				<option value="2" <%=("2".equals(list.get(i).getProcess_status())?" selected":"")%>>취소불가</option>
				<option value="3" <%=("3".equals(list.get(i).getProcess_status())?" selected":"")%>>예약취소</option>
              </select>
              <img align="absmiddle" src="../images/common/btn_save3.gif" width="28" height="16" border="0" style="cursor:pointer" onclick="updateStatus('<%=list.get(i).getReserve_seq()%>');"></td>
          <td align="center" bgcolor="white"><img align="absmiddle" src="../images/common/btn_r_finished.gif" width="50" height="16" border="0" onclick="NewWindow('pop/sms_send.jsp?menu=2&seq=<%=list.get(i).getReserve_seq()%>&msgtxt=<%=Utils.encoder(list.get(i).getGolflink_name()) %>&msgtime=<%=vbookingDate +" " + vbookingTime_s_1 +":" + vbookingTime_s_2 %>','name','740','350','yes');return false;">
          <td align="center" bgcolor="white"><span class=blue_s><%=mDao.getRecommend(list.get(i).getReserve_uid())%></span></td>
		  </td>
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
		    <input id="searchOk" name="searchOk" type="image" src="../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle" onclick="on_search();">
		  </td>
		</tr>
        <tr>
        <td height="4" >
        	부킹일 ("~2012-01-01" 2012년 1월 1일 까지 검색) </br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;("2012-01-01~" 2012년 1월 1일 부터 검색) </br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;("2011-01-01~2011-12-31" 2011년 전체 검색) </br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;("2011-01-01" 당일 하루 검색) </br>
        	처리상태 (예약대기:0, 예약완료:1, 취소불가:2, 예약취소:3) </br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ex)예약취소건 조회시 => 3
        </td>
        </tr>
		</form>
		 </table>
	</td>
  </tr>
</table>
</body>
</html>