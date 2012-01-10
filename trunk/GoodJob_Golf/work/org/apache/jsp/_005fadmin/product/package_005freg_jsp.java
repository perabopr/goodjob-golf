package org.apache.jsp._005fadmin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.goodjob.conf.Config;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.*;
import com.goodjob.db.*;
import com.goodjob.product.dto.RegionDto;
import com.goodjob.product.dto.PackageDto;
import com.goodjob.product.dto.PackagePriceDto;

public final class package_005freg_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");

int pkSeq = NumberUtils.toInt(request.getParameter("pkSeq"), 0);

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("1");

List<PackageDto> arrList = null;
PackageDto vPk = new PackageDto();
List<PackagePriceDto> arrList2 = null;
PackagePriceDto vPkp = new PackagePriceDto();
PackageDao pkDao = new PackageDao();
if(pkSeq > 0){
	arrList = pkDao.getPackageSelect(0, pkSeq);
	if(arrList != null && arrList.size() == 1){
		vPk = arrList.get(0);
	}
	arrList2 = pkDao.getPackagePriceSelect(pkSeq);
	if(arrList2 != null && arrList2.size() == 1){
		vPkp = arrList2.get(0);
	}
}

String up_dir = Config.get("reserve_dir");

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../style.css\">\r\n");
      out.write("<title></title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/jquery-1.6.2.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/highgardenEditor.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\"> \r\n");
      out.write("<!-- \r\n");
      out.write("function NewWindow(mypage, myname, w, h, scroll) { \r\n");
      out.write("var winl = (screen.width - w) / 2; \r\n");
      out.write("var wint = (screen.height - h) / 2; \r\n");
      out.write("winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable' \r\n");
      out.write("win = window.open(mypage, myname, winprops) \r\n");
      out.write("if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } \r\n");
      out.write("} \r\n");
      out.write("\r\n");
      out.write("function frmSubmit(){\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("//--> \r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body topmargin=\"10\" marginheight=\"10\">\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"package_reg_ok.jsp\"  enctype=\"multipart/form-data\">\r\n");
      out.write("<input type=\"hidden\" id=\"pkSeq\" name=\"pkSeq\" value=\"");
      out.print( pkSeq);
      out.write("\" />\r\n");
      out.write("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td class=title>★ 국내패키지 등록 ★</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><table border=\"0\" width=\"900\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td bgcolor=\"#E6E7E8\" align=\"right\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>골프패키지명1</span></td>\r\n");
      out.write("          <td width=\"712\" bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"60\" id=\"package_name1\" name=\"package_name1\" value=\"");
      out.print( vPk.getPackage_name1() );
      out.write("\">\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>골프패키지명2</span></td>\r\n");
      out.write("            <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("\t\t\t\t<input class=\"input_box\" size=\"60\"  id=\"package_name2\" name=\"package_name2\" value=\"");
      out.print( vPk.getPackage_name2() );
      out.write("\">\r\n");
      out.write("            </td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>지역선택</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><select name=\"regionseq\" size=\"1\">\r\n");
      out.write("              <option>선택하세요</option>\r\n");
 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
			if(vPk.getRegion_seq() == arrRegions.get(i).getRegion_seq()){

      out.write("\r\n");
      out.write("\t        <option value=\"");
      out.print(arrRegions.get(i).getRegion_seq() );
      out.write("\" selected>");
      out.print(arrRegions.get(i).getRegion_name() );
      out.write("</option>\r\n");

			}else{

      out.write("\r\n");
      out.write("\t        <option value=\"");
      out.print(arrRegions.get(i).getRegion_seq() );
      out.write('"');
      out.write('>');
      out.print(arrRegions.get(i).getRegion_name() );
      out.write("</option>\r\n");

			}
		}
	}

      out.write("\r\n");
      out.write("            </select></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>목록이미지</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg0\" name=\"txtimg0\" value=\"");
      out.print( vPk.getImg_sub() );
      out.write("\">\r\n");
      out.write("          <input class=\"upload\" name=\"img0\" type=\"file\" size=\"55\">(313x110)</br>\r\n");
      out.write("          ");
      out.print( vPk.getImg_sub4().length() > 0 ? up_dir + "/" + vPk.getImg_sub() : "" );
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이미지업로드1</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg1\" name=\"txtimg1\" value=\"");
      out.print( vPk.getImg_sub1() );
      out.write("\">\r\n");
      out.write("          <input class=\"upload\" name=\"img1\" type=\"file\" size=\"55\">(270x202) </br> \r\n");
      out.write("          ");
      out.print( vPk.getImg_sub1().length() > 0 ? up_dir + "/" + vPk.getImg_sub1() : "" );
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이미지업로드2</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg2\" name=\"txtimg2\" value=\"");
      out.print( vPk.getImg_sub2() );
      out.write("\">\r\n");
      out.write("          <input class=\"upload\" name=\"img2\" type=\"file\" size=\"55\">(270x202)</br>\r\n");
      out.write("          ");
      out.print( vPk.getImg_sub2().length() > 0 ? up_dir + "/" + vPk.getImg_sub2() : "" );
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이미지업로드3</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg3\" name=\"txtimg3\" value=\"");
      out.print( vPk.getImg_sub3() );
      out.write("\">\r\n");
      out.write("          <input class=\"upload\" name=\"img3\" type=\"file\" size=\"55\">(270x202)</br>\r\n");
      out.write("          ");
      out.print( vPk.getImg_sub3().length() > 0 ? up_dir + "/" + vPk.getImg_sub3() : "" );
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이미지업로드4</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg4\" name=\"txtimg4\" value=\"");
      out.print( vPk.getImg_sub4() );
      out.write("\">\r\n");
      out.write("          <input class=\"upload\" name=\"img4\" type=\"file\" size=\"55\">(270x202)</br>\r\n");
      out.write("          ");
      out.print( vPk.getImg_sub4().length() > 0 ? up_dir + "/" + vPk.getImg_sub4() : "" );
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>주소</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><table border=\"0\" width=\"80%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" width=\"572\"><input class=\"input_box\" size=\"80\" id=\"address1\" name=\"address1\" value=\"");
      out.print( vPk.getAddress1());
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" height=\"2\" width=\"572\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" width=\"495\"><input class=\"input_box\" size=\"80\" id=\"address2\" name=\"address2\" value=\"");
      out.print( vPk.getAddress2());
      out.write("\"></td>                \r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" width=\"572\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" height=\"25\"><span class=list_title>노출여부</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          ");

          	if(vPk.getView_yn().startsWith("Y")){
          
      out.write("\r\n");
      out.write("          \t노출함\r\n");
      out.write("            <input type=\"radio\" id=\"viewY\" name=\"rdbView\" value=\"Y\" checked>\r\n");
      out.write("            &nbsp;&nbsp;노출안함\r\n");
      out.write("            <input type=\"radio\" id=\"viewN\" name=\"rdbView\" value=\"N\">\r\n");
      out.write("          ");

          	}else{
          
      out.write("\r\n");
      out.write("          \t노출함\r\n");
      out.write("            <input type=\"radio\" id=\"viewY\" name=\"rdbView\" value=\"Y\">\r\n");
      out.write("            &nbsp;&nbsp;노출안함\r\n");
      out.write("            <input type=\"radio\" id=\"viewN\" name=\"rdbView\" checked value=\"N\">\r\n");
      out.write("          ");

          	}
          
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td><p>&nbsp;</p></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><table border=\"0\" width=\"900\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" width=\"162\"><p><span class=list_title>가격입력</span></p></td>\r\n");
      out.write("          <td height=\"18\" bgcolor=\"white\" style=\"padding-left:10px;\" width=\"711\"><table width=\"100%\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"silver\" height=\"102\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#FCF9EB\" rowspan=\"2\" width=\"81\">&nbsp;</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\" colspan=\"3\" width=\"305\"><p>성수기</p></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\" colspan=\"3\" width=\"309\"><p>비성수기</p></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#F1F1F1\" width=\"55\">요일</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#F1F1F1\" width=\"118\">정상가</td>\r\n");
      out.write("                <td width=\"122\" align=\"center\" bgcolor=\"#F1F1F1\">할인가</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#F1F1F1\" width=\"57\">요일</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#F1F1F1\" width=\"115\">정상가</td>\r\n");
      out.write("                <td width=\"127\" align=\"center\" bgcolor=\"#F1F1F1\">할인가</td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#FCF9EB\" width=\"81\" rowspan=\"5\">주중</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">월</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_pn_mon\" value=\"");
      out.print( vPkp.getPeak_n_mon() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_ps_mon\" value=\"");
      out.print( vPkp.getPeak_s_mon() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">월</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_on_mon\" value=\"");
      out.print( vPkp.getOff_n_mon() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_os_mon\" value=\"");
      out.print( vPkp.getOff_s_mon() );
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">화</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_pn_tue\" value=\"");
      out.print( vPkp.getPeak_n_tue() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_ps_tue\" value=\"");
      out.print( vPkp.getPeak_s_tue() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">화</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_on_tue\" value=\"");
      out.print( vPkp.getOff_n_tue() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_os_tue\" value=\"");
      out.print( vPkp.getOff_s_tue() );
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">수</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_pn_wed\" value=\"");
      out.print( vPkp.getPeak_n_wed() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_ps_wed\" value=\"");
      out.print( vPkp.getPeak_s_wed() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">수</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_on_wed\" value=\"");
      out.print( vPkp.getOff_n_wed() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_os_wed\" value=\"");
      out.print( vPkp.getOff_s_wed() );
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">목</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_pn_thu\" value=\"");
      out.print( vPkp.getPeak_n_thu() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_ps_thu\" value=\"");
      out.print( vPkp.getPeak_s_thu() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">목</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_on_thu\" value=\"");
      out.print( vPkp.getOff_n_thu() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_os_thu\" value=\"");
      out.print( vPkp.getOff_s_thu() );
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">금</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_pn_fri\" value=\"");
      out.print( vPkp.getPeak_n_fri() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_ps_fri\" value=\"");
      out.print( vPkp.getPeak_s_fri() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">금</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_on_fri\" value=\"");
      out.print( vPkp.getOff_n_fri() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_os_fri\" value=\"");
      out.print( vPkp.getOff_s_fri() );
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#FCF9EB\" width=\"81\" rowspan=\"2\">주말</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">토</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_pn_sat\" value=\"");
      out.print( vPkp.getPeak_n_sat() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_ps_sat\" value=\"");
      out.print( vPkp.getPeak_s_sat() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">토</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_on_sat\" value=\"");
      out.print( vPkp.getOff_n_sat() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_os_sat\" value=\"");
      out.print( vPkp.getOff_s_sat() );
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">일</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_pn_sun\" value=\"");
      out.print( vPkp.getPeak_n_sun() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_ps_sun\" value=\"");
      out.print( vPkp.getPeak_s_sun() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\">일</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_on_sun\" value=\"");
      out.print( vPkp.getOff_n_sun() );
      out.write("\"></td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"12\" name=\"price_os_sun\" value=\"");
      out.print( vPkp.getOff_s_sun() );
      out.write("\"></td>\r\n");
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
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>상품안내</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\" width=\"710\">\r\n");
      out.write("          \t<textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content1\" name=\"content1\" title=\"higheditor_simple\">");
      out.print( vPk.getPackage_guide() );
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"162\" align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이용안내</span></td>\r\n");
      out.write("          <td width=\"710\" bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          \t<textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content2\" name=\"content2\" title=\"higheditor_simple\">");
      out.print( vPk.getUse_guide() );
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>골프장소개</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          \t<textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content3\" name=\"content3\" title=\"higheditor_simple\">");
      out.print( vPk.getGolflink_guide() );
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이용약관</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          \t<textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content4\" name=\"content4\" title=\"higheditor_simple\">");
      out.print( vPk.getUse_rule() );
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>오시는길</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("              <textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content5\" name=\"content5\" title=\"higheditor_simple\">");
      out.print( vPk.getWay_map() );
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\" style=\"padding-top:20px;padding-bottom:20px;\"><img align=\"absmiddle\" src=\"../images/inc/btn_regist2.gif\" width=\"74\" height=\"26\" border=\"0\" onclick=\"frmSubmit();\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</FORM>\r\n");
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
