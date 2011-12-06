<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@page import="com.goodjob.reserve.dto.GolfLinkCourseDto"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%
	String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));
	GolfLinkDao gfdao = new GolfLinkDao(); 
	List<GolfLinkCourseDto> glcDto = gfdao.getGolfLinkCourseSelect(Integer.parseInt(glSeq));
	
	String ddlCourseHTML = "<select name='course_list'><option value=''>선택하세요</option>";
	for(int i = 0; i < glcDto.size();i++){
		ddlCourseHTML += "<option value='" + glcDto.get(i).getGolflink_course_seq() +"'>" + glcDto.get(i).getCourse_name() + "</option>";
	}
	ddlCourseHTML += "</select>";

String nowDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
int action = 0;  // incoming request for moving calendar up(1) down(0) for month
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth = 0; // same as year

Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();

if (request.getParameter("action") == null) // Check to see if we should set the year and month to the current
{
	currMonth = c.get(c.MONTH);
	currYear = c.get(c.YEAR);
	cal.set(currYear, currMonth,1);
}
else
{
	if (!(request.getParameter("action") == null)) // Hove the calendar up or down in this if block
	{
		currMonth = Integer.parseInt(request.getParameter("month"));
		currYear = Integer.parseInt(request.getParameter("year"));

			if (Integer.parseInt( request.getParameter("action")) == 1 )
			{
				cal.set(currYear, currMonth, 1);
				cal.add(cal.MONTH, 1);
				currMonth = cal.get(cal.MONTH);
				currYear = cal.get(cal.YEAR);
			}
			else
			{
				cal.set(currYear, currMonth ,1);
				cal.add(cal.MONTH, -1);
				currMonth = cal.get(cal.MONTH);
				currYear = cal.get(cal.YEAR);
			}
	}
} 
%>

<%!
    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);

        try
        {
                c.set(y,m,d);
                java.util.Date dt = c.getTime();
        }
          catch (IllegalArgumentException e)
        {
                return false;

        }
                return true;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>실시간 골프장 시간 및 가격입력</title>
<link rel="stylesheet" href="../../style.css" type="text/css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript">
var selDate = "<%= nowDate%>";
function selSetting(sDate){
	var splitDate = sDate.split('/');
	selDate = splitDate[0] + "/" + LenChk(splitDate[1], 2) + "/" + LenChk(splitDate[2], 2);

	//초기화
	var arrChkItems = $("input[name='timeItems']");
	if(arrChkItems.length > 0){
		for(i = arrChkItems.length; i >= 0;i--){
			$("#tbTimeCost tr:eq("+(i+1)+")").remove();
		}
	}

	//ajax호출 - 입력값 확인.
	$.ajax({
	  url: "/_admin/product/ajax/ajax_datetimecost_list.jsp?date="+selDate,
	  cache: false,
	  success: function(html){
		var evalData = eval("("+html+")");
		for(i=0;i<evalData.ProductSub.length;i++){
			addTime(evalData.ProductSub[i].c,evalData.ProductSub[i].d.substring(0,2),evalData.ProductSub[i].d.substring(2,4),evalData.ProductSub[i].f,evalData.ProductSub[i].g);
		}
		
		//기본행
		addTime('','0','0','','');
	  }
	});
}
function addTime(vCourse, vTimeH, vTimeM, nPrice, sPrice){
	var currMD = selDate.split('/');
	var timecostHTML = "";
	timecostHTML += "<tr><td bgcolor='white' align='center' width='40'>"+currMD[1]+"/"+currMD[2]+"</td>"
		+"<td bgcolor='white' align='center'><%= ddlCourseHTML%>"
		+"</td><td bgcolor='white' align='center'><select name='course_hour'>"
	for(i=0;i<24;i++){
		var ih = LenChk(i, 2);
		
		if(ih == vTimeH){
			timecostHTML += "<option value='" + ih + "' selected>" + ih + "</option>";
		}else{
			timecostHTML += "<option value='" + ih + "'>" + ih + "</option>";
		}		
	}
	timecostHTML += "</select>시";
	timecostHTML += "<select name='course_minute'>";
	for(i=0;i<60;i++){
		var im = LenChk(i, 2);
		
		if(im == vTimeM){
			timecostHTML += "<option value='" + im + "' selected>" + im + "</option>";
		}else{
			timecostHTML += "<option value='" + im + "'>" + im + "</option>";
		}	
	}  
	timecostHTML += "</select>분 </td>";
	timecostHTML += "<td align='center' bgcolor='white'><input class='input_box' size='10' name='courseN' value='" + nPrice + "' ></td>";
	timecostHTML += "<td align='center' bgcolor='white'><input class='input_box' size='10' name='courseS' value='" + sPrice + "' ></td>";
	timecostHTML += "<td align='center' bgcolor='white'><input type='checkbox' name='timeItems' /></td>";
	timecostHTML += "</tr>";
	$("#tbTimeCost").append(timecostHTML);

	$("#tbTimeCost tr:last-child select[name='course_list']").val(vCourse);
}
function removeTime(){
	var arrChkItems = $("input[name='timeItems']");
	for(i = 0; i < arrChkItems.length;i++){
		if(arrChkItems[i].checked){
			$("#tbTimeCost tr:eq("+(i+1)+")").remove();
		}
	}
}
function LenChk(inval, n)
{
	var tmp = "00000" + inval;
	var len = tmp.length;
	return (tmp.substring(len - n, len));
}

</script>
</head>
<body>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="760">
  <tr>
    <td align="center" width="760" class=title>★ 실시간 골프장 시간 및 가격입력 ★</td>
  </tr>
  <tr>
    <td align="right" style="padding-right:20px;" height="35"><img src="../../images/inc/month_prev.gif" width="41" height="16" border="0" align="absmiddle" onclick="location.href='pop_real_time_reg.jsp?glseq=<%= glSeq%>&month=<%=currMonth%>&year=<%=currYear%>&action=0'"> &nbsp;<span class=month><%= (currYear) %>년 <%= (currMonth+1) %>월</span> &nbsp;<img align="absmiddle" src="../../images/inc/month_next.gif" width="41" height="16" border="0" onclick="location.href='pop_real_time_reg.jsp?glseq=<%= glSeq%>&month=<%=currMonth%>&year=<%=currYear%>&action=1'"></td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="740" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
        <tr>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=sunday>일요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>월요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>화요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>수요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>목요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>금요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=saturday>토요일</span></td>
        </tr>
<%
//'Calendar loop

	int currDay;
	String todayColor;
	int count = 1;
	int dispDay = 1;

	for (int w = 1; w < 7; w++)
	{
		if(w == 6 && !isDate( currMonth + 1, dispDay, currYear)){
			break;
		}
%>
<tr>
<% 
  		for (int d = 1; d < 8; d++)
		{
			if (! (count >= cal.get(c.DAY_OF_WEEK)))
			{ 
%>
		<td bgcolor="white" align="center">
<%
				count += 1;
			} 
			else
			{
				if (isDate( currMonth + 1, dispDay, currYear)) // use the isDate method
				{ 

					if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)) // Here we check to see if the current day is today
       				{
						todayColor = "#6C7EAA";
					}
					else
					{
						todayColor = "#ffffff";
					}
%> 
		<td bgcolor="white" align="center">
			<table border="0" width="97%" cellpadding="0" cellspacing="0">
           	<tr>
            <td height="20" width="35">
            <% if (d == 1){ %>
            	<span class=sunday><%= (currMonth+1) + "/" + dispDay%></span>
            <% }else if(d == 7){ %>
            	<span class=saturday><%= (currMonth+1) + "/" + dispDay%></span>
            <% }else{ %>
            	<span class=day><%= (currMonth+1) + "/" + dispDay%></span>
            <% } %>
            </td>
            <td height="20" align="center" width="65">
            	<span class=regist_no>예약마감</span>
            	<!-- <span class=regist_yes>예약가능</span> -->
            </td>
           	</tr>
           	<tr>
            <td align="center" colspan="2">
            	<table border="0" width="97%" cellpadding="0" cellspacing="0">
	            <tr>
	            <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
	            <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
	            <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle" onclick="selSetting('<%=currYear + "/" + (currMonth+1) + "/" + dispDay%>');"></td>
	            </tr>
	            </table>
	        </td>
           	</tr>
         	</table>
		</td>
<%
					count += 1;
					dispDay += 1;
				}
				else
				{
%>					
		<td bgcolor="white" align="center">
			<table border="0" width="97%" cellpadding="0" cellspacing="0">
           	<tr>
            <td height="20" width="35"><span class=day></span></td>
            <td height="20" align="center" width="65"></span></td>
           	</tr>
           	<tr>
            <td align="center" colspan="2">
            	<table border="0" width="97%" cellpadding="0" cellspacing="0">
	            <tr>
	            <td align="center" height="20"></td>
	            <td align="center"></td>
	            <td align="center"></td>
	            </tr>
	            </table>
	        </td>
           	</tr>
         	</table>
		</td>
<%
				} 
			}
       } 
%>
</tr>
<% 
}
%>
</table>
</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table id="tbTimeCost" name="tbTimeCost" border="0" width="745" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
        <tr>
          <td bgcolor="#F1F1F1" align="center" height="19" width="40">날짜</td>
          <td bgcolor="#F1F1F1" align="center" height="19" width="161">코스선택 </td>
          <td bgcolor="#F1F1F1" align="center" height="19" width="134">시간선택</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="112">정상가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="95">할인가</td>
          <td width="95" height="19" align="center" bgcolor="#F1F1F1">
          	<img align="absmiddle" src="../../images/inc/btn_plus.gif" width="32" height="16" border="0" onclick="addTime('','0','0','','');">
          	<img src="../../images/inc/btn_del2.gif" width="32" height="16" border="0" align="absmiddle" onclick="removeTime();">
          	<img align="absmiddle" src="../../images/inc/btn_save.gif" width="32" height="16" border="0">
		  </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><img align="absmiddle" src="../../images/inc/btn_regist2.gif" width="74" height="26" border="0"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="bottom"><a href="javascript:self.close();"><img align="absmiddle" src="../../images/inc/btn_del.gif" width="13" height="14" border="0"></a></td>
  </tr>
</table>
</body>
</html>