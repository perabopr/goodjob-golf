package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import java.sql.*;
import java.util.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=euc-kr\">\n");
      out.write("<title>굳잡골프 통합 관리자.</title>\n");
      out.write("<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\">\n");
      out.write("</head>\n");
      out.write("<body leftmargin=\"0\" marginwidth=\"0\" topmargin=\"150\" marginheight=\"150\" bgcolor=\"#E4E4E4\">\n");
      out.write("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"601\">\n");
      out.write("  <tr>\n");
      out.write("    <td width=\"100%\" align=\"center\"><p><img src=\"/Admin/images/common/img_login_top.gif\" width=\"601\" height=\"141\" border=\"0\"></p></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td align=\"center\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"601\">\n");
      out.write("        <tr>\n");
      out.write("          <td width=\"330\"><p><img src=\"/Admin/images/common/img_login_id_title.gif\" width=\"330\" height=\"60\" border=\"0\"></p></td>\n");
      out.write("          <td width=\"271\" bgcolor=\"#414042\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("              <tr>\n");
      out.write("                <td width=\"261\"><p>\n");
      out.write("                    <input class=\"insText\" type=\"text\" size=\"30\" name=\"m_id\" >\n");
      out.write("                  </p></td>\n");
      out.write("              </tr>\n");
      out.write("              <tr>\n");
      out.write("                <td height=\"10\"><p></p></td>\n");
      out.write("              </tr>\n");
      out.write("              <tr>\n");
      out.write("                <td><p>\n");
      out.write("                    <input class=\"insText\" type=\"password\" size=\"30\" name=\"m_pass\" >\n");
      out.write("                  </p></td>\n");
      out.write("              </tr>\n");
      out.write("            </table></td>\n");
      out.write("        </tr>\n");
      out.write("      </table></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td align=\"right\" background=\"/Admin/images/common/img_login_bg.gif\" height=\"120\"  style=\"padding-right:100\"><p>\n");
      out.write("        <input type=\"image\" src=\"/Admin/images/common/btn_login.gif\" width=\"185\" height=\"45\" onclick=\"location.href='/Admin/sub/';\" border=\"0\" name=\"a11\">\n");
      out.write("        &gt;</p></td>\n");
      out.write("  </tr>\n");
      out.write("  <tr>\n");
      out.write("    <td align=\"center\"><p><img src=\"/Admin/images/common/img_login_bottom.gif\" width=\"601\" height=\"44\" border=\"0\"></p></td>\n");
      out.write("  </tr>\n");
      out.write("</table>\n");
      out.write("</body>\n");
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
