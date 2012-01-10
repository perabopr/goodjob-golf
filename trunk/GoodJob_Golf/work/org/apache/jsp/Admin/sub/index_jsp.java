package org.apache.jsp.Admin.sub;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

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
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=euc-kr\">\n");
      out.write("<title>굳잡골프 통합 관리자</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<frameset cols=\"200, 1*\" border=\"0\">\n");
      out.write("\t<frame src=\"left_menu.jsp\" name=\"left_menu\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\" namo_target_frame=\"main\">\n");
      out.write("\t<frameset rows=\"30, 92%, 25\">\n");
      out.write("\t\t<frame src=\"top.jsp\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("\t\t<frame src=\"booking/realtime_list.html\" name=\"main\" scrolling=\"yes\" marginwidth=\"10\" marginheight=\"10\" namo_target_frame=\"main\">\n");
      out.write("\t\t<frame src=\"bottom.jsp\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\" name=\"bottom\">\n");
      out.write("\t</frameset>\n");
      out.write("\t<noframes>\n");
      out.write("\t<body bgcolor=\"white\">\n");
      out.write("\t<p>이 페이지를 보려면, 프레임을 볼 수 있는 브라우저가 필요합니다.</p>\n");
      out.write("\t</body>\n");
      out.write("\t</noframes>\n");
      out.write("</frameset>\n");
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
