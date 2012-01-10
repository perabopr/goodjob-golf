package org.apache.jsp._005fadmin.product.popup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.dto.GolfLinkCourseDto;
import com.goodjob.product.GolfLinkDao;

public final class pop_005fcourse_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));
	GolfLinkDao gfdao = new GolfLinkDao(); 
	List<GolfLinkCourseDto> glcDto = gfdao.getGolfLinkCourseSelect(Integer.parseInt(glSeq));

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>코스입력</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../../style.css\" type=\"text/css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/jquery-1.5.2.min.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\tfunction reg_submit() {\r\n");
      out.write("\t\tif(!$(\"#course\").val()){\r\n");
      out.write("\t\t\talert('코스를 입력하세요.');\r\n");
      out.write("\t\t\t$(\"#course\").focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfrm1.submit();\t\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction del_submit(seq){\r\n");
      out.write("\t\tif(confirm(\"삭제 하겠습니까?\")){\r\n");
      out.write("\t\t\t$(\"#courseSeq\").val(seq);\r\n");
      out.write("\t\t\tfrm2.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"360\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\" width=\"360\" class=title>★ 실시간 골프장 코스입력 ★</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\">&nbsp;</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t<form NAME=\"frm1\" METHOD=\"post\" ACTION=\"pop_course_reg.jsp\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" id=\"glSeq1\" name=\"glSeq1\" value=\"");
      out.print(glSeq );
      out.write("\" />\r\n");
      out.write("\t\t  \t<table width=\"320\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#D1D3D4\">\r\n");
      out.write("\t\t    <tr>\r\n");
      out.write("\t\t    \t<td bgcolor=\"white\" width=\"279\"><input class=\"input_box\" size=\"40\" id=\"course\" name=\"course\"></td>\r\n");
      out.write("\t\t        <td align=\"center\" bgcolor=\"white\" width=\"60\"><img align=\"absmiddle\" src=\"../../images/inc/btn_plus.gif\" width=\"32\" height=\"16\" border=\"0\" onclick=\"reg_submit();return false;\"></td>\r\n");
      out.write("\t\t    </tr>\r\n");
      out.write("\t\t    </table>\r\n");
      out.write("\t\t    </form>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\">&nbsp;</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t<form NAME=\"frm2\" METHOD=\"post\" ACTION=\"pop_course_del.jsp\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" id=\"glSeq2\" name=\"glSeq2\" value=\"");
      out.print(glSeq );
      out.write("\" />\r\n");
      out.write("\t\t\t<input type=\"hidden\" id=\"courseSeq\" name=\"courseSeq\" value=\"\" />\r\n");
      out.write("\t\t\t<table width=\"320\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t");

				for(int i = 0; i < glcDto.size();i++){
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( glcDto.get(i).getCourse_name());
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td align=\"right\"><a href=\"javascript:del_submit('");
      out.print( glcDto.get(i).getGolflink_course_seq());
      out.write("');\"><img align=\"absmiddle\" src=\"../../images/inc/btn_del.gif\" width=\"13\" height=\"14\" border=\"0\"></a></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

				}
			
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\">&nbsp;</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\"><img align=\"absmiddle\" src=\"../../images/inc/btn_regist2.gif\" width=\"74\" height=\"26\" border=\"0\" onclick=\"self.close();\"></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t</table>\r\n");
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
