package org.apache.jsp._005fadmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.lang.StringUtils;

public final class Main_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");

if(StringUtils.trimToEmpty((String)session.getAttribute("admin_id")).length()==0){

      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\talert(\"로그인이 필요한 곳입니다.\");\r\n");
      out.write("\ttop.location.href=\"/_admin/\";\r\n");
      out.write("</script>\r\n");

	return;
}

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=euc-kr\">\r\n");
      out.write("<title>굳잡골프 통합 관리자</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<frameset cols=\"200, 1*\" border=\"0\">\r\n");
      out.write("\t<frame src=\"left_menu.jsp\" name=\"left_menu\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\" namo_target_frame=\"main\">\r\n");
      out.write("\t<frameset rows=\"30, 92%, 25\">\r\n");
      out.write("\t\t<frame src=\"top.jsp\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("\t\t<frame src=\"product/real_list.jsp?menu=1\" name=\"main\" scrolling=\"yes\" marginwidth=\"10\" marginheight=\"10\" namo_target_frame=\"main\">\r\n");
      out.write("\t\t<frame src=\"bottom.jsp\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\" name=\"bottom\">\r\n");
      out.write("\t</frameset>\r\n");
      out.write("\t<noframes>\r\n");
      out.write("\t<body bgcolor=\"white\">\r\n");
      out.write("\t<p>이 페이지를 보려면, 프레임을 볼 수 있는 브라우저가 필요합니다.</p>\r\n");
      out.write("\t</body>\r\n");
      out.write("\t</noframes>\r\n");
      out.write("</frameset>\r\n");
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
