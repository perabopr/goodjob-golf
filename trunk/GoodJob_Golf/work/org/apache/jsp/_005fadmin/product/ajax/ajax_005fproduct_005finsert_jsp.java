package org.apache.jsp._005fadmin.product.ajax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.dto.ProductDto;
import com.goodjob.product.productDao;

public final class ajax_005fproduct_005finsert_jsp extends org.apache.jasper.runtime.HttpJspBase
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

String menuseq = request.getParameter("mnseq");
String golflinkseq = request.getParameter("glseq");
String pDate = StringUtils.trimToEmpty(request.getParameter("date"));
String[] arrDate = pDate.split("/");
String pYear = arrDate[0];
String pMonth = arrDate[1];
String pDay = arrDate[2];


ProductDto prdtDto = new ProductDto();
prdtDto.setMenu_seq(Integer.parseInt(menuseq));
prdtDto.setGolflink_seq(Integer.parseInt(golflinkseq));
prdtDto.setProduct_year(pYear);
prdtDto.setProduct_month(pMonth);
prdtDto.setProduct_day(pDay);
prdtDto.setView_yn("N");
productDao prdtDao = new productDao();

int idSeq = 0;
List<ProductDto> list = prdtDao.getProductSelectDate(prdtDto);
if(list.size() == 0){
	idSeq = prdtDao.setProductInsert(prdtDto);
}

String returnJson = "{\"Product\":[";
returnJson += "{";
returnJson += "\"a\":\"" + idSeq + "\",";
returnJson += "\"b\":\"" + pYear + pMonth + pDay + "\"";
returnJson += "}";
returnJson += "]}";
out.println(returnJson);
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
