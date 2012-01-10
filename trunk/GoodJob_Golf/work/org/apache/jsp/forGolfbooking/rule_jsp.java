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
import com.goodjob.reserve.dto.GolfLinkPromiseDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.GolfLinkPromiseDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import com.goodjob.reserve.dto.PackagePromiseDto;
import org.apache.commons.lang.math.NumberUtils;
import com.goodjob.reserve.PackageDao;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.dto.GolfLinkPromiseDto;
import java.util.List;
import com.goodjob.reserve.GolfLinkDao;
import org.apache.commons.lang.StringUtils;
import com.goodjob.reserve.CondoReserveDao;
import java.util.List;
import com.goodjob.reserve.dto.CondoPromiseDto;
import org.apache.commons.lang.math.NumberUtils;

public final class rule_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


public String commify(int n) {
	return com.goodjob.util.Utils.numberFormat(n);
}

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(8);
    _jspx_dependants.add("/include/loginCheck.jsp");
    _jspx_dependants.add("/include/header.jsp");
    _jspx_dependants.add("/forGolfbooking/ruleReal.jsp");
    _jspx_dependants.add("/forGolfbooking/rulePre.jsp");
    _jspx_dependants.add("/forGolfbooking/rulePackage.jsp");
    _jspx_dependants.add("/forGolfbooking/ruleCondo.jsp");
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

int productsubSeq = NumberUtils.toInt(request.getParameter("gcId"), 0);
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkPromiseDto> listPromise = glDao.getGolfPromise(productsubSeq);

if(listPromise == null || listPromise.size() == 0){
	out.println("<script>location.href='reserve.jsp?menu=1'</script>");
	return;
}

      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function reserveAgree(){\r\n");
      out.write("\tif(!$(\"#chkAgree1\").attr(\"checked\")){\r\n");
      out.write("\t\talert(\"위약처리규정에 동의하세요.\");\r\n");
      out.write("\t\t$(\"#chkAgree1\").select();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(!$(\"#chkAgree2\").attr(\"checked\")){\r\n");
      out.write("\t\talert(\"이용약관에 동의하세요.\");\r\n");
      out.write("\t\t$(\"#chkAgree2\").select();\r\n");
      out.write("\t\treturn false;\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t$(\"#menu\").val(\"1\");\r\n");
      out.write("\t$(\"#gcId\").val(\"");
      out.print(productsubSeq);
      out.write("\");\r\n");
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
      out.write("</script>\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"bill.jsp\">\r\n");
      out.write("<input type=\"hidden\" id=\"menu\" name=\"menu\" >\r\n");
      out.write("<input type=\"hidden\" id=\"gcId\" name=\"gcId\" >\r\n");
      out.write("<input type=\"hidden\" id=\"golf\" name=\"golf\" >\r\n");
      out.write("<input type=\"hidden\" id=\"date\" name=\"date\" >\r\n");
      out.write("<input type=\"hidden\" id=\"cdate\" name=\"cdate\" >\r\n");
      out.write("</FORM>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>실시간예약</SPAN></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 15px; PADDING-TOP: 4px\" class=sub_title bgColor=#d1d3d4 height=33>실시간예약</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top>\r\n");
      out.write("<P>&nbsp;</P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD vAlign=top align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>\r\n");
      out.write("<P><IMG border=0 src=\"../../images/booking/img_rule_title.gif\" width=192 height=30></P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=630 bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 height=25 width=\"50%\" align=center>구분</TD>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 width=\"50%\" align=center>위약처리규정</TD>\r\n");
      out.write("</TR>\r\n");

	if(listPromise != null && listPromise.size() == 1){
		if(listPromise.get(0).getPromise1_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise1_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise1() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise2_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise2_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise2() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise3_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise3_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise3() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise4_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise4_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise4() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise5_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise5_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise5() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
	}

      out.write("\r\n");
      out.write("</TBODY></TABLE></TD>\r\n");
      out.write("<TR><TD>&nbsp;</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 40px; PADDING-RIGHT: 40px\">\r\n");

	if(listPromise != null && listPromise.size() == 1){	
 		out.print(listPromise.get(0).getCancelrule());
	}

      out.write("\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 40px\" align=right><INPUT id=\"chkAgree1\" value=\"\" type=checkbox> 위약처리규정에 동의합니다 </TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD><IMG border=0 src=\"../../images/booking/img_agree_title.gif\" width=192 height=30></TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR height=\"130px\" valign=\"top\">\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<div style=\"overflow-x:hidden; overflow-y:auto; height:130px; width:630px;text-align:left;border: 1px solid; border-color:#D1D3D4;\" >\r\n");

	if(listPromise != null && listPromise.size() == 1){	
		out.print(listPromise.get(0).getUse_rule());
	}

      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>&nbsp;</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 40px\" align=right><INPUT id=\"chkAgree2\" value=\"\" type=checkbox> 이용약관에 동의합니다 </TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-BOTTOM: 30px; PADDING-TOP: 30px\" align=center><A href=\"javascript:;\" onclick=\"reserveAgree();\"><IMG border=0 src=\"../../images/common/btn_regist_booking2.gif\"></A></TD>\r\n");
      out.write("</TR>\r\n");
      out.write("</TBODY>\r\n");
      out.write("</TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>");
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

int productsubSeq = NumberUtils.toInt(request.getParameter("psId"), 0);
if(productsubSeq == 0){
	out.println("<script>location.href='reserve.jsp?menu=2'</script>");
	return;
}
GolfLinkDao glDao = new GolfLinkDao();
List<GolfLinkPromiseDto> listPromise = glDao.getGolfPromise(productsubSeq);

if(listPromise == null || listPromise.size() == 0){
	out.println("<script>location.href='reserve.jsp?menu=2'</script>");
	return;
}

      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function reserveAgree(){\r\n");
      out.write("\tif(!$(\"#chkAgree1\").attr(\"checked\")){\r\n");
      out.write("\t\talert(\"위약처리규정에 동의하세요.\");\r\n");
      out.write("\t\t$(\"#chkAgree1\").select();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(!$(\"#chkAgree2\").attr(\"checked\")){\r\n");
      out.write("\t\talert(\"이용약관에 동의하세요.\");\r\n");
      out.write("\t\t$(\"#chkAgree2\").select();\r\n");
      out.write("\t\treturn false;\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t$(\"#menu\").val(\"2\");\r\n");
      out.write("\t$(\"#psId\").val(\"");
      out.print(productsubSeq);
      out.write("\");\r\n");
      out.write("\t$(\"#golf\").val('");
      out.print(request.getParameter("golf"));
      out.write("');\r\n");
      out.write("\t$(\"#date\").val('");
      out.print(request.getParameter("date"));
      out.write("');\r\n");
      out.write("\t$(\"#cdate\").val('");
      out.print(request.getParameter("cdate"));
      out.write("');\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#reserveCnt\").val('");
      out.print(request.getParameter("reserveCnt"));
      out.write("');\r\n");
      out.write("\t$(\"#reserveTeam\").val('");
      out.print(request.getParameter("reserveTeam"));
      out.write("');\r\n");
      out.write("\t$(\"#reserveDate\").val('");
      out.print(request.getParameter("reserveDate"));
      out.write("');\r\n");
      out.write("\t$(\"#reserveTime\").val('");
      out.print(request.getParameter("reserveTime"));
      out.write("');\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#reserveName\").val('");
      out.print(request.getParameter("reserveName"));
      out.write("');\r\n");
      out.write("\t$(\"#reservePhone\").val('");
      out.print(request.getParameter("reservePhone"));
      out.write("');\r\n");
      out.write("\t$(\"#reserveEmail\").val('");
      out.print(request.getParameter("reserveEmail"));
      out.write("');\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"bill.jsp\">\r\n");
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
      out.write("<textarea id=\"reserveRequest\" name=\"reserveRequest\" style=\"display:none\">");
      out.print(request.getParameter("reserveRequest"));
      out.write("</textarea>\r\n");
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
      out.write("<TD>\r\n");
      out.write("<P><IMG border=0 src=\"../../images/booking/img_rule_title.gif\" width=192 height=30></P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=630 bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 height=25 width=\"50%\" align=center>구분</TD>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 width=\"50%\" align=center>위약처리규정</TD>\r\n");
      out.write("</TR>\r\n");

	if(listPromise != null && listPromise.size() == 1){
		if(listPromise.get(0).getPromise1_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise1_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise1() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise2_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise2_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise2() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise3_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise3_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise3() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise4_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise4_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise4() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise5_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise5_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise5() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
	}

      out.write("\r\n");
      out.write("</TBODY></TABLE></TD>\r\n");
      out.write("<TR><TD>&nbsp;</TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 40px; PADDING-RIGHT: 40px\">\r\n");

	if(listPromise != null && listPromise.size() == 1){	
 		out.print(listPromise.get(0).getCancelrule());
	}

      out.write("\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 40px\" align=right><INPUT id=\"chkAgree1\" value=\"\" type=checkbox> 위약처리규정에 동의합니다 </TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD><IMG border=0 src=\"../../images/booking/img_agree_title.gif\" width=192 height=30></TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR height=\"130px\" valign=\"top\">\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<div style=\"overflow-x:hidden; overflow-y:auto; height:130px; width:630px;text-align:left; border: 1px solid; border-color:#D1D3D4;\">\r\n");

	if(listPromise != null && listPromise.size() == 1){	
		out.print(listPromise.get(0).getUse_rule());
	}

      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>&nbsp;</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 40px\" align=right><INPUT id=\"chkAgree2\" value=\"\" type=checkbox> 이용약관에 동의합니다 </TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-BOTTOM: 30px; PADDING-TOP: 30px\" align=center><A href=\"javascript:;\" onclick=\"reserveAgree();\"><IMG border=0 src=\"../../images/common/btn_regist_booking2.gif\"></A></TD>\r\n");
      out.write("</TR>\r\n");
      out.write("</TBODY>\r\n");
      out.write("</TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>");
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

int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"),0);
if(pkSeq == 0){
	out.println("<script>location.href='reserve.jsp?menu=3'</script>");
	return;
}
PackageDao pkDao = new PackageDao();
List<PackagePromiseDto> listPromise = pkDao.getPackagePromise(pkSeq);

if(listPromise.size() != 1){
	out.println("<script>alert('취소 규정이 없습니다.');location.href='reserve.jsp?menu=3'</script>");
	return;
}

      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function reserveAgree(){\r\n");
      out.write("\tif(!$(\"#chkAgree1\").attr(\"checked\")){\r\n");
      out.write("\t\talert(\"위약처리규정에 동의하세요.\");\r\n");
      out.write("\t\t$(\"#chkAgree1\").select();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(!$(\"#chkAgree2\").attr(\"checked\")){\r\n");
      out.write("\t\talert(\"이용약관에 동의하세요.\");\r\n");
      out.write("\t\t$(\"#chkAgree2\").select();\r\n");
      out.write("\t\treturn false;\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t$(\"#menu\").val(\"3\");\r\n");
      out.write("\t$(\"#pkSeq\").val(\"");
      out.print(pkSeq);
      out.write("\");\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"bill.jsp\">\r\n");
      out.write("<input type=\"hidden\" id=\"menu\" name=\"menu\" value=\"3\" >\r\n");
      out.write("<input type=\"hidden\" id=\"pkSeq\" name=pkSeq>\r\n");
      out.write("</FORM>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=751 bgColor=#d2d2d2><TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD bgColor=white vAlign=top width=745 align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"95%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=location height=30 width=\"95%\" align=right><A href=\"/main.jsp\">HOME</A> &gt; 골프장부킹 &gt; <SPAN class=location_b>사전예약</SPAN></TD></TR>\r\n");
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
      out.write("<TD>\r\n");
      out.write("<P><IMG border=0 src=\"../../images/booking/img_rule_title.gif\" width=192 height=30></P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=630 bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 height=25 width=\"50%\" align=center>구분</TD>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 width=\"50%\" align=center>위약처리규정</TD>\r\n");
      out.write("</TR>\r\n");

	if(listPromise != null && listPromise.size() == 1){
		if(listPromise.get(0).getPromise1_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise1_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise1() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise2_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise2_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise2() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise3_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise3_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise3() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise4_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise4_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise4() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise5_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise5_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise5() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
	}

      out.write("\r\n");
      out.write("</TBODY></TABLE></TD>\r\n");
      out.write("<TR><TD>&nbsp;</TD></TR>\t\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 40px; PADDING-RIGHT: 40px\">\r\n");

	if(listPromise != null && listPromise.size() == 1){	
 		out.print(listPromise.get(0).getCancelrule());
	}

      out.write("\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 40px\" align=right><INPUT id=\"chkAgree1\" value=\"\" type=checkbox> 위약처리규정에 동의합니다 </TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD><IMG border=0 src=\"../../images/booking/img_agree_title.gif\" width=192 height=30></TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR height=\"130px\" valign=\"top\">\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<div style=\"overflow-x:hidden; overflow-y:auto; height:130px; width:630px;text-align:left;border: 1px solid; border-color:#D1D3D4\">\r\n");

	if(listPromise != null && listPromise.size() == 1){	
		out.print(listPromise.get(0).getUse_rule());
	}

      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>&nbsp;</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 40px\" align=right><INPUT id=\"chkAgree2\" value=\"\" type=checkbox> 이용약관에 동의합니다 </TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-BOTTOM: 30px; PADDING-TOP: 30px\" align=center><A href=\"javascript:;\" onclick=\"reserveAgree();\"><IMG border=0 src=\"../../images/common/btn_regist_booking2.gif\"></A></TD>\r\n");
      out.write("</TR>\r\n");
      out.write("</TBODY>\r\n");
      out.write("</TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>");
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


	String menu = StringUtils.trimToEmpty(request.getParameter("menu"));
	String condo_seq = StringUtils.trimToEmpty(request.getParameter("condo_seq"));
	String condo_name = StringUtils.trimToEmpty(request.getParameter("condo_name"));
	
	String in_date = StringUtils.trimToEmpty(request.getParameter("in_date"));
	String out_date = StringUtils.trimToEmpty(request.getParameter("out_date"));
	String condoroom_seq = StringUtils.trimToEmpty(request.getParameter("condoroom_seq"));
	String roomtype = StringUtils.trimToEmpty(request.getParameter("roomtype"));
	String room_num = StringUtils.trimToEmpty(request.getParameter("room_num"));
	String per_num = StringUtils.trimToEmpty(request.getParameter("per_num"));
	String reserve_name = StringUtils.trimToEmpty(request.getParameter("reserve_name"));
	String mobile = StringUtils.trimToEmpty(request.getParameter("mobile1"))+"-"+StringUtils.trimToEmpty(request.getParameter("mobile2"))+"-"+StringUtils.trimToEmpty(request.getParameter("mobile3"));
	String reserve_memo = StringUtils.trimToEmpty(request.getParameter("reserve_memo"));

	CondoReserveDao reserveDao = new CondoReserveDao();
	
	List<CondoPromiseDto> listPromise = reserveDao.getCondoPromise(NumberUtils.toInt(condo_seq));
	if(listPromise.size() != 1){
		out.println("<script>alert('취소 규정이 없습니다.');location.href='reserve.jsp?menu=5'</script>");
		return;
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function reserveAgree(){\r\n");
      out.write("\tif(!$(\"#chkAgree1\").attr(\"checked\")){\r\n");
      out.write("\t\talert(\"위약처리규정에 동의하세요.\");\r\n");
      out.write("\t\t$(\"#chkAgree1\").select();\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(!$(\"#chkAgree2\").attr(\"checked\")){\r\n");
      out.write("\t\talert(\"이용약관에 동의하세요.\");\r\n");
      out.write("\t\t$(\"#chkAgree2\").select();\r\n");
      out.write("\t\treturn;\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("                          <tr>\r\n");
      out.write("                            <td><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                  <td width=\"751\"><table border=\"0\" cellpadding=\"2\" cellspacing=\"1\" width=\"751\" bgcolor=\"#D2D2D2\">\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                        <td align=\"center\" bgcolor=\"white\" width=\"745\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"95%\">\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td align=\"right\" class=\"location\" height=\"30\" width=\"95%\"><a href=\"/index.html\">HOME</a> &gt; 골프장부킹 &gt; <span class=location_b>실시간예약</span></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td bgcolor=\"#D1D3D4\" height=\"33\" class=\"sub_title\" style=\"padding-left:15px;padding-top:4px\">콘도예약</td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td valign=\"top\"><p>&nbsp;</p></td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("<form name=\"frm\" method=\"post\" action=\"result.jsp\">\r\n");
      out.write("<input type=\"hidden\" name=\"menu\" value=\"");
      out.print(menu);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"condo_seq\" value=\"");
      out.print(condo_seq);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"condo_name\" value=\"");
      out.print(condo_name);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"in_date\" value=\"");
      out.print(in_date);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"out_date\" value=\"");
      out.print(out_date);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"condoroom_seq\" value=\"");
      out.print(condoroom_seq);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"roomtype\" value=\"");
      out.print(roomtype);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"room_num\" value=\"");
      out.print(room_num);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"per_num\" value=\"");
      out.print(per_num);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"reserve_name\" value=\"");
      out.print(reserve_name);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"mobile\" value=\"");
      out.print(mobile);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" name=\"reserve_memo\" value=\"");
      out.print(reserve_memo);
      out.write("\"/>\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                              <td valign=\"top\" align=\"center\">\r\n");
      out.write("                                              \r\n");
      out.write("<TABLE border=0 cellSpacing=0 cellPadding=0 width=\"100%\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>\r\n");
      out.write("<P><IMG border=0 src=\"../../images/booking/img_rule_title.gif\" width=192 height=30></P></TD></TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<TABLE border=0 cellSpacing=1 cellPadding=2 width=630 bgColor=#d1d3d4>\r\n");
      out.write("<TBODY>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 height=25 width=\"50%\" align=center>구분</TD>\r\n");
      out.write("<TD class=normal_b bgColor=#f1f1f1 width=\"50%\" align=center>위약처리규정</TD>\r\n");
      out.write("</TR>\r\n");

	if(listPromise != null && listPromise.size() == 1){
		if(listPromise.get(0).getPromise1_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise1_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise1() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise2_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise2_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise2() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise3_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise3_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise3() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise4_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise4_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise4() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
		if(listPromise.get(0).getPromise5_type().length() > 0){

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=normal_b bgColor=white height=25 width=\"50%\">");
      out.print(listPromise.get(0).getPromise5_type() );
      out.write("</TD>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 20px\" class=orange bgColor=white width=\"50%\">");
      out.print(listPromise.get(0).getPromise5() );
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");

		}
	}

      out.write("\r\n");
      out.write("</TBODY></TABLE></TD>\r\n");
      out.write("<TR><TD>&nbsp;</TD></TR>\t\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-LEFT: 40px; PADDING-RIGHT: 40px\">\r\n");

	if(listPromise != null && listPromise.size() == 1){	
 		out.print(listPromise.get(0).getCancelrule());
	}

      out.write("\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 40px\" align=right><INPUT id=\"chkAgree1\" value=\"\" type=checkbox> 위약처리규정에 동의합니다 </TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD><IMG border=0 src=\"../../images/booking/img_agree_title.gif\" width=192 height=30></TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR height=\"130px\" valign=\"top\">\r\n");
      out.write("<TD align=center>\r\n");
      out.write("<div style=\"overflow-x:hidden; overflow-y:auto; height:130px; width:630px;text-align:left;border: 1px solid; border-color:#D1D3D4\">\r\n");

	if(listPromise != null && listPromise.size() == 1){	
		out.print(listPromise.get(0).getUse_rule());
	}

      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD>&nbsp;</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-RIGHT: 40px\" align=right><INPUT id=\"chkAgree2\" value=\"\" type=checkbox> 이용약관에 동의합니다 </TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("<TD style=\"PADDING-BOTTOM: 30px; PADDING-TOP: 30px\" align=center><A href=\"javascript:;\" onclick=\"reserveAgree();\"><IMG border=0 src=\"../../images/common/btn_regist_booking2.gif\"></A></TD>\r\n");
      out.write("</TR>\r\n");
      out.write("</TBODY>\r\n");
      out.write("</TABLE>\r\n");
      out.write("                                              </td>\r\n");
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
      out.write('\r');
      out.write('\n');
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
