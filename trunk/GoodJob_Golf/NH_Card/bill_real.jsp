<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.reserve.dto.ProductReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.util.Utils"%>
<%
String menu = "1";
int productsubSeq = NumberUtils.toInt(request.getParameter("gcId"), 0);
int golf = NumberUtils.toInt(request.getParameter("golf"), 0);
int date = NumberUtils.toInt(request.getParameter("date"), 0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"), 0);

String rName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String rPhone = StringUtils.trimToEmpty(request.getParameter("reservePhone"));
String rEmail = StringUtils.trimToEmpty(request.getParameter("reserveEmail"));
String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));

//사용자정보.
String user_Name = StringUtils.trimToEmpty((String)session.getAttribute("mem_name"));
String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));

if(productsubSeq == 0 || golf == 0 || date == 0 || cdate == 0){
	out.println("<script>location.href='reserve.jsp?menu=1'</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> listPr = glDao.getGolfProduct(productsubSeq);

//=================적립금 가져 오기..
int site_save_price = glDao.getSiteSavePrice(productsubSeq , 3);

ProductReserveDto prDto = null;
if(listPr == null || listPr.size() != 1){
	out.println("<script>location.href='reserve.jsp?menu=1'</script>");
	return;
}
prDto = listPr.get(0);

String bookingDate = prDto.getProduct_date();
String bookingTime = prDto.getTime_start();
bookingDate = bookingDate.substring(0,4) + "-" + bookingDate.substring(4,6) + "-" + bookingDate.substring(6,8) + " ";
bookingDate += bookingTime.substring(0,2) + ":" + bookingTime.substring(2,4); 
int buyPrice = prDto.getNH_price() + prDto.getReal_nh_price();// * 4;


/* ----- 쿠폰 ----- */
CouponDao cpDao = new CouponDao();
List<CouponDto> couponList = null;
if(prDto.getCoupon_use_yn().equals("1")){
	couponList = cpDao.getUserCouponList(user_Id, "0", true);
}
%>

<script language="javascript" src="/js/money.js"></script>
<script type="text/javascript">
<!--
function reSetDate(){
	location.href = "/NH_Card/detail.jsp?menu=1&golf=<%=golf%>&date=<%=date%>&cdate=<%=cdate%>";
}

function billok(){
	var chkBool = true;
	if($("#reserveName").val().length == 0){
		alert("예약자명을 입력하세요");
		$("#reserveName").focus();
		return;
	}
	if($("#phone1").val().length == 0){
		chkBool = false;
	}
	if($("#phone2").val().length == 0){
		chkBool = false;
	}
	if($("#phone3").val().length == 0){
		chkBool = false;
	}
	if(!chkBool){
		alert("연락처를 입력하세요.");
		return ;
	}
	var rEmail = $("#email1").val()+"@"+$("#email2").val();
	if($("#email1").val().length == 0 && $("#email2").val().length == 0){
		alert("E-Mail을 입력하세요.");
		return ;
	}
	
	$("#menu").val("<%=menu%>");
	$("#gcId").val("<%=productsubSeq%>");
	$("#golf").val('<%=golf%>');
	$("#date").val('<%=date%>');
	$("#cdate").val('<%=cdate%>');

	$("#reserveEmail").val(rEmail);	
	
	if($("#billBtype").attr("checked")){
		if(window.confirm("예약을 완료하시려면 확인 버튼을 누르십시오 \r\n예약확인 SMS : "+$("#phone1").val()+$("#phone2").val()+$("#phone3").val())){
			billSubmit("");
		}
	}else{
		var billprice = <%=buyPrice%> * $("#perNum").val();
		card_order('1','',billprice,'<%=prDto.getGolflink_name()%>');
	}
}

function billSubmit(cbNum){
	$("#cbNum").val(cbNum);
	var frm = document.exefrm;
	frm.target =  "ifr_hidden"; 
	frm.action = "exe_real.jsp";
	frm.submit();
}

function priceChange(){
	var billprice = <%=buyPrice%> * $("#perNum").val();
	var save_price = <%=site_save_price%> * $("#perNum").val();
		billprice = commify(billprice);

	$("#billPrice").html(billprice);
	$("#buyPrice").val(billprice);

	$("#savePrice").html(save_price);
	$("#save_price").val(save_price);
}

function commify(n) {
  var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
  n += '';                          // 숫자를 문자열로 변환

  while (reg.test(n))
    n = n.replace(reg, '$1' + ',' + '$2');

  return n;
}

$(function(){
	$("#chkRealName").click(function(){		
		if(this.checked){
			document.getElementById("reserveName").readOnly = true;
			$("#reserveName").val("<%=user_Name%>");
		}else{
			document.getElementById("reserveName").readOnly = false;
			$("#reserveName").val("");
		}
	});
});

function sel_phone1(){
	$("#phone2").focus();
}

function sel_phone2(){
	var ph_num = $("#phone2").val();
	if(ph_num.length >= 4){
		$("#phone3").focus();
	}
}

function emaildomain(){
	$("#email2").val($("#ddlEmail").val());
}

function card_order(menu , reserve_seq , good_price , good_name){
	
	if(good_price == '' || good_price == '0'){
		alert("결제 금액이 없습니다.");
		return;
	}
	var frm = document.order_frm;
	
	$("#good_name").val(good_name);
	$('#good_price').val(good_price);
	$('#menu').val(menu);
	$('#reserve_seq').val(reserve_seq);
	$('#reserve_name').val($("#reserveName").val());
	var phone = $("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val();
	$('#mtel').val(phone);

	var rEmail = $("#email1").val()+"@"+$("#email2").val();
	$('#ordEmail').val(rEmail);
	
	var win_pop = window.open("","order_pop","width=650,height=700,scrollbars=no");
	frm.target =  "order_pop"; 
	frm.action = "./chk_plugin.jsp";
	frm.submit();
}

//-->
</script>
<form name="order_frm" method="post">
<input type="hidden" id="good_name" name="good_name" value=""/>
<input type="hidden" id="good_price" name="good_price" value=""/>
<input type="hidden" id="menu" name="menu" value=""/>
<input type="hidden" id="reserve_seq" name="reserve_seq" value=""/>
<input type="hidden" id="reserve_name" name="reserve_name" value=""/>
<input type="hidden" id="mtel" name="mtel" value=""/>
<input type="hidden" id="reserveEmail" name="reserveEmail" value=""/>
</form>
<FORM NAME="exefrm" METHOD="post">
<input type="hidden" id="menu" name="menu" value="1">
<input type="hidden" id="gcId" name="gcId" >
<input type="hidden" id="golf" name="golf" >
<input type="hidden" id="date" name="date" >
<input type="hidden" id="cdate" name="cdate" >
<input type="hidden" id="cbNum" name="cbNum" >
<input type="hidden" id="bill_price" name="bill_price" value="<%=buyPrice%>"/>
<input type="hidden" id="save_price" name="save_price" value="<%=buyPrice%>"/>
<table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="713"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="50%" style="padding-left: 15px; padding-top: 4px" class=sub_title height="33" bgcolor="#dcddde">실시간예약</td>
          <td width="50%" height="25" bgcolor="#DCDDDE" style="padding-top:4px; padding-right: 10px;" align="right"><a href="default.jsp"><img align="absmiddle" src="../img_nhcard/common/btn_home.gif" width="60" height="19" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="padding-left: 55px;"><img src="../img_nhcard/common/img_real_finished_title.gif" width="556" height="80" border="0"></td>
  </tr>
  <tr>
    <td align="center">
    <table border="0" width="600" cellpadding="0" cellspacing="0">
        <tr>
          <td width="600" colspan="3" bgcolor="#D1D3D4" height="1"></td>
        </tr>
        <tr>
          <td width="169" height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>예약자명</td>
          <td width="1" bgcolor="#D1D3D4"></td>
          <td width="430"  style="padding-left: 10px;"><INPUT id="reserveName" name="reserveName" class=input_01 name=day size=14 value="" style="ime-mode:active;"></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="40" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>핸드폰</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><table border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30">
                <SELECT size=1 id="phone1" name="phone1" onChange="sel_phone1();">
                 <OPTION value="" selected>선택</OPTION>
                           <OPTION value="010">010</OPTION>
                           <OPTION value="011">011</OPTION>
                           <OPTION value="016">016</OPTION>
                           <OPTION value="017">017</OPTION>
                           <OPTION value="018">018</OPTION>
                           <OPTION value="019">019</OPTION>
               </SELECT>
                         -
                         <INPUT class=mem_input id="phone2" name="phone2" onKeyup="sel_phone2();" maxLength=4 size=8>
                         -
                         <INPUT class=mem_input id="phone3" name="phone3" maxLength=4 size=8>
				</td>
              </tr>
              <tr>
                <td class="mem_notice" height="20">입력하신 핸드폰으로 예약사항 내역을 SMS 발송해드립니다 </td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td width="169" height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>E-Mail</td>
          <td width="1" bgcolor="#D1D3D4"></td>
          <td bgcolor="white" style="padding-left:10px;" colspan="3" width="559"><INPUT class=mem_input id="email1" name="email1" size=15 value="">
                      @
                      <INPUT class=mem_input ID="email2" name="email2" size=15 value="">
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
                        <OPTION value="gmail.com">gmail.com</OPTION>
                      </SELECT></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>골프장명</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;" class=blue_list><%=prDto.getGolflink_name() %>
          <input type="hidden" id="golflinkName" name="golflinkName" value="<%=prDto.getGolflink_name() %>"></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>부킹일시</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;">
          <%=bookingDate %> &nbsp;<IMG border=0 align=absMiddle src="/images/booking/btn_back.gif" width=67 height=16 onclick="reSetDate();" style="cursor:hand">
		<input type="hidden" id="bookingDate" name="bookingDate" value="<%=bookingDate %>"></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>코스명</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><%=StringUtils.defaultIfEmpty(prDto.getCourse_name(), "<div class=red_s>없음</div>") %>
          <input type="hidden" id="course_name" name="course_name" value="<%=StringUtils.defaultIfEmpty(prDto.getCourse_name(), "<div class=red_s>없음</div>") %>"></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>인원</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;">
          <select id="perNum" name="perNum" onchange="priceChange();"><option value="3">3</option><option value="4" selected>4</option></select></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>결제금액</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><span class=orange><%=Utils.numberFormat(buyPrice*4) %></span> 원
          <input type="hidden" id="buyPrice" name="buyPrice" value=""/></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>적립금액</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><span class=orange><%=Utils.numberFormat(site_save_price*4) %></span> 원
          <input type="hidden" id="savePrice" name="savePrice" value="<%=(site_save_price*4)%>"/></td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
        <tr>
          <td height="28" bgcolor="#F1F1F1" align="right" style="padding-right: 10px;" class=normal_b>결제방법</td>
          <td width="1" height="18" bgcolor="#D1D3D4"></td>
          <td style="padding-left: 10px;"><INPUT id="billBtype2" name="billtype" value="C" type=radio checked> 신용카드결제</td>
        </tr>
        <tr>
          <td height="1" colspan="3" bgcolor="#D1D3D4" width="600"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td style="padding-bottom: 30px; padding-top: 30px" align=center>
    <a href="javascript:billok();"><img border=0 src="../img_nhcard/common/btn_pay.gif" width="150" height="39"></a></td>
  </tr>
</table>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe>
</FORM>