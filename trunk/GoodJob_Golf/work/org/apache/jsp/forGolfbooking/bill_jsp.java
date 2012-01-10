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
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.ProductReserveDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.ProductReserveDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import com.goodjob.reserve.dto.PackageDto;
import java.util.List;
import com.goodjob.reserve.PackageDao;

public final class bill_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


public String commify(int n) {
	return com.goodjob.util.Utils.numberFormat(n);
}

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(7);
    _jspx_dependants.add("/include/header.jsp");
    _jspx_dependants.add("/forGolfbooking/billReal.jsp");
    _jspx_dependants.add("/forGolfbooking/billPre.jsp");
    _jspx_dependants.add("/forGolfbooking/billPackage.jsp");
    _jspx_dependants.add("/forGolfbooking/billCondo.jsp");
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

String menu = "1";
int productsubSeq = NumberUtils.toInt(request.getParameter("gcId"), 0);
int golf = NumberUtils.toInt(request.getParameter("golf"), 0);
int date = NumberUtils.toInt(request.getParameter("date"), 0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"), 0);

if(productsubSeq == 0 || golf == 0 || date == 0 || cdate == 0){
	out.println("<script>location.href='reserve.jsp?menu=1'</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> listPr = glDao.getGolfProduct(productsubSeq);

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
int buyPrice = prDto.getNH_price() * 4;

      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("<!--\n");
      out.write("function reSetDate(){\r\n");
      out.write("\tlocation.href = \"/forGolfbooking/detail.jsp?menu=1&golf=");
      out.print(golf);
      out.write("&date=");
      out.print(date);
      out.write("&cdate=");
      out.print(cdate);
      out.write("\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function billok(){\r\n");
      out.write("\tvar chkBool = true;\r\n");
      out.write("\tif($(\"#reserveName\").val().length == 0){\r\n");
      out.write("\t\talert(\"예약자명을 입력하세요\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif($(\"#phone1\").val().length == 0){\r\n");
      out.write("\t\tchkBool = false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif($(\"#phone2\").val().length == 0){\r\n");
      out.write("\t\tchkBool = false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif($(\"#phone3\").val().length == 0){\r\n");
      out.write("\t\tchkBool = false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(!chkBool){\r\n");
      out.write("\t\talert(\"연락처를 입력하세요.\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#menu\").val(\"");
      out.print(menu);
      out.write("\");\r\n");
      out.write("\t$(\"#gcId\").val(\"");
      out.print(productsubSeq);
      out.write("\");\r\n");
      out.write("\t$(\"#golf\").val('");
      out.print(golf);
      out.write("');\r\n");
      out.write("\t$(\"#date\").val('");
      out.print(date);
      out.write("');\r\n");
      out.write("\t$(\"#cdate\").val('");
      out.print(cdate);
      out.write("');\r\n");
      out.write("\t\r\n");
      out.write("\tif($(\"#billBtype\").attr(\"checked\")){\r\n");
      out.write("\t\tif(window.confirm(\"예약을 완료하시려면 확인 버튼을 누르십시오 \\r\\n예약확인 SMS : \"+$(\"#phone1\").val()+$(\"#phone2\").val()+$(\"#phone3\").val())){\r\n");
      out.write("\t\t\tfrm.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("$(function(){\r\n");
      out.write("\t$(\"#chkRealName\").click(function(){\t\t\r\n");
      out.write("\t\tif(this.checked){\r\n");
      out.write("\t\t\tdocument.getElementById(\"reserveName\").readOnly = true;\r\n");
      out.write("\t\t\t$(\"#reserveName\").val(\"");
      out.print(user_Name);
      out.write("\");\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tdocument.getElementById(\"reserveName\").readOnly = false;\r\n");
      out.write("\t\t\t$(\"#reserveName\").val(\"\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("});\n");
      out.write("//-->\n");
      out.write("</script>\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"result.jsp\">\r\n");
      out.write("<input type=\"hidden\" id=\"menu\" name=\"menu\" value=\"1\">\r\n");
      out.write("<input type=\"hidden\" id=\"gcId\" name=\"gcId\" >\r\n");
      out.write("<input type=\"hidden\" id=\"golf\" name=\"golf\" >\r\n");
      out.write("<input type=\"hidden\" id=\"date\" name=\"date\" >\r\n");
      out.write("<input type=\"hidden\" id=\"cdate\" name=\"cdate\" >\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>예약확인 및 결제</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>예약확인 및 결제</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>\r\n");
      out.write("<P>&nbsp;</P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center><IMG border=0 src=\"/images/booking/img_finished_title.gif\" width=640 height=108></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=601 bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 width=170 align=right>예약자명</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" class=normal_b bgColor=white width=420><INPUT id=\"reserveName\" name=\"reserveName\" class=input_01 name=day size=14 value=\"\"> <INPUT name=\"chkRealName\" id=\"chkRealName\" type=checkbox><SPAN class=mem_notice>실제이용자가 예약자와 동일한 경우 체크</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>연락처</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=30><SELECT size=1 id=\"phone1\" name=\"phone1\"> \r\n");
      out.write("<OPTION value=\"\" selected>선택</OPTION> \r\n");
      out.write("<OPTION value=\"010\">010</OPTION> \r\n");
      out.write("<OPTION value=\"011\">011</OPTION> \r\n");
      out.write("<OPTION value=\"016\">016</OPTION> \r\n");
      out.write("<OPTION value=\"017\">017</OPTION> \r\n");
      out.write("<OPTION value=\"018\">018</OPTION> \r\n");
      out.write("<OPTION value=\"019\">019</OPTION>\r\n");
      out.write("</SELECT> - <INPUT id=\"phone2\" name=\"phone2\" class=input_01 name=day size=6 maxlength=\"4\"> - <INPUT id=\"phone3\" name=\"phone3\" class=input_01 name=day size=6 maxlength=\"4\"></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=mem_notice height=20>예약사항을 입력하신 핸드폰번호로 SMS발송해드립니다 </TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>골프장명</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(prDto.getGolflink_name() );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>부킹일시</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(bookingDate );
      out.write(" &nbsp;<IMG border=0 align=absMiddle src=\"/images/booking/btn_back.gif\" width=67 height=16 onclick=\"reSetDate();\" style=\"cursor:hand\"></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>코스명</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(StringUtils.defaultIfEmpty(prDto.getCourse_name(), "<div class=red_s>없음</div>") );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>인원</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>4명</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>프리미엄상품권 적용</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white height=25><SELECT size=1 name=formselect1> <OPTION selected>선택하세요</OPTION></SELECT></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>결제금액</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white><SPAN class=orange>");
      out.print(commify(buyPrice) );
      out.write("</SPAN>원</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>결제방법선택</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white><INPUT id=\"billBtype\" name=\"billtype\" value=\"B\" type=radio checked> 무통장입금</TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-BOTTOM: 50px; PADDING-TOP: 30px\" align=center><IMG border=0 src=\"/images/booking/btn_next_page3.gif\" onclick=\"billok();\" style=\"cursor:hand\"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>\r\n");
      out.write("</FORM>");
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

String menu = "2";
int productsubSeq = NumberUtils.toInt(request.getParameter("psId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"), 0);
int date = NumberUtils.toInt(request.getParameter("date"), 0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"), 0);
int rCnt = NumberUtils.toInt(request.getParameter("reserveCnt"), 0);
int rTeam = NumberUtils.toInt(request.getParameter("reserveTeam"), 0);
String rDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String rTime = StringUtils.trimToEmpty(request.getParameter("reserveTime"));
String rName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String rPhone = StringUtils.trimToEmpty(request.getParameter("reservePhone"));
String rEmail = StringUtils.trimToEmpty(request.getParameter("reserveEmail"));
String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));
rRequest = rRequest.replaceAll("\r\n","</br>");

if(productsubSeq == 0 || golf == 0 || date == 0
		|| cdate == 0 || rCnt == 0 || rTeam == 0){
	out.println("<script>location.href='reserve.jsp?menu=2'</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> listPr = glDao.getGolfProduct(productsubSeq);

ProductReserveDto prDto = null;
if(listPr == null || listPr.size() != 1){
	out.println("<script>location.href='reserve.jsp?menu=2'</script>");
	return;
}
prDto = listPr.get(0);

String bookingDate = prDto.getProduct_date();
String bookingTime = prDto.getTime_start();
bookingDate = bookingDate.substring(0,4) + "-" + bookingDate.substring(4,6) + "-" + bookingDate.substring(6,8) + " ";
bookingDate += bookingTime.substring(0,2) + ":" + bookingTime.substring(2,4); 

int buyPrice = prDto.getGoodjob_price() * rCnt;

      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("<!--\r\n");
      out.write("function reSetDate(){\r\n");
      out.write("\tlocation.href = \"/forGolfbooking/detail.jsp?menu=2&golf=");
      out.print(golf);
      out.write("&date=");
      out.print(date);
      out.write("&cdate=");
      out.print(cdate);
      out.write("\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function billok(){\r\n");
      out.write("\tif(window.confirm(\"사전예약신청 내역입니다.\\r\\n예약신청내역이 맞으시면 사전신청예약버튼을 누르십시오 \\r\\n예약신청확인 SMS : ");
      out.print(rPhone );
      out.write("\")){\r\n");
      out.write("\t\tfrm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("//-->\r\n");
      out.write("</script>\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"result.jsp\">\r\n");
      out.write("<input type=\"hidden\" id=\"menu\" name=\"menu\" value=\"2\" >\r\n");
      out.write("<input type=\"hidden\" id=\"psId\" name=\"psId\" value=\"");
      out.print(productsubSeq );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" id=\"golf\" name=\"golf\" value=\"");
      out.print(golf );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" id=\"date\" name=\"date\" value=\"");
      out.print(date );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" id=\"cdate\" name=\"cdate\" value=\"");
      out.print(cdate );
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("<input type=\"hidden\" id=\"reserveCnt\" name=\"reserveCnt\" value=\"");
      out.print(rCnt );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveTeam\" name=\"reserveTeam\" value=\"");
      out.print(rTeam );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveDate\" name=\"reserveDate\" value=\"");
      out.print(rDate );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveTime\" name=\"reserveTime\" value=\"");
      out.print(rTime );
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("<input type=\"hidden\" id=\"reserveName\" name=\"reserveName\" value=\"");
      out.print(rName );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" id=\"reservePhone\" name=\"reservePhone\" value=\"");
      out.print(rPhone );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveEmail\" name=\"reserveEmail\" value=\"");
      out.print(rEmail );
      out.write("\">\r\n");
      out.write("<textarea id=\"reserveRequest\" name=\"reserveRequest\" style=\"display:none\">");
      out.print(rRequest);
      out.write("</textarea>\r\n");
      out.write("\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>예약확인</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>예약확인</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>&nbsp;</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center><IMG border=0 src=\"../../images/booking/img_finished_before_title.gif\" width=640 height=108></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=601 bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 width=132 align=right>예약자이름</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" class=normal_b bgColor=white width=442>");
      out.print(rName );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>연락처</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>\r\n");
      out.write("<P>");
      out.print(rPhone );
      out.write("</P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>E-Mail</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(rEmail );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>골프장명</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(prDto.getGolflink_name() );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>시간대</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(rDate );
      out.write(" &nbsp;");
      out.print(rTime );
      out.write(" &nbsp;<IMG border=0 align=absMiddle src=\"../../images/booking/btn_back.gif\" width=67 height=16 onclick=\"reSetDate();\" style=\"cursor:hand\"></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>인원</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(rCnt );
      out.write('인');
      out.write(' ');
      out.print(rTeam );
      out.write("팀</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>결제예상금액</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white><SPAN class=orange>");
      out.print(commify(buyPrice) );
      out.write("</SPAN>원</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=normal_b bgColor=#f1f1f1 height=25 align=right>요청사항</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(rRequest );
      out.write("</TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-BOTTOM: 50px; PADDING-TOP: 30px\" align=center><IMG border=0 src=\"/images/booking/btn_before_01.gif\" onclick=\"billok();\" style=\"cursor:hand\"></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=100>&nbsp;</TD></TR>\r\n");
      out.write("</TBODY></TABLE></TD></TR></TBODY></TABLE>\r\n");
      out.write("</FORM>");
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

String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));
int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"),0);

PackageDao pkDao = new PackageDao();
String strWhere = "AND a.package_seq = '" + pkSeq + "'";
List<PackageDto> pkList = pkDao.getPackageList(strWhere);
PackageDto pkDto = new PackageDto();
if(pkList != null && pkList.size() == 1){
	pkDto = pkList.get(0);
}

String[] eMail = (user_Id!=null)? user_Id.split("@") : null;
String eMail1 = "";
String eMail2 = "";
if(eMail != null && eMail.length == 2){
	eMail1 = eMail[0];
	eMail2 = eMail[1];
}

      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("<!--\n");
      out.write("$(function() {\r\n");
      out.write("\t$( \"#reserveDate\" ).datepicker({\r\n");
      out.write("\t\tdateFormat:'yy-mm-dd',\r\n");
      out.write("\t\tonSelect : function(dateText, inst){\t\t\r\n");
      out.write("\t\t\tvar nowDate = (\"");
      out.print(headDate_now);
      out.write("\").replace('-','').replace('-','');\r\n");
      out.write("\t\t\tvar arrDate = dateText.split(\"-\");\r\n");
      out.write("\t\t\tarrDate = arrDate[0] + arrDate[1] + arrDate[2];\r\n");
      out.write("\t\t\tif(nowDate > arrDate){\r\n");
      out.write("\t\t\t\talert(\"오늘보다 이전날짜를 선택할 수 없습니다.\");\r\n");
      out.write("\t\t\t\t$( \"#reserveDate\" ).val(\"");
      out.print(headDate_now);
      out.write("\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$( \"#reserveDate\" ).change(\r\n");
      out.write("\t\tfunction(){\r\n");
      out.write("\t\t\tvar arrDate = this.value.split(\"-\");\r\n");
      out.write("\t\t\tvar week = new Array('일', '월', '화', '수', '목', '금', '토');\r\n");
      out.write("\t\t\tvar rDate = new Date(arrDate[1]+\"/\"+arrDate[2]+\"/\"+arrDate[0]);\r\n");
      out.write("\t\t\t$(\"#weekname\").text(week[rDate.getDay()] + \"요일\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t);\r\n");
      out.write("\t$(\"#btnReserveDate\").click(\r\n");
      out.write("\t\tfunction(){\r\n");
      out.write("\t\t\t$( \"#reserveDate\" ).datepicker(\"show\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t);\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("function emaildomain(){\r\n");
      out.write("\t$(\"#eMail2\").val($(\"#ddlEmail\").val());\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function billok(){\r\n");
      out.write("\tif(!$('#reserveName').val()) {\r\n");
      out.write("\t\talert('예약자이름을 입력하시기 바랍니다.');\r\n");
      out.write("\t\t$('#reserveName').focus();\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t} \r\n");
      out.write("\tif($('#phone1').val() == \"\" || $('#phone2').val().length < 3 || $('#phone3').val().length < 4) {\r\n");
      out.write("\t\talert('핸드폰을 입력하시기 바랍니다.');\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t} \r\n");
      out.write("\tif($('#reserveDate').val().length == \"0\") {\r\n");
      out.write("\t\talert('출발일을 입력하시기 바랍니다.');\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t} \r\n");
      out.write("\tif($('#reservePerson').val().length == \"0\") {\r\n");
      out.write("\t\talert('인원을 입력하시기 바랍니다.');\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t} \r\n");
      out.write("\r\n");
      out.write("\tif(window.confirm(\"국내패키지 예약신청 내역입니다.\\r\\n예약내역이 맞으시면 예약신청 버튼을 누르십시오 \\r\\n예약신청확인 SMS : \"+$(\"#phone1\").val()+$(\"#phone2\").val()+$(\"#phone3\").val())){\r\n");
      out.write("\t\tfrm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("}\n");
      out.write("//-->\n");
      out.write("</script>\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"result.jsp\">\r\n");
      out.write("<input type=\"hidden\" id=\"menu\" name=\"menu\" value=\"3\" >\r\n");
      out.write("<input type=\"hidden\" id=\"pkSeq\" name=\"pkSeq\" value=\"");
      out.print(pkSeq );
      out.write("\" >\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프패키지 &gt; <SPAN class=location_b>국내골프패키지</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>국내골프패키지</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<P><IMG border=0 src=\"../../images/package/img_domestic_regist_title.gif\" width=640 height=108></P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=600 bgColor=\"#d1d3d4\" align=center>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=#aed247 width=594 colSpan=2></TD></TR>\r\n");
      out.write("<TR>\r\n");
 
	String packName = "";
	if(pkDto.getPackage_name1().trim().length() > 0 && pkDto.getPackage_name2().trim().length() > 0){
		packName = pkDto.getPackage_name1() + " + " + pkDto.getPackage_name2();
	}else{
		packName = pkDto.getPackage_name1() + pkDto.getPackage_name2();
	}

      out.write("\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>패키지명</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=451><SPAN class=normal_b>");
      out.print(packName );
      out.write("</SPAN>\r\n");
      out.write("<input type=\"hidden\" id=\"packageName\" name=\"packageName\" value=\"");
      out.print(packName );
      out.write("\">\r\n");
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=13 width=122 align=right>예약자이름</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=451><INPUT class=input_01 id=\"reserveName\" name=\"reserveName\" size=15></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 align=right>핸드폰</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white><SELECT size=1 id=\"phone1\" name=\"phone1\"> \r\n");
      out.write("<OPTION value=\"\" selected>선택</OPTION> \r\n");
      out.write("<OPTION value=\"010\">010</OPTION> \r\n");
      out.write("<OPTION value=\"011\">011</OPTION> \r\n");
      out.write("<OPTION value=\"016\">016</OPTION> \r\n");
      out.write("<OPTION value=\"017\">017</OPTION> \r\n");
      out.write("<OPTION value=\"018\">018</OPTION> \r\n");
      out.write("<OPTION value=\"019\">019</OPTION></SELECT> - <INPUT class=input_01 id=\"phone2\" name=\"phone2\" size=8 maxlength=\"4\"> - <INPUT class=input_01 id=\"phone3\" name=\"phone3\" size=8 maxlength=\"4\"></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>E-Mail</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=451><INPUT class=input_01 id=\"eMail1\" name=\"eMail1\" size=15 readonly value=\"");
      out.print(eMail1 );
      out.write("\"> @ <INPUT class=input_01 id=\"eMail2\" name=\"eMail2\" size=15 readonly value=\"");
      out.print(eMail2 );
      out.write("\"> \r\n");
      out.write("<SELECT size=1 id=\"ddlEmail\" name=\"ddlEmail\" onchange=\"emaildomain();\" disabled> \r\n");
      out.write("\t<OPTION value=\"\" SELECTED>직접입력하기</OPTION> \r\n");
      out.write("\t<OPTION value=\"naver.com\">naver.com</OPTION> \r\n");
      out.write("\t<OPTION value=\"hanmail.net\">hanmail.net</OPTION>\r\n");
      out.write("\t<OPTION value=\"dreamwiz.com\">dreamwiz.com</OPTION> \r\n");
      out.write("\t<OPTION value=\"empal.com\">empal.com</OPTION> \r\n");
      out.write("\t<OPTION value=\"hanmir.com\">hanmir.com</OPTION> \r\n");
      out.write("\t<OPTION value=\"hanafos.com\">hanafos.com</OPTION> \r\n");
      out.write("\t<OPTION value=\"nate.com\">nate.com</OPTION>\r\n");
      out.write("\t<OPTION value=\"paran.com\">paran.com</OPTION> \r\n");
      out.write("\t<OPTION value=\"yahoo.co.kr\">yahoo.co.kr</OPTION> \r\n");
      out.write("\t<OPTION value=\"gmail.com\">gmail.com</OPTION></SELECT></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=12 width=122 align=right>출발일</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=451><IMG id=\"btnReserveDate\" name=\"btnReserveDate\" border=0 align=absMiddle src=\"../../images/package/img_calendar.gif\" width=15 height=16  style=\"cursor:hand\"> <INPUT class=input_01 id=\"reserveDate\" name=\"reserveDate\" size=10 maxlength=\"10\" readonly /> <span id=\"weekname\" name=\"weekname\"></span></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=12 width=122 align=right>인원</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white height=25 width=451><INPUT class=input_01 id=\"reserveTeam\" name=\"reserveTeam\" size=4 value=\"1\" readonly=\"readonly\"> 팀 <INPUT class=input_01 id=\"reservePerson\" name=\"reservePerson\" size=4 maxlength=\"2\"> 인 </TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 width=122 align=right>요청사항</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=451><TEXTAREA class=box_02 cols=70 rows=8 id=\"content\" name=\"content\"></TEXTAREA></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=#aed247 width=594 colSpan=2></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-BOTTOM: 60px; PADDING-TOP: 40px\" align=center><A href=\"javascript:;\" onclick=\"billok();\"><IMG border=0 align=absMiddle src=\"../../images/package/btn_domestic_regist3.gif\" width=150 height=39></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>\r\n");
      out.write("</FORM>");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 }else if(menuName == 5){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
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
