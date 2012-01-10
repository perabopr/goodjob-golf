package org.apache.jsp._005fadmin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.dto.RegionDto;
import com.goodjob.product.dto.GolfLinkDto;
import com.goodjob.product.dto.GolfLinkCourseDto;
import com.goodjob.product.*;
import com.goodjob.db.*;

public final class real_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

String menuSeq = StringUtils.trimToEmpty(request.getParameter("menu"));
int regionseq = NumberUtils.toInt(request.getParameter("region"),0);

	RegionDao regionDao = new RegionDao();
	List<RegionDto> arrRegions = regionDao.getRegionList("1");
	String mainTitle = "";
	String pageName = "";

	if(menuSeq.startsWith("1")){
		mainTitle = "★ 실시간 골프장목록 ★";
		pageName = "실시간";
	}else{
		mainTitle = "★ 사전 골프장목록 ★";
		pageName = "사전";
	}
	
	GolfLinkDao dld = new GolfLinkDao();
	List<GolfLinkDto> arrGolfLink = null;
	arrGolfLink = dld.getGolfLinkList(Integer.parseInt(menuSeq), regionseq);

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../style.css\">\r\n");
      out.write("<title></title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/jquery-1.6.2.min.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\"> \r\n");
      out.write("<!-- \r\n");
      out.write("function NewWindow(mypage, myname, w, h, scroll) { \r\n");
      out.write("var winl = (screen.width - w) / 2; \r\n");
      out.write("var wint = (screen.height - h) / 2; \r\n");
      out.write("winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' \r\n");
      out.write("win = window.open(mypage, myname, winprops) \r\n");
      out.write("if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function searchRegion(){\r\n");
      out.write("\tlocation.href = \"/_admin/product/real_list.jsp?menu=1&region=\" + $(\"#ddl_region\").val();\r\n");
      out.write("} \r\n");
      out.write("//--> \r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body topmargin=\"10\" marginheight=\"10\">\r\n");
      out.write("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td class=title>");
      out.print( mainTitle);
      out.write("</td>\r\n");
      out.write("    <td align=\"right\" style=\"padding-right:30px;\"><select id=\"ddl_region\" name=\"ddl_region\" size=\"1\">\r\n");
      out.write("        <option value=\"0\">전체지역보기</option>\r\n");
 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){

      out.write("\r\n");
      out.write("        <option value=\"");
      out.print(arrRegions.get(i).getRegion_seq() );
      out.write('"');
      out.write(' ');
      out.print( regionseq == arrRegions.get(i).getRegion_seq()? "SELECTED":"" );
      out.write('>');
      out.print(arrRegions.get(i).getRegion_name() );
      out.write("</option>\r\n");

		}
	}

      out.write("\r\n");
      out.write("      </select> <img align=\"absmiddle\" src=\"../images/inc/btn_search2.gif\" width=\"45\" height=\"22\" border=\"0\" onclick=\"searchRegion();return false;\" style=\"cursor:pointer\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\" colspan=\"2\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\" colspan=\"2\">\r\n");
      out.write("    <table border=\"0\" cellpadding=\"2\" cellspacing=\"1\" width=\"100%\" bgcolor=\"silver\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t    <td bgcolor=\"#e6e7e8\" align=\"center\" height=\"25\" width=\"176\"><span class=list_title>지역</span></td>\r\n");
      out.write("\t    <td bgcolor=\"#e6e7e8\" align=\"center\" width=\"236\"><span class=list_title>골프장명</span></td>\r\n");
      out.write("\t    <td bgcolor=\"#e6e7e8\" align=\"center\" width=\"293\"><span class=list_title>주소</span></td>\r\n");
      out.write("\t    <td bgcolor=\"#e6e7e8\" align=\"center\" width=\"159\"><span class=list_title>운영방식</span></td>\r\n");
      out.write("\t");

		if(menuSeq.equals("1")){
	
      out.write("\r\n");
      out.write("\t    <td width=\"249\" align=\"center\" bgcolor=\"#E6E7E8\"><span class=list_title>코스입력</span></td>\r\n");
      out.write("\t");

		}
	
      out.write("\r\n");
      out.write("\t    <td width=\"233\" align=\"center\" bgcolor=\"#E6E7E8\"><span class=list_title>시간 및 가격입력</span></td>\r\n");
      out.write("\t    <td align=\"center\" bgcolor=\"#E6E7E8\" width=\"248\"><span class=list_title>위약처리규정입력 및 수정</span></td>\r\n");
      out.write("\t    <td align=\"center\" bgcolor=\"#E6E7E8\" width=\"216\"><span class=list_title>골프장 정보</span></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");
 
	if(arrGolfLink.size() > 0){
		for(int i = 0; i < arrGolfLink.size();i++){
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t    <td bgcolor=\"white\" align=\"center\" bgcolor=\"white\">");
      out.print( arrGolfLink.get(i).getRegion_name());
      out.write("</td>\r\n");
      out.write("\t\t<td align=\"center\" bgcolor=\"white\"><span class=list_subject>");
      out.print( arrGolfLink.get(i).getGolflink_name());
      out.write("</span></td>\r\n");
      out.write("\t\t<td align=\"center\" bgcolor=\"white\">");
      out.print( arrGolfLink.get(i).getGolflink_address1());
      out.write("</td>\r\n");
      out.write("\t\t<td align=\"center\" bgcolor=\"white\">");
      out.print( pageName );
      out.write("</td>\r\n");
      out.write("\t");

	if(menuSeq.equals("1")){
	
      out.write("\r\n");
      out.write("        <td align=\"center\" bgcolor=\"white\">\r\n");
      out.write("        \t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\">\r\n");
      out.write("            <tr>\r\n");
      out.write("            \t<td width=\"50%\" align=\"center\"><a href=\"/_admin/product/popup/pop_course.jsp?glseq=");
      out.print(arrGolfLink.get(i).getGolflink_seq());
      out.write("\" onClick=\"NewWindow(this.href,'name','415','400','yes');return false;\"><img src=\"../images/inc/btn_input.gif\" width=\"74\" height=\"26\" border=\"0\"></a></td>\r\n");
      out.write("                <td width=\"50%\" align=\"center\">코스없음<input type=\"checkbox\" name=\"formcheckbox1\"></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </td>\r\n");
      out.write("\t");

		}
	
      out.write("\r\n");
      out.write("        <td align=\"center\" bgcolor=\"white\"><a href=\"/_admin/product/popup/pop_real_time_reg.jsp?menuseq=");
      out.print(arrGolfLink.get(i).getMenu_seq() );
      out.write("&glseq=");
      out.print(arrGolfLink.get(i).getGolflink_seq());
      out.write("\" onClick=\"NewWindow(this.href,'name','820','520','yes');return false;\"><img src=\"../images/inc/btn_input.gif\" width=\"74\" height=\"26\" border=\"0\"></a></td>\r\n");
      out.write("        <td align=\"center\" bgcolor=\"white\"><a href=\"real_rule_reg.jsp?menu=");
      out.print(arrGolfLink.get(i).getMenu_seq() );
      out.write("&glseq=");
      out.print(arrGolfLink.get(i).getGolflink_seq());
      out.write("\"><img src=\"../images/inc/btn_input.gif\" width=\"74\" height=\"26\" border=\"0\"></a></td>\r\n");
      out.write("        <td align=\"center\" bgcolor=\"white\"><a href=\"real_reg.jsp?menu=");
      out.print(arrGolfLink.get(i).getMenu_seq() );
      out.write("&glseq=");
      out.print(arrGolfLink.get(i).getGolflink_seq());
      out.write("\"><img src=\"../images/inc/btn_edit2.gif\" width=\"74\" height=\"26\" border=\"0\"></a></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    ");

		}
   	}
    
      out.write("\r\n");
      out.write("    </table>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td colspan=\"2\" align=\"center\" height=\"100\"><a href=\"real_reg.jsp?menu=");
      out.print(menuSeq);
      out.write("\"><img align=\"absmiddle\" src=\"../images/inc/btn_regist2.gif\" width=\"74\" height=\"26\" border=\"0\"></a></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
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
