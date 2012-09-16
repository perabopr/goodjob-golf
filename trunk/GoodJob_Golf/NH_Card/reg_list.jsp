<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.mypage.*"%>
<%@page import="com.goodjob.reserve.dto.*"%>
<%@ page import="com.goodjob.util.Utils" %>
<%
	
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
	String field = StringUtils.trimToEmpty(request.getParameter("field"));
	String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));
	
	String reserve_name = StringUtils.defaultString(request.getParameter("reserve_name"),"");
	
	String reserve_phone = StringUtils.defaultString(request.getParameter("reserve_phone"),"");
	
	if(reserve_phone.length() == 0){
		reserve_phone = StringUtils.trimToEmpty(request.getParameter("phone1"))+"-"+
						StringUtils.trimToEmpty(request.getParameter("phone2"))+"-"+
						StringUtils.trimToEmpty(request.getParameter("phone3"));
	}
	
	String startDt = StringUtils.trimToEmpty(request.getParameter("startDt"));
	String endDt = StringUtils.trimToEmpty(request.getParameter("endDt"));
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , 10 );
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("startDt",startDt);
	params.put("endDt",endDt);
	params.put("reserve_name",reserve_name);
	params.put("reserve_phone",reserve_phone);
	
	System.out.println("endDt : "+ endDt);
	System.out.println("startDt : "+ startDt);
	System.out.println("reserve_name : "+ reserve_name);
	System.out.println("reserve_phone : "+ reserve_phone);
	
	MyPageDao myDao = new MyPageDao();
	
	//골프장
	List<GolfLinkReserveDto> golfList = myDao.getNHReserveList(params);
	
	int totalCount = myDao.getNHReserveTotal(params);
	
	String strPage = paging.getPaging(totalCount, false);
	
%>
<!-- 상단 영역 -->
<%@ include file="/include/header_nhcard.jsp" %>
<%@ include file="/cfg/site_conf_inc_nh.jsp" %>
<link href="/kcp/css/sample.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%= g_conf_js_url %>"></script>
<!-- 상단 영역 -->
<script language="javascript">

var startDt = '<%=startDt%>';
var endDt = '<%=endDt%>';

$(function() {
	$( "#startDt" ).datepicker({dateFormat:'yy-mm-dd'});
	$( "#endDt" ).datepicker({dateFormat:'yy-mm-dd'});
	
	$("#istartDt").click(
		function(){
			$( "#startDt" ).datepicker("show");
		}
	);
	$("#iendDt").click(
		function(){
			$( "#endDt" ).datepicker("show");
		}
	);
});

function mypage_search() {

	if(!$('#startDt').val()) {
		alert('검색 시작일을 입력해주세요!');
		$('#startDt').focus();
		return;
	}

	if(!$('#endDt').val()) {
		alert('검색 종료일을 입력해주세요!');
		$('#endDt').focus();
		return;
	}

	var frm = document.frm;
	frm.action="reg_list.jsp"
	frm.submit();
}

function card_order(process_status, menu, reserve_seq, good_price, good_name, reserve_name, mtel, ordEmail){

	if(good_price == '' || good_price == '0'){
		alert("결제 금액이 없습니다.");
		return;
	}
	
	var frm = document.order_info;

	$("#buyr_name").val(good_name);
	$('#good_mny').val(good_price);
	$('#menu').val(menu);
	$('#reserve_seq').val(reserve_seq);
	$('#process_status').val(process_status);

	$('#reserve_name').val(reserve_name);
	$('#mtel').val(mtel);
	$('#buyr_mail').val(ordEmail);
	$('#buyr_tel1').val(mtel);
	$('#buyr_tel2').val(mtel);
	
	init_orderid();
	jsf__pay( frm );
}

// 플러그인 설치(확인)
StartSmartUpdate();

/* Payplus Plug-in 실행 */
function  jsf__pay( form )
{
    var RetVal = false;
    
    if( document.Payplus.object == null )
    {
        openwin = window.open( "/kcp/chk_plugin.html", "chk_plugin", "width=420, height=100, top=300, left=300" );
    }

    /* Payplus Plugin 실행 */
    if ( MakePayMessage( form ) == true )
    {
        openwin = window.open( "/kcp/proc_win.html", "proc_win", "width=449, height=209, top=300, left=300" );
        form.submit();
        //RetVal = true ;
    }
    else
    {
        /*  res_cd와 res_msg변수에 해당 오류코드와 오류메시지가 설정됩니다.
            ex) 고객이 Payplus Plugin에서 취소 버튼 클릭시 res_cd=3001, res_msg=사용자 취소값이 설정됩니다.
        */
        res_cd  = document.order_info.res_cd.value ;
        res_msg = document.order_info.res_msg.value ;
        form.submit();
        //alert ( "Payplus Plug-in 실행 결과(샘플)\n" + "res_cd = " + res_cd + "|" + "res_msg=" + res_msg ) ;
    }

    //return RetVal ;
}

/* 주문번호 생성 예제 */
function init_orderid()
{
    var today = new Date();
    var year  = today.getFullYear();
    var month = today.getMonth() + 1;
    var date  = today.getDate();
    var time  = today.getTime();

    if(parseInt(month) < 10) {
        month = "0" + month;
    }

    if(parseInt(date) < 10) {
        date = "0" + date;
    }

    var order_idxx = "NHGLF_" + year + "" + month + "" + date + "" + time;

    $('#ordr_idxx').val(order_idxx);
    
    //document.order_info.ordr_idxx.value = order_idxx;
}

/* onLoad 이벤트 시 Payplus Plug-in이 실행되도록 구성하시려면 다음의 구문을 onLoad 이벤트에 넣어주시기 바랍니다. */
function onload_pay()
{
     if( jsf__pay(document.order_info) )
        document.order_info.submit();
}
</script>
<!-- 상단 영역 -->
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">예약확인</td>
          <td width="50%" height="25" bgcolor="#DCDDDE" style="padding-top:4px; padding-right: 10px;" align="right"><a href="default.jsp"><img align="absmiddle" src="../img_nhcard/common/btn_home.gif" width="60" height="19" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
<form name="order_info" action="/NH_Card/pp_ax_hub.jsp" method="post">
<input type="hidden" id="good_mny" name="good_mny" value=""/>
<input type="hidden" id="buyr_name" name="buyr_name" value=""/>
<input type="hidden" id="buyr_mail" name="buyr_mail" value=""/>
<input type="hidden" id="menu" name="menu" value=""/>
<input type="hidden" id="reserve_seq" name="reserve_seq" value=""/>
<input type="hidden" id="process_status" name="process_status" value=""/>
<input type="hidden" id="reserve_name" name="reserve_name" value=""/>
<input type="hidden" id="mtel" name="mtel" value=""/>
<input type="hidden" id="buyr_tel1" name="buyr_tel1" value=""/>
<input type="hidden" id="buyr_tel2" name="buyr_tel2" value=""/>
<input type="hidden" id="req_tx" name="req_tx" value="pay" />
<input type="hidden" id="site_cd" name="site_cd" value="<%=g_conf_site_cd%>" />
<input type="hidden" id="site_key" name="site_key" value="<%=g_conf_site_key%>" />
<input type="hidden" id="site_name" name="site_name" value="<%=g_conf_site_name%>" />

<input type="hidden" id="ordr_idxx" name="ordr_idxx" value="" />

<input type="hidden" name="pay_method" value="100000000000">
<input type="hidden" name="quotaopt" value="12">
<input type="hidden" name="currency"        value="WON"/>
<input type="hidden" name="site_logo" value="http://www.savekorea.com/images/savekorea_logo_kcp.jpg">
<input type="hidden" name="not_used_card" value="CCKM:CCSG:CCCT:CCHM:CCXX:CCLO:CCPH:CCHN:CCSS:CCKJ:CCSU:CCSH:CCJB:CCCJ:CCKW:CCLG:CCKE:CCDI:CCSB:CCKD:CCCH:CCCU"/>
<input type="hidden" name="module_type"     value="01"/>
<input type="hidden" name="epnt_issu"       value="" />
<input type="hidden" name="res_cd"          value=""/>
<input type="hidden" name="res_msg"         value=""/>
<input type="hidden" name="tno"             value=""/>
<input type="hidden" name="trace_no"        value=""/>
<input type="hidden" name="enc_info"        value=""/>
<input type="hidden" name="enc_data"        value=""/>
<input type="hidden" name="ret_pay_method"  value=""/>
<input type="hidden" name="tran_cd"         value=""/>
<input type="hidden" name="bank_name"       value=""/>
<input type="hidden" name="bank_issu"       value=""/>
<input type="hidden" name="use_pay_method"  value=""/>

<!--  현금영수증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->
<input type="hidden" name="cash_tsdtime"    value=""/>
<input type="hidden" name="cash_yn"         value=""/>
<input type="hidden" name="cash_authno"     value=""/>
<input type="hidden" name="cash_tr_code"    value=""/>
<input type="hidden" name="cash_id_info"    value=""/>
	
</form>
<form name="frm" method="post">
<input type="hidden" id="reserve_name" name="reserve_name" value="<%=reserve_name%>"/>
<input type="hidden" id="reserve_phone" name="reserve_phone" value="<%=reserve_phone%>"/>
  <tr>
    <td align="center" height="60"><img align="absmiddle" src="../images/mypage/img_search_title_s.gif" width="50" height="19" border="0"> <a href="#"><img align="absmiddle" id="istartDt" src="../images/common/btn_calendar_left.gif" width="22" height="21"></a>&nbsp;
      <input type="text" class="input_01" size="13" id="startDt" name="startDt" value="<%=startDt%>" readonly/>
      &nbsp;&nbsp;~&nbsp;&nbsp; <a href="#"><img align="absmiddle" id="iendDt" src="../images/common/btn_calendar_right.gif" width="22" height="21"></a>&nbsp;
      <input type="text" class="input_01" size="13" id="endDt" name="endDt" value="<%=endDt%>" readonly/>
      <a href="javascript:mypage_search();"><img align="absmiddle" src="../images/mypage/btn_search.gif" width="38" height="19" border="0"></a></td>
  </tr>
</form>
  <tr>
    <td align="center"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#CCCCCC">
        <tr>
          <td bgcolor="#F1F1F1" align="center" height="25" class=m_title_b width="75">예약신청일</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="92">부킹날짜/시간</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="215">골프장명</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="53">코스</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="71">금액</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="51">인원/팀</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="56">예약구분</td>
          <td bgcolor="#F1F1F1" align="center" class=m_title_b width="59">처리상태</td>
        </tr>
<%
																			
GolfLinkReserveDto golfDto;
if(golfList != null && !golfList.isEmpty()){
	
	int size = golfList.size();
	String booking_time = "";
	for(int i = 0 ; i < size ; i++){
		
		golfDto = golfList.get(i);
		
		booking_time = golfDto.getBooking_time_s().substring(0,2)+":"+golfDto.getBooking_time_s().substring(2,4);
%>
        <tr>
	        <td height="35" bgcolor="white" align="center" class=m_title><%=golfDto.getReserve_day()%></td>
			<td bgcolor="white" align="center" class=m_title>
			<span class=<%=Utils.getIsWeek(golfDto.getBooking_day())%>>
			<%=Utils.dateFormat(golfDto.getBooking_day(),".")%> <%=booking_time%></span>
			</td>
	        <td bgcolor="white" class=m_title_blue style="padding-left:7px;padding-right:7px;"><%=golfDto.getGolflink_name()%></td>
	        <td bgcolor="white" align="center" class=m_title><%=(StringUtils.defaultIfEmpty(golfDto.getGolflink_course(),""))%></td>
	        <td bgcolor="white" align="center" class=m_title_red><%=Utils.numberFormat(golfDto.getProduct_price())%>원</td>
	        <td bgcolor="white" align="center" class=m_title><%=golfDto.getPer_num()%>명/1팀</td>
	        <td bgcolor="white" align="center"><%=(golfDto.getMenu_seq()==1?"<span class=m_title_pink>실시간</span>":"<span class=m_title_green>사전신청</span>")%></td>
			<td bgcolor="white" align="center">
			<%
			if("0".equals(golfDto.getProcess_status())){
			%>
			<a href="javascript:card_order('1','<%=golfDto.getMenu_seq()%>','<%=golfDto.getReserve_seq()%>','<%=golfDto.getProduct_price()%>','<%=golfDto.getGolflink_name()%>','<%=golfDto.getReserve_name()%>','<%=golfDto.getReserve_phone()%>','<%=golfDto.getReserve_uid()%>');">
			<img align="absmiddle" src="/images/mypage/btn_pay.gif" width="56" height="16" border="0"></a>
			<%}
			else if("1".equals(golfDto.getProcess_status()))
				out.println("<span class=m_title_blue>예약완료</span>");
			else if("2".equals(golfDto.getProcess_status()))
				out.println("<span class=m_title_red>취소불가</span>");
			else if("3".equals(golfDto.getProcess_status()))
				out.println("<span class=m_title_red>예약취소</span>");
			%></td>
        </tr>
<%
		}
	}
%>
      </table></td>
  </tr>
  <tr>
    <td style="padding-top: 10px; padding-bottom: 20px"> 고객님께서 예약하신 내역입니다<br>
      변동사항이나 예약취소를 원하실 경우 <span class=blue_list>고객센터(02-6670-4321)</span>로 연락주시면 빠른시일내에 처리해 드리겠습니다. 감사합니다.</td>
  </tr>
  <tr>
    <td align="center" style="padding-top: 30px; padding-bottom: 30px"><p><%=strPage%></p></td>
  </tr>
</table>
<script type="text/javascript">
init_orderid();
</script>
<!-- 하단 footer  -->
<%@ include file="/include/footer_nhcard.jsp" %>
<!-- 하단 footer  -->