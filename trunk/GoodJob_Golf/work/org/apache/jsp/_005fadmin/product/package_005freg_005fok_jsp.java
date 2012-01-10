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
import com.goodjob.common.*;
import com.goodjob.conf.Config;
import com.goodjob.product.PackageDao;
import com.goodjob.product.dto.PackagePriceDto;
import com.goodjob.product.dto.PackageDto;

public final class package_005freg_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
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
	
	String upfile0 = fileUpload.getParameter("txtimg0");
	String upfile1 = fileUpload.getParameter("txtimg1");
	String upfile2 = fileUpload.getParameter("txtimg2");
	String upfile3 = fileUpload.getParameter("txtimg3");
	String upfile4 = fileUpload.getParameter("txtimg4");
	
	if(fileMap.get("img0") != null){
		upfile0 = (String)fileMap.get("img0");
	}
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
	
	PackageDto pkDto = new PackageDto();
	if(fileUpload.getParameter("pkSeq").length() > 0){
		pkDto.setPackage_seq(Integer.parseInt(fileUpload.getParameter("pkSeq")));
	}
	pkDto.setPackage_name1(fileUpload.getParameter("package_name1"));
	pkDto.setPackage_name2(fileUpload.getParameter("package_name2"));
	pkDto.setRegion_seq(Integer.parseInt(fileUpload.getParameter("regionseq")));
	pkDto.setImg_sub(upfile0);
	pkDto.setImg_sub1(upfile1);
	pkDto.setImg_sub2(upfile2);
	pkDto.setImg_sub3(upfile3);
	pkDto.setImg_sub4(upfile4);
	pkDto.setAddress1(fileUpload.getParameter("address1"));
	pkDto.setAddress2(fileUpload.getParameter("address2"));
	pkDto.setPoint_x(fileUpload.getParameter("pointx"));
	pkDto.setPoint_y(fileUpload.getParameter("pointy"));
	pkDto.setView_yn(fileUpload.getParameter("rdbView"));
	pkDto.setPackage_guide(fileUpload.getParameter("content1"));
	pkDto.setUse_guide(fileUpload.getParameter("content2"));
	pkDto.setGolflink_guide(fileUpload.getParameter("content3"));
	pkDto.setUse_rule(fileUpload.getParameter("content4"));
	pkDto.setWay_map(fileUpload.getParameter("content5"));
	
	PackagePriceDto pkpDto = new PackagePriceDto();
	if(fileUpload.getParameter("pkSeq").length() > 0){
		pkpDto.setPackage_seq(Integer.parseInt(fileUpload.getParameter("pkSeq")));
	}
	pkpDto.setPeak_n_mon(Integer.parseInt(fileUpload.getParameter("price_pn_mon")));
	pkpDto.setPeak_s_mon(Integer.parseInt(fileUpload.getParameter("price_ps_mon")));
	pkpDto.setOff_n_mon(Integer.parseInt(fileUpload.getParameter("price_on_mon")));
	pkpDto.setOff_s_mon(Integer.parseInt(fileUpload.getParameter("price_os_mon")));
	pkpDto.setPeak_n_tue(Integer.parseInt(fileUpload.getParameter("price_pn_tue")));
	pkpDto.setPeak_s_tue(Integer.parseInt(fileUpload.getParameter("price_ps_tue")));
	pkpDto.setOff_n_tue(Integer.parseInt(fileUpload.getParameter("price_on_tue")));
	pkpDto.setOff_s_tue(Integer.parseInt(fileUpload.getParameter("price_os_tue")));
	pkpDto.setPeak_n_wed(Integer.parseInt(fileUpload.getParameter("price_pn_wed")));
	pkpDto.setPeak_s_wed(Integer.parseInt(fileUpload.getParameter("price_ps_wed")));
	pkpDto.setOff_n_wed(Integer.parseInt(fileUpload.getParameter("price_on_wed")));
	pkpDto.setOff_s_wed(Integer.parseInt(fileUpload.getParameter("price_os_wed")));
	pkpDto.setPeak_n_thu(Integer.parseInt(fileUpload.getParameter("price_pn_thu")));
	pkpDto.setPeak_s_thu(Integer.parseInt(fileUpload.getParameter("price_ps_thu")));
	pkpDto.setOff_n_thu(Integer.parseInt(fileUpload.getParameter("price_on_thu")));
	pkpDto.setOff_s_thu(Integer.parseInt(fileUpload.getParameter("price_os_thu")));
	pkpDto.setPeak_n_fri(Integer.parseInt(fileUpload.getParameter("price_pn_fri")));
	pkpDto.setPeak_s_fri(Integer.parseInt(fileUpload.getParameter("price_ps_fri")));
	pkpDto.setOff_n_fri(Integer.parseInt(fileUpload.getParameter("price_on_fri")));
	pkpDto.setOff_s_fri(Integer.parseInt(fileUpload.getParameter("price_os_fri")));
	pkpDto.setPeak_n_sat(Integer.parseInt(fileUpload.getParameter("price_pn_sat")));
	pkpDto.setPeak_s_sat(Integer.parseInt(fileUpload.getParameter("price_ps_sat")));
	pkpDto.setOff_n_sat(Integer.parseInt(fileUpload.getParameter("price_on_sat")));
	pkpDto.setOff_s_sat(Integer.parseInt(fileUpload.getParameter("price_os_sat")));
	pkpDto.setPeak_n_sun(Integer.parseInt(fileUpload.getParameter("price_pn_sun")));
	pkpDto.setPeak_s_sun(Integer.parseInt(fileUpload.getParameter("price_ps_sun")));
	pkpDto.setOff_n_sun(Integer.parseInt(fileUpload.getParameter("price_on_sun")));
	pkpDto.setOff_s_sun(Integer.parseInt(fileUpload.getParameter("price_os_sun")));
	
	PackageDao pkDao = new PackageDao();
	if(fileUpload.getParameter("pkSeq").length() > 0){//수정
		pkDao.setPackageUpdate(pkDto);
		pkDao.setPackagePriceDelete(pkpDto);
		pkpDto.setPackage_seq(Integer.parseInt(fileUpload.getParameter("pkSeq")));
		pkDao.setPackagePriceInsert(pkpDto);
	}else{//추가
		pkDao.setPackageInsert(pkDto, pkpDto);
	}
	
	try{
		response.sendRedirect("./package_list.jsp?pkSeq=" + fileUpload.getParameter("pkSeq"));
	}catch(Exception e){}

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
