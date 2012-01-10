package org.apache.jsp.forGolfbooking;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import java.text.DecimalFormat;
import java.util.Calendar;
import com.goodjob.reserve.dto.RegionDto;
import java.util.List;
import com.goodjob.reserve.PackageDao;
import com.goodjob.util.Utils;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.RegionDto;
import com.goodjob.reserve.PackageDao;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import com.goodjob.reserve.dto.ProductDto;
import com.goodjob.reserve.dto.GolfLinkDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import java.util.Calendar;
import java.util.Date;
import com.goodjob.reserve.dto.RegionDto;
import com.goodjob.reserve.PackageDao;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import com.goodjob.reserve.dto.ProductDto;
import com.goodjob.reserve.dto.GolfLinkDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import java.util.Calendar;
import java.util.Date;
import org.apache.commons.lang.math.NumberUtils;
import java.text.DecimalFormat;
import com.goodjob.reserve.dto.PackageDto;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.RegionDto;
import java.util.List;
import com.goodjob.reserve.PackageDao;
import java.util.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.reserve.dto.RegionDto;
import com.goodjob.reserve.PackageDao;
import com.goodjob.reserve.CondoReserveDao;
import com.goodjob.reserve.dto.*;
import com.goodjob.conf.Config;
import com.goodjob.util.Utils;

public final class reserve_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


public String commify(int n) {
	return com.goodjob.util.Utils.numberFormat(n);
}

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(7);
    _jspx_dependants.add("/include/header.jsp");
    _jspx_dependants.add("/forGolfbooking/reserveReal.jsp");
    _jspx_dependants.add("/forGolfbooking/reservePre.jsp");
    _jspx_dependants.add("/forGolfbooking/reservePackage.jsp");
    _jspx_dependants.add("/forGolfbooking/reserveCondo.jsp");
    _jspx_dependants.add("/include/copyright.jsp");
    _jspx_dependants.add("/include/footer.jsp");
  }

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      out.write("﻿\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

//사용자정보.
String user_Name = StringUtils.trimToEmpty((String)session.getAttribute("mem_name"));
String user_Id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));

	String curr_url = StringUtils.trimToEmpty(request.getRequestURI());

	String swf_param = "";
	if(curr_url.indexOf("/board/join_List.jsp")>-1){
		swf_param = "pageNum=5&sub=1";
	}
	else if(curr_url.indexOf("/forGolfbooking/")>-1){
		if(request.getParameter("menu")==null || "1".equals(request.getParameter("menu"))){
			swf_param = "pageNum=1&sub=1";
		}
		else if("2".equals(request.getParameter("menu"))){
			swf_param = "pageNum=1&sub=3";
		}
		else if("3".equals(request.getParameter("menu"))){
			swf_param = "pageNum=2&sub=1";
		}
		else if("5".equals(request.getParameter("menu"))){
			swf_param = "pageNum=3&sub=1";
		}
	}
	
	PackageDao listRegionDao = new PackageDao();
	List<RegionDto> listRegion = listRegionDao.getRegionList("1");

	String headDate_now = Utils.getDate("yyyy-MM-dd");
	String headDate_2week = Utils.getDate("yyyy-MM-dd" , 14);
	
	String ddlSearchRegion = StringUtils.trimToEmpty(request.getParameter("ddlSearchRegion"));
	String ddlSearchMenu = StringUtils.trimToEmpty(request.getParameter("ddlSearchMenu"));
	String txtSearchStartDate = StringUtils.defaultString(request.getParameter("txtSearchStartDate"),headDate_now);
	String txtSearchEndDate = StringUtils.defaultString(request.getParameter("txtSearchEndDate"),headDate_2week);
	

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=euc-kr\">\r\n");
      out.write("<title>대한민국 넘버원 골프부킹 할인서비스 굿잡골프</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/css/common.css\" type=\"text/css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/css/style.css\" type=\"text/css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/css/jquery.ui.all.css\">\r\n");
      out.write("<script src=\"/js/jquery-1.6.2.min.js\"></script>\r\n");
      out.write("<script src=\"/js/jquery.ui.core.js\"></script>\r\n");
      out.write("<script src=\"/js/jquery.ui.widget.js\"></script>\r\n");
      out.write("<script src=\"/js/jquery.ui.datepicker.js\"></script>\r\n");
      out.write("<script src=\"/js/jquery.ui.datepicker.kr.js\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"/js/flashObject.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("$(function() {\r\n");
      out.write("\t$( \"#txtSearchStartDate\" ).datepicker({\r\n");
      out.write("\t\tdateFormat:'yy-mm-dd',\r\n");
      out.write("\t\tonSelect : function(dateText, inst){\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar nowDate = (\"");
      out.print(headDate_now);
      out.write("\").replace('-','').replace('-','');\r\n");
      out.write("\t\t\tvar arrDate = dateText.split(\"-\");\r\n");
      out.write("\t\t\tarrDate = arrDate[0] + arrDate[1] + arrDate[2];\r\n");
      out.write("\t\t\tif(nowDate > arrDate){\r\n");
      out.write("\t\t\t\talert(\"오늘보다 이전날짜를 선택할 수 없습니다.\");\r\n");
      out.write("\t\t\t\t$( \"#txtSearchStartDate\" ).val(\"");
      out.print(headDate_now);
      out.write("\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$( \"#txtSearchEndDate\" ).datepicker({\r\n");
      out.write("\t\tdateFormat:'yy-mm-dd',\r\n");
      out.write("\t\tonSelect : function(dateText, inst){\r\n");
      out.write("\t\t\tvar startDate = $( \"#txtSearchStartDate\" ).val().replace('-','').replace('-','');\r\n");
      out.write("\t\t\tvar arrDate = dateText.split(\"-\");\r\n");
      out.write("\t\t\tarrDate = arrDate[0] + arrDate[1] + arrDate[2];\r\n");
      out.write("\t\t\tif(startDate > arrDate){\r\n");
      out.write("\t\t\t\talert(\"시작날짜보다 이전날짜를 선택할 수 없습니다.\");\r\n");
      out.write("\t\t\t\t$( \"#txtSearchEndDate\" ).val(\"");
      out.print(headDate_2week);
      out.write("\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#btnSearchStartDate\").click(\r\n");
      out.write("\t\tfunction(){\r\n");
      out.write("\t\t\t$( \"#txtSearchStartDate\" ).datepicker(\"show\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t);\r\n");
      out.write("\t$(\"#btnSearchEndDate\").click(\r\n");
      out.write("\t\tfunction(){\r\n");
      out.write("\t\t\t$( \"#txtSearchEndDate\" ).datepicker(\"show\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t);\r\n");
      out.write("});\r\n");
      out.write("\tfunction logon_ok() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(!$('#login_id').val()) {\r\n");
      out.write("\t\t\talert('아이디를 입력하시기 바랍니다.');\r\n");
      out.write("\t\t\t$('#login_id').focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tif(!$('#login_pwd').val()) {\r\n");
      out.write("\t\t\talert('비밀번호를 입력하시기 바랍니다.');\r\n");
      out.write("\t\t\t$('#login_pwd').focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t} \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\tvar frm = document.forms[\"logonFrm\"];\r\n");
      out.write("\t\tfrm.action = \"/logon/logon.jsp\";\r\n");
      out.write("\t\tfrm.submit();\r\n");
      out.write("   \t}\r\n");
      out.write("\r\n");
      out.write("\tfunction onClick_id(){\r\n");
      out.write("\t\tif($('#login_id').val()==\"아이디@메일주소\"){\r\n");
      out.write("\t\t\t$('#login_id').val(\"\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("   \tfunction golflinkSearch(){\r\n");
      out.write("   \t   \tif($(\"#ddlSearchRegion\").val() == \"\" || $(\"#ddlSearchRegion\").val() == \"0\" \r\n");
      out.write("   \t   \t   \t&& $(\"#ddlSearchMenu\").val() == \"\"){\r\n");
      out.write("   \t   \t   \talert(\"검색하려면 '지역'이나 '항목'을 선택해주세요.\");\r\n");
      out.write("   \t   \t   \treturn;\r\n");
      out.write("   \t   \t}\r\n");
      out.write("   \t\tfrmSearch.submit();\r\n");
      out.write("   \t}\r\n");
      out.write("//-->\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" background=\"/images/bg_main.jpg\">\r\n");
      out.write("<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"100%\" align=\"center\"><table border=\"0\" width=\"1000\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"100%\">\r\n");
      out.write("          <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td height=\"146\"><script>flashObject(\"/images/swf/navigation.swf\",\"");
      out.print(swf_param);
      out.write("\",\"1000\",\"146\")</script></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td>\r\n");
      out.write("                <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                      <td colspan=\"3\" background=\"/images/common/img_top_bg.jpg\" height=\"50\" valign=\"top\" width=\"1000\" align=\"right\">\r\n");
      out.write("                      \t<FORM NAME=\"frmSearch\" METHOD=\"post\" ACTION=\"/forGolfbooking/search.jsp\">\r\n");
      out.write("\t\t\t\t\t\t<TABLE cellSpacing=0 cellPadding=0 width=751 bgColor=#052b48>\r\n");
      out.write("\t\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t\t<TD width=105><IMG alt=\"골프장 빠른검색\" src=\"/images/common/img_search_title.gif\" width=120 height=40></TD>\r\n");
      out.write("\t\t\t\t\t\t<TD width=143 align=center><SELECT id=\"ddlSearchRegion\" name=\"ddlSearchRegion\">\r\n");
      out.write("\t\t\t\t\t\t<OPTION selected value=\"\">지역선택-------</OPTION> \r\n");
      out.write("\t\t\t\t\t\t");
 if(ddlSearchRegion.equals("0")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=\"0\" selected>전체보기</OPTION> \r\n");
      out.write("\t\t\t\t\t\t");
 }else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=\"0\">전체보기</OPTION>\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t");

							for(int i = 0; i < listRegion.size();i++){
								String selected = "";
								if(ddlSearchRegion.equals(Integer.toString(listRegion.get(i).getRegion_seq()))){
									selected = "selected";
								}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=\"");
      out.print(listRegion.get(i).getRegion_seq() );
      out.write('"');
      out.write(' ');
      out.print(selected );
      out.write('>');
      out.print(listRegion.get(i).getRegion_name() );
      out.write("</OPTION>\r\n");
      out.write("\t\t\t\t\t\t");

							}
						
      out.write("</SELECT></TD>\r\n");
      out.write("\t\t\t\t\t\t<TD width=175><SELECT id=\"ddlSearchMenu\" name=\"ddlSearchMenu\"> \r\n");
      out.write("\t\t\t\t\t\t<OPTION value=\"\">항목선택-------------</OPTION> \r\n");
      out.write("\t\t\t\t\t\t");
 if(ddlSearchMenu.equals("1")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=\"1\" selected>실시간부킹골프장</OPTION>\r\n");
      out.write("\t\t\t\t\t\t");
 }else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=\"1\">실시간부킹골프장</OPTION>\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t");
 if(ddlSearchMenu.equals("2")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=\"2\" selected>사전신청골프장</OPTION></SELECT></TD>\r\n");
      out.write("\t\t\t\t\t\t");
 }else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<OPTION value=\"2\">사전신청골프장</OPTION></SELECT></TD>\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t<TD width=30 align=right><A href=\"#\"><IMG id=\"btnSearchStartDate\" src=\"/images/common/btn_calendar_left.gif\" width=22 height=21></A></TD>\r\n");
      out.write("\t\t\t\t\t\t<TD width=106 align=center><INPUT class=input_01 id=\"txtSearchStartDate\" name=\"txtSearchStartDate\" size=13 maxlength=\"10\" readonly value=\"");
      out.print(txtSearchStartDate);
      out.write("\"></TD>\r\n");
      out.write("\t\t\t\t\t\t<TD width=9><IMG src=\"/images/common/img_search_blank.gif\" width=9 height=6></TD>\r\n");
      out.write("\t\t\t\t\t\t<TD width=30 align=right><A href=\"#\"><IMG id=\"btnSearchEndDate\" src=\"/images/common/btn_calendar_right.gif\" width=22 height=21></A></TD>\r\n");
      out.write("\t\t\t\t\t\t<TD width=106 align=center><INPUT class=input_01 id=\"txtSearchEndDate\" name=\"txtSearchEndDate\" size=13 maxlength=\"10\" readonly value=\"");
      out.print(txtSearchEndDate);
      out.write("\"></TD>\r\n");
      out.write("\t\t\t\t\t\t<TD width=75><A href=\"javascript:;\" onclick=\"golflinkSearch()\"><IMG border=0 src=\"/images/common/btn_top_search.gif\"></A></TD></TR></TBODY>\r\n");
      out.write("\t\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t\t\t</FORM>\r\n");
      out.write("                      </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                      <td width=\"235\" valign=\"top\">\r\n");
      out.write("                        <table border=\"0\" width=\"235\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                          <tr>\r\n");
      out.write("                            <td background=\"/images/img_leftmenu/img_left_bg.jpg\" width=\"235\">\r\n");

	if(curr_url.indexOf("/member_logon.jsp") == -1){
	

      out.write("\r\n");
      out.write("                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"235\" bgcolor=\"#052B48\">\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                  <td width=\"235\" align=\"center\" valign=\"top\">\r\n");
      out.write("                                  ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/logon_form.jsp", out, true);
      out.write("\r\n");
      out.write("                                  </td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                              </table>\r\n");

	}

      out.write("\r\n");
      out.write("                            </td>\r\n");
      out.write("                          </tr>\r\n");
      out.write("                          <tr>\r\n");
      out.write("                            <td height=\"10\"></td>\r\n");
      out.write("                          </tr>\r\n");
      out.write("                          <tr>\r\n");
      out.write("                              <td bgcolor=\"#F7F5F6\">\r\n");
      out.write("                                  <table border=\"0\" width=\"235\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                          <td width=\"235\"><a href=\"/common/counsel.jsp\"><img src=\"/images/img_leftmenu/img_customer_center.gif\" width=\"235\" height=\"139\" border=\"0\"></a></td>\r\n");
      out.write("                                      </tr>\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                          <td><a href=\"/common/field_guide.jsp\"><img src=\"/images/img_leftmenu/btn_user_guide.gif\" width=\"235\" height=\"86\" border=\"0\"></a></td>\r\n");
      out.write("                                      </tr>\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                          <td><a href=\"/board/faq_list.jsp\"><img src=\"/images/img_leftmenu/btn_faq.gif\" width=\"235\" height=\"86\" border=\"0\"></a></td>\r\n");
      out.write("                                      </tr>\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                          <td><a href=\"#\"><img src=\"/images/img_leftmenu/btn_event.gif\" width=\"235\" height=\"86\" border=\"0\"></a></td>\r\n");
      out.write("                                      </tr>\r\n");
      out.write("                                  </table>\r\n");
      out.write("                              </td>\r\n");
      out.write("                          </tr>\r\n");
      out.write("                        </table>\r\n");
      out.write("                      </td>\r\n");
      out.write("                      <td width=\"15\" valign=\"top\"></td>\r\n");
      out.write("                      <td width=\"750\" valign=\"top\">");
      out.write('\r');
      out.write('\n');
int menuName = NumberUtils.toInt(request.getParameter("menu"),1);
      out.write("\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t");
 if(menuName == 1){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

int menuNum = NumberUtils.toInt(request.getParameter("menu"),1);

int pRegion = NumberUtils.toInt(request.getParameter("region"), 0);
PackageDao pkDao = new PackageDao();
List<RegionDto> rList = pkDao.getRegionList("1");

//String nowDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
Calendar vCalendar = Calendar.getInstance();
String strDate = Integer.toString(NumberUtils.toInt(request.getParameter("date"),0));
int tYear;
int tMonth;
int tDay;
if(strDate == null || strDate.length() != 8){
	strDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	out.print("<script>");
	out.print("location.href='/forGolfbooking/reserve.jsp?menu=1&region="+pRegion+"&date="+strDate+"';");
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
String tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
String tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
String tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));

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

String strWhere = "AND A.menu_seq = " + menuNum + " ";
if(pRegion >= 1 && pRegion <= 6){
	strWhere += "AND A.region_seq = " + pRegion;
}
/*
String strRegion = request.getParameter("region");
if(strRegion != null){
	if(strRegion.equals("1") || strRegion.equals("2") 
			|| strRegion.equals("3") || strRegion.equals("4")
			|| strRegion.equals("5") || strRegion.equals("6")){
		strWhere += "AND A.region_seq = " + strRegion;
	}
}
*/
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> listGolf = glDao.getGolfLinkList(strWhere);

Calendar incDate = Calendar.getInstance();
incDate.set(tYear, tMonth-1, tDay);

      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("#dhtmltooltip{\r\n");
      out.write("position: absolute;\r\n");
      out.write("left: -300px;\r\n");
      out.write("width: 130px;\r\n");
      out.write("border: 1px solid black;\r\n");
      out.write("padding: 3px;\r\n");
      out.write("background-color: lightyellow;\r\n");
      out.write("visibility: hidden;\r\n");
      out.write("z-index: 100;\r\n");
      out.write("filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#dhtmlpointer{\r\n");
      out.write("position:absolute;\r\n");
      out.write("left: -300px;\r\n");
      out.write("z-index: 101;\r\n");
      out.write("visibility: hidden;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=751><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=751>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 height=\"650\" align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>실시간예약</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>실시간예약</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<tr>\r\n");
      out.write("<td>&nbsp;</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("<td align=\"right\">\r\n");

	if(pRegion == 0){

      out.write("\r\n");
      out.write("\t<SPAN class=blue>전체보기</SPAN> &nbsp;I&nbsp;\r\n");
		
	}else{

      out.write("\r\n");
      out.write("\t<a class=area href=\"reserve.jsp?menu=1&date=");
      out.print(strDate );
      out.write("\">전체보기</a> &nbsp;I&nbsp;\r\n");
		
	}
		
	for(int i = 0; i < rList.size(); i++){ 
		if(pRegion == rList.get(i).getRegion_seq()){

      out.write("\r\n");
      out.write("\t\t<SPAN class=blue>");
      out.print(rList.get(i).getRegion_name());
      out.write("</SPAN> &nbsp;I&nbsp;\r\n");

		}else{

      out.write("\r\n");
      out.write("\t\t<A class=area href=\"reserve.jsp?menu=1&region=");
      out.print(rList.get(i).getRegion_seq());
      out.write("&date=");
      out.print(strDate );
      out.write('"');
      out.write('>');
      out.print(rList.get(i).getRegion_name());
      out.write("</A> &nbsp;I &nbsp;\r\n");
 
		}
	} 

      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=40 align=right>\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"75\" align=\"center\"><p><a href=\"/forGolfbooking/reserve.jsp?menu=");
      out.print(menuNum);
      out.write("&region=");
      out.print(pRegion );
      out.write("&date=");
      out.print(preDate);
      out.write("\"><img align=\"absmiddle\" src=\"../../images/booking/btn_2week_pre.gif\" width=\"62\" height=\"22\" border=\"0\"></a></p></td>\r\n");
      out.write("    <td width=\"75\" align=\"center\"><p><a href=\"/forGolfbooking/reserve.jsp?menu=");
      out.print(menuNum);
      out.write("&region=");
      out.print(pRegion );
      out.write("&date=");
      out.print(eDate);
      out.write("\"><img align=\"absmiddle\" src=\"../../images/booking/btn_2week_later.gif\" width=\"62\" height=\"22\" border=\"0\"></a></p></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=707 bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=#f1f1f1 height=35 width=212 align=center><SPAN class=normal_s>실시간예약 골프장명</SPAN></TD>\r\n");
 
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
			weekImg = "img_monday.gif";
			break;
		case 3:
			weekImg = "img_tuesday.gif";
			break;
		case 4:
			weekImg = "img_wednesday.gif";
			break;
		case 5:
			weekImg = "img_thursday.gif";
			break;
		case 6:
			weekImg = "img_friday.gif";
			break;
		case 7:
			weekImg = "img_saturday.gif";
			weekClass = "saturday";
			break;
		case 1:
			weekImg = "img_sunday.gif";
			weekClass = "sunday";
			break;
		default:
			break;
	}
	incDate.add(incDate.DATE, 1);

      out.write("\r\n");
      out.write("<TD bgColor=#f1f1f1 width=30 align=center>\r\n");
      out.write("<SPAN class=\"");
      out.print(weekClass);
      out.write('"');
      out.write('>');
      out.print(Integer.toString(incMonth)+"/"+Integer.toString(incDay));
      out.write("<BR></SPAN>\r\n");
      out.write("<IMG border=0 align=absMiddle src=\"../../images/booking/");
      out.print(weekImg);
      out.write("\" width=20 height=16>\r\n");
      out.write("</TD>\r\n");
 
} 

      out.write('\r');
      out.write('\n');

for(int i = 0; i < listGolf.size(); i++){
	ProductDto pDto = new ProductDto();
	pDto.setGolflink_seq(listGolf.get(i).getGolflink_seq());
	pDto.setProduct_startDate(sDate);
	pDto.setProduct_endDate(eDate);
	List<ProductDto> listPrdt = glDao.getGolfProductList(pDto);

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 5px\" bgColor=white height=30><SPAN class=normal_s style=\"color:red;font-weight:bold\">(");
      out.print(listGolf.get(i).getRegion_name() );
      out.write(')');
      out.print(listGolf.get(i).getGolflink_name());
      out.write("</SPAN></TD>\r\n");

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
		for(int j = 0; j < listPrdt.size(); j++){
			if(listPrdt.get(j).getProduct_year().equals(cYear)
					&&listPrdt.get(j).getProduct_month().equals(cMonth)
					&&listPrdt.get(j).getProduct_day().equals(cDay))
			{
				pDate = cYear + "/" + cMonth + "/" + cDay;
				cDate = cYear + cMonth + cDay;
				rCnt = listPrdt.get(j).getProduct_cnt();
			}
		}		
		if(pDate.equals("")){

      out.write("\r\n");
      out.write("\t\t<TD bgColor=white height=30 align=center>&nbsp;</TD>\r\n");

		}else{

      out.write("\r\n");
      out.write("\t\t<TD bgColor=white height=30 align=center>\r\n");
      out.write("\t\t<a href=\"/forGolfbooking/detail.jsp?menu=");
      out.print(menuNum);
      out.write("&golf=");
      out.print(listGolf.get(i).getGolflink_seq());
      out.write("&date=");
      out.print(sDate );
      out.write("&cdate=");
      out.print(cDate);
      out.write("\"><IMG border=0 align=absMiddle src=\"../../images/booking/img_golf_pole.gif\" width=24 height=22 onMouseover=\"ddrivetip('");
      out.print(pDate );
      out.write("</br>--------------------</br>예약가능팀 : ");
      out.print(rCnt );
      out.write("팀');\" onMouseout=\"hideddrivetip()\"></a>\r\n");
      out.write("\t\t</TD>\r\n");

		}
	}

      out.write("\r\n");
      out.write("</TR>\r\n");

}

      out.write("\r\n");
      out.write("</TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("<!---//\r\n");
      out.write("var offsetfromcursorX=12 // 커서의 x 축 \r\n");
      out.write("var offsetfromcursorY=10 //y 축 위치\r\n");
      out.write("\r\n");
      out.write("var offsetdivfrompointerX=10 //커서그림의 X\r\n");
      out.write("var offsetdivfrompointerY=14 //Y축임 신경안써도 무방\r\n");
      out.write("document.write('<div id=\"dhtmltooltip\"></div>') \r\n");
      out.write("document.write('<img id=\"dhtmlpointer\" src=\"http://gif00.com.ne.kr/image/balloon.gif\">') //말풍선모양의 꼭지그림주소입니다.필히넣어야합니다\r\n");
      out.write("\r\n");
      out.write("var ie=document.all\r\n");
      out.write("var ns6=document.getElementById && !document.all\r\n");
      out.write("var enabletip=false\r\n");
      out.write("if (ie||ns6)\r\n");
      out.write("var tipobj=document.all? document.all[\"dhtmltooltip\"] : document.getElementById? document.getElementById(\"dhtmltooltip\") : \"\"\r\n");
      out.write("\r\n");
      out.write("var pointerobj=document.all? document.all[\"dhtmlpointer\"] : document.getElementById? document.getElementById(\"dhtmlpointer\") : \"\"\r\n");
      out.write("\r\n");
      out.write("function ietruebody(){\r\n");
      out.write("return (document.compatMode && document.compatMode!=\"BackCompat\")? document.documentElement : document.body\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function ddrivetip(thetext, thewidth, thecolor){\r\n");
      out.write("if (ns6||ie){\r\n");
      out.write("if (typeof thewidth!=\"undefined\") tipobj.style.width=thewidth+\"px\"\r\n");
      out.write("if (typeof thecolor!=\"undefined\" && thecolor!=\"\") tipobj.style.backgroundColor=thecolor\r\n");
      out.write("tipobj.innerHTML=thetext\r\n");
      out.write("enabletip=true\r\n");
      out.write("return false\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function positiontip(e){\r\n");
      out.write("if (enabletip){\r\n");
      out.write("var nondefaultpos=false\r\n");
      out.write("var curX=(ns6)?e.pageX : event.x+ietruebody().scrollLeft;\r\n");
      out.write("var curY=(ns6)?e.pageY : event.y+ietruebody().scrollTop;\r\n");
      out.write("//Find out how close the mouse is to the corner of the window\r\n");
      out.write("var winwidth=ie&&!window.opera? ietruebody().clientWidth : window.innerWidth-20\r\n");
      out.write("var winheight=ie&&!window.opera? ietruebody().clientHeight : window.innerHeight-20\r\n");
      out.write("\r\n");
      out.write("var rightedge=ie&&!window.opera? winwidth-event.clientX-offsetfromcursorX : winwidth-e.clientX-offsetfromcursorX\r\n");
      out.write("var bottomedge=ie&&!window.opera? winheight-event.clientY-offsetfromcursorY : winheight-e.clientY-offsetfromcursorY\r\n");
      out.write("\r\n");
      out.write("var leftedge=(offsetfromcursorX<0)? offsetfromcursorX*(-1) : -1000\r\n");
      out.write("\r\n");
      out.write("if (rightedge<tipobj.offsetWidth){\r\n");
      out.write("tipobj.style.left=curX-tipobj.offsetWidth+\"px\"\r\n");
      out.write("nondefaultpos=true\r\n");
      out.write("}\r\n");
      out.write("else if (curX<leftedge)\r\n");
      out.write("tipobj.style.left=\"5px\"\r\n");
      out.write("else{\r\n");
      out.write("tipobj.style.left=curX+offsetfromcursorX-offsetdivfrompointerX+\"px\"\r\n");
      out.write("pointerobj.style.left=curX+offsetfromcursorX+\"px\"\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("if (bottomedge<tipobj.offsetHeight){\r\n");
      out.write("tipobj.style.top=curY-tipobj.offsetHeight-offsetfromcursorY+\"px\"\r\n");
      out.write("nondefaultpos=true\r\n");
      out.write("}\r\n");
      out.write("else{\r\n");
      out.write("tipobj.style.top=curY+offsetfromcursorY+offsetdivfrompointerY+\"px\"\r\n");
      out.write("pointerobj.style.top=curY+offsetfromcursorY+\"px\"\r\n");
      out.write("}\r\n");
      out.write("tipobj.style.visibility=\"visible\"\r\n");
      out.write("if (!nondefaultpos)\r\n");
      out.write("pointerobj.style.visibility=\"visible\"\r\n");
      out.write("else\r\n");
      out.write("pointerobj.style.visibility=\"hidden\"\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function hideddrivetip(){\r\n");
      out.write("if (ns6||ie){\r\n");
      out.write("enabletip=false\r\n");
      out.write("tipobj.style.visibility=\"hidden\"\r\n");
      out.write("pointerobj.style.visibility=\"hidden\"\r\n");
      out.write("tipobj.style.left=\"-1000px\"\r\n");
      out.write("tipobj.style.backgroundColor=''\r\n");
      out.write("tipobj.style.width=''\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("document.onmousemove=positiontip\r\n");
      out.write("//--->\r\n");
      out.write("</script>");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 }else if(menuName == 2){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

int menuNum = NumberUtils.toInt(request.getParameter("menu"),2);

int pRegion = NumberUtils.toInt(request.getParameter("region"), 0);
PackageDao pkDao = new PackageDao();
List<RegionDto> rList = pkDao.getRegionList("1");

//String nowDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
Calendar vCalendar = Calendar.getInstance();
String strDate = Integer.toString(NumberUtils.toInt(request.getParameter("date"),0));
int tYear;
int tMonth;
int tDay;
if(strDate == null || strDate.length() != 8){
	strDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	out.print("<script>");
	out.print("location.href='/forGolfbooking/reserve.jsp?menu=2&region="+pRegion+"&date="+strDate+"';");
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
String tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
String tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
String tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));

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

String strWhere = "AND A.menu_seq = " + Integer.toString(menuNum) + " ";
if(pRegion >= 1 && pRegion <= 6){
	strWhere += "AND A.region_seq = " + pRegion;
}
/*
String strRegion = request.getParameter("region");
if(strRegion != null){
	if(strRegion.equals("1") || strRegion.equals("2") 
			|| strRegion.equals("3") || strRegion.equals("4")
			|| strRegion.equals("5") || strRegion.equals("6")){
		strWhere += "AND A.region_seq = " + strRegion;
	}
}
*/
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> listGolf = glDao.getGolfLinkList(strWhere);

Calendar incDate = Calendar.getInstance();
incDate.set(tYear, tMonth-1, tDay);


      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("#dhtmltooltip{\r\n");
      out.write("position: absolute;\r\n");
      out.write("left: -300px;\r\n");
      out.write("width: 130px;\r\n");
      out.write("border: 1px solid black;\r\n");
      out.write("padding: 3px;\r\n");
      out.write("background-color: lightyellow;\r\n");
      out.write("visibility: hidden;\r\n");
      out.write("z-index: 100;\r\n");
      out.write("filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#dhtmlpointer{\r\n");
      out.write("position:absolute;\r\n");
      out.write("left: -300px;\r\n");
      out.write("z-index: 101;\r\n");
      out.write("visibility: hidden;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=751><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=751>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 height=\"650\" align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>사전예약</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>사전예약</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<tr>\r\n");
      out.write("<td>&nbsp;</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("<td align=\"right\">\r\n");

	if(pRegion == 0){

      out.write("\r\n");
      out.write("\t<SPAN class=blue>전체보기</SPAN> &nbsp;I&nbsp;\r\n");
		
	}else{

      out.write("\r\n");
      out.write("\t<a class=area href=\"reserve.jsp?menu=1&date=");
      out.print(strDate );
      out.write("\">전체보기</a> &nbsp;I&nbsp;\r\n");
		
	}
		
	for(int i = 0; i < rList.size(); i++){ 
		if(pRegion == rList.get(i).getRegion_seq()){

      out.write("\r\n");
      out.write("\t\t<SPAN class=blue>");
      out.print(rList.get(i).getRegion_name());
      out.write("</SPAN> &nbsp;I&nbsp;\r\n");

		}else{

      out.write("\r\n");
      out.write("\t\t<A class=area href=\"reserve.jsp?menu=2&region=");
      out.print(rList.get(i).getRegion_seq());
      out.write("&date=");
      out.print(strDate );
      out.write('"');
      out.write('>');
      out.print(rList.get(i).getRegion_name());
      out.write("</A> &nbsp;I &nbsp;\r\n");
 
		}
	} 

      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=40 align=right>\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"75\" align=\"center\"><p><a href=\"/forGolfbooking/reserve.jsp?menu=");
      out.print(menuNum);
      out.write("&region=");
      out.print(pRegion );
      out.write("&date=");
      out.print(preDate);
      out.write("\"><img align=\"absmiddle\" src=\"../../images/booking/btn_2week_pre.gif\" width=\"62\" height=\"22\" border=\"0\"></a></p></td>\r\n");
      out.write("    <td width=\"75\" align=\"center\"><p><a href=\"/forGolfbooking/reserve.jsp?menu=");
      out.print(menuNum);
      out.write("&region=");
      out.print(pRegion );
      out.write("&date=");
      out.print(eDate);
      out.write("\"><img align=\"absmiddle\" src=\"../../images/booking/btn_2week_later.gif\" width=\"62\" height=\"22\" border=\"0\"></a></p></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=707 bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=#f1f1f1 height=35 width=212 align=center><SPAN class=normal_s>사전신청예약 골프장명</SPAN></TD>\r\n");
 
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
			weekImg = "img_monday.gif";
			break;
		case 3:
			weekImg = "img_tuesday.gif";
			break;
		case 4:
			weekImg = "img_wednesday.gif";
			break;
		case 5:
			weekImg = "img_thursday.gif";
			break;
		case 6:
			weekImg = "img_friday.gif";
			break;
		case 7:
			weekImg = "img_saturday.gif";
			weekClass = "saturday";
			break;
		case 1:
			weekImg = "img_sunday.gif";
			weekClass = "sunday";
			break;
		default:
			break;
	}
	incDate.add(incDate.DATE, 1);

      out.write("\r\n");
      out.write("<TD bgColor=#f1f1f1 width=30 align=center>\r\n");
      out.write("<SPAN class=\"");
      out.print(weekClass);
      out.write('"');
      out.write('>');
      out.print(Integer.toString(incMonth)+"/"+Integer.toString(incDay));
      out.write("<BR></SPAN>\r\n");
      out.write("<IMG border=0 align=absMiddle src=\"../../images/booking/");
      out.print(weekImg);
      out.write("\" width=20 height=16>\r\n");
      out.write("</TD>\r\n");
 
} 

      out.write('\r');
      out.write('\n');

for(int i = 0; i < listGolf.size(); i++){
	ProductDto pDto = new ProductDto();
	pDto.setGolflink_seq(listGolf.get(i).getGolflink_seq());
	pDto.setProduct_startDate(sDate);
	pDto.setProduct_endDate(eDate);
	List<ProductDto> listPrdt = glDao.getGolfProductList(pDto);

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 5px\" bgColor=white height=30><SPAN class=normal_s style=\"color:red;font-weight:bold\" >(");
      out.print(listGolf.get(i).getRegion_name() );
      out.write(')');
      out.print(listGolf.get(i).getGolflink_name());
      out.write("</SPAN></TD>\r\n");

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
		for(int j = 0; j < listPrdt.size(); j++){
			if(listPrdt.get(j).getProduct_year().equals(cYear)
					&&listPrdt.get(j).getProduct_month().equals(cMonth)
					&&listPrdt.get(j).getProduct_day().equals(cDay))
			{
				pDate = cYear + "/" + cMonth + "/" + cDay;
				cDate = cYear + cMonth + cDay;
				rCnt = listPrdt.get(j).getProduct_cnt();
			}
		}		
		if(pDate.equals("")){

      out.write("\r\n");
      out.write("\t\t<TD bgColor=white height=30 align=center>&nbsp;</TD>\r\n");

		}else{

      out.write("\r\n");
      out.write("\t\t<TD bgColor=white height=30 align=center>\r\n");
      out.write("\t\t<a href=\"/forGolfbooking/detail.jsp?menu=");
      out.print(menuNum);
      out.write("&golf=");
      out.print(listGolf.get(i).getGolflink_seq());
      out.write("&date=");
      out.print(sDate );
      out.write("&cdate=");
      out.print(cDate);
      out.write("\"><IMG border=0 align=absMiddle src=\"../../images/booking/img_golf_pole.gif\" width=24 height=22 onMouseover=\"ddrivetip('");
      out.print(pDate );
      out.write("</br>--------------------</br>예약가능팀 : ");
      out.print(rCnt );
      out.write("팀');\" onMouseout=\"hideddrivetip()\"></a>\r\n");
      out.write("\t\t</TD>\r\n");

		}
	}

      out.write("\r\n");
      out.write("</TR>\r\n");

}

      out.write("\r\n");
      out.write("</TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("<!---//\r\n");
      out.write("var offsetfromcursorX=12 // 커서의 x 축 \r\n");
      out.write("var offsetfromcursorY=10 //y 축 위치\r\n");
      out.write("\r\n");
      out.write("var offsetdivfrompointerX=10 //커서그림의 X\r\n");
      out.write("var offsetdivfrompointerY=14 //Y축임 신경안써도 무방\r\n");
      out.write("document.write('<div id=\"dhtmltooltip\"></div>') \r\n");
      out.write("document.write('<img id=\"dhtmlpointer\" src=\"http://gif00.com.ne.kr/image/balloon.gif\">') //말풍선모양의 꼭지그림주소입니다.필히넣어야합니다\r\n");
      out.write("\r\n");
      out.write("var ie=document.all\r\n");
      out.write("var ns6=document.getElementById && !document.all\r\n");
      out.write("var enabletip=false\r\n");
      out.write("if (ie||ns6)\r\n");
      out.write("var tipobj=document.all? document.all[\"dhtmltooltip\"] : document.getElementById? document.getElementById(\"dhtmltooltip\") : \"\"\r\n");
      out.write("\r\n");
      out.write("var pointerobj=document.all? document.all[\"dhtmlpointer\"] : document.getElementById? document.getElementById(\"dhtmlpointer\") : \"\"\r\n");
      out.write("\r\n");
      out.write("function ietruebody(){\r\n");
      out.write("return (document.compatMode && document.compatMode!=\"BackCompat\")? document.documentElement : document.body\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function ddrivetip(thetext, thewidth, thecolor){\r\n");
      out.write("if (ns6||ie){\r\n");
      out.write("if (typeof thewidth!=\"undefined\") tipobj.style.width=thewidth+\"px\"\r\n");
      out.write("if (typeof thecolor!=\"undefined\" && thecolor!=\"\") tipobj.style.backgroundColor=thecolor\r\n");
      out.write("tipobj.innerHTML=thetext\r\n");
      out.write("enabletip=true\r\n");
      out.write("return false\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function positiontip(e){\r\n");
      out.write("if (enabletip){\r\n");
      out.write("var nondefaultpos=false\r\n");
      out.write("var curX=(ns6)?e.pageX : event.x+ietruebody().scrollLeft;\r\n");
      out.write("var curY=(ns6)?e.pageY : event.y+ietruebody().scrollTop;\r\n");
      out.write("//Find out how close the mouse is to the corner of the window\r\n");
      out.write("var winwidth=ie&&!window.opera? ietruebody().clientWidth : window.innerWidth-20\r\n");
      out.write("var winheight=ie&&!window.opera? ietruebody().clientHeight : window.innerHeight-20\r\n");
      out.write("\r\n");
      out.write("var rightedge=ie&&!window.opera? winwidth-event.clientX-offsetfromcursorX : winwidth-e.clientX-offsetfromcursorX\r\n");
      out.write("var bottomedge=ie&&!window.opera? winheight-event.clientY-offsetfromcursorY : winheight-e.clientY-offsetfromcursorY\r\n");
      out.write("\r\n");
      out.write("var leftedge=(offsetfromcursorX<0)? offsetfromcursorX*(-1) : -1000\r\n");
      out.write("\r\n");
      out.write("if (rightedge<tipobj.offsetWidth){\r\n");
      out.write("tipobj.style.left=curX-tipobj.offsetWidth+\"px\"\r\n");
      out.write("nondefaultpos=true\r\n");
      out.write("}\r\n");
      out.write("else if (curX<leftedge)\r\n");
      out.write("tipobj.style.left=\"5px\"\r\n");
      out.write("else{\r\n");
      out.write("tipobj.style.left=curX+offsetfromcursorX-offsetdivfrompointerX+\"px\"\r\n");
      out.write("pointerobj.style.left=curX+offsetfromcursorX+\"px\"\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("if (bottomedge<tipobj.offsetHeight){\r\n");
      out.write("tipobj.style.top=curY-tipobj.offsetHeight-offsetfromcursorY+\"px\"\r\n");
      out.write("nondefaultpos=true\r\n");
      out.write("}\r\n");
      out.write("else{\r\n");
      out.write("tipobj.style.top=curY+offsetfromcursorY+offsetdivfrompointerY+\"px\"\r\n");
      out.write("pointerobj.style.top=curY+offsetfromcursorY+\"px\"\r\n");
      out.write("}\r\n");
      out.write("tipobj.style.visibility=\"visible\"\r\n");
      out.write("if (!nondefaultpos)\r\n");
      out.write("pointerobj.style.visibility=\"visible\"\r\n");
      out.write("else\r\n");
      out.write("pointerobj.style.visibility=\"hidden\"\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function hideddrivetip(){\r\n");
      out.write("if (ns6||ie){\r\n");
      out.write("enabletip=false\r\n");
      out.write("tipobj.style.visibility=\"hidden\"\r\n");
      out.write("pointerobj.style.visibility=\"hidden\"\r\n");
      out.write("tipobj.style.left=\"-1000px\"\r\n");
      out.write("tipobj.style.backgroundColor=''\r\n");
      out.write("tipobj.style.width=''\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("document.onmousemove=positiontip\r\n");
      out.write("//--->\r\n");
      out.write("</script>");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 }else if(menuName == 3){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

int pRegion = NumberUtils.toInt(request.getParameter("region"), 0);
//String pRegion = StringUtils.defaultIfEmpty(request.getParameter("region"), "0");
PackageDao pkDao = new PackageDao();
List<RegionDto> rList = pkDao.getRegionList("1");

String strWhere = "";
if(pRegion != 0){
	strWhere = "AND a.region_seq = " + pRegion;
}
List<PackageDto> pkList = pkDao.getPackageList(strWhere);

      out.write("\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 height=\"650\" align=center>\r\n");
      out.write("\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("\t<TBODY>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프패키지 &gt; <SPAN class=location_b>국내골프패키지</SPAN></TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>국내골프패키지</TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD vAlign=top>\r\n");
      out.write("\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t<TBODY>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD>\r\n");
      out.write("\t\t<P>&nbsp;</P></TD></TR>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD align=center>\r\n");
      out.write("\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t\t<TBODY>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD style=\"PADDING-RIGHT: 18px\" height=30 align=right>\r\n");
      out.write("\t\t\t");

				if(pRegion == 0){
			
      out.write("\r\n");
      out.write("\t\t\t\t<SPAN class=blue>전체보기</SPAN> &nbsp;I&nbsp;\r\n");
      out.write("\t\t\t");
		
				}else{
			
      out.write("\r\n");
      out.write("\t\t\t\t<a class=area href=\"reserve.jsp?menu=3\">전체보기</a> &nbsp;I&nbsp;\r\n");
      out.write("\t\t\t");
		
				}
					
				for(int i = 0; i < rList.size(); i++){ 
					if(pRegion == rList.get(i).getRegion_seq()){
			
      out.write("\r\n");
      out.write("\t\t\t\t\t<SPAN class=blue>");
      out.print(rList.get(i).getRegion_name());
      out.write("</SPAN> &nbsp;I&nbsp;\r\n");
      out.write("\t\t\t");

					}else{
			
      out.write("\r\n");
      out.write("\t\t\t\t\t<A class=area href=\"reserve.jsp?menu=3&region=");
      out.print(rList.get(i).getRegion_seq());
      out.write('"');
      out.write('>');
      out.print(rList.get(i).getRegion_name());
      out.write("</A> &nbsp;I &nbsp;\r\n");
      out.write("\t\t\t");
 
					}
				} 
			
      out.write("\r\n");
      out.write("\t\t\t</TD></TR>\r\n");

if(pkList.size() > 0){
	int i = 0;
	int j = (int)Math.round((double)pkList.size()/2);
	for(int k = 0; k < j;k++){

      out.write("\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD align=center>\r\n");
      out.write("\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=669>\r\n");
      out.write("\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD vAlign=top width=325>\r\n");

		if(i < pkList.size()){

      out.write("\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=325>\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD width=325 colSpan=2>\r\n");
      out.write("\t\t\t\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=3 width=\"100%\" bgColor=#d1d3d4>\r\n");
      out.write("\t\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t\t<TD bgColor=white height=120 align=center>\r\n");
      out.write("\t\t\t\t\t\t\t<TABLE cellSpacing=0 cellPadding=0 width=313>\r\n");
      out.write("\t\t\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t\t\t<TD bgColor=#f1f1f1 height=110 width=313 align=center><img src=\"/upload/");
      out.print(pkList.get(i).getImg_sub() );
      out.write("\" width=\"313\" height=\"110\"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD colSpan=2>&nbsp;</TD></TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t");
 
						String packName1 = "";
						if(pkList.get(i).getPackage_name1().trim().length() > 0 && pkList.get(i).getPackage_name2().trim().length() > 0){
							packName1 = pkList.get(i).getPackage_name1() + " + " + pkList.get(i).getPackage_name2();
						}else{
							packName1 = pkList.get(i).getPackage_name1() + pkList.get(i).getPackage_name2();
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<TD class=cc_name colSpan=2>");
      out.print(packName1 );
      out.write("</TD></TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD width=225><SPAN class=normal_fee_b><strike>정상가 : ");
      out.print(commify(pkList.get(i).getOff_n_mon()) );
      out.write("원 ~</strike></SPAN></TD>\r\n");
      out.write("\t\t\t\t\t<TD vAlign=bottom rowSpan=2 width=100 align=center><A href=\"detail.jsp?menu=3&pkSeq=");
      out.print(pkList.get(i).getPackage_seq() );
      out.write("\"><IMG border=0 align=absMiddle src=\"../../images/common/btn_regist_booking.gif\" width=89 height=34></A></TD></TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD width=225><SPAN class=mem_fee_b>회원가 : ");
      out.print(commify(pkList.get(i).getOff_s_mon()) );
      out.write("원 ~</SPAN></TD></TR></TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");

			i++;
		}

      out.write("\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t<TD width=19>&nbsp;</TD>\r\n");
      out.write("\t\t\t\t<TD vAlign=top width=325>\r\n");

		if(i < pkList.size()){

      out.write("\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=325>\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD width=325 colSpan=2>\r\n");
      out.write("\t\t\t\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=3 width=\"100%\" bgColor=#d1d3d4>\r\n");
      out.write("\t\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t\t<TD bgColor=white height=120 align=center>\r\n");
      out.write("\t\t\t\t\t\t<img src=\"/upload/");
      out.print(pkList.get(i).getImg_sub() );
      out.write("\" width=\"313\" height=\"110\"></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD colSpan=2>&nbsp;</TD></TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t");
 
						String packName2 = "";
						if(pkList.get(i).getPackage_name1().trim().length() > 0 && pkList.get(i).getPackage_name2().trim().length() > 0){
							packName2 = pkList.get(i).getPackage_name1() + " + " + pkList.get(i).getPackage_name2();
						}else{
							packName2 = pkList.get(i).getPackage_name1() + pkList.get(i).getPackage_name2();
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<TD class=cc_name colSpan=2>");
      out.print(packName2 );
      out.write("</TD></TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD width=225><SPAN class=normal_fee_b><strike>정상가 : ");
      out.print(commify(pkList.get(i).getOff_n_mon()) );
      out.write("원 ~</strike></SPAN></TD>\r\n");
      out.write("\t\t\t\t\t<TD vAlign=bottom rowSpan=2 width=100 align=center><A href=\"detail.jsp?menu=3&pkSeq=");
      out.print(pkList.get(i).getPackage_seq() );
      out.write("\"><IMG border=0 align=absMiddle src=\"../../images/common/btn_regist_booking.gif\" width=89 height=34></A></TD></TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD width=225><SPAN class=mem_fee_b>회원가 : ");
      out.print(commify(pkList.get(i).getOff_s_mon()) );
      out.write("원 ~</SPAN></TD></TR></TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");

			i++;
		}

      out.write("\r\n");
      out.write("\t\t\t\t</TD></TR></TBODY></TABLE>\r\n");
      out.write("\t\t\t</TD></TR>\r\n");
      out.write("\t\t<TR><TD>&nbsp;</TD></TR>\r\n");

	}
}

      out.write("\r\n");
      out.write("\t\t\t</TBODY></TABLE></TD></TR>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 }else if(menuName == 5){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	int region = NumberUtils.toInt(request.getParameter("region"),0);

	//어드민쪽 DAO랑 사용자쪽 DAO가 틀려요 근데 왜 안되는지 몰겠네여;
	PackageDao pkDao = new PackageDao();
	List<RegionDto> arrRegions = pkDao.getRegionList("1");
	
	CondoReserveDao cdDao = new CondoReserveDao();
	
	List<CondoDto> condoList = cdDao.getCondoList(region);
	

      out.write("\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("                          <tr>\r\n");
      out.write("                            <td><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                  <td width=\"751\"><table border=\"0\" cellpadding=\"2\" cellspacing=\"1\" width=\"751\" bgcolor=\"#D2D2D2\">\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                        <td align=\"center\" bgcolor=\"white\" width=\"745\" height=\"650\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"95%\">\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td align=\"right\" class=\"location\" height=\"30\" width=\"95%\"><a href=\"/index.html\">HOME</a> &gt; <span class=location_b>콘도예약</span></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td bgcolor=\"#D1D3D4\" height=\"33\" class=\"sub_title\" style=\"padding-left:15px;padding-top:4px\">콘도예약</td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td><p>&nbsp;</p></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td align=\"center\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"30\" align=\"right\" style=\"padding-right:18px;\">\r\n");
      out.write("                                                    ");
 
                                                    	if(region == 0){
    												
      out.write("\r\n");
      out.write("    \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span class=blue>전체보기</span> &nbsp;I &nbsp;\r\n");
      out.write("    \t\t\t\t\t\t\t\t\t\t\t\t");
}else{
      out.write("\r\n");
      out.write("    \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"/forGolfbooking/reserve.jsp?menu=5&region=0\" class=area>전체보기</a> &nbsp;I &nbsp;\r\n");
      out.write("    \t\t\t\t\t\t\t\t\t\t\t\t");

    													}
                                                    
														if (arrRegions != null && !arrRegions.isEmpty()){
															for(int i = 0; i < arrRegions.size();i++){
																if(region == arrRegions.get(i).getRegion_seq()){
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span class=blue>");
      out.print(arrRegions.get(i).getRegion_name());
      out.write("</a></span> &nbsp;I &nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

																}
																else{
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"/forGolfbooking/reserve.jsp?menu=5&region=");
      out.print(arrRegions.get(i).getRegion_seq() );
      out.write("\" class=area>");
      out.print(arrRegions.get(i).getRegion_name());
      out.write("</a> &nbsp;I &nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");
				
																}
															}
														}
													
      out.write("\r\n");
      out.write("                                                    </td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td align=\"center\">\r\n");
      out.write("                                                    <table border=\"0\" width=\"669\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                                      <tr>\r\n");
      out.write("\t\t\t\t\t");

										if(condoList != null && !condoList.isEmpty()){
											
											String img_dir = Config.get("reserve_img");
											int size = condoList.size();
											
											int remainder = size%2;
											
											CondoDto cdDto;
											for(int i = 0 ; i < size ; i++){
												
												cdDto = condoList.get(i);
												
												if(i!=0 && i%2==0){
					
      out.write("                                    \r\n");
      out.write("                                                     </tr>\r\n");
      out.write("                                                  </table>\r\n");
      out.write("                                                  <div style=\"height:20px;\"></div>\r\n");
      out.write("                                                  <table border=\"0\" width=\"669\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                                      <tr>\r\n");
      out.write("                                                        \r\n");
      out.write("                      ");

												}
                      
      out.write("                                    \r\n");
      out.write("                                                         <td width=\"325\" valign=\"top\">\r\n");
      out.write("                                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"325\">\r\n");
      out.write("                                                              <tr>\r\n");
      out.write("                                                                <td colspan=\"2\" width=\"325\"><table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" width=\"100%\" bgcolor=\"#D1D3D4\">\r\n");
      out.write("                                                                    <tr>\r\n");
      out.write("                                                                      <td bgcolor=\"white\" height=\"120\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" width=\"313\">\r\n");
      out.write("                                                                          <tr>\r\n");
      out.write("                                                                            <td width=\"313\" height=\"110\" bgcolor=\"#F1F1F1\" align=\"center\"><img src=\"");
      out.print(img_dir);
      out.print(cdDto.getImg_main());
      out.write("\" width=\"313\" height=\"110\"/></td>\r\n");
      out.write("                                                                          </tr>\r\n");
      out.write("                                                                        </table></td>\r\n");
      out.write("                                                                    </tr>\r\n");
      out.write("                                                                  </table></td>\r\n");
      out.write("                                                              </tr>\r\n");
      out.write("                                                              <tr>\r\n");
      out.write("                                                                <td colspan=\"2\">&nbsp;</td>\r\n");
      out.write("                                                              </tr>\r\n");
      out.write("                                                              <tr>\r\n");
      out.write("                                                                <td class=\"cc_name\" colspan=\"2\">");
      out.print(cdDto.getCondo_name());
      out.write("</td>\r\n");
      out.write("                                                              </tr>\r\n");
      out.write("                                                              <tr>\r\n");
      out.write("                                                                <td width=\"225\"><span class=normal_fee_b><strike>정상가:주중");
      out.print(Utils.numberFormat(cdDto.getPrice_n1()));
      out.write("원 ~ 주말");
      out.print(Utils.numberFormat(cdDto.getPrice_n1()));
      out.write("원</strike></span></td>\r\n");
      out.write("                                                                <td width=\"100\" rowspan=\"2\" align=\"center\" valign=\"bottom\"><a href=\"detail.jsp?menu=5&condo_seq=");
      out.print(cdDto.getCondo_seq());
      out.write("\"><img align=\"absmiddle\" src=\"../../images/common/btn_regist_booking.gif\" width=\"89\" height=\"34\" border=\"0\"></a></td>\r\n");
      out.write("                                                              </tr>\r\n");
      out.write("                                                              <tr>\r\n");
      out.write("                                                                <td width=\"225\"><span class=mem_fee_b>회원가:주중 ");
      out.print(Utils.numberFormat(cdDto.getPrice_s1()));
      out.write("원 ~ 주말 ");
      out.print(Utils.numberFormat(cdDto.getPrice_s1()));
      out.write("원</span></td>\r\n");
      out.write("                                                              </tr>\r\n");
      out.write("                                                            </table>\r\n");
      out.write("                                                            </td>\r\n");
      out.write("                                                          \t<td width=\"19\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t");

											}
										}
					
      out.write("                                   </tr>\r\n");
      out.write("                                                      </table>\r\n");
      out.write("                                                \t</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td>&nbsp;</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                </table></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td>&nbsp;</td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                          </table></td>\r\n");
      out.write("                                      </tr>\r\n");
      out.write("                                    </table></td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                              </table></td>\r\n");
      out.write("                          </tr>\r\n");
      out.write("                        </table>");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("                            <td>&nbsp;</td>\r\n");
      out.write("                          </tr>\r\n");
      out.write("\t\t\t\t\t</table>\t\t\t\t\t\r\n");
      out.write("                    ");
      out.write("﻿\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td><script>flashObject(\"/images/swf/bottom_menu.swf\",\"\",\"751\",\"27\")</script></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height=\"76\"><img src=\"/images/common/img_copyright.gif\" width=\"751\" height=\"76\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>");
      out.write("\t\t\t\t\t\r\n");
      out.write("﻿\r\n");
      out.write("                      </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                  </table></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"198\" background=\"/images/common/img_copyright_bg.jpg\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
