package org.apache.jsp.forGolfbooking;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.omg.CORBA.Request;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import java.util.*;
import org.omg.CORBA.Request;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;

public final class realReserve_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(5);
    _jspx_dependants.add("/include/header.jsp");
    _jspx_dependants.add("/include/logon_form.jsp");
    _jspx_dependants.add("/forGolfbooking/realReserve_content.jsp");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

String requestUri = request.getRequestURI();

      out.write("\r\n");
      out.write("<!-- 상단 영역 -->\r\n");
      out.write("﻿\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=euc-kr\">\r\n");
      out.write("<title>Welcome to GoodJobGolf</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/css/common.css\" type=\"text/css\">\r\n");
      out.write("<script src=\"/js/jquery-1.5.2.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"/js/flashObject.js\"></script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("select {\r\n");
      out.write("\tbehavior: url('/inc/selectbox.htc');\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\tfunction logon_ok() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(!$('#mem_id').val()) {\r\n");
      out.write("\t\t\talert('아이디를 입력하시기 바랍니다.');\r\n");
      out.write("\t\t\t$('#mem_id').focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tif(!$('#mem_pwd').val()) {\r\n");
      out.write("\t\t\talert('비밀번호를 입력하시기 바랍니다.');\r\n");
      out.write("\t\t\t$('#mem_pwd').focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t} \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\tvar frm = document.forms[\"logonFrm\"];\r\n");
      out.write("\t\tfrm.action = \"/logon/logon.jsp\";\r\n");
      out.write("\t\tfrm.submit();\r\n");
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
      out.write("                <td height=\"146\"><script>flashObject(\"/images/swf/navigation.swf\",\"\",\"1000\",\"146\")</script></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td>\r\n");
      out.write("                <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                      <td colspan=\"3\" background=\"/images/common/img_top_bg.jpg\" height=\"50\" valign=\"top\" width=\"1000\" align=\"right\">\r\n");
      out.write("                      \t<table cellpadding=\"0\" cellspacing=\"0\" width=\"749\" bgcolor=\"#052B48\">\r\n");
      out.write("                          <tr>\r\n");
      out.write("                            <td width=\"120\"><img src=\"/images/common/img_search_title.gif\" width=\"120\" height=\"40\" alt=\"골프장 빠른검색\"></td>\r\n");
      out.write("                            <td align=\"center\" width=\"180\"><select name=\"number\"  onchange=\"f_select(this.selectedIndex);\">\r\n");
      out.write("                                <option value=\"\">지역선택------------</option>\r\n");
      out.write("                                <option value=\"1\">전체보기</option>\r\n");
      out.write("                                <option value=\"2\">수도권</option>\r\n");
      out.write("                                <option value=\"3\">강원권</option>\r\n");
      out.write("                                <option value=\"4\">충청권</option>\r\n");
      out.write("                                <option value=\"5\">전라권</option>\r\n");
      out.write("                                <option value=\"6\">제주권</option>\r\n");
      out.write("                              </select></td>\r\n");
      out.write("                            <td width=\"175\"><select name=\"number\"  onchange=\"f_select(this.selectedIndex);\">\r\n");
      out.write("                                <option value=\"\">항목선택-------------</option>\r\n");
      out.write("                                <option value=\"1\">전체보기</option>\r\n");
      out.write("                                <option value=\"2\">실시간부킹 골프장</option>\r\n");
      out.write("                                <option value=\"3\">사전신청 골프장</option>\r\n");
      out.write("                                <option value=\"4\">국내패키지</option>\r\n");
      out.write("                                <option value=\"5\">해외패키지</option>\r\n");
      out.write("                              </select></td>\r\n");
      out.write("                            <td width=\"198\"><input class=\"input_01\" type=\"text\" size=\"28\" name=\"day\">\r\n");
      out.write("                            <td width=\"76\"><input type=\"image\" name=\"formimage1\" src=\"/images/common/btn_top_search.gif\" width=\"52\" height=\"22\"></td>\r\n");
      out.write("                          </tr>\r\n");
      out.write("                        </table>\r\n");
      out.write("                      </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                      <td width=\"235\" valign=\"top\">\r\n");
      out.write("                        <table border=\"0\" width=\"235\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("                          <tr>\r\n");
      out.write("                            <td background=\"/images/img_leftmenu/img_left_bg.jpg\" width=\"235\">\r\n");

	String current_url = StringUtils.trimToEmpty(request.getRequestURI());
	if(current_url.indexOf("/member/") == -1){
	

      out.write("\r\n");
      out.write("                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"235\" bgcolor=\"#052B48\">\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                  <td width=\"235\" align=\"center\" valign=\"top\">\r\n");
      out.write("                                   ");
      out.write('﻿');
      out.write('\r');
      out.write('\n');

	String ses_mem_id = (String)session.getAttribute("mem_id");
	String ses_mem_name = (String)session.getAttribute("mem_name");
	
	if(ses_mem_id != null && ses_mem_id.length() > 0){

      out.write("\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"235\">\r\n");
      out.write("   <tr>\r\n");
      out.write("     <td></td>\r\n");
      out.write("   </tr>\r\n");
      out.write("   <tr>\r\n");
      out.write("     <td height=\"70\" align=\"center\">\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"207\">\r\n");
      out.write("<form name=\"logonFrm\" method=\"post\" action=\"\">\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td><div class=\"white_b\" style=\"padding-left:15px;\">");
      out.print(ses_mem_id);
      out.write("</div></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td height=\"5\"></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td><div class=\"white_b\" style=\"padding-left:15px;\">");
      out.print(ses_mem_name);
      out.write("</div></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     \r\n");
      out.write("     <tr>\r\n");
      out.write("       <td height=\"5\"></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td align=\"center\"><a href=\"/logon/logout.jsp\"><img src=\"/images/common/btn_log_out.gif\"  border=\"0\"></a></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td height=\"5\"></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td align=\"center\"><img src=\"/images/common/btn_modify_out.gif\"  border=\"0\"></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td height=\"5\"></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("</form>\r\n");
      out.write("</table>\r\n");
      out.write("       </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");

	}
	else{

      out.write("\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"235\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td><img src=\"/images/img_leftmenu/img_login_title.gif\" width=\"235\" height=\"49\" border=\"0\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"146\" align=\"center\">\r\n");
      out.write("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"207\">\r\n");
      out.write("<form name=\"logonFrm\" method=\"post\" action=\"\">\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td width=\"103\"><input id=\"mem_id\" class=\"input_01\" type=\"text\" size=\"20\" name=\"mem_id\" value=\"");
      out.print(com.goodjob.util.Utils.getCookie(request,"golf.mem_id"));
      out.write("\"></td>\r\n");
      out.write("       <td rowspan=\"3\" align=\"right\"><a href=\"javascript:logon_ok();\"><img src=\"/images/img_leftmenu/btn_login_confirm.gif\" width=\"64\" height=\"51\" border=\"0\"></a></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td height=\"2\"></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td width=\"103\"><input id=\"mem_pwd\" class=\"input_01\" type=\"password\" size=\"20\" name=\"mem_pwd\" value=\"\"></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("       <td width=\"207\" colspan=\"2\" height=\"40\" align=\"right\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\">\r\n");
      out.write("           <tr>\r\n");
      out.write("             <td width=\"104\"><a href=\"/member/join_agreement.jsp\"><img src=\"/images/img_leftmenu/btn_join_s.gif\" width=\"55\" height=\"13\" border=\"0\"></a></td>\r\n");
      out.write("             <td width=\"104\"><a href=\"/member/id_pass_search.jsp\"><img src=\"/images/img_leftmenu/btn_id_pw_s.gif\" width=\"108\" height=\"13\" border=\"0\"></a></td>\r\n");
      out.write("           </tr>\r\n");
      out.write("         </table></td>\r\n");
      out.write("     </tr>\r\n");
      out.write("</form>\r\n");
      out.write("</table>\r\n");
      out.write("       </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");

	}

      out.write("\r\n");
      out.write("   ");
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
      out.write("                                          <td width=\"235\"><a href=\"#\"><img src=\"/images/img_leftmenu/img_customer_center.gif\" width=\"235\" height=\"139\" border=\"0\"></a></td>\r\n");
      out.write("                                      </tr>\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                          <td><a href=\"#\"><img src=\"/images/img_leftmenu/btn_user_guide.gif\" width=\"235\" height=\"86\" border=\"0\"></a></td>\r\n");
      out.write("                                      </tr>\r\n");
      out.write("                                      <tr>\r\n");
      out.write("                                          <td><a href=\"sub/board/faq_list.html\"><img src=\"/images/img_leftmenu/btn_faq.gif\" width=\"235\" height=\"86\" border=\"0\"></a></td>\r\n");
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
      out.write("\r\n");
      out.write("<!-- 상단 영역 -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<!--############### 중앙 컨텐츠 영역 #################-->\r\n");
      out.write("\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"751\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t");
 if(requestUri.startsWith("/forGolfbooking/realReserve.jsp")){ 
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

out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 }else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 out.println("a/"+requestUri+"/a"); 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<!-- 하단  회사 소개 부분  -->\r\n");
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
      out.write("\r\n");
      out.write("                    <!-- 하단  회사 소개 부분  -->\r\n");
      out.write("\t\t\t\t\t<!--############### 중앙 컨텐츠 영역 #################-->\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("<!-- 하단 footer  -->\r\n");
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
      out.write("\r\n");
      out.write("<!-- 하단 footer  -->");
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
