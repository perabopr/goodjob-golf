package org.apache.jsp.Admin.sub;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

public final class bottom_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<HTML>\n");
      out.write("\n");
      out.write("<HEAD>\n");
      out.write("<META HTTP-EQUIV=\"content-type\" CONTENT=\"text/html; charset=euc-kr\">\n");
      out.write("\n");
      out.write("\n");
      out.write("</HEAD>\n");
      out.write("\n");
      out.write("<BODY BGCOLOR=\"#666666\" LEFTMARGIN=\"0\" MARGINWIDTH=\"0\" TOPMARGIN=\"0\" MARGINHEIGHT=\"0\">\n");
      out.write("<TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\" WIDTH=\"100%\">\n");
      out.write("<TR>\n");
      out.write("<TD HEIGHT=\"21\" ALIGN=\"center\">\n");
      out.write("<P><IMG SRC=\"../images/common/img_copyright.gif\" WIDTH=\"291\" HEIGHT=\"14\" BORDER=\"0\"></P>\n");
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("</BODY>\n");
      out.write("\n");
      out.write("</HTML>\n");
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
