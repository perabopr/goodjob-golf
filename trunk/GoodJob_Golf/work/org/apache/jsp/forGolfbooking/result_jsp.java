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
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.GolfLinkDao;
import com.goodjob.reserve.dto.GolfLinkReserveDto;
import org.apache.commons.lang.math.NumberUtils;
import com.goodjob.reserve.dto.ProductReserveDto;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.GolfLinkDao;
import com.goodjob.reserve.dto.GolfLinkReserveDto;
import org.apache.commons.lang.math.NumberUtils;
import com.goodjob.reserve.dto.PackageReserveDto;
import com.goodjob.reserve.PackageDao;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import com.goodjob.reserve.CondoReserveDao;
import com.goodjob.reserve.dto.*;
import com.goodjob.conf.Config;
import com.goodjob.util.Utils;

public final class result_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


public String commify(int n) {
	return com.goodjob.util.Utils.numberFormat(n);
}

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(8);
    _jspx_dependants.add("/include/loginCheck.jsp");
    _jspx_dependants.add("/include/header.jsp");
    _jspx_dependants.add("/forGolfbooking/resultReal.jsp");
    _jspx_dependants.add("/forGolfbooking/resultPre.jsp");
    _jspx_dependants.add("/forGolfbooking/resultPackage.jsp");
    _jspx_dependants.add("/forGolfbooking/resultCondo.jsp");
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

if(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")).length()==0){

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\talert(\"로그인이 필요한 곳입니다.\");\r\n");
      out.write("\t//history.go(-1);\r\n");
      out.write("\tlocation.href=\"/member/member_logon.jsp\";\r\n");
      out.write("</script>\r\n");

	return;
}

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
String menuName = StringUtils.defaultIfEmpty(request.getParameter("menu"),"1");
      out.write("\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t");
 if(menuName.equals("1")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int gcId = NumberUtils.toInt(request.getParameter("gcId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"),0);
int date = NumberUtils.toInt(request.getParameter("date"),0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"),0);

if(menu == 0 || gcId == 0 || golf == 0 || date == 0 || cdate == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=1'</script>");
	return;
}

String resName = request.getParameter("reserveName");
String uPhone = "";
uPhone += request.getParameter("phone1") + "-";
uPhone += request.getParameter("phone2") + "-";
uPhone += request.getParameter("phone3");
int perNum = 4;

GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
glrDto.setReserve_name(resName);
glrDto.setReserve_uid(user_Id);
glrDto.setPer_num(Integer.toString(perNum));
glrDto.setReserve_phone(uPhone);
glrDto.setProduct_price(100);
glrDto.setCoupon_price(0);
glrDto.setProcess_status("0");
glrDto.setCard_bill_num("");
glrDto.setProductsub_seq(gcId);

GolfLinkDao glDao = new GolfLinkDao();
glDao.setGolfReserve(glrDto);

      out.write("\r\n");
      out.write("\r\n");
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
      out.write("<TD align=center><IMG border=0 src=\"../../images/booking/img_without_title.gif\" width=640 height=108></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<P><IMG border=0 src=\"../../images/booking/img_bank_number.gif\" width=640 height=298></P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=100 align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 }else if(menuName.equals("2")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

int menu = NumberUtils.toInt(request.getParameter("menu"),0);
int psId = NumberUtils.toInt(request.getParameter("psId"),0);
int golf = NumberUtils.toInt(request.getParameter("golf"),0);
int date = NumberUtils.toInt(request.getParameter("date"),0);
int cdate = NumberUtils.toInt(request.getParameter("cdate"),0);
int rCnt = NumberUtils.toInt(request.getParameter("reserveCnt"),0);
int rTeam = NumberUtils.toInt(request.getParameter("reserveTeam"),0);
String rDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String rTime = StringUtils.trimToEmpty(request.getParameter("reserveTime"));
String rName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String rPhone = StringUtils.trimToEmpty(request.getParameter("reservePhone"));
String rEmail = StringUtils.trimToEmpty(request.getParameter("reserveEmail"));
String rRequest = StringUtils.trimToEmpty(request.getParameter("reserveRequest"));

if(menu == 0 || psId == 0 || golf == 0 || date == 0 || cdate == 0 || rCnt == 0 || rTeam == 0){
	out.println("<script>alert('잘못된 접근입니다.');location.href='reserve.jsp?menu=2';</script>");
	return;
}

GolfLinkDao glDao = new GolfLinkDao();
List<ProductReserveDto> prList = glDao.getGolfProduct(psId);

if(prList.size() != 1){
	out.print("<script>alert('잘못된 접근입니다.');location.href='/forGolfbooking/reserve.jsp?menu=2';</script>");
}else{
	if(prList.get(0).getProduct_status().equals("0")){
		GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
		glrDto.setReserve_name(rName);
		glrDto.setReserve_uid(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
		//glrDto.setReserve_uid(rEmail);
		glrDto.setPer_num(Integer.toString(rCnt));
		glrDto.setReserve_phone(rPhone);
		glrDto.setProduct_price(prList.get(0).getGoodjob_price() * rCnt);
		glrDto.setCoupon_price(0);
		glrDto.setProcess_status("0");
		glrDto.setCard_bill_num("");
		glrDto.setProductsub_seq(psId);
		
		glDao.setGolfReserve(glrDto);
		
	}else{
		out.print("<script>alert('예약할 수 없습니다.');location.href='/forGolfbooking/reserve.jsp?menu=2';</script>");		
	}
}

      out.write("\r\n");
      out.write("\r\n");
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
      out.write("<TD align=center><IMG border=0 src=\"../../images/booking/img_without_title.gif\" width=640 height=108></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<P><IMG border=0 src=\"../../images/booking/img_bank_number.gif\" width=640 height=298></P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD height=100 align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 }else if(menuName.equals("3")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"),0);
String packageName = StringUtils.trimToEmpty(request.getParameter("packageName"));
String reserveName = StringUtils.trimToEmpty(request.getParameter("reserveName"));
String reservePhone = StringUtils.trimToEmpty(request.getParameter("phone1")) 
					+ "-" + StringUtils.trimToEmpty(request.getParameter("phone2"))
					+ "-" + StringUtils.trimToEmpty(request.getParameter("phone3"));
String reserveEMail = StringUtils.trimToEmpty(request.getParameter("eMail1"))
					+ "@" + StringUtils.trimToEmpty(request.getParameter("eMail2"));
String reserveDate = StringUtils.trimToEmpty(request.getParameter("reserveDate"));
String reserveTeam = StringUtils.trimToEmpty(request.getParameter("reserveTeam"));
String reservePerson = StringUtils.trimToEmpty(request.getParameter("reservePerson"));
String content = StringUtils.trimToEmpty(request.getParameter("content"));
content = content.replaceAll("\r\n", "</br>");

PackageReserveDto prDto = new PackageReserveDto();
prDto.setMenu_seq(3);
prDto.setReserve_name(reserveName);
//prDto.setReserve_uid(reserveEMail);
prDto.setReserve_uid(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
prDto.setTour_date(reserveDate);
prDto.setPer_num(reservePerson);
prDto.setReserve_phone(reservePhone);
prDto.setPackage_price(0);
prDto.setRequest_content(content);
prDto.setProcess_status("0");
prDto.setPackage_seq(pkSeq);

PackageDao pkDao = new PackageDao();
pkDao.setPackageReserve(prDto);


      out.write("\r\n");
      out.write("\r\n");
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
      out.write("<TD vAlign=top align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center><IMG border=0 src=\"../images/package/img_domestic_regist_finishe.gif\" width=640 height=108></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=600 bgColor=\"#d1d3d4\" align=center>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=#aed247 width=594 colSpan=2></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>패키지명</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white width=451><SPAN class=normal_b>");
      out.print(packageName );
      out.write("</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>예약자이름</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(reserveName );
      out.write(" </TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>핸드폰</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(reservePhone );
      out.write(" </TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>E-Mail</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(reserveEMail );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>출발일</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(reserveDate );
      out.write(" </TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>인원</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white height=25>");
      out.print(reserveTeam );
      out.write('팀');
      out.write(' ');
      out.print(reservePerson );
      out.write("인 </TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 10px\" class=mem_subject bgColor=#f1f1f1 height=25 width=122 align=right>요청사항</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 10px\" bgColor=white>");
      out.print(content );
      out.write("</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=#aed247 width=594 colSpan=2></TD></TR></TBODY></TABLE></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-BOTTOM: 140px; PADDING-TOP: 40px\" align=center>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 }else if(menuName.equals("5")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");


	String menu = StringUtils.trimToEmpty(request.getParameter("menu"));
	int condo_seq = NumberUtils.toInt(request.getParameter("condo_seq"),1);
	String condo_name = StringUtils.trimToEmpty(request.getParameter("condo_name"));
	String in_date = StringUtils.trimToEmpty(request.getParameter("in_date"));
	String out_date = StringUtils.trimToEmpty(request.getParameter("out_date"));
	String condoroom_seq = StringUtils.trimToEmpty(request.getParameter("condoroom_seq"));
	String roomtype = StringUtils.trimToEmpty(request.getParameter("roomtype"));
	String room_num = StringUtils.trimToEmpty(request.getParameter("room_num"));
	String per_num = StringUtils.trimToEmpty(request.getParameter("per_num"));
	String reserve_name = StringUtils.trimToEmpty(request.getParameter("reserve_name"));
	String mobile = StringUtils.trimToEmpty(request.getParameter("mobile"));
	String reserve_memo = StringUtils.trimToEmpty(request.getParameter("reserve_memo"));
	
	CondoReserveDto cdDto = new CondoReserveDto();
	cdDto.setCondo_name(condo_name);
	cdDto.setCondo_seq(condo_seq);
	cdDto.setIn_date(in_date);
	cdDto.setOut_date(out_date);
	cdDto.setCondoroom_seq(NumberUtils.toInt(condoroom_seq));
	cdDto.setRoom_num(NumberUtils.toInt(room_num));
	cdDto.setRoomtype(roomtype);
	cdDto.setPer_num(NumberUtils.toInt(per_num));
	cdDto.setReserve_name(reserve_name);
	cdDto.setReserve_uid(StringUtils.trimToEmpty((String)session.getAttribute("mem_id")));
	cdDto.setReserve_phone(mobile);
	cdDto.setReserve_memo(reserve_memo);
	
	CondoReserveDao cdDao = new CondoReserveDao();
	
	cdDao.setCondoReserve(cdDto);

      out.write("\r\n");
      out.write("\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("                          <tr>\r\n");
      out.write("                            <td><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                  <td width=\"751\"><table border=\"0\" cellpadding=\"2\" cellspacing=\"1\" width=\"751\" bgcolor=\"#D2D2D2\">\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                        <td align=\"center\" bgcolor=\"white\" width=\"745\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"704\">\r\n");
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
      out.write("                                              <td align=\"center\"><img src=\"../../images/condo/img_condo_finished.gif\" width=\"640\" height=\"106\" border=\"0\"></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td align=\"center\"><table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" width=\"600\" bgcolor=\"#D1D3D4\">\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td bgcolor=\"#AED247\" colspan=\"2\" width=\"594\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td bgcolor=\"#F1F1F1\" height=\"30\" align=\"right\" style=\"padding-right:10px;\" class=mem_subject width=\"122\">콘도명</td>\r\n");
      out.write("                                                    <td bgcolor=\"white\" style=\"padding-left:10px;\" width=\"451\"><span class=normal_b>");
      out.print(condo_name);
      out.write("</span></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" height=\"30\">이용일자</td>\r\n");
      out.write("                                                    <td bgcolor=\"white\" style=\"padding-left:10px;\"> ");
      out.print(in_date);
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(out_date);
      out.write("</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" height=\"30\">객실선택</td>\r\n");
      out.write("                                                    <td bgcolor=\"white\" style=\"padding-left:10px;\" class=red_ss>");
      out.print(roomtype);
      out.write("</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"30\" align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\">객실수</td>\r\n");
      out.write("                                                    <td height=\"25\" bgcolor=\"white\" style=\"padding-left:10px;\">");
      out.print(room_num);
      out.write("실</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"30\" align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\">이용인원</td>\r\n");
      out.write("                                                    <td height=\"25\" bgcolor=\"white\" style=\"padding-left:10px;\">");
      out.print(per_num);
      out.write("인</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"30\" align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\">예약자이름</td>\r\n");
      out.write("                                                    <td height=\"25\" bgcolor=\"white\" style=\"padding-left:10px;\">");
      out.print(reserve_name);
      out.write("</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td height=\"30\" align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\">핸드폰</td>\r\n");
      out.write("                                                    <td height=\"25\" bgcolor=\"white\" style=\"padding-left:10px;\">");
      out.print(mobile);
      out.write("</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <!--tr>\r\n");
      out.write("                                                    <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" height=\"30\">이용요금</td>\r\n");
      out.write("                                                    <td bgcolor=\"white\" style=\"padding-left:10px;\" class=\"red\">150,000원</td>\r\n");
      out.write("                                                  </tr>-->\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td align=\"right\" bgcolor=\"#F1F1F1\" class=\"mem_subject\" style=\"padding-right:10px;\" height=\"30\">요청사항</td>\r\n");
      out.write("                                                    <td bgcolor=\"white\" style=\"padding-left:10px;\">");
      out.print(StringUtils.replace(reserve_memo,"\n","<br/>"));
      out.write("</td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                  <tr>\r\n");
      out.write("                                                    <td bgcolor=\"#AED247\" colspan=\"2\" width=\"594\"></td>\r\n");
      out.write("                                                  </tr>\r\n");
      out.write("                                                </table></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td align=\"center\" height=\"115\">&nbsp;</td>\r\n");
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
