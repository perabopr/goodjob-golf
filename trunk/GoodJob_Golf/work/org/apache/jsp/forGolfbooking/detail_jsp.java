package org.apache.jsp.forGolfbooking;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import java.text.DecimalFormat;
import java.util.Calendar;
import com.goodjob.reserve.dto.RegionDto;
import java.util.List;
import com.goodjob.reserve.PackageDao;
import com.goodjob.util.Utils;
import org.apache.commons.lang.StringUtils;
import java.text.DecimalFormat;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.ProductReserveDto;
import com.goodjob.reserve.dto.ProductDto;
import java.util.Calendar;
import com.goodjob.reserve.dto.GolfLinkPriceDto;
import com.goodjob.reserve.dto.GolfLinkDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import java.text.DecimalFormat;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.ProductReserveDto;
import com.goodjob.reserve.dto.ProductDto;
import java.util.Calendar;
import com.goodjob.reserve.dto.GolfLinkPriceDto;
import com.goodjob.reserve.dto.GolfLinkDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import com.goodjob.common.Utillity;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.PackageDto;
import java.util.List;
import com.goodjob.reserve.PackageDao;
import org.apache.commons.lang.math.NumberUtils;
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

public final class detail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


public String commify(int n) {
	return com.goodjob.util.Utils.numberFormat(n);
}

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(8);
    _jspx_dependants.add("/include/loginCheck.jsp");
    _jspx_dependants.add("/include/header.jsp");
    _jspx_dependants.add("/forGolfbooking/detailReal.jsp");
    _jspx_dependants.add("/forGolfbooking/detailPre.jsp");
    _jspx_dependants.add("/forGolfbooking/detailPackage.jsp");
    _jspx_dependants.add("/forGolfbooking/detailCondo.jsp");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("﻿\r\n");
      out.write("\r\n");

if(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")).length()==0){

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\talert(\"로그인이 필요한 곳입니다.\");\r\n");
      out.write("\t//history.go(-1);\r\n");
      out.write("\tlocation.href=\"/member/member_logon.jsp\";\r\n");
      out.write("</script>\r\n");

	return;
}

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

String golfSeq = Integer.toString(NumberUtils.toInt(request.getParameter("golf"),0));
String curDate = Integer.toString(NumberUtils.toInt(request.getParameter("cdate"),0));
if(curDate == null || curDate.length() != 8){
	out.print("<script>");
	out.print("location.href='reserve.jsp?menu=1';");
	out.print("</script>");
	return;
}

//골프장상세정보.
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> listGolf = glDao.getGolfLinkDetail(Integer.parseInt(golfSeq));
if(listGolf == null || listGolf.size() != 1){
	out.print("<script>");
	out.print("location.href='reserveReal.jsp?menu=1';");
	out.print("</script>");
	return;
}
GolfLinkDto glDto = listGolf.get(0);
String imgSubPath1 = glDto.getImg_sub1();
if(imgSubPath1.length() != 0){
	imgSubPath1 = "/upload/" + imgSubPath1;
}else{
	imgSubPath1 = "../../images/common/img_thumb_ready.jpg";
}
String imgSubPath2 = glDto.getImg_sub2();
if(imgSubPath2.length() != 0){
	imgSubPath2 = "/upload/" + imgSubPath2;
}else{
	imgSubPath2 = "../../images/common/img_thumb_ready.jpg";
}
String imgSubPath3 = glDto.getImg_sub3();
if(imgSubPath3.length() != 0){
	imgSubPath3 = "/upload/" + imgSubPath3;
}else{
	imgSubPath3 = "../../images/common/img_thumb_ready.jpg";
}
String imgSubPath4 = glDto.getImg_sub4();
if(imgSubPath4.length() != 0){
	imgSubPath4 = "/upload/" + imgSubPath4;
}else{
	imgSubPath4 = "../../images/common/img_thumb_ready.jpg";
}

//가격정보.
List<GolfLinkPriceDto> listGolfPrice = glDao.getGolfLinkPrice(Integer.parseInt(golfSeq));
int np = 0;
int nw = 0;
int sp = 0;
int sw = 0;
for(int i = 0; i < listGolfPrice.size();i++){
	if(listGolfPrice.get(i).getPrice_type().equals("1")){
		np = listGolfPrice.get(i).getGolflink_price();
	}else if(listGolfPrice.get(i).getPrice_type().equals("2")){
		nw = listGolfPrice.get(i).getGolflink_price();		
	}else if(listGolfPrice.get(i).getPrice_type().equals("3")){
		sp = listGolfPrice.get(i).getGolflink_price();		
	}else if(listGolfPrice.get(i).getPrice_type().equals("4")){
		sw = listGolfPrice.get(i).getGolflink_price();		
	}
}

//파라메터 날짜체크.
Calendar vCalendar = Calendar.getInstance();
String strDate = request.getParameter("date");
int tYear;
int tMonth;
int tDay;
if(strDate == null || strDate.length() != 8){
	strDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());

	tYear = Integer.parseInt(strDate.substring(0,4));
	tMonth = Integer.parseInt(strDate.substring(4,6));
	tDay = Integer.parseInt(strDate.substring(6,8));
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

//이전날짜.
String preDate = tmYear
			+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
			+ tmDay.substring(tmDay.length()-2, tmDay.length());

vCalendar.add(vCalendar.DATE, 28);

tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));

//현재날짜.
String sDate = strDate;
//다음날짜.
String eDate = tmYear
			+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
			+ tmDay.substring(tmDay.length()-2, tmDay.length());

//2주 예약가능리스트
ProductDto pDto = new ProductDto();
pDto.setGolflink_seq(glDto.getGolflink_seq());
pDto.setProduct_startDate(sDate);
pDto.setProduct_endDate(eDate);
List<ProductDto> listPrdt = glDao.getGolfProductList(pDto);

//시작일 설정.
Calendar incDate = Calendar.getInstance();
incDate.set(tYear, tMonth-1, tDay);

String arrDateStr = "";
for(int i = 0; i < listPrdt.size();i++){
	arrDateStr += listPrdt.get(i).getProduct_date()+",";
}
if(arrDateStr.length() > 0){
	arrDateStr = arrDateStr.substring(0,arrDateStr.length()-1);
}

//선택날짜 예약리스트 가져오기.
ProductReserveDto prDto = new ProductReserveDto();
prDto.setGolflink_seq(Integer.parseInt(golfSeq));
prDto.setProduct_date(curDate);
List<ProductReserveDto> listPr = glDao.getGolfProduct(prDto);

      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("#dhtmltooltip{\r\n");
      out.write("position: absolute;\r\n");
      out.write("left: -300px;\r\n");
      out.write("width: 300px;\r\n");
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
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("<!---//\r\n");
      out.write("function DisplayMenu(vIdx){\r\n");
      out.write("\t$(\"#imgtap1\").attr(\"src\", \"../../images/booking/btn_tab_off_01.gif\");\r\n");
      out.write("\t$(\"#imgtap2\").attr(\"src\", \"../../images/booking/btn_tab_off_02.gif\");\r\n");
      out.write("\t$(\"#imgtap3\").attr(\"src\", \"../../images/booking/btn_tab_off_03.gif\");\r\n");
      out.write("\t$(\"#imgtap4\").attr(\"src\", \"../../images/booking/btn_tab_off_04.gif\"); \r\n");
      out.write("\t$(\"#destap1\").hide();\r\n");
      out.write("\t$(\"#destap2\").hide();\r\n");
      out.write("\t$(\"#destap3\").hide();\r\n");
      out.write("\t$(\"#destap4\").hide();\r\n");
      out.write("\t\r\n");
      out.write("\tswitch(vIdx){\r\n");
      out.write("\t\tcase 1:\r\n");
      out.write("\t\t\t$(\"#imgtap1\").attr(\"src\", \"../../images/booking/btn_tab_on_01.gif\"); \r\n");
      out.write("\t\t\t$(\"#destap1\").show();\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 2:\r\n");
      out.write("\t\t\t$(\"#imgtap2\").attr(\"src\", \"../../images/booking/btn_tab_on_02.gif\");\r\n");
      out.write("\t\t\t$(\"#destap2\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 3:\r\n");
      out.write("\t\t\t$(\"#imgtap3\").attr(\"src\", \"../../images/booking/btn_tab_on_03.gif\");\r\n");
      out.write("\t\t\t$(\"#destap3\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 4:\r\n");
      out.write("\t\t\t$(\"#imgtap4\").attr(\"src\", \"../../images/booking/btn_tab_on_04.gif\");\r\n");
      out.write("\t\t\t$(\"#ifrmMap\").attr(\"src\", \"/forGolfbooking/ifrm_map.jsp?x=");
      out.print(glDto.getPoint_x());
      out.write('&');
      out.write('y');
      out.write('=');
      out.print(glDto.getPoint_y());
      out.write("\");\r\n");
      out.write("\t\t\t$(\"#destap4\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function reserveSubmit(gcId){\r\n");
      out.write("\t$(\"#menu\").val(\"1\");\r\n");
      out.write("\t$(\"#gcId\").val(gcId);\r\n");
      out.write("\t$(\"#golf\").val('");
      out.print(request.getParameter("golf"));
      out.write("');\r\n");
      out.write("\t$(\"#date\").val('");
      out.print(request.getParameter("date"));
      out.write("');\r\n");
      out.write("\t$(\"#cdate\").val('");
      out.print(request.getParameter("cdate"));
      out.write("');\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function nextResDate(){\r\n");
      out.write("\tlocation.href = \"/forGolfbooking/detail.jsp?menu=1&golf=");
      out.print(golfSeq);
      out.write("&date=");
      out.print(eDate);
      out.write("&cdate=");
      out.print(curDate);
      out.write("\";\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function preResDate(){\r\n");
      out.write("\tlocation.href = \"/forGolfbooking/detail.jsp?menu=1&golf=");
      out.print(golfSeq);
      out.write("&date=");
      out.print(preDate);
      out.write("&cdate=");
      out.print(curDate);
      out.write("\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function imgChange(objId){\r\n");
      out.write("\t$(\"#imgmain\").attr(\"src\", objId.src);\r\n");
      out.write("}\r\n");
      out.write("//--->\r\n");
      out.write("</script>\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"rule.jsp\">\r\n");
      out.write("<input type=\"hidden\" id=\"menu\" name=\"menu\" >\r\n");
      out.write("<input type=\"hidden\" id=\"gcId\" name=\"gcId\" >\r\n");
      out.write("<input type=\"hidden\" id=\"golf\" name=\"golf\" >\r\n");
      out.write("<input type=\"hidden\" id=\"date\" name=\"date\" >\r\n");
      out.write("<input type=\"hidden\" id=\"cdate\" name=\"cdate\" >\r\n");
      out.write("</FORM>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 align=center>\r\n");
      out.write("\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("\t<TBODY>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>실시간예약</SPAN></TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>실시간예약</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD vAlign=top><P>&nbsp;</P></TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD vAlign=top align=center>\r\n");
      out.write("\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t<TBODY>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD vAlign=top width=295>\r\n");
      out.write("\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=274 bgColor=white>\r\n");
      out.write("\t\t\t<TBODY>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD bgColor=white>\r\n");
      out.write("\t\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=2 width=274 bgColor=silver>\r\n");
      out.write("\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD bgColor=white width=270><IMG border=0 id=\"imgmain\" name=\"imgmain\" src=\"");
      out.print(imgSubPath1 );
      out.write("\" width=270 height=202></TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD bgColor=white height=10></TD></TR>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD bgColor=white width=272>\r\n");
      out.write("\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD width=62>\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD bgColor=white><IMG border=0 name=img1 src=\"");
      out.print(imgSubPath1 );
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t<TD width=62>\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD bgColor=white><IMG border=0 name=img2 src=\"");
      out.print(imgSubPath2 );
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t<TD width=62>\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD bgColor=white><IMG border=0 name=img3 src=\"");
      out.print(imgSubPath3 );
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t<TD width=62>\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD bgColor=white><IMG border=0 name=img4 src=\"");
      out.print(imgSubPath4 );
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t\t</TBODY>\r\n");
      out.write("\t\t\t</TABLE>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD vAlign=top width=412>\r\n");
      out.write("\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t\t<TBODY>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD class=cc_name vAlign=top>\r\n");
      out.write("\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD class=cc_name>");
      out.print(glDto.getGolflink_name());
      out.write("</TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD height=10></TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD>\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD class=normal_b height=23 width=47>주소 </TD>\r\n");
      out.write("\t\t\t\t\t<TD width=12>:</TD>\r\n");
      out.write("\t\t\t\t\t<TD width=320>");
      out.print(glDto.getGolflink_address1() + " " + glDto.getGolflink_address2() );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD class=normal_b height=23>홀구분</TD>\r\n");
      out.write("\t\t\t\t\t<TD>:</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=orange>");
      out.print(glDto.getHoll_type());
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD class=normal_b height=23>&nbsp;</TD>\r\n");
      out.write("\t\t\t\t\t<TD>&nbsp;</TD>\r\n");
      out.write("\t\t\t\t\t<TD><a href=\"");
      out.print(glDto.getCourse_guide() );
      out.write("\" target=\"_blank\"><IMG border=0 src=\"../../images/booking/btn_golfcourse.gif\" width=70 height=19 style=\"cursor:hand\"></a></TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD>&nbsp;</TD></TR>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD class=normal_b>가격정보 </TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD>\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=2 width=\"100%\" bgColor=#d1d3d4>\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD bgColor=#f1f1f1 height=25 width=45 align=center>&nbsp;</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=normal_s bgColor=#f1f1f1 height=22 width=95 align=center>그린피정상가</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=sunday bgColor=#f1f1f1 width=90 align=center>그린피할인가</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=red_s bgColor=#f1f1f1 width=150 align=center>4인그린피할인가 합계</TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD class=saturday bgColor=white height=25 align=center>주중</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=normal_s bgColor=white align=center>");
      out.print(commify(np) );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=sunday bgColor=white align=center>");
      out.print(commify(sp) );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=red_s bgColor=white align=center>");
      out.print(commify(sp*4) );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD class=sunday bgColor=white height=25 align=center>주말</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=normal_s bgColor=white align=center>");
      out.print(commify(nw) );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=sunday bgColor=white align=center>");
      out.print(commify(sw) );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=red_s bgColor=white align=center>");
      out.print(commify(sw*4) );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD>&nbsp;</TD></TR>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD class=red_s>");
      out.print(glDto.getCancel_rule() );
      out.write("</TD>\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t\t</TBODY>\r\n");
      out.write("\t\t\t</TABLE>\r\n");
      out.write("\t\t\t<P>&nbsp;</P>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD width=707 colSpan=2>&nbsp;</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD width=707 colSpan=2>\r\n");
      out.write("\t\t\t<TABLE border=0 cellSpacing=1 cellPadding=2 width=707 bgColor=#d1d3d4>\r\n");
      out.write("\t\t\t<TBODY>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD bgColor=#f1f1f1 height=35 width=212 align=center><SPAN class=normal_s>실시간예약 골프장명</SPAN></TD>\r\n");
 
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
      out.write("\t\t\t<TD bgColor=#f1f1f1 width=30 align=center>\r\n");
      out.write("\t\t\t<SPAN class=\"");
      out.print(weekClass);
      out.write('"');
      out.write('>');
      out.print(Integer.toString(incMonth)+"/"+Integer.toString(incDay));
      out.write("<BR></SPAN>\r\n");
      out.write("\t\t\t<IMG border=0 align=absMiddle src=\"../../images/booking/");
      out.print(weekImg);
      out.write("\" width=20 height=16>\r\n");
      out.write("\t\t\t</TD>\r\n");
 
} 

      out.write("\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD style=\"PADDING-LEFT: 5px\" bgColor=white height=30><SPAN class=normal_s>");
      out.print(glDto.getGolflink_name());
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
      out.write("\t\t\t<TD bgColor=white height=30 align=center>&nbsp;</TD>\r\n");

		}else{

      out.write("\r\n");
      out.write("\t\t\t<TD bgColor=white height=30 align=center>\r\n");
      out.write("\t\t\t<a href=\"/forGolfbooking/detail.jsp?menu=");
      out.print(menuNum);
      out.write("&golf=");
      out.print(glDto.getGolflink_seq());
      out.write("&date=");
      out.print(sDate );
      out.write("&cdate=");
      out.print(cDate);
      out.write("\"><IMG border=0 align=absMiddle src=\"../../images/booking/img_golf_pole.gif\" width=24 height=22 onMouseover=\"ddrivetip('");
      out.print(pDate );
      out.write("</br>--------------------</br>예약가능팀 : ");
      out.print(rCnt );
      out.write("팀');\" onMouseout=\"hideddrivetip()\"></a>\r\n");
      out.write("\t\t\t</TD>\r\n");

		}
	}

      out.write("\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t\t</TBODY>\r\n");
      out.write("\t\t\t</TABLE>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD height=50 width=707 colSpan=2 align=right>\r\n");
      out.write("\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=150>\r\n");
      out.write("\t\t\t<TBODY>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD width=75 align=center><IMG border=0 src=\"../../images/booking/btn_prev_day.gif\" width=65 height=20 onclick=\"preResDate();\" style=\"cursor:hand\"></TD>\r\n");
      out.write("\t\t\t<TD width=75 align=center><IMG border=0 src=\"../../images/booking/btn_next_day.gif\" width=65 height=20 onclick=\"nextResDate();\" style=\"cursor:hand\"></TD>\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t\t</TBODY>\r\n");
      out.write("\t\t\t</TABLE>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD vAlign=top width=707 colSpan=2 align=center>\r\n");
      out.write("\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>\r\n");
      out.write("\t\t\t<TBODY>\r\n");
      out.write("\t\t\t<TR><TD width=426></TD></TR>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t<TD vAlign=top width=\"100%\">\r\n");
      out.write("\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD style=\"CURSOR: hand\" onclick=DisplayMenu(1) width=176><IMG id=\"imgtap1\" alt=\"실시간 예약하기\" src=\"../../images/booking/btn_tab_on_01.gif\" width=173 height=25></TD>\r\n");
      out.write("\t\t\t\t\t<TD style=\"CURSOR: hand\" onclick=DisplayMenu(2) width=176><IMG id=\"imgtap2\" alt=이용안내 src=\"../../images/booking/btn_tab_off_02.gif\" width=173 height=25></TD>\r\n");
      out.write("\t\t\t\t\t<TD style=\"CURSOR: hand\" onclick=DisplayMenu(3) width=176><IMG id=\"imgtap3\" alt=골프장소개 src=\"../../images/booking/btn_tab_off_03.gif\" width=173 height=25></TD>\r\n");
      out.write("\t\t\t\t\t<TD style=\"CURSOR: hand\" onclick=DisplayMenu(4) width=176><IMG id=\"imgtap4\" alt=오시는길 src=\"../../images/booking/btn_tab_off_04.gif\" width=173 height=25></TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD bgColor=#91b500 height=1 width=704 colSpan=4></TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t<TR><TD height=10></TD></TR>\r\n");
      out.write("\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD bgColor=white align=center>\r\n");
      out.write("\t\t\t\t\t<DIV style=\"DISPLAY: block\" id=destap1>\r\n");
      out.write("\t\t\t\t\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<TBODY>\r\n");
      out.write("\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t<TD>\r\n");
      out.write("\t\t\t\t\t\t<TABLE id=\"tbReserveList\" border=0 cellSpacing=1 cellPadding=2 width=706 bgColor=#d1d3d4>\r\n");
      out.write("\t\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t\t<TD class=normal_b bgColor=#f1f1f1 height=25 width=120 align=center>부킹날짜</TD>\r\n");
      out.write("\t\t\t\t\t\t<TD class=normal_b bgColor=#f1f1f1 height=25 width=120 align=center>부킹시간</TD>\r\n");
      out.write("\t\t\t\t\t\t<TD class=normal_b bgColor=#f1f1f1 width=168 align=center>코스</TD>\r\n");
      out.write("\t\t\t\t\t\t<TD class=normal_b bgColor=#f1f1f1 width=90 align=center>홀구분</TD>\r\n");
      out.write("\t\t\t\t\t\t<TD class=normal_b bgColor=#f1f1f1 width=182 align=center>예약가능여부</TD>\r\n");
      out.write("\t\t\t\t\t\t</TR>\r\n");

	for(int i = 0; i < listPr.size();i++){
		String tmpDate = listPr.get(i).getProduct_date();
		String tmpTime = listPr.get(i).getTime_start();
		tmpDate = tmpDate.substring(0,4) + "-" + tmpDate.substring(4,6) + "-" + tmpDate.substring(6,8);
		tmpTime = tmpTime.substring(0,2) + ":" + tmpTime.substring(2,4);
		

      out.write("\r\n");
      out.write("\t\t\t\t\t\t<TR>\r\n");
      out.write("\t\t\t\t\t\t<TD bgColor=white height=25 align=center>");
      out.print(tmpDate );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t\t<TD bgColor=white height=25 align=center>");
      out.print(tmpTime );
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t\t<TD bgColor=white align=center>");
      out.print(StringUtils.defaultIfEmpty(listPr.get(i).getCourse_name(), "<div class=red_s>없음</div>"));
      out.write("</TD>\r\n");
      out.write("\t\t\t\t\t\t<TD bgColor=white align=center>");
      out.print(listPr.get(i).getHoll_type() );
      out.write("</TD>\r\n");

		if(listPr.get(i).getProduct_status().equals("0")){			

      out.write("\r\n");
      out.write("\t\t\t\t\t\t<TD bgColor=white align=center><A href=\"javascript:;\" onclick=\"reserveSubmit('");
      out.print(listPr.get(i).getProductsub_seq() );
      out.write("')\"><IMG border=0 align=absMiddle src=\"../../images/booking/btn_regist_ok.gif\" width=112 height=20></A></TD>\t\t\r\n");

		}else{

      out.write("\r\n");
      out.write("\t\t\t\t\t\t<TD bgColor=white height=25 align=center><IMG border=0 align=absMiddle src=\"../../images/booking/btn_regist_no.gif\" width=112 height=20></TD>\r\n");
			
		}

      out.write("\r\n");
      out.write("\t\t\t\t\t\t</TR>\r\n");

	}

      out.write("\r\n");
      out.write("\t\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t\t<TR><TD height=50>&nbsp;</TD></TR>\r\n");
      out.write("\t\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t\t</DIV>\r\n");
      out.write("\t\t\t\t\t<div id=\"destap2\" style=\"display:none;\">");
      out.print(glDto.getUse_guide() );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div id=\"destap3\" style=\"display:none;\">");
      out.print(glDto.getGolflink_guide() );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div id=\"destap4\" style=\"display:none;\">\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<iframe id=\"ifrmMap\" src=\"\" width=602 height=402 frameborder=\"0\" border=\"0\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" noresize></iframe>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t</TR>\r\n");
      out.write("\t\t\t\t</TBODY>\r\n");
      out.write("\t\t\t\t</TABLE>\r\n");
      out.write("\t\t\t\t</DIV>\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t\t</TBODY>\r\n");
      out.write("\t\t\t</TABLE>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t<TD vAlign=top width=707 colSpan=2 align=center>&nbsp;</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t</TBODY>\r\n");
      out.write("\t\t</TABLE>\r\n");
      out.write("\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t</TBODY>\r\n");
      out.write("\t</TABLE>\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("</TBODY>\r\n");
      out.write("</TABLE>\r\n");
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

int menuNum = NumberUtils.toInt(request.getParameter("menu"),1);

String golfSeq = Integer.toString(NumberUtils.toInt(request.getParameter("golf"),0));
String curDate = Integer.toString(NumberUtils.toInt(request.getParameter("cdate"),0));
if(curDate == null || curDate.length() != 8){
	out.print("<script>");
	out.print("location.href='reserve.jsp?menu=2';");
	out.print("</script>");
	return;
}

//골프장상세정보.
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkDto> listGolf = glDao.getGolfLinkDetail(Integer.parseInt(golfSeq));
if(listGolf == null || listGolf.size() != 1){
	out.print("<script>");
	out.print("location.href='reserve.jsp?menu=2';");
	out.print("</script>");
	return;
}
GolfLinkDto glDto = listGolf.get(0);

//가격정보.
List<GolfLinkPriceDto> listGolfPrice = glDao.getGolfLinkPrice(Integer.parseInt(golfSeq));
int np = 0;
int nw = 0;
int sp = 0;
int sw = 0;
for(int i = 0; i < listGolfPrice.size();i++){
	if(listGolfPrice.get(i).getPrice_type().equals("1")){
		np = listGolfPrice.get(i).getGolflink_price();
	}else if(listGolfPrice.get(i).getPrice_type().equals("2")){
		nw = listGolfPrice.get(i).getGolflink_price();		
	}else if(listGolfPrice.get(i).getPrice_type().equals("3")){
		sp = listGolfPrice.get(i).getGolflink_price();		
	}else if(listGolfPrice.get(i).getPrice_type().equals("4")){
		sw = listGolfPrice.get(i).getGolflink_price();		
	}
}

//파라메터 날짜체크.
Calendar vCalendar = Calendar.getInstance();
String strDate = request.getParameter("date");
int tYear;
int tMonth;
int tDay;
if(strDate == null || strDate.length() != 8){
	strDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());

	tYear = Integer.parseInt(strDate.substring(0,4));
	tMonth = Integer.parseInt(strDate.substring(4,6));
	tDay = Integer.parseInt(strDate.substring(6,8));
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

//이전날짜.
String preDate = tmYear
			+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
			+ tmDay.substring(tmDay.length()-2, tmDay.length());

vCalendar.add(vCalendar.DATE, 28);

tmYear = Integer.toString(vCalendar.get(vCalendar.YEAR));
tmMonth = "0" + Integer.toString(vCalendar.get(vCalendar.MONTH)+1);
tmDay = "0" + Integer.toString(vCalendar.get(vCalendar.DATE));

//현재날짜.
String sDate = strDate;
//다음날짜.
String eDate = tmYear
			+ tmMonth.substring(tmMonth.length()-2, tmMonth.length())
			+ tmDay.substring(tmDay.length()-2, tmDay.length());

//2주 예약가능리스트
ProductDto pDto = new ProductDto();
pDto.setGolflink_seq(glDto.getGolflink_seq());
pDto.setProduct_startDate(sDate);
pDto.setProduct_endDate(eDate);
List<ProductDto> listPrdt = glDao.getGolfProductList(pDto);

//시작일 설정.
Calendar incDate = Calendar.getInstance();
incDate.set(tYear, tMonth-1, tDay);

/*
String arrDateStr = "";
for(int i = 0; i < listPrdt.size();i++){
	arrDateStr += listPrdt.get(i).getProduct_date()+",";
}
if(arrDateStr.length() > 0){
	arrDateStr = arrDateStr.substring(0,arrDateStr.length()-1);
}
*/

//선택날짜 예약리스트 가져오기.
ProductReserveDto prDto = new ProductReserveDto();
prDto.setGolflink_seq(Integer.parseInt(golfSeq));
prDto.setProduct_date(curDate);
List<ProductReserveDto> listPr = glDao.getGolfProduct(prDto);

String[] eMail = (user_Id!=null)? user_Id.split("@") : null;
String eMail1 = "";
String eMail2 = "";
if(eMail != null && eMail.length == 2){
	eMail1 = eMail[0];
	eMail2 = eMail[1];
}


      out.write("\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("#dhtmltooltip{\r\n");
      out.write("position: absolute;\r\n");
      out.write("left: -300px;\r\n");
      out.write("width: 300px;\r\n");
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
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("<!---//\r\n");
      out.write("function DisplayMenu(vIdx){\r\n");
      out.write("\t$(\"#imgtap1\").attr(\"src\", \"../../images/booking/btn_tab_off_05.gif\");\r\n");
      out.write("\t$(\"#imgtap2\").attr(\"src\", \"../../images/booking/btn_tab_off_02.gif\");\r\n");
      out.write("\t$(\"#imgtap3\").attr(\"src\", \"../../images/booking/btn_tab_off_03.gif\");\r\n");
      out.write("\t$(\"#imgtap4\").attr(\"src\", \"../../images/booking/btn_tab_off_04.gif\"); \r\n");
      out.write("\t$(\"#destap1\").hide();\r\n");
      out.write("\t$(\"#destap2\").hide();\r\n");
      out.write("\t$(\"#destap3\").hide();\r\n");
      out.write("\t$(\"#destap4\").hide();\r\n");
      out.write("\t\r\n");
      out.write("\tswitch(vIdx){\r\n");
      out.write("\t\tcase 1:\r\n");
      out.write("\t\t\t$(\"#imgtap1\").attr(\"src\", \"../../images/booking/btn_tab_on_05.gif\"); \r\n");
      out.write("\t\t\t$(\"#destap1\").show();\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 2:\r\n");
      out.write("\t\t\t$(\"#imgtap2\").attr(\"src\", \"../../images/booking/btn_tab_on_02.gif\");\r\n");
      out.write("\t\t\t$(\"#destap2\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 3:\r\n");
      out.write("\t\t\t$(\"#imgtap3\").attr(\"src\", \"../../images/booking/btn_tab_on_03.gif\");\r\n");
      out.write("\t\t\t$(\"#destap3\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 4:\r\n");
      out.write("\t\t\t$(\"#imgtap4\").attr(\"src\", \"../../images/booking/btn_tab_on_04.gif\");\r\n");
      out.write("\t\t\t$(\"#ifrmMap\").attr(\"src\", \"/forGolfbooking/ifrm_map.jsp?x=");
      out.print(glDto.getPoint_x());
      out.write('&');
      out.write('y');
      out.write('=');
      out.print(glDto.getPoint_y());
      out.write("\");\r\n");
      out.write("\t\t\t$(\"#destap4\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function nextResDate(){\r\n");
      out.write("\tlocation.href = \"/forGolfbooking/detail.jsp?menu=2&golf=");
      out.print(golfSeq);
      out.write("&date=");
      out.print(eDate);
      out.write("&cdate=");
      out.print(curDate);
      out.write("\";\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function preResDate(){\r\n");
      out.write("\tlocation.href = \"/forGolfbooking/detail.jsp?menu=2&golf=");
      out.print(golfSeq);
      out.write("&date=");
      out.print(preDate);
      out.write("&cdate=");
      out.print(curDate);
      out.write("\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function selectGolfLink(){\r\n");
      out.write("\t$(\"#ddlTimeTerm option:selected\").each(function(){\r\n");
      out.write("\t\t$(\"#selectTime\").val($(this).text().replace(\"선택하세요\",\"\"));\r\n");
      out.write("\t});\r\n");
      out.write("\tvar tmpPerCnt = $(\"#ddlPersonCnt\").val();\r\n");
      out.write("\tvar tmpOptions = $(\"#ddlTimeTerm\").val();\r\n");
      out.write("\tvar tmpOption = tmpOptions.split(\"/\");\r\n");
      out.write("\r\n");
      out.write("\t$(\"#txtBillPrice\").text(commify(tmpPerCnt*tmpOption[1]));\r\n");
      out.write("\t$(\"#personCnt\").val($(\"#ddlPersonCnt\").val());\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#psId\").val(tmpOption[0]);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function reserveSubmit(){\r\n");
      out.write("\t$(\"#menu\").val(\"2\");\r\n");
      out.write("\t$(\"#golf\").val('");
      out.print(request.getParameter("golf"));
      out.write("');\r\n");
      out.write("\t$(\"#date\").val('");
      out.print(request.getParameter("date"));
      out.write("');\r\n");
      out.write("\t$(\"#cdate\").val('");
      out.print(request.getParameter("cdate"));
      out.write("');\r\n");
      out.write("\r\n");
      out.write("\tvar rCnt = $(\"#personCnt\").val();\r\n");
      out.write("\tif(rCnt.length == 0){\r\n");
      out.write("\t\talert(\"인원을 선택하세요.\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar rTeam = $(\"#teamCnt\").val();\r\n");
      out.write("\tif(rTeam.length == 0){\r\n");
      out.write("\t\talert(\"팀을 선택하세요.\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar rDate = $(\"#selectDate\").val();\r\n");
      out.write("\tif(rDate.length == 0){\r\n");
      out.write("\t\talert(\"날짜를 선택하세요.\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar rTime = $(\"#selectTime\").val();\r\n");
      out.write("\tif(rTime.length == 0){\r\n");
      out.write("\t\talert(\"시간대를 선택하세요.\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar rName = $(\"#reserveUName\").val();\r\n");
      out.write("\tif(rName.length == 0){\r\n");
      out.write("\t\talert(\"예약자이름을 입력하세요.\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar rPhone = $(\"#phone1\").val()+\"-\"+$(\"#phone2\").val()+\"-\"+$(\"#phone3\").val();\r\n");
      out.write("\tif($(\"#phone1\").val().length == 0 || $(\"#phone2\").val().length < 3 || $(\"#phone3\").val().length != 4){\r\n");
      out.write("\t\talert(\"핸드폰을 입력하세요.\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar rEmail = $(\"#email1\").val()+\"@\"+$(\"#email2\").val();\r\n");
      out.write("\tif($(\"#email1\").val().length == 0 && $(\"#email2\").val().length == 0){\r\n");
      out.write("\t\talert(\"E-Mail을 입력하세요.\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar rRequestContent = $(\"#requestContent\").val();\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#reserveCnt\").val(rCnt);\r\n");
      out.write("\t$(\"#reserveTeam\").val(rTeam);\r\n");
      out.write("\t$(\"#reserveDate\").val(rDate);\r\n");
      out.write("\t$(\"#reserveTime\").val(rTime);\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#reserveName\").val(rName);\t\r\n");
      out.write("\t$(\"#reservePhone\").val(rPhone);\t\r\n");
      out.write("\t$(\"#reserveEmail\").val(rEmail);\t\r\n");
      out.write("\t$(\"#reserveRequest\").val(rRequestContent);\t\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function emaildomain(){\r\n");
      out.write("\t$(\"#email2\").val($(\"#ddlEmail\").val());\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function imgChange(objId){\r\n");
      out.write("\t$(\"#imgmain\").attr(\"src\", objId.src);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function commify(n) {\r\n");
      out.write("  var reg = /(^[+-]?\\d+)(\\d{3})/;   // 정규식\r\n");
      out.write("  n += '';                          // 숫자를 문자열로 변환\r\n");
      out.write("\r\n");
      out.write("  while (reg.test(n))\r\n");
      out.write("    n = n.replace(reg, '$1' + ',' + '$2');\r\n");
      out.write("\r\n");
      out.write("  return n;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("//--->\r\n");
      out.write("</script>\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"rule.jsp\">\r\n");
      out.write("<input type=\"hidden\" id=\"menu\" name=\"menu\" value=\"2\" >\r\n");
      out.write("<input type=\"hidden\" id=\"psId\" name=\"psId\">\r\n");
      out.write("<input type=\"hidden\" id=\"golf\" name=\"golf\" >\r\n");
      out.write("<input type=\"hidden\" id=\"date\" name=\"date\" >\r\n");
      out.write("<input type=\"hidden\" id=\"cdate\" name=\"cdate\" >\r\n");
      out.write("\r\n");
      out.write("<input type=\"hidden\" id=\"reserveCnt\" name=\"reserveCnt\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveTeam\" name=\"reserveTeam\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveDate\" name=\"reserveDate\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveTime\" name=\"reserveTime\">\r\n");
      out.write("\r\n");
      out.write("<input type=\"hidden\" id=\"reserveName\" name=\"reserveName\">\r\n");
      out.write("<input type=\"hidden\" id=\"reservePhone\" name=\"reservePhone\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveEmail\" name=\"reserveEmail\">\r\n");
      out.write("<input type=\"hidden\" id=\"reserveRequest\" name=\"reserveRequest\">\r\n");
      out.write("</FORM>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>사전예약</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>사전예약</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top>\r\n");
      out.write("<P>&nbsp;</P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top width=295>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=274 bgColor=white>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=274 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white width=270><IMG border=0 id=\"imgmain\" name=\"imgmain\" src=\"/upload/");
      out.print(glDto.getImg_sub1());
      out.write("\" width=270 height=202></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white height=10></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white width=272>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=62>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white><IMG border=0 name=img1 src=\"/upload/");
      out.print(glDto.getImg_sub1());
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("<TD width=62>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white><IMG border=0 name=img1 src=\"/upload/");
      out.print(glDto.getImg_sub2());
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("<TD width=62>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white><IMG border=0 name=img1 src=\"/upload/");
      out.print(glDto.getImg_sub3());
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("<TD width=62>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white><IMG border=0 name=img1 src=\"/upload/");
      out.print(glDto.getImg_sub4());
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("<TD vAlign=top width=412>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=cc_name vAlign=top>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=cc_name>");
      out.print(glDto.getGolflink_name());
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=10></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b height=23 width=47>주소 </TD>\r\n");
      out.write("<TD width=12>:</TD>\r\n");
      out.write("<TD width=320>");
      out.print(glDto.getGolflink_address1() + " " + glDto.getGolflink_address2() );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b height=23>홀구분</TD>\r\n");
      out.write("<TD>:</TD>\r\n");
      out.write("<TD class=orange>");
      out.print(glDto.getHoll_type());
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b height=23>&nbsp;</TD>\r\n");
      out.write("<TD>&nbsp;</TD>\r\n");
      out.write("<TD><a href=\"");
      out.print(glDto.getCourse_guide() );
      out.write("\" target=\"_blank\"><IMG border=0 src=\"../../images/booking/btn_golfcourse.gif\" width=70 height=19 style=\"cursor:hand\"></a></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>&nbsp;</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b>가격정보 </TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=\"100%\" bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=#f1f1f1 height=25 width=45 align=center>&nbsp;</TD>\r\n");
      out.write("<TD class=normal_s bgColor=#f1f1f1 height=22 width=95 align=center>그린피정상가</TD>\r\n");
      out.write("<TD class=sunday bgColor=#f1f1f1 width=90 align=center>그린피할인가</TD>\r\n");
      out.write("<TD class=red_s bgColor=#f1f1f1 width=150 align=center>4인그린피할인가 합계</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=saturday bgColor=white height=25 align=center>주중</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(commify(np) );
      out.write("</TD>\r\n");
      out.write("<TD class=sunday bgColor=white align=center>");
      out.print(commify(sp) );
      out.write("</TD>\r\n");
      out.write("<TD class=red_s bgColor=white align=center>");
      out.print(commify(sp*4) );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=sunday bgColor=white height=25 align=center>주말</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(commify(nw) );
      out.write("</TD>\r\n");
      out.write("<TD class=sunday bgColor=white align=center>");
      out.print(commify(sw) );
      out.write("</TD>\r\n");
      out.write("<TD class=red_s bgColor=white align=center>");
      out.print(commify(sw*4) );
      out.write("</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>&nbsp;</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=red_s>");
      out.print(glDto.getCancel_rule() );
      out.write("</TD></TR></TBODY></TABLE>\r\n");
      out.write("<P>&nbsp;</P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=707 colSpan=2>&nbsp;</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=707 colSpan=2>\r\n");
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

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 5px\" bgColor=white height=30><SPAN class=normal_s>");
      out.print(glDto.getGolflink_name());
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
      out.print(glDto.getGolflink_seq());
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
      out.write("</TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=50 width=707 colSpan=2 align=right>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=150>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=75 align=center><IMG border=0 src=\"../../images/booking/btn_prev_day.gif\" width=65 height=20 onclick=\"preResDate();\" style=\"cursor:hand\"></TD>\r\n");
      out.write("<TD width=75 align=center><IMG border=0 src=\"../../images/booking/btn_next_day.gif\" width=65 height=20 onclick=\"nextResDate();\" style=\"cursor:hand\"></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top width=707 colSpan=2 align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=426></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top width=\"100%\">\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=\"100%\">\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"CURSOR: hand\" onclick=DisplayMenu(1) width=176><IMG id=\"imgtap1\" alt=\"사전 예약하기\" src=\"../../images/booking/btn_tab_on_05.gif\" width=173 height=25></TD>\r\n");
      out.write("<TD style=\"CURSOR: hand\" onclick=DisplayMenu(2) width=176><IMG id=\"imgtap2\" alt=이용안내 src=\"../../images/booking/btn_tab_off_02.gif\" width=173 height=25></TD>\r\n");
      out.write("<TD style=\"CURSOR: hand\" onclick=DisplayMenu(3) width=176><IMG id=\"imgtap3\" alt=골프장소개 src=\"../../images/booking/btn_tab_off_03.gif\" width=173 height=25></TD>\r\n");
      out.write("<TD style=\"CURSOR: hand\" onclick=DisplayMenu(4) width=176><IMG id=\"imgtap4\" alt=오시는길 src=\"../../images/booking/btn_tab_off_04.gif\" width=173 height=25></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=#91b500 height=1 width=704 colSpan=4></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=10></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white align=center>\r\n");
      out.write("<DIV style=\"DISPLAY: block\" id=\"destap1\">\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>\r\n");
      out.write("\t<TABLE id=\"tbReserveList\" border=0 cellSpacing=1 cellPadding=2 width=706 bgColor=#d1d3d4>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD class=normal_b bgColor=#f1f1f1 height=25 width=192 align=center>골프장명</TD>\r\n");
      out.write("\t<TD class=normal_b bgColor=#f1f1f1 height=25 width=118 align=center>날짜</TD>\r\n");
      out.write("\t<TD class=normal_b bgColor=#f1f1f1 width=108 align=center>시간대</TD>\r\n");
      out.write("\t<TD class=normal_b bgColor=#f1f1f1 width=177 align=center>인원/팀</TD>\r\n");
      out.write("\t<TD class=normal_b bgColor=#f1f1f1 width=85 align=center>결제예상금액</TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD bgColor=white height=25 align=center>");
      out.print(glDto.getGolflink_name());
      out.write("</TD>\r\n");
      out.write("\t<TD bgColor=white align=center>");
      out.print(curDate.substring(0,4) + "-" + curDate.substring(4,6) + "-" + curDate.substring(6,8));
      out.write("</TD>\r\n");
      out.write("\t<TD bgColor=white align=center><SELECT size=1 id=\"ddlTimeTerm\" name=\"ddlTimeTerm\" onchange=\"selectGolfLink();\">\r\n");
      out.write("\t\t<OPTION value=\"/0\" selected>선택하세요</OPTION>\r\n");
 
	for(int i = 0; i < listPr.size();i++){
		int tPrdtSeq = listPr.get(i).getProductsub_seq();
		String tTerm = listPr.get(i).getTime_start().substring(0,2) + "시 ~ " + listPr.get(i).getTime_end().substring(0,2) + "시";
		int tPrice = listPr.get(i).getNH_price();

      out.write("\r\n");
      out.write("\t\t<OPTION value=\"");
      out.print(tPrdtSeq+"/"+tPrice);
      out.write('"');
      out.write('>');
      out.print(tTerm);
      out.write("</OPTION>\r\n");
 
	} 

      out.write("\r\n");
      out.write("\t\t</SELECT></TD>\r\n");
      out.write("\t<TD bgColor=white align=center>\r\n");
      out.write("\t<P><SELECT size=1 id=\"ddlPersonCnt\" name=\"ddlPersonCnt\" onchange=\"selectGolfLink();\"> \r\n");
      out.write("\t\t<OPTION value=\"0\" selected>선택</OPTION> \r\n");
      out.write("\t\t<OPTION value=\"1\">1</OPTION> \r\n");
      out.write("\t\t<OPTION value=\"2\">2</OPTION> \r\n");
      out.write("\t\t<OPTION value=\"3\">3</OPTION> \r\n");
      out.write("\t\t<OPTION value=\"4\">4</OPTION></SELECT> 명 /\r\n");
      out.write("\t\t<SELECT size=1 id=\"ddlTeamCnt\" name=\"ddlTeamCnt\" disabled=\"disabled\"> \r\n");
      out.write("\t\t<OPTION value=\"1\" selected>1</OPTION> \r\n");
      out.write("\t\t</SELECT> 팀 </P></TD>\r\n");
      out.write("\t<TD bgColor=white align=center><SPAN class=orange id=\"txtBillPrice\" name=\"txtBillPrice\">0</SPAN>원\r\n");
      out.write("\t</TD></TR>\r\n");
      out.write("\t</TABLE>\r\n");
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>&nbsp;</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD colspan=\"5\">\r\n");
      out.write("\t<TABLE border=0 cellSpacing=1 cellPadding=2 width=\"100%\" bgColor=#d1d3d4 align=center>\r\n");
      out.write("\t<TBODY>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD bgColor=#aed247 width=700 colSpan=4></TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=142 align=right>골프장</TD>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=537 colSpan=3><SPAN class=normal_b>");
      out.print(glDto.getGolflink_name());
      out.write("</SPAN></TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=13 width=142 align=right>인원</TD>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=211><INPUT class=\"mem_input\" id=\"personCnt\" name=\"personCnt\" size=5 disabled> 인 &nbsp; <INPUT class=mem_input id=\"teamCnt\" name=\"teamCnt\" size=5 disabled value=\"1\"> 팀 </TD>\r\n");
      out.write("\t<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 width=130 align=right>날짜/시간대</TD>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=170>\r\n");
      out.write("\t\t<input type=\"text\" class=\"mem_input\" id=\"selectDate\" name=\"selectDate\" size=\"10\" disabled value=\"");
      out.print(curDate.substring(0,4) + "-" + curDate.substring(4,6) + "-" + curDate.substring(6,8));
      out.write("\">/<input type=\"text\" class=\"mem_input\" id=\"selectTime\" name=\"selectTime\" size=\"10\" disabled>  \r\n");
      out.write("\t</TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=13 align=right>예약자이름</TD>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 10px\" bgColor=white height=27 colSpan=3><INPUT class=mem_input id=\"reserveUName\" name=\"reserveUName\" size=15 value=\"");
      out.print(user_Name );
      out.write("\"></TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 align=right>핸드폰</TD>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 10px\" bgColor=white colSpan=3><SELECT size=1 id=\"phone1\" name=\"phone1\"> \r\n");
      out.write("\t<OPTION value=\"\" selected>선택</OPTION> \r\n");
      out.write("\t<OPTION value=\"010\">010</OPTION> \r\n");
      out.write("\t<OPTION value=\"011\">011</OPTION> \r\n");
      out.write("\t<OPTION value=\"016\">016</OPTION>\r\n");
      out.write("\t<OPTION value=\"017\">017</OPTION> \r\n");
      out.write("\t<OPTION value=\"018\">018</OPTION>\r\n");
      out.write("\t<OPTION value=\"019\">019</OPTION></SELECT> \r\n");
      out.write("\t- <INPUT class=mem_input id=\"phone2\" name=\"phone2\" maxLength=4 size=8> \r\n");
      out.write("\t- <INPUT class=mem_input id=\"phone3\" name=\"phone3\" maxLength=4 size=8></TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 align=right>E-Mail</TD>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 10px\" bgColor=white colSpan=3><INPUT class=mem_input id=\"email1\" name=\"email1\" size=15 readonly value=\"");
      out.print(eMail1 );
      out.write("\"> @ <INPUT class=mem_input ID=\"email2\" name=\"email2\" size=15 readonly value=\"");
      out.print(eMail2 );
      out.write("\"> \r\n");
      out.write("\t<SELECT size=1 id=\"ddlEmail\" name=\"ddlEmail\" onchange=\"emaildomain();\" disabled> \r\n");
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
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 align=right>요청사항</TD>\r\n");
      out.write("\t<TD style=\"PADDING-LEFT: 10px\" bgColor=white colSpan=3><TEXTAREA class=box_01 cols=80 rows=4 id=\"requestContent\" name=\"requestContent\"></TEXTAREA></TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD bgColor=#aed247 width=700 colSpan=4></TD></TR></TBODY></TABLE>\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=50>&nbsp;</TD></TR>\r\n");
      out.write("<TR><TD style=\"PADDING-BOTTOM: 40px; PADDING-TOP: 40px\" align=center><A href=\"javascript:;\" onclick=\"reserveSubmit();\"><IMG border=0 align=textTop src=\"../../images/booking/btn_next_page2.gif\" width=150 height=39></A></TD></TR>\r\n");
      out.write("</TBODY></TABLE>\r\n");
      out.write("</DIV>\r\n");
      out.write("<div id=\"destap2\" style=\"display:none;\">");
      out.print(glDto.getUse_guide() );
      out.write("</div>\r\n");
      out.write("<div id=\"destap3\" style=\"display:none;\">");
      out.print(glDto.getGolflink_guide() );
      out.write("</div>\r\n");
      out.write("<div id=\"destap4\" style=\"display:none;\">\r\n");
      out.write("<iframe id=\"ifrmMap\" src=\"\" width=602 height=402 frameborder=\"0\" border=\"0\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" noresize></iframe>\r\n");
      out.write("</div>\r\n");
      out.write("</TD></TR></TBODY></TABLE>\r\n");
      out.write("</TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top width=707 colSpan=2 align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>\r\n");
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

int packSeq = NumberUtils.toInt(request.getParameter("pkSeq"),1);

PackageDao pkDao = new PackageDao();
String strWhere = "AND a.package_seq = " + packSeq;
List<PackageDto> pkList = pkDao.getPackageList(strWhere);
PackageDto pkDto = new PackageDto();
if(pkList != null && pkList.size() == 1){
	pkDto = pkList.get(0);
}
else{
	out.print("<script>");
	out.print("location.href='/forGolfbooking/reserve.jsp?menu=3'");
	out.print("</script>");
}

Utillity myUtil = new Utillity();


      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function DisplayMenu(vIdx){\r\n");
      out.write("\t$(\"#imgtap1\").attr(\"src\", \"../../images/package/btn_tab_off_01.gif\");\r\n");
      out.write("\t$(\"#imgtap2\").attr(\"src\", \"../../images/package/btn_tab_off_02.gif\");\r\n");
      out.write("\t$(\"#imgtap3\").attr(\"src\", \"../../images/package/btn_tab_off_03.gif\");\r\n");
      out.write("\t$(\"#imgtap4\").attr(\"src\", \"../../images/package/btn_tab_off_04.gif\"); \r\n");
      out.write("\t$(\"#destap1\").hide();\r\n");
      out.write("\t$(\"#destap2\").hide();\r\n");
      out.write("\t$(\"#destap3\").hide();\r\n");
      out.write("\t$(\"#destap4\").hide();\r\n");
      out.write("\t\r\n");
      out.write("\tswitch(vIdx){\r\n");
      out.write("\t\tcase 1:\r\n");
      out.write("\t\t\t$(\"#imgtap1\").attr(\"src\", \"../../images/package/btn_tab_on_01.gif\"); \r\n");
      out.write("\t\t\t$(\"#destap1\").show();\r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 2:\r\n");
      out.write("\t\t\t$(\"#imgtap2\").attr(\"src\", \"../../images/package/btn_tab_on_02.gif\");\r\n");
      out.write("\t\t\t$(\"#destap2\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 3:\r\n");
      out.write("\t\t\t$(\"#imgtap3\").attr(\"src\", \"../../images/package/btn_tab_on_03.gif\");\r\n");
      out.write("\t\t\t$(\"#destap3\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t\tcase 4:\r\n");
      out.write("\t\t\t$(\"#imgtap4\").attr(\"src\", \"../../images/package/btn_tab_on_04.gif\");\r\n");
      out.write("\t\t\t$(\"#destap4\").show(); \r\n");
      out.write("\t\t\tbreak;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function imgChange(objId){\r\n");
      out.write("\t$(\"#imgmain\").attr(\"src\", objId.src);\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
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
      out.write("<P>&nbsp;</P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top width=300>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=274 bgColor=white>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=274 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white width=270><IMG border=0 id=\"imgmain\" name=\"imgmain\" src=\"/upload/");
      out.print(pkDto.getImg_sub1());
      out.write("\" width=270 height=202></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white height=10></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white width=272>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=62>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white><IMG border=0 name=img1 src=\"/upload/");
      out.print(pkDto.getImg_sub1());
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("<TD width=62>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white><IMG border=0 name=img1 src=\"/upload/");
      out.print(pkDto.getImg_sub2());
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("<TD width=62>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white><IMG border=0 name=img1 src=\"/upload/");
      out.print(pkDto.getImg_sub3());
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("<TD width=62>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=69 bgColor=silver>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white><IMG border=0 name=img1 src=\"/upload/");
      out.print(pkDto.getImg_sub4());
      out.write("\" width=63 height=47 onclick=\"imgChange(this);\" style=\"cursor:hand;\"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>\r\n");
      out.write("<TD vAlign=top width=407>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=407>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
 
	String packName = "";
	if(pkDto.getPackage_name1().trim().length() > 0 && pkDto.getPackage_name2().trim().length() > 0){
		packName = pkDto.getPackage_name1() + " + " + pkDto.getPackage_name2();
	}else{
		packName = pkDto.getPackage_name1() + pkDto.getPackage_name2();
	}

      out.write("\r\n");
      out.write("<TD class=cc_name height=25>");
      out.print(packName );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>");
      out.print(pkDto.getGolflink_guide() );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=\"100%\" bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 height=18 align=center>요일</TD>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 width=145 align=center>성수기</TD>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 width=146 align=center>비성수기</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>월요일</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getPeak_n_mon()) );
      out.write("원/인</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getOff_n_mon()) );
      out.write("원/인</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>화요일</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getPeak_n_tue()) );
      out.write("원/인</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getOff_n_tue()) );
      out.write("원/인</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>수요일</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getPeak_n_wed()) );
      out.write("원/인</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getOff_n_wed()) );
      out.write("원/인</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>목요일</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getPeak_n_thu()) );
      out.write("원/인</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getOff_n_thu()) );
      out.write("원/인</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_s bgColor=#f1f1f1 height=18 align=center>금요일</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getPeak_n_fri()) );
      out.write("원/인</TD>\r\n");
      out.write("<TD class=normal_s bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getOff_n_fri()) );
      out.write("원/인</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=saturday bgColor=#f1f1f1 height=18 align=center>토요일</TD>\r\n");
      out.write("<TD class=saturday bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getPeak_n_sat()) );
      out.write("원/인</TD>\r\n");
      out.write("<TD class=saturday bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getOff_n_sat()) );
      out.write("원/인</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=sunday bgColor=#f1f1f1 height=18 align=center>일요일</TD>\r\n");
      out.write("<TD class=sunday bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getPeak_n_sun()) );
      out.write("원/인</TD>\r\n");
      out.write("<TD class=sunday bgColor=white align=center>");
      out.print(myUtil.commify(pkDto.getOff_n_sun()) );
      out.write("원/인</TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-TOP: 17px\"><A href=\"rule.jsp?menu=3&pkSeq=");
      out.print(packSeq );
      out.write("\"><IMG border=0 src=\"../../images/package/btn_domestic_regist.gif\" width=407 height=39></A></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top width=707 colSpan=2></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=707 colSpan=2>&nbsp;</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=707 colSpan=2 align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=704>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR><TD>\r\n");
      out.write("\t<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("\t<TBODY>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD style=\"CURSOR: hand\" onclick=DisplayMenu(1) width=176><IMG id=\"imgtap1\" alt=상품안내 src=\"../../images/package/btn_tab_on_01.gif\" width=173 height=25></TD>\r\n");
      out.write("\t<TD style=\"CURSOR: hand\" onclick=DisplayMenu(2) width=176><IMG id=\"imgtap2\" alt=이용안내 src=\"../../images/package/btn_tab_off_02.gif\" width=173 height=25></TD>\r\n");
      out.write("\t<TD style=\"CURSOR: hand\" onclick=DisplayMenu(3) width=176><IMG id=\"imgtap3\" alt=골프장소개 src=\"../../images/package/btn_tab_off_03.gif\" width=173 height=25></TD>\r\n");
      out.write("\t<TD style=\"CURSOR: hand\" onclick=DisplayMenu(4) width=176><IMG id=\"imgtap4\" alt=오시는길 src=\"../../images/package/btn_tab_off_04.gif\" width=173 height=25></TD></TR>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t<TD bgColor=#91b500 height=1 width=704 colSpan=4></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR><TD height=10></TD></TR>\r\n");
      out.write("<TR><TD bgColor=white align=center>\r\n");
      out.write("<div id=\"destap1\">");
      out.print(pkDto.getPackage_guide() );
      out.write("</div>\r\n");
      out.write("<div id=\"destap2\" style=\"display:none;\">");
      out.print(pkDto.getUse_guide() );
      out.write("</div>\r\n");
      out.write("<div id=\"destap3\" style=\"display:none;\">");
      out.print(pkDto.getGolflink_guide() );
      out.write("</div>\r\n");
      out.write("<div id=\"destap4\" style=\"display:none;\">");
      out.print(pkDto.getWay_map() );
      out.write("</div>\r\n");
      out.write("</TD></TR></TBODY></TABLE>\r\n");
      out.write("</TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD width=707 colSpan=2>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>");
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

	int region = NumberUtils.toInt(request.getParameter("region"),1);

	int condo_seq = NumberUtils.toInt(request.getParameter("condo_seq"),1);
	
	String menu = StringUtils.trimToEmpty(request.getParameter("menu"));
	
	//어드민쪽 DAO랑 사용자쪽 DAO가 틀려요 근데 왜 안되는지 몰겠네여;
	PackageDao pkDao = new PackageDao();
	List<RegionDto> arrRegions = pkDao.getRegionList("1");
	
	CondoReserveDao cdDao = new CondoReserveDao();
	
	CondoDto cdDto = cdDao.getCondo(condo_seq);
	
	List<CondoGalleryDto> galleryList = cdDao.getCondoGallerySelect(condo_seq);
	
	List<CondoRoomDto> roomList = cdDao.getCondoRoomSelect(condo_seq);
	
	String img_dir = Config.get("reserve_img");
	
	String now_date = Utils.getDate("yyyy-MM-dd");

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\tfunction reserve_condo(){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(!$(\"#in_date\").val() || !$(\"#out_date\").val()){\r\n");
      out.write("\t\t\talert(\"이용 일자를 입력하세요!\");\r\n");
      out.write("\t\t\treturn ;\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(!$(\"input[name=condoroom_seq][checked]\").val()){\r\n");
      out.write("\t\t\talert(\"객실을 선택 하세요.\");\r\n");
      out.write("\t\t\t$(\"#condoroom_seq\").focus();\r\n");
      out.write("\t\t\treturn ;\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(!$(\"#room_num\").val()){\r\n");
      out.write("\t\t\talert(\"객실수량을 선택 하세요.\");\r\n");
      out.write("\t\t\t$(\"#room_num\").focus();\r\n");
      out.write("\t\t\treturn ;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tif(!$(\"#per_num\").val()){\r\n");
      out.write("\t\t\talert(\"이용인원을 입력 입력하세요!\");\r\n");
      out.write("\t\t\treturn ;\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tif(!$('#mobile1').val()) {\r\n");
      out.write("\t\t\talert('핸드폰 앞자리를 선택해 주세요.');\r\n");
      out.write("\t\t\t$('#mobile1').focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("   \t\tif(!$('#mobile2').val()) {\r\n");
      out.write("\t\t\talert('핸드폰 번호를 입력해 주세요.');\r\n");
      out.write("\t\t\t$('#mobile2').focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("   \t\tif(!$('#mobile3').val()) {\r\n");
      out.write("   \t\t\talert('핸드폰 번호를 입력해 주세요.');\r\n");
      out.write("\t\t\t$('#mobile3').focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tdocument.frm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t$( \"#in_date\" ).datepicker({\r\n");
      out.write("\t\t\tdateFormat:'yy-mm-dd',\r\n");
      out.write("\t\t\tonSelect : function(dateText, inst){\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar nowDate = (\"");
      out.print(now_date);
      out.write("\").replace('-','').replace('-','');\r\n");
      out.write("\t\t\t\tvar arrDate = dateText.split(\"-\");\r\n");
      out.write("\t\t\t\tarrDate = arrDate[0] + arrDate[1] + arrDate[2];\r\n");
      out.write("\t\t\t\tif(nowDate > arrDate){\r\n");
      out.write("\t\t\t\t\talert(\"오늘보다 이전날짜를 선택할 수 없습니다.\");\r\n");
      out.write("\t\t\t\t\t$( \"#in_date\" ).val(\"");
      out.print(now_date);
      out.write("\");\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tcalDateRange($(\"#in_date\").val(),$(\"#out_date\").val());\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t$( \"#out_date\" ).datepicker({\r\n");
      out.write("\t\t\tdateFormat:'yy-mm-dd',\r\n");
      out.write("\t\t\tonSelect : function(dateText, inst){\r\n");
      out.write("\t\t\t\tvar nowDate = (\"");
      out.print(now_date);
      out.write("\").replace('-','').replace('-','');\r\n");
      out.write("\t\t\t\tvar arrDate = dateText.split(\"-\");\r\n");
      out.write("\t\t\t\tarrDate = arrDate[0] + arrDate[1] + arrDate[2];\r\n");
      out.write("\t\t\t\tif(nowDate > arrDate){\r\n");
      out.write("\t\t\t\t\talert(\"오늘보다 이전날짜를 선택할 수 없습니다.\");\r\n");
      out.write("\t\t\t\t\t$( \"#out_date\" ).val(\"");
      out.print(now_date);
      out.write("\");\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t\tcalDateRange($(\"#in_date\").val(),$(\"#out_date\").val());\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\tfunction calDateRange(val1, val2){\r\n");
      out.write("\t        var FORMAT = \"-\";\r\n");
      out.write("\t        // FORMAT을 포함한 길이 체크\r\n");
      out.write("\t        if (val1.length != 10 || val2.length != 10)\r\n");
      out.write("\t            return 0;\r\n");
      out.write("\r\n");
      out.write("\t        // FORMAT이 있는지 체크\r\n");
      out.write("\t        if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)\r\n");
      out.write("\t            return 0;\r\n");
      out.write("\r\n");
      out.write("\t        // 년도, 월, 일로 분리\r\n");
      out.write("\t        var start_dt = val1.split(FORMAT);\r\n");
      out.write("\t        var end_dt = val2.split(FORMAT);\r\n");
      out.write("\r\n");
      out.write("\t        // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)\r\n");
      out.write("\t        // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.\r\n");
      out.write("\t        start_dt[1] = (Number(start_dt[1]) - 1) + \"\";\r\n");
      out.write("\t        end_dt[1] = (Number(end_dt[1]) - 1) + \"\";\r\n");
      out.write("\r\n");
      out.write("\t        var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);\r\n");
      out.write("\t        var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);\r\n");
      out.write("\r\n");
      out.write("\t        var day = ((to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24)+1;\r\n");
      out.write("\t        var night = day - 1;\r\n");
      out.write("\t        var night_day = (night==0?\"\":night+\"박 \")+day+\"일\";\r\n");
      out.write("\t        $(\"#room_num\").val(day);\r\n");
      out.write("\t        $(\"#room_show\").val(night_day);\r\n");
      out.write("\t        \r\n");
      out.write("\t    }\r\n");
      out.write("\tfunction DisplayMenu(index) {\r\n");
      out.write("        for (i=1; i<=4; i++)\r\n");
      out.write("        if (index == i) {\r\n");
      out.write("\t        thisMenu = eval(\"menu\" + index + \".style\");\r\n");
      out.write("\t        thisMenu.display = \"\";\r\n");
      out.write("        \tif(index == 4){\r\n");
      out.write("        \t\t$(\"#ifrmMap\").attr(\"src\", \"/forGolfbooking/ifrm_map.jsp?x=");
      out.print(cdDto.getPoint_x());
      out.write('&');
      out.write('y');
      out.write('=');
      out.print(cdDto.getPoint_y());
      out.write("\");\r\n");
      out.write("        \t}\r\n");
      out.write("        } \r\n");
      out.write("        else {\r\n");
      out.write("\t        otherMenu = eval(\"menu\" + i + \".style\"); \r\n");
      out.write("\t        otherMenu.display = \"none\"; \r\n");
      out.write("        }\r\n");
      out.write("       }\r\n");
      out.write("//-->\r\n");
      out.write("</script>\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("            <tr>\r\n");
      out.write("              <td width=\"751\"><table border=\"0\" cellpadding=\"2\" cellspacing=\"1\" width=\"751\" bgcolor=\"#D2D2D2\">\r\n");
      out.write("                  <tr>\r\n");
      out.write("                    <td align=\"center\" bgcolor=\"white\" width=\"745\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"704\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                          <td align=\"right\" class=\"location\" height=\"30\" width=\"95%\"><a href=\"/index.html\">HOME</a> &gt; <span class=location_b>콘도예약</span></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                          <td bgcolor=\"#D1D3D4\" height=\"33\" class=\"sub_title\" style=\"padding-left:15px;padding-top:4px\">콘도예약</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                          <td><p>&nbsp;</p></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("\r\n");
      out.write("<form name=\"frm\" method=\"post\" action=\"rule.jsp\">\r\n");
      out.write("<input type=\"hidden\" name=\"menu\" value=\"");
      out.print(menu);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"condo_seq\" value=\"");
      out.print(condo_seq);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"condo_name\" value=\"");
      out.print(cdDto.getCondo_name());
      out.write("\"/>\r\n");
      out.write("\r\n");
      out.write("                        <tr>\r\n");
      out.write("                          <td align=\"center\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"707\">\r\n");
      out.write("                              <tr>\r\n");
      out.write("                                <td width=\"290\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"274\" bgcolor=\"white\">\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td bgcolor=\"white\"><table border=\"0\" cellpadding=\"2\" cellspacing=\"1\" width=\"274\" bgcolor=\"silver\">\r\n");
      out.write("                                          <tr>\r\n");
      out.write("                                            <td bgcolor=\"white\" width=\"270\">\r\n");
      out.write("                                            ");
if(cdDto.getImg_main()==null){
      out.write("\r\n");
      out.write("                                            <img src=\"/images/common/img_thumb_ready.jpg\" name=\"img1\" width=\"270\" height=\"202\" border=\"0\">\r\n");
      out.write("                                            ");
}else{
      out.write("\r\n");
      out.write("                                            <img src=\"");
      out.print(img_dir);
      out.print(cdDto.getImg_main());
      out.write("\" name=\"img1\" width=\"270\" height=\"202\" border=\"0\">\r\n");
      out.write("                                            ");
}
      out.write("\r\n");
      out.write("                                            </td>\r\n");
      out.write("                                          </tr>\r\n");
      out.write("                                        </table></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                  </table></td>\r\n");
      out.write("                                <td width=\"417\" valign=\"top\"><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td class=cc_name valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("                                          <tr>\r\n");
      out.write("                                            <td class=\"cc_name\">");
      out.print(cdDto.getCondo_name());
      out.write("</td>\r\n");
      out.write("                                          </tr>\r\n");
      out.write("                                          <tr>\r\n");
      out.write("                                            <td height=\"10\"></td>\r\n");
      out.write("                                          </tr>\r\n");
      out.write("                                          <tr>\r\n");
      out.write("                                            <td height=\"4\"><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                  <td height=\"30\" width=\"60\" class=normal_b>위치 </td>\r\n");
      out.write("                                                  <td width=\"10\">:</td>\r\n");
      out.write("                                                  <td width=\"347\">");
      out.print(cdDto.getAddress1());
      out.write(' ');
      out.print(cdDto.getAddress2());
      out.write("</td>\r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                  <td height=\"30\" class=\"normal_b\" width=\"60\">할인기간</td>\r\n");
      out.write("                                                  <td height=\"23\">:</td>\r\n");
      out.write("                                                  <td height=\"23\">");
      out.print(cdDto.getSaledate_start());
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(cdDto.getSaledate_end());
      out.write("</td>\r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                  <td height=\"30\" class=normal_b width=\"60\">정상가</td>\r\n");
      out.write("                                                  <td>:</td>\r\n");
      out.write("                                                  <td>\r\n");
      out.write("\t\t\t\t");

						if(roomList != null && !roomList.isEmpty()){
							
							int size = roomList.size();
							CondoRoomDto roomDto; 
							for(int i = 0 ; i < size ; i++){
								
								roomDto = roomList.get(i);
				
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=blue style=\"width:170px;height:15px;\">");
      out.print(roomDto.getRoomtype());
      out.write("&nbsp;주중:");
      out.print(Utils.numberFormat(roomDto.getPrice_n1()));
      out.write("원</span><span style=\"width:50px;height:20px;text-align:center;\">~</span><span class=blue style=\"height:15px;\">주말:");
      out.print(Utils.numberFormat(roomDto.getPrice_n2()));
      out.write("원</span><br/>\r\n");
      out.write("\t\t\t\t");

							}
						}
				
      out.write("                                                  \t\r\n");
      out.write("                                                  </td>\r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                  <td height=\"30\" class=normal_b width=\"60\">할인가</td>\r\n");
      out.write("                                                  <td>:</td>\r\n");
      out.write("                                                  <td>\r\n");
      out.write("\t\t\t\t");

						if(roomList != null && !roomList.isEmpty()){
							
							int size = roomList.size();
							CondoRoomDto roomDto; 
							for(int i = 0 ; i < size ; i++){
								
								roomDto = roomList.get(i);
				
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=orange style=\"width:170px;height:15px;\">");
      out.print(roomDto.getRoomtype());
      out.write("&nbsp;주중:");
      out.print(Utils.numberFormat(roomDto.getPrice_s1()));
      out.write("원</span><span style=\"width:50px;height:20px;text-align:center;\">~</span><span class=orange style=\"height:15px;\">주말:");
      out.print(Utils.numberFormat(roomDto.getPrice_s2()));
      out.write("원</span><br/>\r\n");
      out.write("\t\t\t\t");

							}
						}
				
      out.write("                                                  \r\n");
      out.write("                                                  </td>\r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                              </table></td>\r\n");
      out.write("                                          </tr>\r\n");
      out.write("                                          <tr>\r\n");
      out.write("                                            <td>&nbsp;</td>\r\n");
      out.write("                                          </tr>\r\n");
      out.write("                                          <tr>\r\n");
      out.write("                                            <td>※ 자세한 콘도정보는 아래 <span class=normal_b>콘도안내</span> 메뉴를 참조하시기 바랍니다</td>\r\n");
      out.write("                                          </tr>\r\n");
      out.write("                                          <tr>\r\n");
      out.write("                                            <td></td>\r\n");
      out.write("                                          </tr>\r\n");
      out.write("                                        </table></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                  </table></td>\r\n");
      out.write("                              </tr>\r\n");
      out.write("                              <tr>\r\n");
      out.write("                                <td colspan=\"2\" valign=\"top\" width=\"707\"></td>\r\n");
      out.write("                              </tr>\r\n");
      out.write("\r\n");
      out.write("                              <tr>\r\n");
      out.write("                                <td colspan=\"2\" width=\"707\">&nbsp;</td>\r\n");
      out.write("                              </tr>\r\n");
      out.write("                              <tr>\r\n");
      out.write("                                <td colspan=\"2\" align=\"center\" width=\"707\"><table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" width=\"100%\" bgcolor=\"#D1D3D4\">\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td bgcolor=\"#AED247\" colspan=\"4\" width=\"701\"></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" width=\"130\" height=\"25\">이용일자</td>\r\n");
      out.write("                                      <td colspan=\"3\" bgcolor=\"white\" style=\"padding-left:10px;\" width=\"550\"><input class=\"mem_input\" value=\"\" onclick=\"blur();\" type=\"text\" size=\"14\" id=\"in_date\" name=\"in_date\" readonly>\r\n");
      out.write("                                        <img align=\"absmiddle\" src=\"/images/common/img_calendar.gif\" width=\"15\" height=\"16\" border=\"0\"> ~\r\n");
      out.write("                                        <input class=\"mem_input\" value=\"\" type=\"text\" size=\"14\" id=\"out_date\" name=\"out_date\" onclick=\"blur();\">\r\n");
      out.write("                                        <img align=\"absmiddle\" src=\"/images/common/img_calendar.gif\" width=\"15\" height=\"16\" border=\"0\"></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\">객실선택</td>\r\n");
      out.write("                                      <td colspan=\"3\" bgcolor=\"white\" style=\"padding-left:10px;padding-bottom:5px;\" class=red_ss>\r\n");
      out.write("\t\t");

				if(roomList != null && !roomList.isEmpty()){
					
					int size = roomList.size();
					CondoRoomDto roomDto;
					for(int i = 0 ; i < size ; i++){
						
						roomDto = roomList.get(i);
						
						//if(roomDto.getReserve_room_seq()==0){
		
      out.write("\r\n");
      out.write("                                      <input type=\"radio\" id=\"condoroom_seq\" name=\"condoroom_seq\" value=\"");
      out.print(roomDto.getCondoroom_seq());
      out.write('"');
      out.write('>');
      out.print(roomDto.getRoomtype());
      out.write(" (&nbsp;");
      out.print(Utils.numberFormat(roomDto.getPrice_s1()));
      out.write("원 ~ 주말 : ");
      out.print(Utils.numberFormat(roomDto.getPrice_s2()));
      out.write("원&nbs)<br>\r\n");
      out.write("                                      <input type=\"hidden\" name=\"roomtype\" value=\"");
      out.print(roomDto.getRoomtype());
      out.write("\"/>\r\n");
      out.write("\t\t");

						//}
					}
				}
		
      out.write("\r\n");
      out.write("                                      </td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" width=\"130\">객실수량</td>\r\n");
      out.write("                                      <td bgcolor=\"white\" class=\"red_ss\" style=\"padding-left:10px;\" width=\"164\">\r\n");
      out.write("                                      <input class=\"mem_input\" type=\"text\" maxlength=\"2\" size=\"8\" id=\"room_show\" name=\"room_show\"/>\r\n");
      out.write("                                      <input class=\"mem_input\" type=\"hidden\" maxlength=\"2\" id=\"room_num\" name=\"room_num\"/>\r\n");
      out.write("                                      <!--select id=\"room_num\" name=\"room_num\" size=\"1\">\r\n");
      out.write("                                          <option value=\"\">선택</option>\r\n");
      out.write("                                          <option value=\"1\">1실</option>\r\n");
      out.write("                                          <option value=\"2\">2실</option>\r\n");
      out.write("                                          <option value=\"3\">3실</option>\r\n");
      out.write("                                          <option value=\"4\">4실</option>\r\n");
      out.write("                                          <option value=\"5\">5실</option>\r\n");
      out.write("                                          <option value=\"6\">6실</option>\r\n");
      out.write("                                          <option value=\"7\">7실</option>\r\n");
      out.write("                                          <option value=\"8\">8실</option>\r\n");
      out.write("                                          <option value=\"9\">9실</option>\r\n");
      out.write("                                          <option value=\"10\">10실</option>\r\n");
      out.write("                                        </select--></td>\r\n");
      out.write("                                      <td width=\"117\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" align=\"right\">이용인원</td>\r\n");
      out.write("                                      <td width=\"243\" bgcolor=\"white\" style=\"padding-left:10px;\"><input class=\"mem_input\" type=\"text\" maxlength=\"2\" size=\"5\" id=\"per_num\" name=\"per_num\">\r\n");
      out.write("                                        인 </td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" height=\"25\">실제이용자</td>\r\n");
      out.write("                                      <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("                                      <input class=\"mem_input\" type=\"text\" size=\"15\" id=\"reserve_name\"name=\"reserve_name\" value=\"");
      out.print(StringUtils.trimToEmpty((String)session.getAttribute("mem_name")));
      out.write("\"></td>\r\n");
      out.write("                                      <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\">핸드폰</td>\r\n");
      out.write("                                      <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("                                      <select id=\"mobile1\" name=\"mobile1\" size=\"1\">\r\n");
      out.write("                                          <option value=\"\">선택</option>\r\n");
      out.write("                                          <option value=\"010\">010</option>\r\n");
      out.write("                                          <option value=\"011\">011</option>\r\n");
      out.write("                                          <option value=\"016\">016</option>\r\n");
      out.write("                                          <option value=\"017\">017</option>\r\n");
      out.write("                                          <option value=\"018\">018</option>\r\n");
      out.write("                                          <option value=\"019\">019</option>\r\n");
      out.write("                                        </select>\r\n");
      out.write("                                        -\r\n");
      out.write("                                        <input class=\"mem_input\" type=\"text\" size=\"8\" id=\"mobile2\" name=\"mobile2\" maxlength=\"4\">\r\n");
      out.write("                                        -\r\n");
      out.write("                                        <input class=\"mem_input\" type=\"text\" size=\"8\" id=\"mobile3\" name=\"mobile3\" maxlength=\"4\"></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                    <!--tr>\r\n");
      out.write("                                      <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" height=\"25\">이용요금</td>\r\n");
      out.write("                                      <td colspan=\"3\" bgcolor=\"white\" style=\"padding-left:10px;\" class=\"red\">150,000원</td>\r\n");
      out.write("                                    </tr>-->\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\">요청사항</td>\r\n");
      out.write("                                      <td bgcolor=\"white\" style=\"padding-left:10px;\" colspan=\"3\">\r\n");
      out.write("                                      <textarea class=\"box_02\" rows=\"4\" cols=\"85\" name=\"reserve_memo\"></textarea></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td bgcolor=\"#AED247\" colspan=\"4\" width=\"701\"></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                  </table></td>\r\n");
      out.write("                              </tr>\r\n");
      out.write("                              <tr>\r\n");
      out.write("                                <td colspan=\"2\" align=\"center\" style=\"padding-top:20px;padding-bottom:30px;\" width=\"707\"><a href=\"javascript:reserve_condo();\"><img align=\"absmiddle\" src=\"/images/condo/btn_condo_regist.gif\" width=\"150\" height=\"39\" border=\"0\"></a></td>\r\n");
      out.write("                              </tr>\r\n");
      out.write("</form>\r\n");
      out.write("                              <tr>\r\n");
      out.write("                                <td colspan=\"2\" width=\"707\" align=\"center\"><table border=\"0\" width=\"704\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td width=\"426\"></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                      <td valign=\"top\"><div id=\"menu1\" style=\"display:block;\">\r\n");
      out.write("                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"704\">\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(1)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_on_01.gif\" width=\"173\" height=\"25\" alt=\"콘도안내\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(2)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_02.gif\" width=\"173\" height=\"25\" alt=\"상세정보\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(3)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_03.gif\" width=\"173\" height=\"25\" alt=\"사진갤러리\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(4)\" style=\"cursor:hand\" width=\"176\"><p><img src=\"/images/condo/btn_tab_off_04.gif\" width=\"173\" height=\"25\" alt=\"오시는길\"></p></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"1\" colspan=\"4\" bgcolor=\"#91B500\" width=\"704\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                </table></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td height=\"10\"></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td bgcolor=\"white\" align=\"center\"><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td>");
      out.print(cdDto.getCondo_info());
      out.write("</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                </table></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                          </table>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div id=\"menu2\" style=\"display:none;\">\r\n");
      out.write("                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td background=\"/renewal/images/inc/img_board_bg.gif\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"704\">\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(1)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_01.gif\" width=\"173\" height=\"25\" alt=\"콘도안내\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(2)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_on_02.gif\" width=\"173\" height=\"25\" alt=\"상세정보\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(3)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_03.gif\" width=\"173\" height=\"25\" alt=\"사진갤러리\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(4)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_04.gif\" width=\"173\" height=\"25\" alt=\"오시는길\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"1\" colspan=\"4\" bgcolor=\"#91B500\" width=\"704\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                </table></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td height=\"10\"></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td bgcolor=\"white\">");
      out.print(cdDto.getDetail_info());
      out.write("</td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                          </table>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div id=\"menu3\" style=\"display:none;\">\r\n");
      out.write("                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td background=\"/renewal/images/inc/img_board_bg.gif\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"704\">\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(1)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_01.gif\" width=\"173\" height=\"25\" alt=\"콘도안내\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(2)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_02.gif\" width=\"173\" height=\"25\" alt=\"상세정보\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(3)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_on_03.gif\" width=\"173\" height=\"25\" alt=\"사진갤러리\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(4)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_04.gif\" width=\"173\" height=\"25\" alt=\"오시는길\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"1\" colspan=\"4\" bgcolor=\"#91B500\" width=\"704\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                </table></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td height=\"10\"></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td bgcolor=\"white\" align=\"center\">\r\n");


		if(galleryList != null && !galleryList.isEmpty()){
			
			int size = galleryList.size();
			String[]  gallery_img = new String[4];
			
			for(int i = 0 ; i < 4; i++){
				gallery_img[i] = galleryList.get(i).getCondo_img();
			}

      out.write("\r\n");
      out.write("                                             \t \t<table border=\"0\" width=\"669\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                                        <tr>\r\n");
      out.write("                                                          <td width=\"325\" valign=\"top\">\r\n");
      out.write("                                                          <img src=\"");
      out.print(img_dir);
      out.print(StringUtils.trimToEmpty(gallery_img[0]));
      out.write("\" width=\"313\" height=\"150\"/>\r\n");
      out.write("                                                          </td>\r\n");
      out.write("                                                          <td width=\"19\">&nbsp;</td>\r\n");
      out.write("                                                           <td width=\"325\" valign=\"top\">\r\n");
      out.write("                                                          <img src=\"");
      out.print(img_dir);
      out.print(StringUtils.trimToEmpty(gallery_img[1]));
      out.write("\" width=\"313\" height=\"150\"/>\r\n");
      out.write("                                                          </td>\r\n");
      out.write("                                                        </tr>\r\n");
      out.write("                                                    </table>\r\n");
      out.write("                                                    \r\n");
      out.write("                                                    <table border=\"0\" width=\"669\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                                                        <tr>\r\n");
      out.write("                                                           <td width=\"325\" valign=\"top\">\r\n");
      out.write("                                                          <img src=\"");
      out.print(img_dir);
      out.print(StringUtils.trimToEmpty(gallery_img[2]));
      out.write("\" width=\"313\" height=\"150\"/>\r\n");
      out.write("                                                          </td>\r\n");
      out.write("                                                          <td width=\"19\">&nbsp;</td>\r\n");
      out.write("                                                           <td width=\"325\" valign=\"top\">\r\n");
      out.write("                                                          <img src=\"");
      out.print(img_dir);
      out.print(StringUtils.trimToEmpty(gallery_img[3]));
      out.write("\" width=\"313\" height=\"150\"/>\r\n");
      out.write("                                                          </td>\r\n");
      out.write("                                                        </tr>\r\n");
      out.write("                                                    </table>\r\n");

		}

      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                          </table>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div id=\"menu4\" style=\"display:none;\">\r\n");
      out.write("                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td background=\"/renewal/images/inc/img_board_bg.gif\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"704\">\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(1)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_01.gif\" width=\"173\" height=\"25\" alt=\"콘도안내\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(2)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_02.gif\" width=\"173\" height=\"25\" alt=\"상세정보\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(3)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_off_03.gif\" width=\"173\" height=\"25\" alt=\"사진갤러리\"></td>\r\n");
      out.write("                                                    <td onClick=\"DisplayMenu(4)\" style=\"cursor:hand\" width=\"176\"><img src=\"/images/condo/btn_tab_on_04.gif\" width=\"173\" height=\"25\" alt=\"오시는길\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"1\" colspan=\"4\" bgcolor=\"#91B500\" width=\"704\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                </table></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td height=\"10\"></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td bgcolor=\"white\" align=\"center\"><iframe id=\"ifrmMap\" src=\"\" width=602 height=402 frameborder=\"0\" border=\"0\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" noresize></iframe></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                          </table>\r\n");
      out.write("                                        </div></td>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                  </table></td>\r\n");
      out.write("                              </tr>\r\n");
      out.write("                            </table></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                          <td>&nbsp;</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                      </table></td>\r\n");
      out.write("                  </tr>\r\n");
      out.write("                </table></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("          </table></td>\r\n");
      out.write("      </tr>      \r\n");
      out.write("    </table>");
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
