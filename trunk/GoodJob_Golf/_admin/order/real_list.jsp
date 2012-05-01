<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.util.Utils"%>
<%@page import="java.net.URLEncoder"%>
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
params.put("menu_seq", "1");
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
	frm.action="real_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="real_list.jsp"
	frm.submit();
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="1500">
  <tr>
    <td class=title>★ 실시간예약현황 ★</td>
  </tr>
  <tr>
    <td><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center" width="1500"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
        <tr>
          <td bgcolor="#e6e7e8" height="25" align="center" width="130"><span class=normal_b>예약신청일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="100"><span class=normal_b>예약자</span></td>
          <td bgcolor="#e6e7e8" align="center" width="150"><span class=normal_b>아이디</span></td>
          <td width="200" align="center" bgcolor="#E6E7E8"><span class=normal_b>골프장명</span></td>
          <td bgcolor="#e6e7e8" align="center" width="130"><span class=normal_b>부킹일시</span></td>
          <td bgcolor="#E6E7E8" align="center" width="60"><span class=normal_b>인원/팀</span></td>
          <td bgcolor="#e6e7e8" align="center" width="80"><span class=normal_b>코스</span></td>
          <td bgcolor="#e6e7e8" align="center" width="120"><span class=normal_b>연락처</span></td>
          <td align="center" bgcolor="#e6e7e8" width="60"><span class=normal_b>상품권</span></td>
          <td align="center" bgcolor="#e6e7e8" width="70"><span class=normal_b>입금액</span></td>
          <td align="center" bgcolor="#E6E7E8" width="140"><span class=normal_b>처리상태</span></td>
          <td align="center" bgcolor="#E6E7E8" width="80"><span class=normal_b>SMS</span></td>
          <td align="center" bgcolor="#E6E7E8" width="50"><span class=normal_b>메모</span></td>
          <td align="center" bgcolor="#E6E7E8" width="180"><span class=normal_b>추천인</span></td>
        </tr>
<%
if(list != null){
	for(int i = 0; i < list.size();i++){
		String vbookingDate = list.get(i).getBooking_day() + list.get(i).getBooking_time_s();
		vbookingDate = vbookingDate.substring(0,4)
				+ "-" + vbookingDate.substring(4,6)
				+ "-" + vbookingDate.substring(6,8)
				+ " " + vbookingDate.substring(8,10)
				+ ":" + vbookingDate.substring(10,12);
		
%>
        <tr>
          <td bgcolor="white" align="center" height="25"><%=list.get(i).getReserve_day() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_name() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_uid().indexOf("@") > 0 ? list.get(i).getReserve_uid() : list.get(i).getReserve_uid() + "<font color='blue'>NH</font>" %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getGolflink_name() %></td>
          <td align="center" bgcolor="white"><span class=<%=Utils.getIsWeek(vbookingDate.substring(0,10))%>><%=vbookingDate %></span></td>
          <td align="center" bgcolor="white"><%=list.get(i).getPer_num() %>명/1팀</td>
          <td align="center" bgcolor="white"><%=list.get(i).getGolflink_course() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_phone() %></td>
          <td align="right" bgcolor="white"><span class=blue><%=commify(list.get(i).getCoupon_price()) %> 원</span></td>
          <td align="right" bgcolor="white"><span class=orange><%=commify(list.get(i).getProduct_price()) %> 원</span></td>
          <td align="center" bgcolor="white"><select id="ddlStatus<%=list.get(i).getReserve_seq()%>" name="ddlStatus" size="1">
              <option value="0" <%=("0".equals(list.get(i).getProcess_status())?" selected":"")%>>예약대기</option>
              <option value="1" <%=("1".equals(list.get(i).getProcess_status())?" selected":"")%> style="color:blue">예약완료</option>
              <option value="2" <%=("2".equals(list.get(i).getProcess_status())?" selected":"")%> style="color:blue">취소불가</option>
              <option value="3" <%=("3".equals(list.get(i).getProcess_status())?" selected":"")%> style="color:red">예약취소</option>
            </select>
            <img src="../images/common/btn_save2.gif" width="32" height="16" border="0" align="absmiddle" style="cursor:pointer" onclick="updateStatus('<%=list.get(i).getReserve_seq()%>');"></td>
          <td align="center" bgcolor="white">
	          <img align="absmiddle" src="../images/common/btn_r_finished.gif" width="50" height="16" border="0" onclick="NewWindow('pop/sms_send.jsp?menu=1&seq=<%=list.get(i).getReserve_seq()%>&msgtxt=<%=Utils.encoder(list.get(i).getGolflink_name())%>&msgtime=<%=vbookingDate %>','name','740','350','yes');return false;">
          </td>
          <TD bgColor=white align=center><input type="button" value="메모" onclick="NewWindow('/_admin/member/order_memo.jsp?mem_id=<%=list.get(i).getReserve_uid()%>','name','760','300','yes');"/></TD>
          <td align="center" bgcolor="white"><span class=blue><%=mDao.getRecommend(list.get(i).getReserve_uid())%></span></td>
        </tr>
<%
	}
}
%>
      </table></td>
  </tr>
  <tr>
    <td align="center" style="padding-top:50px;padding-bottom:40px;"><table border="0" cellpadding="0" cellspacing="0" width="50%">
        <tr>
          <td height="50" align="center"><p><span class=normal_b><%=strPage%></span></p></td>
        </tr>
        <tr>
          <td height="4" align="center">&nbsp;</td>
        </tr>
        <form name="frm" method="post" action="real_list.jsp">
        <input type="hidden" name="npage" value="<%=npage%>"/>
        <tr>
          <td height="4" align="center"><select id="field" name="field" size="1">
              <option>선택하세요</option>
              <option value="golflink_name"<%=("golflink_name".equals(field)?" selected":"")%>>골프장</option>
              <option value="reserve_day"<%=("reserve_day".equals(field)?" selected":"")%>>부킹일</option>
              <option value="reserve_name"<%=("reserve_name".equals(field)?" selected":"")%>>예약자</option>
              <option value="product_price"<%=("product_price".equals(field)?" selected":"")%>>금액</option>
              <option value="process_status"<%=("process_status".equals(field)?" selected":"")%>>처리상태</option>
              <option value="recommend"<%=("recommend".equals(field)?" selected":"")%>>추천인</option>
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
      </table></td>
  </tr>
</table>
</body>
</html>
