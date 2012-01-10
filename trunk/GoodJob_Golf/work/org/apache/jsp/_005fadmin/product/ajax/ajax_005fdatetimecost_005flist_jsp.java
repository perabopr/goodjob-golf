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
import com.goodjob.product.dto.ProductSubDto;
import com.goodjob.product.productDao;

public final class ajax_005fdatetimecost_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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

 
String menuseq = request.getParameter("mnseq");
String golflinkseq = request.getParameter("glseq");
String pDate = StringUtils.trimToEmpty(request.getParameter("date"));
String[] arrDate = pDate.split("/");
String pYear = arrDate[0];
String pMonth = arrDate[1];
String pDay = arrDate[2];

ProductDto pdDto = new ProductDto();
pdDto.setMenu_seq(Integer.parseInt(menuseq));
pdDto.setGolflink_seq(Integer.parseInt(golflinkseq));
pdDto.setProduct_year(pYear);
pdDto.setProduct_month(pMonth);
pdDto.setProduct_day(pDay);

productDao pDao = new productDao();
List<ProductSubDto> arrPrdtSub = pDao.getProductSubSelect(pdDto);

String returnJson = "{\"ProductSub\":[";

for(int i = 0; i < arrPrdtSub.size();i++){
	returnJson += "{";
	returnJson += "\"a\":\"" + arrPrdtSub.get(i).getProductsub_seq() + "\",";
	returnJson += "\"b\":\"" + arrPrdtSub.get(i).getProduct_seq() + "\",";
	returnJson += "\"c\":\"" + arrPrdtSub.get(i).getGolflink_course_seq() + "\",";
	returnJson += "\"d\":\"" + arrPrdtSub.get(i).getTime_start() + "\",";
	returnJson += "\"e\":\"" + arrPrdtSub.get(i).getTime_end() + "\",";
	returnJson += "\"f\":\"" + arrPrdtSub.get(i).getGoodjob_price() + "\",";
	returnJson += "\"g\":\"" + arrPrdtSub.get(i).getNH_price() + "\",";
	returnJson += "\"h\":\"" + arrPrdtSub.get(i).getProduct_status() + "\"";
	returnJson += "},";
}
if(arrPrdtSub.size() > 0){
	returnJson = returnJson.substring(0, returnJson.length()-1);
}
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
