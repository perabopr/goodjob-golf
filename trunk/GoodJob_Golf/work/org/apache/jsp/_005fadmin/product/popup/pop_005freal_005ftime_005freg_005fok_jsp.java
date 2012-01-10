package org.apache.jsp._005fadmin.product.popup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.dto.ProductSubDto;
import com.goodjob.product.productDao;

public final class pop_005freal_005ftime_005freg_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
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

String menuSeq = request.getParameter("menuseq");
String prdtSeq = request.getParameter("prdtseq");
String glSeq = request.getParameter("glseq");
String backYear = request.getParameter("cpYear");
String backMonth = request.getParameter("cpMonth");
if(request.getParameterValues("pdsubseq") != null && request.getParameterValues("course_list") != null
		&& request.getParameterValues("course_hour") != null && request.getParameterValues("course_minute") != null
		&& request.getParameterValues("courseN") != null && request.getParameterValues("courseS") != null
		&& request.getParameterValues("prdtStatus") != null){
	String arrPrdtSubSeq[] = request.getParameterValues("pdsubseq");
	String arrCourse[] = request.getParameterValues("course_list");
	String arrHour[] = request.getParameterValues("course_hour");
	String arrMin[] = request.getParameterValues("course_minute");	
	String arrNorPrice[] = request.getParameterValues("courseN");
	String arrSalePrice[] = request.getParameterValues("courseS");
	String arrPrdtStatus[] = request.getParameterValues("prdtStatus");
	
	productDao pd = new productDao();
	String pdsubseqs = "'";
	for(int i = 0; i < arrPrdtSubSeq.length;i++){
		if(arrPrdtSubSeq[i].length() > 0){
			pdsubseqs += arrPrdtSubSeq[i] +"','";	
		}
	}
	if(pdsubseqs.length() > 3){
		pdsubseqs = pdsubseqs.substring(0, pdsubseqs.length()-3);
	}
	pdsubseqs += "'";
	
	ProductSubDto pdsd = new ProductSubDto();
	pdsd.setProduct_seq(Integer.parseInt(prdtSeq));
	pdsd.setProductsub_seqs(pdsubseqs);
	pd.setProductSubDelete(pdsd);

	for(int i = 0; i < arrPrdtSubSeq.length;i++){
		if(arrNorPrice[i].trim().length() == 0){
			continue;
		}
		ProductSubDto pdsd2 = new ProductSubDto();
		pdsd2.setProduct_seq(Integer.parseInt(prdtSeq));
		pdsd2.setGolflink_course_seq(Integer.parseInt(arrCourse[i]));
		pdsd2.setTime_start(arrHour[i]+arrMin[i]);
		pdsd2.setTime_end("");
		pdsd2.setGoodjob_price(Integer.parseInt(arrNorPrice[i]));
		pdsd2.setNH_price(Integer.parseInt(arrSalePrice[i]));
		pdsd2.setProduct_status(arrPrdtStatus[i]);
		
		if(arrPrdtSubSeq[i].length() > 0 && arrNorPrice[i].trim().length() > 0){//수정
			pdsd2.setProductsub_seq(Integer.parseInt(arrPrdtSubSeq[i]));
			pd.setProductSubUpdate(pdsd2);					
		}else if(arrPrdtSubSeq[i].length() == 0 ){//추가
			pd.setProductSubInsert(pdsd2);
		}
		
		//out.println(pdsd2.getProductsub_seq());
		//out.println(pdsd2.getProduct_seq());
		//out.println(pdsd2.getGolflink_course_seq());
		//out.println(pdsd2.getTime_start());
		//out.println(pdsd2.getTime_end());
		//out.println(pdsd2.getGoodjob_price());
		//out.println(pdsd2.getNH_price());
		//out.println(pdsd2.getProduct_status());
		//out.print("<br>");
		
	}
	pd.setProductUpdate(Integer.parseInt(prdtSeq), "Y");
}else{
	
}

out.print("<script type='text/javascript'>");
out.print("alert('등록했습니다.');");
out.print("location.href='pop_real_time_reg.jsp?menuseq=" + menuSeq + "&glseq=" + glSeq + "&month=" + backMonth + "&year=" + backYear + "&action=0'");
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
