<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@page import="com.goodjob.util.Utils"%>
<%@ page import="com.goodjob.member.*"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="com.goodjob.coupon.CouponDao"%>
<%@page import="com.goodjob.coupon.dto.CouponDto"%>
<%
	String type = StringUtils.defaultIfEmpty(request.getParameter("type") , "0");
	String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"), "1");
	String field = StringUtils.defaultIfEmpty(request.getParameter("field"), "");
	String keyword = StringUtils.defaultIfEmpty(request.getParameter("keyword"), "");
	
	String title = "";
	
	if("0".equals(type)){
		title = "★ 온라인 상품권 등록 ★";
	}
	else{
		title = "★ 오프라인 상품권 등록 ★";
	}
	
	CouponDao cDao = new CouponDao();
	
	PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , 20);
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("npage",npage);
	params.put("type",type);
	params.put("field",field);
	params.put("keyword",keyword);
	
	List<CouponDto> cpList = cDao.getCouponList(params);
	
	int totalCount = cDao.getTotalCoupon(params); 
	
	params.put("field","remain");
	params.put("keyword",keyword);
	int remainCount = cDao.getTotalCoupon(params); 
	
	String strPage = paging.getPaging(totalCount, false);
%>

<html>
<head>
<link rel="stylesheet" href="/_admin/style.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
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

function on_search() {

	var frm = document.frm;
	
	frm.action="coupon_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="coupon_list.jsp"
	frm.submit();
}

function coupon_del(){

	if(confirm("쿠폰 삭제시 이미 유저가 등록된 쿠폰은 삭제되지 않습니다.")){
		var frm = document.cpFrm;
		frm.target =  "ifr_hidden"; 
		frm.action="coupon_del.jsp"
		frm.submit();
	}
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="50%" class=title><%=title%></td>
    <td width="50%" align="right" style="padding-right:30px;"><!--남은상품권 : <span class=orange><%=remainCount%>장</span>--></td>
  </tr>
  <tr>
    <td align="center" colspan="2" width="1242">&nbsp;</td>
  </tr>
<form name="cpFrm" method="post">
  <tr>
    <td align="center" colspan="2" width="1242">
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
		<tr>
			<td bgcolor="#e6e7e8" align="center" width="50"><span class=list_title>선택</span></td>
			<td bgcolor="#e6e7e8" align="center" width="100"><span class=list_title>NO.</span></td>
	        <td bgcolor="#e6e7e8" align="center" height="25" width="372"><span class=list_title>상품권 번호</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="230"><span class=list_title>금액</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="290"><span class=list_title>발행일</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="290"><span class=list_title>유효기간</span></td>
		</tr>
<%
	int size = cpList.size();
	int iNpage = NumberUtils.toInt(npage);
	CouponDto cDto;
	for(int i = 0 ; i < size ; i++){ 
		cDto = cpList.get(i);
%>
                <tr>
                	<td bgcolor="white" align="center" bgcolor="white" height="23"><input type="checkbox" name="coupon_seq" value="<%=cDto.getCoupon_seq()%>"/></td>
                	<td bgcolor="white" align="center" bgcolor="white" height="23"><%=totalCount-(i*iNpage)%></td>
			        <td bgcolor="white" align="center" bgcolor="white" height="23"><%=cDto.getCoupon_code()%></td>
			        <td bgcolor="white" align="center" bgcolor="white" height="23"><%=Utils.numberFormat(cDto.getSale_price())%></td>
                    <td align="center" bgcolor="white" ><%=StringUtils.trimToEmpty(cDto.getExpiredate_start())%></td>
                    <td align="center" bgcolor="white" ><%=StringUtils.trimToEmpty(cDto.getExpiredate_end())%></td>
                </tr>
<%
	}
%>
    </table>
    </td>
  </tr>
</form>
<form name="frm" method="post">
<input type="hidden" name="npage" value=""/>
    <tr>
        <td colspan="2" align="center" width="0" height="50">
            <table border="0" cellpadding="0" cellspacing="0" width="80%" bgcolor="white">
                <tr>
                    <td width="50%" align="center"><%=strPage%></td>
                    <td width="50%" align="center">
					<select name="field" size="1">
						<option>선택</option>
						<option value="code"<%=("code".equals(field)?" selected":"")%>>상품권번호</option>
              			<option value="price"<%=("price".equals(field)?" selected":"")%>>금액</option>
              			<option value="start_dt"<%=("start_dt".equals(field)?" selected":"")%>>발행일</option>
              			<option value="end_dt"<%=("end_dt".equals(field)?" selected":"")%>>유효기간</option>
            	</select>
			<input id="keyword" name="keyword" value="<%=keyword%>" type="text" size="20" class="input_box">
           <a href="javascript:on_search();"><img src="../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle"></a>

                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </form>
    <tr>
        <td width="1242" height="50" align="center" colspan="2">
<a href="javascript:coupon_del();"><img src="/_admin/images/inc/btn_del3.gif" border="0" align="absmiddle"></a>&nbsp;
<a href="coupon_input.jsp?type=<%=type%>" onClick="NewWindow(this.href,'name','400','300','no');return false;"><img align="absmiddle" src="/_admin/images/inc/btn_regist2.gif" width="74" height="26" border="0"></a>
</td>
    </tr>
    <tr>
        <td style="padding-left:200px;" height="50" align="left" colspan="2">
업로드 하려는 파일은 CSV 형태여야 합니다.
<br/>상품권 번호 외에는 어떤 문자(숫자)도 들어 있으면 안됩니다.
<br/>각 줄은 “상품권번호 12자리 첫자~세째 자리까지 영문 시작~, 4번째부터 숫자”의 형태여야 합니다.
<br/>시작  ~ 끝 번호 상품권 일련번호는 무작위 번호로 등록합니다.
<br/>상품권을 등록할 경우 ,(쉼표)로 구분해서 등록
<br/>Ex) ABC123456789 , 10000 , 2012-12-31
<br/>   (상품권 번호 ,     금액 ,     유효기간)
        </td>
    </tr>
</table>
<iframe  name="ifr_hidden"  src="" style="width:0;height:0;visibility: hidden;"></iframe> 
</body>
</html>