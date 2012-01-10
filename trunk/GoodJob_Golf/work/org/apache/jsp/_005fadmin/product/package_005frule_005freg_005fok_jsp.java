package org.apache.jsp._005fadmin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.PackageDao;
import com.goodjob.product.dto.PackagePromiseDto;

public final class package_005frule_005freg_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

String pkSeq = StringUtils.trimToEmpty(request.getParameter("pkSeq"));
String p1 = StringUtils.trimToEmpty(request.getParameter("promise1"));
String p1t = StringUtils.trimToEmpty(request.getParameter("promise1_type"));
String p2 = StringUtils.trimToEmpty(request.getParameter("promise2"));
String p2t = StringUtils.trimToEmpty(request.getParameter("promise2_type"));
String p3 = StringUtils.trimToEmpty(request.getParameter("promise3"));
String p3t = StringUtils.trimToEmpty(request.getParameter("promise3_type"));
String p4 = StringUtils.trimToEmpty(request.getParameter("promise4"));
String p4t = StringUtils.trimToEmpty(request.getParameter("promise4_type"));
String p5 = StringUtils.trimToEmpty(request.getParameter("promise5"));
String p5t = StringUtils.trimToEmpty(request.getParameter("promise5_type"));
String cancelrule = StringUtils.trimToEmpty(request.getParameter("cancelrule"));

PackagePromiseDto glpDto = new PackagePromiseDto();
glpDto.setPackage_seq(Integer.parseInt(pkSeq));
glpDto.setPromise1_type(p1t);
glpDto.setPromise1(p1);
glpDto.setPromise2_type(p2t);
glpDto.setPromise2(p2);
glpDto.setPromise3_type(p3t);
glpDto.setPromise3(p3);
glpDto.setPromise4_type(p4t);
glpDto.setPromise4(p4);
glpDto.setPromise5_type(p5t);
glpDto.setPromise5(p5);
glpDto.setCancelrule(cancelrule);

PackageDao pkDao = new PackageDao();
pkDao.setPackagePromiseDelete(Integer.parseInt(pkSeq));
pkDao.setPackagePromiseInsert(glpDto);

out.print("<script type='text/javascript'>");
out.print("alert('수정되었습니다.');");
out.print("location.href='package_rule_reg.jsp?pkSeq=" + pkSeq + "'");
out.print("</script>");

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
