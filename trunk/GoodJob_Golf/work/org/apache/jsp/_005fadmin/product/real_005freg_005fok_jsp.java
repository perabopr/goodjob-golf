package org.apache.jsp._005fadmin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.dto.RegionDto;
import com.goodjob.product.*;
import com.goodjob.product.dto.*;
import com.goodjob.db.*;
import com.goodjob.common.*;
import com.goodjob.conf.Config;

public final class real_005freg_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=EUC-KR\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

	request.setCharacterEncoding("UTF-8");

	String up_dir = Config.get("reserve_dir");
	
	FileUpload fileUpload = new FileUpload(request, up_dir, 1024*1024*5);

	//Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();
	
	String upfile0 = "";//(String)fileMap.get("img0");
	String upfile1 = fileUpload.getParameter("txtimg1");
	String upfile2 = fileUpload.getParameter("txtimg2");
	String upfile3 = fileUpload.getParameter("txtimg3");
	String upfile4 = fileUpload.getParameter("txtimg4");
	
	if(fileMap.get("img1") != null){
		upfile1 = (String)fileMap.get("img1");
	}
	if(fileMap.get("img2") != null){
		upfile2 = (String)fileMap.get("img2");
	}
	if(fileMap.get("img3") != null){
		upfile3 = (String)fileMap.get("img3");
	}
	if(fileMap.get("img4") != null){
		upfile4 = (String)fileMap.get("img4");
	}
	
	GolfLinkDto glDto = new GolfLinkDto();
	glDto.setMenu_seq(Integer.parseInt(fileUpload.getParameter("menuSeq")));
	if(fileUpload.getParameter("glSeq").length() > 0){
		glDto.setGolflink_seq(Integer.parseInt(fileUpload.getParameter("glSeq")));
	}
	glDto.setGolflink_name((String)fileUpload.getParameter("golflinkName"));
	glDto.setRegion_seq(Integer.parseInt(fileUpload.getParameter("regionSeq")));
	glDto.setHoll_type((String)fileUpload.getParameter("hollType"));
	glDto.setCourse_guide((String)fileUpload.getParameter("courseGuide"));
	glDto.setGolflink_address1((String)fileUpload.getParameter("address1"));
	glDto.setGolflink_address2((String)fileUpload.getParameter("address2"));
	glDto.setPoint_x(fileUpload.getParameter("pointx"));
	glDto.setPoint_y(fileUpload.getParameter("pointy"));
	glDto.setImg_main(upfile0);
	glDto.setImg_sub1(upfile1);
	glDto.setImg_sub2(upfile2);
	glDto.setImg_sub3(upfile3);
	glDto.setImg_sub4(upfile4);
	glDto.setCancel_term(fileUpload.getParameter("cancelterm"));
	
	glDto.setView_yn(fileUpload.getParameter("rdbView"));
	glDto.setCancel_rule(fileUpload.getParameter("content1"));
	glDto.setPromise_rule(fileUpload.getParameter("content2"));
	glDto.setUse_guide(fileUpload.getParameter("content3"));
	glDto.setGolflink_guide(fileUpload.getParameter("content4"));
	glDto.setUse_rule(fileUpload.getParameter("content5"));
	
	GolfLinkDao glDao = new GolfLinkDao();	
	int idSeq = 0;
	
	if(fileUpload.getParameter("glSeq").length() > 0){
		idSeq = glDto.getGolflink_seq();
		glDao.setGolfLinkUpdate(glDto);
		glDao.setGolfLinkPriceDelete(idSeq);
	}else{
		idSeq = glDao.setGolfLinkInsert(glDto);
	}
		
	for(int i = 1; i <= 2;i++){
		if(fileUpload.getParameter("priceN" + Integer.toString(i)).length() > 0){
			GolfLinkPriceDto glpDto1 = new GolfLinkPriceDto();
			glpDto1.setGolflink_seq(idSeq);
			glpDto1.setPrice_type(Integer.toString(i));
			glpDto1.setGolflink_price(Integer.parseInt(fileUpload.getParameter("priceN" + Integer.toString(i))));
			glDao.setGolfLinkPriceInsert(glpDto1);
		}
	}
	for(int i = 1; i <= 2;i++){
		if(fileUpload.getParameter("priceS" + Integer.toString(i)).length() > 0){
			GolfLinkPriceDto glpDto2 = new GolfLinkPriceDto();
			glpDto2.setGolflink_seq(idSeq);
			glpDto2.setPrice_type(Integer.toString(i+2));
			glpDto2.setGolflink_price(Integer.parseInt(fileUpload.getParameter("priceS" + Integer.toString(i))));
			glDao.setGolfLinkPriceInsert(glpDto2);
		}
	}
	
	try{
		response.sendRedirect("./real_list.jsp?menu=" + fileUpload.getParameter("menuSeq"));
	}catch(Exception e){}

      out.write("\r\n");
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
