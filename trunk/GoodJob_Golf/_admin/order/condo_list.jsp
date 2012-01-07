<%@page import="com.goodjob.order.dto.CondoDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.order.CondoDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.goodjob.sql.ORDER"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.util.PageNavigater"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String npage = StringUtils.defaultIfEmpty(request.getParameter("npage"),"1");
String field = StringUtils.trimToEmpty(request.getParameter("field"));
String keyword = StringUtils.trimToEmpty(request.getParameter("keyword"));

PageNavigater paging = new PageNavigater(NumberUtils.toInt(npage) , ORDER.per_page );

Map<String,String> params = new HashMap<String,String>();
params.put("menu_seq", "5");
params.put("npage",npage);
params.put("field",field);
params.put("keyword",keyword);

CondoDao cdDao = new CondoDao();
List<CondoDto> list = cdDao.getList("tb_condo_reserve", params);

int totalCount = cdDao.getTotalCount("tb_condo_reserve", params);

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
<style type="text/css">

#dhtmltooltip{
position: absolute;
left: -300px;
width: 300px;
border: 1px solid black;
padding: 3px;
background-color: lightyellow;
visibility: hidden;
z-index: 100;
filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135);
}

#dhtmlpointer{
position:absolute;
left: -300px;
z-index: 101;
visibility: hidden;
}

</style>
<script language="javascript">
<!-- 
function NewWindow(mypage, myname, w, h, scroll) { 
var winl = (screen.width - w) / 2; 
var wint = (screen.height - h) / 2; 
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' 
win = window.open(mypage, myname, winprops) 
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } 
} 

function updatePrice(reserveseq){
	var status = $("#Price"+reserveseq).val();

	$.ajax({
	  url: "/_admin/order/ajax/ajax_status_update.jsp?tablename=tb_condo_reserve&reserveseq="+reserveseq+"&colname=condo_price&status="+status,
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
	  url: "/_admin/order/ajax/ajax_status_update.jsp?tablename=tb_condo_reserve&reserveseq="+reserveseq+"&colname=process_status&status="+status,
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
	frm.action="condo_list.jsp"
	frm.submit();
}

function goPage(val){
	var frm = document.frm;
	frm.npage.value=val;
	frm.action="condo_list.jsp"
	frm.submit();
}
//--> 
</script>
</head>
<body topmargin="10" marginheight="10">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td class=title>★ 콘도예약현황 ★</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center" width="1851"><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="silver">
          <tr>
          <td bgcolor="#e6e7e8" height="25" align="center" width="132"><span class=normal_b>예약신청일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="64"><span class=normal_b>예약자</span></td>
          <td bgcolor="#e6e7e8" align="center" width="195"><span class=normal_b>아이디</span></td>
          <td width="254" align="center" bgcolor="#E6E7E8"><span class=normal_b>콘도명</span></td>
          <td bgcolor="#e6e7e8" align="center" width="196"><span class=normal_b>객실타입</span></td>
          <td bgcolor="#e6e7e8" align="center" width="196"><span class=normal_b>숙박일수</span></td>
          <td bgcolor="#e6e7e8" align="center" width="101"><span class=normal_b>입실일</span></td>
                    <td width="103" align="center" bgcolor="#E6E7E8"><span class=normal_b>퇴실일</span></td>
          <td bgcolor="#e6e7e8" align="center" width="109"><span class=normal_b>연락처</span></td>
                    <td width="95" align="center" bgcolor="#E6E7E8"><span class=normal_b>요청사항</span></td>
          <td align="center" bgcolor="#e6e7e8" width="187"><span class=normal_b>금액</span></td>
          <td width="156" align="center" bgcolor="#E6E7E8"><span class=normal_b>처리상태</span></td>
          <td width="199" align="center" bgcolor="#E6E7E8"><span class=normal_b>SMS</span></td>
          </tr>
<%
if(list != null){
	for(int i = 0; i < list.size();i++){	 
		String inDate = list.get(i).getIn_date();
		String outDate = list.get(i).getOut_date();
		inDate = inDate.substring(0,4)
			+ "-" + inDate.substring(4,6)
			+ "-" + inDate.substring(6,8);
		outDate = outDate.substring(0,4)
			+ "-" + outDate.substring(4,6)
			+ "-" + outDate.substring(6,8);
%>
          <tr>
          <td bgcolor="white" align="center" height="45"><%=list.get(i).getReserve_day() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_name() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_uid() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getCondo_name() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getRoomtype() %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getRoom_num() > 1? list.get(i).getRoom_num()-1+"박"+list.get(i).getRoom_num()+"일":list.get(i).getRoom_num()+"일" %></td>
          <td align="center" bgcolor="white"><%=inDate %></td>
          <td align="center" bgcolor="white"><%=outDate %></td>
          <td align="center" bgcolor="white"><%=list.get(i).getReserve_phone() %></td>
          <td align="center" bgcolor="white"><a href="javascript:;" ><img align="absmiddle" src="../images/common/btn_detail.gif" width="75" height="22" border="0" onMouseover="ddrivetip('<%=list.get(i).getReserve_memo() %>');" onMouseout="hideddrivetip()"></a></td>
          <td align="center" bgcolor="white">
			<input id="Price<%=list.get(i).getReserve_seq()%>" name="price" type="text" size="10" value="<%=commify(list.get(i).getCondo_price())%>" class="input_box">
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
          <td align="center" bgcolor="white"><img align="absmiddle" src="../images/common/btn_r_finished.gif" width="50" height="16" border="0"> &nbsp;<img align="absmiddle" src="../images/common/btn_cancel.gif" width="34" height="16" border="0"> &nbsp;<img align="absmiddle" src="../images/common/btn_onecheck.gif" width="59" height="16" border="0"></td>
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
        <form name="frm" method="post" action="condo_list.jsp">
		<input type="hidden" name="npage" value="<%=npage%>"/>
        <tr>
          <td height="4" align="center"><select id="field" name="field" size="1">
              <option>선택하세요</option>
              <option value="condo_name"<%=("condo_name".equals(field)?" selected":"")%>>콘도</option>
              <option value="in_date"<%=("in_date".equals(field)?" selected":"")%>>입실일</option>
              <option value="reserve_name"<%=("reserve_name".equals(field)?" selected":"")%>>예약자</option>
              <option value="package_price"<%=("package_price".equals(field)?" selected":"")%>>금액</option>
              <option value="process_status"<%=("process_status".equals(field)?" selected":"")%>>처리상태</option>
            </select>
            <input id="keyword" name="keyword" value="<%=keyword%>" type="text" size="15" class="input_box">
		    <input id="searchOk" name="searchOk" type="image" src="../images/common/bt_search.gif" border="0" width="50" height="19" align="absmiddle" onclick="on_search();"></td>
        </tr>
        </form>
      </table></td>
  </tr>
</table>
</body>
<script type="text/javascript">
<!---//
var offsetfromcursorX=12 // 커서의 x 축 
var offsetfromcursorY=10 //y 축 위치

var offsetdivfrompointerX=10 //커서그림의 X
var offsetdivfrompointerY=14 //Y축임 신경안써도 무방
document.write('<div id="dhtmltooltip"></div>') 
document.write('<img id="dhtmlpointer" src="http://gif00.com.ne.kr/image/balloon.gif">') //말풍선모양의 꼭지그림주소입니다.필히넣어야합니다

var ie=document.all
var ns6=document.getElementById && !document.all
var enabletip=false
if (ie||ns6)
var tipobj=document.all? document.all["dhtmltooltip"] : document.getElementById? document.getElementById("dhtmltooltip") : ""

var pointerobj=document.all? document.all["dhtmlpointer"] : document.getElementById? document.getElementById("dhtmlpointer") : ""

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function ddrivetip(thetext, thewidth, thecolor){
if (ns6||ie){
if (typeof thewidth!="undefined") tipobj.style.width=thewidth+"px"
if (typeof thecolor!="undefined" && thecolor!="") tipobj.style.backgroundColor=thecolor
tipobj.innerHTML=thetext
enabletip=true
return false
}
}

function positiontip(e){
if (enabletip){
var nondefaultpos=false
var curX=(ns6)?e.pageX : event.x+ietruebody().scrollLeft;
var curY=(ns6)?e.pageY : event.y+ietruebody().scrollTop;
//Find out how close the mouse is to the corner of the window
var winwidth=ie&&!window.opera? ietruebody().clientWidth : window.innerWidth-20
var winheight=ie&&!window.opera? ietruebody().clientHeight : window.innerHeight-20

var rightedge=ie&&!window.opera? winwidth-event.clientX-offsetfromcursorX : winwidth-e.clientX-offsetfromcursorX
var bottomedge=ie&&!window.opera? winheight-event.clientY-offsetfromcursorY : winheight-e.clientY-offsetfromcursorY

var leftedge=(offsetfromcursorX<0)? offsetfromcursorX*(-1) : -1000

if (rightedge<tipobj.offsetWidth){
tipobj.style.left=curX-tipobj.offsetWidth+"px"
nondefaultpos=true
}
else if (curX<leftedge)
tipobj.style.left="5px"
else{
tipobj.style.left=curX+offsetfromcursorX-offsetdivfrompointerX+"px"
pointerobj.style.left=curX+offsetfromcursorX+"px"
}

if (bottomedge<tipobj.offsetHeight){
tipobj.style.top=curY-tipobj.offsetHeight-offsetfromcursorY+"px"
nondefaultpos=true
}
else{
tipobj.style.top=curY+offsetfromcursorY+offsetdivfrompointerY+"px"
pointerobj.style.top=curY+offsetfromcursorY+"px"
}
tipobj.style.visibility="visible"
if (!nondefaultpos)
pointerobj.style.visibility="visible"
else
pointerobj.style.visibility="hidden"
}
}

function hideddrivetip(){
if (ns6||ie){
enabletip=false
tipobj.style.visibility="hidden"
pointerobj.style.visibility="hidden"
tipobj.style.left="-1000px"
tipobj.style.backgroundColor=''
tipobj.style.width=''
}
}

document.onmousemove=positiontip
//--->
</script>
</html>