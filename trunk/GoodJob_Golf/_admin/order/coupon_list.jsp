<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.util.Utils"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
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
		title = "★ 온라인 상품권 관리 ★";
	}
	else{
		title = "★ 오프라인 상품권 관리 ★";
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
  <tr>
    <td align="center" colspan="2" width="1230">
    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
		<tr height="25" >
			<td bgcolor="#e6e7e8" align="center" width="100"><span class=list_title>발행일</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="100"><span class=list_title>등록일</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="100"><span class=list_title>사용일</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="200"><span class=list_title>상품권번호</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="180"><span class=list_title>사용자 아이디</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="100"><span class=list_title>사용자</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="150"><span class=list_title>사용 골프장</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="100"><span class=list_title>상품권금액</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="100"><span class=list_title>유효기간</span></td>
	        <td bgcolor="#e6e7e8" align="center" width="100"><span class=list_title>사용유무</span></td>
		</tr>
<%
	int size = cpList.size();
	int iNpage = NumberUtils.toInt(npage);
	CouponDto cDto;
	for(int i = 0 ; i < size ; i++){ 
		cDto = cpList.get(i);
%>
                <tr height="23">
                	<td align="center" bgcolor="white"><%=StringUtils.trimToEmpty(cDto.getExpiredate_start())%></td>
                	<td align="center" bgcolor="white"><%=StringUtils.trimToEmpty(cDto.getReg_date())%></td>
                	<td align="center" bgcolor="white"><%=StringUtils.trimToEmpty(cDto.getUse_date())%></td>
			        <td bgcolor="white" align="center"><%=cDto.getCoupon_code()%></td>
			        <td bgcolor="white" align="center"><%=StringUtils.trimToEmpty(cDto.getReg_user())%></td>
			        <td bgcolor="white" align="center"><%=StringUtils.trimToEmpty(cDto.getMem_name())%></td>
			        <td bgcolor="white" align="center"><%=cDao.getGolflinkName(cDto.getMenu_seq(),cDto.getReserve_seq())%></td>
			        <td bgcolor="white" align="center"><%=Utils.numberFormat(cDto.getSale_price())%></td>
                    <td align="center" bgcolor="white"><%=StringUtils.trimToEmpty(cDto.getExpiredate_end()).replaceAll("-",".")%></td>
                    <td align="center" bgcolor="white">
                    	<%
                    		if(cDto.getUse_date()!=null) out.println("<span class='blue'>사용</span>");
                    		else out.println("<span class='red'>미사용</span>");
                    			
                    	%>
                    </td>
                </tr>
<%
	}
%>
    </table>
    </td>
  </tr>
<form name="frm" method="post">
<input type="hidden" name="npage" value=""/>
    <tr>
        <td colspan="2" align="center" width="0" height="50" style="padding-top:15px;">
            <table border="0" cellpadding="0" cellspacing="0" width="80%" bgcolor="white">
                <tr>
                    <td width="50%" align="center"><%=strPage%></td>
                    <td width="50%" align="center">
					<select name="field" size="1">
						<option>선택</option>
						<option value="code"<%=("code".equals(field)?" selected":"")%>>상품권번호</option>
              			<option value="price"<%=("price".equals(field)?" selected":"")%>>금액</option>
              			<option value="start_dt"<%=("start_dt".equals(field)?" selected":"")%>>발행일</option>
              			<option value="reg_dt"<%=("reg_dt".equals(field)?" selected":"")%>>등록일</option>
              			<option value="end_dt"<%=("end_dt".equals(field)?" selected":"")%>>유효기간</option>
              			<option value="use_dt"<%=("use_dt".equals(field)?" selected":"")%>>사용일</option>
              			<option value="name"<%=("name".equals(field)?" selected":"")%>>사용자</option>
              			<option value="used"<%=("used".equals(field)?" selected":"")%>>사용유무</option>
            	</select>
			<input id="keyword" name="keyword" value="<%=keyword%>" type="text" size="20" class="input_box">
           <a href="javascript:on_search();"><img src="../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle"></a>

                    </td>
                </tr>
                <tr>
                    <td width="50%" align="center"></td>
                    <td width="50%" align="left" style="padding-left:100px;">
                    검색 형식<br/>
발행일,등록일,사용일,유효기간 : 2012-01-01<br/>
사용유무 : 사용 - Y , 미사용 - N<br/>
                    </td>
				</tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>