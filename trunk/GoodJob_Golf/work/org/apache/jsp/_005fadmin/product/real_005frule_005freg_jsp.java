package org.apache.jsp._005fadmin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.db.*;
import com.goodjob.product.dto.GolfLinkPromiseDto;
import com.goodjob.product.GolfLinkDao;

public final class real_005frule_005freg_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");

String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));
String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));

List<GolfLinkPromiseDto> arrList = null;
GolfLinkPromiseDto glpList = new GolfLinkPromiseDto();  
GolfLinkDao glDao = new GolfLinkDao();
if(glSeq.length() > 0){
	arrList = glDao.getGolfLinkPromiseSelect(Integer.parseInt(glSeq));
	if(arrList != null && arrList.size() > 0){
		glpList = arrList.get(0);
	}
}


String pageTitle = "";
if(menuSeq.startsWith("1")){
	pageTitle += "★  실시간골프장 위약처리규정 ★";
}else{
	pageTitle += "★  사전골프장 위약처리규정 ★";
}

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../style.css\">\r\n");
      out.write("<title></title>\r\n");
      out.write("<script language=\"JavaScript\"> \r\n");
      out.write("<!-- \r\n");
      out.write("function NewWindow(mypage, myname, w, h, scroll) { \r\n");
      out.write("var winl = (screen.width - w) / 2; \r\n");
      out.write("var wint = (screen.height - h) / 2; \r\n");
      out.write("winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' \r\n");
      out.write("win = window.open(mypage, myname, winprops) \r\n");
      out.write("if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } \r\n");
      out.write("} \r\n");
      out.write("//--> \r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body topmargin=\"10\" marginheight=\"10\">\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"real_rule_reg_ok.jsp\" >\r\n");
      out.write("<input type=\"hidden\" id=\"menuSeq\" name=\"menuSeq\" value=\"");
      out.print( menuSeq);
      out.write("\" />\r\n");
      out.write("<input type=\"hidden\" id=\"glSeq\" name=\"glSeq\" value=\"");
      out.print( glSeq);
      out.write("\" />\r\n");
      out.write("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td class=title>");
      out.print( pageTitle );
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td>&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><table border=\"0\" width=\"900\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td bgcolor=\"#E6E7E8\" align=\"right\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>위약처리규정 1</span></td>\r\n");
      out.write("          <td width=\"712\" bgcolor=\"white\" style=\"padding-left:10px;\"><table width=\"100%\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"silver\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td bgcolor=\"#FCF9EB\" align=middle width=\"50%\"><b>구분</b></td>\r\n");
      out.write("                <td bgcolor=#fcf9eb align=middle  할인요금 width=\"50%\"><b>위약처리규정</b></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\">\r\n");
      out.write("              \t<input class=\"input_box\" size=\"55\" id=\"promise1_type\" name=\"promise1_type\" value=\"");
      out.print( glpList.getPromise1_type());
      out.write("\">\r\n");
      out.write("              </td>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\">\r\n");
      out.write("              \t<input class=\"input_box\" size=\"55\" id=\"promise1\" name=\"promise1\" value=\"");
      out.print( glpList.getPromise1());
      out.write("\">\r\n");
      out.write("              </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>위약처리규정 2</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><table width=\"100%\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"silver\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td bgcolor=\"#FCF9EB\" align=middle width=\"50%\"><b>구분</b></td>\r\n");
      out.write("                <td bgcolor=#fcf9eb align=middle  할인요금 width=\"50%\"><b>위약처리규정</b></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\" width=\"50%\">\r\n");
      out.write("              <input class=\"input_box\" size=\"55\" name=\"promise2_type\" value=\"");
      out.print( glpList.getPromise2_type());
      out.write("\">\r\n");
      out.write("                </td>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\" width=\"50%\">\r\n");
      out.write("                  <input class=\"input_box\" size=\"55\" name=\"promise2\" value=\"");
      out.print( glpList.getPromise2());
      out.write("\">\r\n");
      out.write("              </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>위약처리규정 3</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><table width=\"100%\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"silver\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td bgcolor=\"#FCF9EB\" align=middle width=\"50%\"><b>구분</b></td>\r\n");
      out.write("                <td bgcolor=#fcf9eb align=middle  할인요금 width=\"50%\"><b>위약처리규정</b></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\" width=\"50%\">\r\n");
      out.write("              <input class=\"input_box\" size=\"55\" name=\"promise3_type\" value=\"");
      out.print( glpList.getPromise3_type());
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\" width=\"50%\">\r\n");
      out.write("                  <input class=\"input_box\" size=\"55\" name=\"promise3\" value=\"");
      out.print( glpList.getPromise3());
      out.write("\">\r\n");
      out.write("              </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>위약처리규정 4</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><table width=\"100%\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"silver\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td bgcolor=\"#FCF9EB\" align=middle width=\"50%\"><b>구분</b></td>\r\n");
      out.write("                <td bgcolor=#fcf9eb align=middle  할인요금 width=\"50%\"><b>위약처리규정</b></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\" width=\"50%\">\r\n");
      out.write("              <input class=\"input_box\" size=\"55\" name=\"promise4_type\" value=\"");
      out.print( glpList.getPromise4_type());
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\" width=\"50%\">\r\n");
      out.write("                  <input class=\"input_box\" size=\"55\" name=\"promise4\" value=\"");
      out.print( glpList.getPromise4());
      out.write("\">\r\n");
      out.write("              </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>위약처리규정 5</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><table width=\"100%\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"silver\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td bgcolor=\"#FCF9EB\" align=middle width=\"50%\"><b>구분</b></td>\r\n");
      out.write("                <td bgcolor=#fcf9eb align=middle  할인요금 width=\"50%\"><b>위약처리규정</b></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("              \r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\" width=\"50%\">\r\n");
      out.write("              <input class=\"input_box\" size=\"55\" name=\"promise5_type\" value=\"");
      out.print( glpList.getPromise5_type());
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("              <td align=\"center\" bgcolor=\"white\" width=\"50%\">\r\n");
      out.write("                  <input class=\"input_box\" size=\"55\" name=\"promise5\" value=\"");
      out.print( glpList.getPromise5());
      out.write("\">\r\n");
      out.write("              </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td>&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><table border=\"0\" width=\"899\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>취소규정</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\" width=\"710\">\r\n");
      out.write("              <textarea class=\"box03\" rows=\"8\" cols=\"113\" id=\"cancelrule\" name=\"cancelrule\">");
      out.print( glpList.getCancelrule() );
      out.write("</textarea>\r\n");
      out.write("            </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\" style=\"padding-top:20px;padding-bottom:20px;\"><img align=\"absmiddle\" src=\"../images/inc/btn_regist2.gif\" width=\"74\" height=\"26\" border=\"0\" onclick=\"frm.submit();\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</FORM>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
