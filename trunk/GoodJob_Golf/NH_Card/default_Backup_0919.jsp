<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.goodjob.util.Utils"%>
<%@page import="com.goodjob.reserve.dto.RegionDto"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkDto"%>
<%@page import="java.util.List"%>
<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ include file="/include/header_nhcard.jsp" %>
<%
	int menuNum = NumberUtils.toInt(request.getParameter("menu"),1);
	
	int pRegion = NumberUtils.toInt(request.getParameter("region"), 0);
	PackageDao pkDao = new PackageDao();
	List<RegionDto> rList = pkDao.getRegionList("1");
	
	Calendar vCalendar = Calendar.getInstance();
	String tmYear = Utils.getDate("yyyyMMdd").substring(0, 4);
	String tmMonth = Utils.getDate("yyyyMMdd").substring(4, 6);
	String tmDay = Utils.getDate("yyyyMMdd").substring(6, 8);
	vCalendar.set(Integer.parseInt(tmYear), Integer.parseInt(tmMonth)-1, Integer.parseInt(tmDay));
	vCalendar.add(vCalendar.DATE, 5);
	tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
	tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
	tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));
	String current5Date = tmYear
		+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
		+ tmDay.substring(tmDay.length()-2, tmDay.length());
	
	String strDate = StringUtils.defaultIfEmpty(request.getParameter("date"),current5Date);

	int tYear;
	int tMonth;
	int tDay;
	if(strDate == null || strDate.length() != 8){
		out.print("<script>");
		out.print("location.href='/NH_Card/default.jsp?menu=12&region="+pRegion+"&date="+strDate+"';");
		out.print("</script>");
		return;
		/*
		tYear = Integer.parseInt(strDate.substring(0,4));
		tMonth = Integer.parseInt(strDate.substring(4,6));
		tDay = Integer.parseInt(strDate.substring(6,8));
		*/
	}else{
		tYear = Integer.parseInt(strDate.substring(0,4));
		tMonth = Integer.parseInt(strDate.substring(4,6));
		tDay = Integer.parseInt(strDate.substring(6,8));
		
		vCalendar.set(tYear, tMonth-1, tDay);
	}

	vCalendar.add(vCalendar.DATE, -14);
	tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
	tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
	tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));
	
	String preDate = tmYear
				+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
				+ tmDay.substring(tmDay.length()-2, tmDay.length());
	
	vCalendar.add(vCalendar.DATE, 28);
	tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
	tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
	tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));
	
	String sDate = strDate;
	String eDate = tmYear
				+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
				+ tmDay.substring(tmDay.length()-2, tmDay.length());
	
	String strWhere = "AND C.site_seq = 3 AND C.menu_seq = 1 AND A.menu_seq = 1 ";
	if(pRegion >= 1 && pRegion <= 6){
		strWhere += "AND A.region_seq = " + pRegion;
	}
	
	String strWhere2 = "AND C.site_seq = 3 AND C.menu_seq = 2 AND A.menu_seq = 2 ";
	if(pRegion >= 1 && pRegion <= 6){
		strWhere2 += "AND A.region_seq = " + pRegion;
	}
	
	
	GolfLinkDao glDao = new GolfLinkDao();
	List<GolfLinkDto> listGolf = glDao.getGolfLinkList(strWhere);
	List<GolfLinkDto> listGolf2 = glDao.getGolfLinkList(strWhere2);
	
	Calendar incDate = Calendar.getInstance();
	incDate.set(tYear, tMonth-1, tDay);
	
	//incDate.add(incDate.DATE, 5);
	
	String strNowDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	int intNowDate = Integer.parseInt(strNowDate);
%>
<!-- 상단 영역 -->

<%@page import="com.goodjob.reserve.dto.ProductDto"%><table border="0" cellpadding="0" cellspacing="0" width="713" align="center">
  <tr>
    <td width="95%"><p><img src="../img_nhcard/img_main/img_main_visual.gif" width="713" height="232" border="0"></p></td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="143" height="40"><TABLE border=0 cellSpacing=0 cellPadding=0 width="140">
              <TR>
                <TD width="70" align=center><IMG border=0 align=absMiddle src="../images/booking/img_golf_pole_yes.gif" width=70 height=22></TD>
                <TD width="70" align=center><IMG border=0 align=absMiddle src="../images/booking/img_golf_pole_no.gif" width=73 height=22></TD>
              </TR>
            </TABLE></td>
          <td width="433" align="center">
			<%if(pRegion == 0){%>
			<SPAN class=blue>전체보기</SPAN> &nbsp;I&nbsp;
			<%}else{%>
			<a class=area href="default.jsp?date=<%=strDate %>">전체보기</a>&nbsp;I&nbsp;
			<%}
				for(int i = 0; i < rList.size(); i++){
				if(pRegion == rList.get(i).getRegion_seq()){
			%>
			<SPAN class=blue><%=rList.get(i).getRegion_name()%></SPAN>&nbsp;I&nbsp;
			<%}else{%>
			<A class=area href="default.jsp?region=<%=rList.get(i).getRegion_seq()%>&date=<%=strDate %>"><%=rList.get(i).getRegion_name()%></A> <%=i+1 < rList.size()? "&nbsp;I&nbsp;":"" %>
			<%
				}
			}
			%>
          </td>
          <td width="19%" align="right"><table border="0" cellpadding="0" cellspacing="0" width="140">
              <tr>
                <td width="70" align="center"><a href="./default.jsp?menu=<%=menuNum%>&region=<%=pRegion %>&date=<%=preDate%>"><img align="absmiddle" src="../images/booking/btn_2week_pre.gif" width="62" height="22" border="0"></a></td>
                <td width="70" align="right"><a href="./default.jsp?menu=<%=menuNum%>&region=<%=pRegion %>&date=<%=eDate%>"><img align="absmiddle" src="../images/booking/btn_2week_later.gif" width="62" height="22" border="0"></a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#D1D3D4">
        <tr>
          <td align="center" bgcolor="#F1F1F1" height="35"><img src="/images/common/img_real_subject.gif" width="160" height="25" border="0"></td>
		<% 
			for (int i = 1; i < 15 ;i++){
				int incYear = incDate.get(incDate.YEAR);
				int incMonth = incDate.get(incDate.MONTH)+1;
				int incDay = incDate.get(incDate.DATE);
				
				int incWeek = incDate.get(incDate.DAY_OF_WEEK);
				String weekimg = "";
				String weekClass = "day";
				switch(incWeek)
				{
					case 2:
						weekimg = "img_monday%s.gif";
						break;
					case 3:
						weekimg = "img_tuesday%s.gif";
						break;
					case 4:
						weekimg = "img_wednesday%s.gif";
						break;
					case 5:
						weekimg = "img_thursday%s.gif";
						break;
					case 6:
						weekimg = "img_friday%s.gif";
						break;
					case 7:
						weekimg = "img_saturday%s.gif";
						weekClass = "saturday";
						break;
					case 1:
						weekimg = "img_sunday%s.gif";
						weekClass = "sunday";
						break;
					default:
						break;
				}
				incDate.add(incDate.DATE, 1);
				boolean isHoliday = com.goodjob.util.Holiday.isHoliday(incYear+""+(incMonth<10?"0"+incMonth:incMonth)+""+(incDay<10?"0"+incDay:incDay));
				if(isHoliday){
					weekClass = "sunday";
					weekimg = String.format(weekimg , "_h");
				}
				else{
					weekimg = String.format(weekimg , "");
				}
			%>
				<td bgColor=#f1f1f1 width=30 align=center>
				<span class="<%=weekClass%>"><%=Integer.toString(incMonth)+"/"+Integer.toString(incDay)%><BR></span>
				<img border=0 align=absMiddle src="../../images/booking/<%=weekimg%>" width=20 height=16>
				</td>
			<%}%>
        </tr>
        
        <%
			for(int i = 0; i < listGolf.size(); i++){
				
				ProductDto pDto = new ProductDto();
				pDto.setGolflink_seq(listGolf.get(i).getGolflink_seq());
				pDto.setProduct_startDate(sDate);
				pDto.setProduct_endDate(eDate);
				List<ProductDto> listPrdt = glDao.getGolfProductList(pDto);
			%>
			<TR height="30">
			<td bgcolor="white" height="30" style="padding-left:5px;"><span class=blue_list><%=listGolf.get(i).getGolflink_name()%></span><!--<%=listGolf.get(i).getEvent_price()!=null&&listGolf.get(i).getEvent_price().length()>0?"</br>"+listGolf.get(i).getEvent_price():"" %>--></td>
			<%
			incDate.set(tYear, tMonth-1, tDay);
			for (int k = 1; k < 15 ;k++){
				String cYear = Integer.toString(incDate.get(incDate.YEAR));
				cYear = cYear.substring(cYear.length()-4,cYear.length());
				String cMonth = "0" + Integer.toString(incDate.get(incDate.MONTH)+1);
				cMonth = cMonth.substring(cMonth.length()-2,cMonth.length());
				String cDay = "0" + Integer.toString(incDate.get(incDate.DATE));
				cDay = cDay.substring(cDay.length()-2,cDay.length());
				incDate.add(incDate.DATE, 1);
				
				String pDate = "";
				String cDate = "";
				int rCnt = 0;
				int cCnt = 0;
				String viewYn = "";
				for(int j = 0; j < listPrdt.size(); j++){
					if(listPrdt.get(j).getProduct_year().equals(cYear)
							&&listPrdt.get(j).getProduct_month().equals(cMonth)
							&&listPrdt.get(j).getProduct_day().equals(cDay))
					{
						int prdtsubCnt = glDao.getGolfProductListCnt(listPrdt.get(j).getProduct_seq());
						pDate = cYear + "/" + cMonth + "/" + cDay;
						cDate = cYear + cMonth + cDay;
						rCnt = listPrdt.get(j).getProduct_cnt();
						cCnt = prdtsubCnt;
						viewYn = listPrdt.get(j).getView_yn();
						break;
					}
				}		
				if(pDate.equals("")){
			%>
					<td bgColor=white height=40 align=center>&nbsp;</td>
			<%
					}else if( Integer.parseInt(cYear + cMonth + cDay) < intNowDate 
							|| cCnt == 0 || viewYn.equals("1")){
			%>
					<td bgColor=white height=40 align=center>
					<img border=0 align=absMiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감/휴장">
					</td>
			<%
					}else if(viewYn.equals("2")){
			%>
					<td bgColor=white height=40 align=center>
					<img border=0 align=absMiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감/휴장">
					</td>
			<%
					}else{
			%>
					<td bgColor=white height=40 align=center>
					<a href="/NH_Card/detail.jsp?menu=1&golf=<%=listGolf.get(i).getGolflink_seq()%>&date=<%=sDate %>&cdate=<%=cDate%>"><img border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22 onMouseover="ddrivetip('<%=pDate %></br>--------------------</br>예약가능팀 : <%=cCnt %>/<%=rCnt %>팀');" onMouseout="hideddrivetip()"></a>
					</td>
			<%
					}
				}
			%>
			</TR>
			<%
			}
			%>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td><table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#D1D3D4">
        <tr>
          <td align="center" bgcolor="#F1F1F1" height="35"><img src="/images/common/img_pre_subject.gif" width="160" height="25" border="0"></td>
		<% 
			incDate.add(incDate.DATE, -14);
			for (int i = 1; i < 15 ;i++){
				int incYear = incDate.get(incDate.YEAR);
				int incMonth = incDate.get(incDate.MONTH)+1;
				int incDay = incDate.get(incDate.DATE);
				
				int incWeek = incDate.get(incDate.DAY_OF_WEEK);
				String weekImg = "";
				String weekClass = "day";
				switch(incWeek)
				{
					case 2:
						weekImg = "img_monday%s.gif";
						break;
					case 3:
						weekImg = "img_tuesday%s.gif";
						break;
					case 4:
						weekImg = "img_wednesday%s.gif";
						break;
					case 5:
						weekImg = "img_thursday%s.gif";
						break;
					case 6:
						weekImg = "img_friday%s.gif";
						break;
					case 7:
						weekImg = "img_saturday%s.gif";
						weekClass = "saturday";
						break;
					case 1:
						weekImg = "img_sunday%s.gif";
						weekClass = "sunday";
						break;
					default:
						break;
				}
				incDate.add(incDate.DATE, 1);
				boolean isHoliday = com.goodjob.util.Holiday.isHoliday(incYear+""+(incMonth<10?"0"+incMonth:incMonth)+""+(incDay<10?"0"+incDay:incDay));
				if(isHoliday){
					weekClass = "sunday";
					weekImg = String.format(weekImg , "_h");
				}
				else{
					weekImg = String.format(weekImg , "");
				}
			%>
				<td bgColor=#f1f1f1 width=30 align=center>
				<span class="<%=weekClass%>"><%=Integer.toString(incMonth)+"/"+Integer.toString(incDay)%><BR></span>
				<img border=0 align=absMiddle src="../../images/booking/<%=weekImg%>" width=20 height=16>
				</td>
			<%}%>
        </tr>
        <%
			for(int i = 0; i < listGolf2.size(); i++){
				ProductDto pDto = new ProductDto();
				pDto.setGolflink_seq(listGolf2.get(i).getGolflink_seq());
				pDto.setProduct_startDate(sDate);
				pDto.setProduct_endDate(eDate);
				List<ProductDto> listPrdt = glDao.getGolfProductList(pDto);
		%>
			<TR height="30">
			<td bgcolor="white" height="30" style="padding-left:5px;"><span class=blue_list><%=listGolf2.get(i).getGolflink_name()%></span><!--<%=listGolf2.get(i).getEvent_price()!=null&&listGolf2.get(i).getEvent_price().length()>0?"</br>"+listGolf2.get(i).getEvent_price():"" %>--></td>
			<%
				incDate.set(tYear, tMonth-1, tDay);
				for (int k = 1; k < 15 ;k++){
					String cYear = Integer.toString(incDate.get(incDate.YEAR));
					cYear = cYear.substring(cYear.length()-4,cYear.length());
					String cMonth = "0" + Integer.toString(incDate.get(incDate.MONTH)+1);
					cMonth = cMonth.substring(cMonth.length()-2,cMonth.length());
					String cDay = "0" + Integer.toString(incDate.get(incDate.DATE));
					cDay = cDay.substring(cDay.length()-2,cDay.length());
					incDate.add(incDate.DATE, 1);
					
					String pDate = "";
					String cDate = "";
					int rCnt = 0;
					int cCnt = 0;
					String viewYn = "";
					for(int j = 0; j < listPrdt.size(); j++){
						if(listPrdt.get(j).getProduct_year().equals(cYear)
								&&listPrdt.get(j).getProduct_month().equals(cMonth)
								&&listPrdt.get(j).getProduct_day().equals(cDay))
						{
							int prdtsubCnt = glDao.getGolfProductListCnt(listPrdt.get(j).getProduct_seq());
							pDate = cYear + "/" + cMonth + "/" + cDay;
							cDate = cYear + cMonth + cDay;
							rCnt = listPrdt.get(j).getProduct_cnt();
							cCnt = prdtsubCnt;
							viewYn = listPrdt.get(j).getView_yn();
							break;
						}
					}		
					if(pDate.equals("")){
			%>
					<TD bgColor=white height=40 align=center>&nbsp;</TD>
			<%
					}else if( Integer.parseInt(cYear + cMonth + cDay) < intNowDate 
							|| cCnt == 0 || viewYn.equals("1")){
			%>
					<TD bgColor=white height=40 align=center>
					<IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감/휴장">
					</TD>
			<%
					}else if(viewYn.equals("2")){
			%>
					<TD bgColor=white height=40 align=center>
					<IMG border=0 align=absMiddle src="../../images/booking/img_golf_pole_gray.gif" width=24 height=22 alt="마감/휴장">
					</TD>
			<%
					}else{
			%>
					<td bgColor=white height=40 align=center>
					<a href="/NH_Card/detail.jsp?menu=2&golf=<%=listGolf2.get(i).getGolflink_seq()%>&date=<%=sDate %>&cdate=<%=cDate%>"><img border=0 align=absMiddle src="../../images/booking/img_golf_pole.gif" width=24 height=22 onMouseover="ddrivetip('<%=pDate %></br>--------------------</br>예약가능팀 : <%=cCnt %>/<%=rCnt %>팀');" onMouseout="hideddrivetip()"></a>
					</td>
			<%
					}
				}
			%>
			</TR>
			<%
			}
			%>
      </table></td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table border="0" width="713" cellpadding="0" cellspacing="0">
        <tr>
          <td width="350"><table border="0" cellpadding="0" cellspacing="0" width="350">
              <tr>
                <td width="175"><img src="../img_nhcard/img_main/img_customer.gif" width="170" height="70" border="0"></td>
                <td width="175"><a href="reg_input.jsp"><img src="../img_nhcard/img_main/btn_regist.gif" width="170" height="70" border="0"></a></td>
              </tr>
              <tr>
                <td colspan="2" height="5"></td>
              </tr>
              <tr>
                <td width="175"><a href="#"><img src="../img_nhcard/img_main/btn_guide.gif" width="170" height="70" border="0"></a></td>
                <td width="175"><a href="faq_list.jsp"><img src="../img_nhcard/img_main/btn_faq.gif" width="170" height="70" border="0"></a></td>
              </tr>
            </table></td>
          <td width="363" align="right" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="350">
              <tr>
                <td width="350" bgcolor="white"><table border="0" cellpadding="0" cellspacing="0" width="350">
                    <tr>
                      <td width="307"><img src="../img_nhcard/img_main/img_notice_main_title.gif" width="307" height="30" border="0"></td>
                      <td width="43"><a href="notice_list.jsp"><img src="../img_nhcard/img_main/btn_more.gif" width="43" height="30" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td bgcolor="white" align="center"">
                <%@ include file="/NH_Card/nhcard_notice_list.jsp" %>
				</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- 하단 footer  -->
<%@ include file="/include/footer_nhcard.jsp" %>
<!-- 하단 footer  -->