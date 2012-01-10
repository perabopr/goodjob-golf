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
import com.goodjob.product.*;
import com.goodjob.db.*;
import com.goodjob.product.dto.RegionDto;
import com.goodjob.product.dto.CondoRoomDto;
import com.goodjob.product.dto.CondoGalleryDto;
import com.goodjob.product.dto.CondoDto;

public final class condo_005freg_jsp extends org.apache.jasper.runtime.HttpJspBase
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

int condoSeq = NumberUtils.toInt(request.getParameter("condoSeq"), 0);

RegionDao regionDao = new RegionDao();
List<RegionDto> arrRegions = regionDao.getRegionList("1");

CondoDao cDao = new CondoDao();
List<CondoDto> arrlist = null;
CondoDto vcDto = new CondoDto();
List<CondoGalleryDto> arrlist2 = null;
List<CondoRoomDto> arrlist3 = null;
if(condoSeq > 0){
	arrlist = cDao.getCondoSelect(0, condoSeq);
	if(arrlist.size() == 1){
		vcDto = arrlist.get(0); 
		arrlist2 = cDao.getCondoGallerySelect(vcDto.getCondo_seq());		
		arrlist3 = cDao.getCondoRoomSelect(vcDto.getCondo_seq());
	}
}

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../css/style.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../css/jquery.ui.all.css\">\r\n");
      out.write("<script src=\"../js/jquery-1.6.2.min.js\"></script>\r\n");
      out.write("<script src=\"../js/jquery.ui.core.js\"></script>\r\n");
      out.write("<script src=\"../js/jquery.ui.widget.js\"></script>\r\n");
      out.write("<script src=\"../js/jquery.ui.datepicker.js\"></script>\r\n");
      out.write("<title></title>\r\n");
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
      out.write("function newWindowPop(mypage, myname, w, h, scroll){\r\n");
      out.write("\tmypage = \"/_admin/product/popup/pop_map.jsp\";\r\n");
      out.write("\tvar winl = (screen.width - w) / 2; \r\n");
      out.write("\tvar wint = (screen.height - h) / 2; \r\n");
      out.write("\twinprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable';\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\tmypage += \"?t=1\";\r\n");
      out.write("\tif($(\"#pointx\").val().length > 0){\r\n");
      out.write("\t\tmypage += \"&x=\" + $(\"#pointx\").val();\r\n");
      out.write("\t}\r\n");
      out.write("\tif($(\"#pointy\").val().length > 0){\r\n");
      out.write("\t\tmypage += \"&y=\" + $(\"#pointy\").val();\r\n");
      out.write("\t}  \r\n");
      out.write("\t\r\n");
      out.write("\twin = window.open(mypage, myname, winprops); \r\n");
      out.write("\tif (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("$(function() {\r\n");
      out.write("\t$( \"#saleDateStart\" ).datepicker({dateFormat:'yy-mm-dd'});\r\n");
      out.write("});\r\n");
      out.write("$(function() {\r\n");
      out.write("\t$( \"#saleDateEnd\" ).datepicker({dateFormat:'yy-mm-dd'});\r\n");
      out.write("});\r\n");
      out.write("$(function() {\r\n");
      out.write("\t$( \"#ReserveDateStart\" ).datepicker({dateFormat:'yy-mm-dd'});\r\n");
      out.write("});\r\n");
      out.write("$(function() {\r\n");
      out.write("\t$( \"#ReserveDateEnd\" ).datepicker({dateFormat:'yy-mm-dd'});\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("var galleryCnt = 0;\r\n");
      out.write("function addgallery(){\r\n");
      out.write("\tgalleryCnt++;\r\n");
      out.write("\tvar strgallery = \"<tr id='trgallery\"+galleryCnt+\"'><td><input type='hidden' name='condoimgseq' >\"\r\n");
      out.write("\t\t+ \"<input class='upload' name='imggallery' type='file' size='55'>\"\r\n");
      out.write("\t\t+ \"<img align='absmiddle' src='../images/inc/btn_del.gif' width='13' height='14' border='0' onclick='delgallery(\"+galleryCnt+\")'>\"\r\n");
      out.write("\t\t+ \"</td></tr>\";\r\n");
      out.write("\t$(\"#tbGallery\").append(strgallery);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function delgallery(obje){\r\n");
      out.write("\t$(\"#trgallery\"+obje).remove();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function condoReg(){\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("}\r\n");
      out.write("//--> \r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body topmargin=\"10\" marginheight=\"10\">\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"condo_reg_ok.jsp\"  enctype=\"multipart/form-data\">\r\n");
      out.write("<input type=\"hidden\" id=\"condoSeq\" name=\"condoSeq\" value=\"");
      out.print( condoSeq);
      out.write("\" />\r\n");
      out.write("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td class=title>★ 콘도 등록 ★</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><table border=\"0\" width=\"900\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td bgcolor=\"#E6E7E8\" align=\"right\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>콘도명</span></td>\r\n");
      out.write("          <td width=\"712\" bgcolor=\"white\" style=\"padding-left:10px;\"><input class=\"input_box\" size=\"40\" id=\"condoname\" name=\"condoname\" value=\"");
      out.print( vcDto.getCondo_name() );
      out.write("\"></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>지역선택</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><select name=\"ddl_region\" size=\"1\">\r\n");
      out.write("              <option>선택하세요</option>\r\n");
 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
			if(vcDto.getRegion_seq() == arrRegions.get(i).getRegion_seq()){

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
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>할인기간</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><img align=\"absmiddle\" src=\"../images/common/img_calendar.gif\" width=\"15\" height=\"16\" border=\"0\">\r\n");
      out.write("            <input class=\"input_box\" size=\"13\" id=\"saleDateStart\" name=\"saleDateStart\" readonly value=\"");
      out.print( vcDto.getSaledate_start() );
      out.write("\">\r\n");
      out.write("            ~ <img align=\"absmiddle\" src=\"../images/common/img_calendar.gif\" width=\"15\" height=\"16\" border=\"0\">\r\n");
      out.write("            <input class=\"input_box\" size=\"13\" id=\"saleDateEnd\" name=\"saleDateEnd\" readonly value=\"");
      out.print( vcDto.getSaledate_end() );
      out.write("\"></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>목록이미지</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          \t<input type=\"hidden\" name=\"txtimgmain\" value=\"");
      out.print( vcDto.getImg_main() );
      out.write("\">\r\n");
      out.write("          \t<input class=\"upload\" name=\"imgmain\" type=\"file\" size=\"55\">(313x110) </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>주소</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><table border=\"0\" width=\"80%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" width=\"572\"><input class=\"input_box\" size=\"80\" id=\"address1\" name=\"address1\" value=\"");
      out.print( vcDto.getAddress1());
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" height=\"2\" width=\"572\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td width=\"495\"><input class=\"input_box\" size=\"80\" id=\"address2\" name=\"address2\" value=\"");
      out.print( vcDto.getAddress2());
      out.write("\"></td>\r\n");
      out.write("                <td width=\"77\"><a href=\"zip_code.jsp\" onClick=\"NewWindow(this.href,'name','420','400','yes');return false;\"><img align=\"absmiddle\" src=\"../images/inc/btn_search.gif\" width=\"45\" height=\"22\" border=\"0\"></a></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" height=\"2\" width=\"572\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" width=\"572\"><a href=\"javascript:;\" onClick=\"newWindowPop(this.href,'name','450','500','yes');return false;\"><img align=\"absmiddle\" src=\"../images/inc/btn_search_xy.gif\" width=\"65\" height=\"22\" border=\"0\"></a> &nbsp;&nbsp;X&nbsp;\r\n");
      out.write("                  <input class=\"input_box\" size=\"20\" id=\"pointx\" name=\"pointx\" value=\"");
      out.print( vcDto.getPoint_x());
      out.write("\">\r\n");
      out.write("                  &nbsp;&nbsp;Y&nbsp;\r\n");
      out.write("                  <input class=\"input_box\" size=\"20\" id=\"pointy\" name=\"pointy\" value=\"");
      out.print( vcDto.getPoint_y());
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" height=\"25\"><span class=list_title>노출여부</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          ");

          	if(vcDto.getView_yn().startsWith("Y")){
          
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
      out.write("    <td align=\"center\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"900\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"50%\" height=\"30\"><span class=list_title>가격입력</span></td>\r\n");
      out.write("          <td width=\"50%\" align=\"right\"><!--<img align=\"absmiddle\" src=\"../images/inc/btn_plus.gif\" width=\"32\" height=\"16\" border=\"0\">--></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><table width=\"900\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"silver\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td bgcolor=\"#FCF9EB\" align=middle width=\"340\"><p>\r\n");
      out.write("          <!--<img align=\"absmiddle\" src=\"../images/common/img_calendar.gif\" width=\"15\" height=\"16\" border=\"0\">\r\n");
      out.write("              <input class=\"input_box\" size=\"13\" id=\"ReserveDateStart\" name=\"ReserveDateStart\" readonly value=\"");
      out.print( vcDto.getReserve_start());
      out.write("\">\r\n");
      out.write("              ~ <img align=\"absmiddle\" src=\"../images/common/img_calendar.gif\" width=\"15\" height=\"16\" border=\"0\">\r\n");
      out.write("              <input class=\"input_box\" size=\"13\" id=\"ReserveDateEnd\" name=\"ReserveDateEnd\" readonly value=\"");
      out.print( vcDto.getReserve_end());
      out.write("\">-->\r\n");
      out.write("            </p></td>\r\n");
      out.write("          <td width=\"307\" align=\"center\" bgcolor=\"#FCF9EB\" colspan=\"3\"><b>정상가</b></td>\r\n");
      out.write("          <td bgcolor=#fcf9eb colspan=\"3\" align=middle  할인요금 width=\"271\"><b>할인가</b></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"center\" bgcolor=\"#FCF9EB\" width=\"340\"><b>객실타입 및 평형</b></td>\r\n");
      out.write("          <td width=\"86\" align=\"center\" bgcolor=\"#FCF9EB\">주중</td>\r\n");
      out.write("          <td bgcolor=#fcf9eb align=middle 주중 width=\"95\">주말</td>\r\n");
      out.write("          <td bgcolor=#fcf9eb align=middle 주말 width=\"91\">휴일</td>\r\n");
      out.write("          <td bgcolor=#fcf9eb align=middle 주중 width=\"89\">주중</td>\r\n");
      out.write("          <td align=\"center\" bgcolor=\"#FCF9EB\" width=\"88\">주말</td>\r\n");
      out.write("          <td bgcolor=#fcf9eb align=middle 주말 width=\"84\">휴일</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("\t");
 
		for(int i = 1; i < 5;i++){
			if(arrlist3 != null && arrlist3.size() >= i){
	
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("          <td height=\"11\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input type=\"hidden\" id=\"condoroomseq");
      out.print(i);
      out.write("\" name=\"condoroomseq");
      out.print(i);
      out.write("\" value=\"");
      out.print( arrlist3.get(i-1).getCondoroom_seq());
      out.write("\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"55\" id=\"roomtype");
      out.print(i);
      out.write("\" name=\"roomtype");
      out.print(i);
      out.write("\" value=\"");
      out.print( arrlist3.get(i-1).getRoomtype());
      out.write("\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"11\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price1N");
      out.print(i);
      out.write("\" name=\"price1N");
      out.print(i);
      out.write("\" value=\"");
      out.print( arrlist3.get(i-1).getPrice_n1());
      out.write("\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price2N");
      out.print(i);
      out.write("\" name=\"price2N");
      out.print(i);
      out.write("\" value=\"");
      out.print( arrlist3.get(i-1).getPrice_n2());
      out.write("\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price3N");
      out.print(i);
      out.write("\" name=\"price3N");
      out.print(i);
      out.write("\" value=\"");
      out.print( arrlist3.get(i-1).getPrice_n3());
      out.write("\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price1S");
      out.print(i);
      out.write("\" name=\"price1S");
      out.print(i);
      out.write("\" value=\"");
      out.print( arrlist3.get(i-1).getPrice_s1());
      out.write("\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price2S");
      out.print(i);
      out.write("\" name=\"price2S");
      out.print(i);
      out.write("\" value=\"");
      out.print( arrlist3.get(i-1).getPrice_s2());
      out.write("\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price3S");
      out.print(i);
      out.write("\" name=\"price3S");
      out.print(i);
      out.write("\" value=\"");
      out.print( arrlist3.get(i-1).getPrice_s3());
      out.write("\">\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("\t");

			}else{
	
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("          <td height=\"11\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input type=\"hidden\" id=\"condoroomseq");
      out.print(i);
      out.write("\" name=\"condoroomseq");
      out.print(i);
      out.write("\" value=\"\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"55\" id=\"roomtype");
      out.print(i);
      out.write("\" name=\"roomtype");
      out.print(i);
      out.write("\" value=\"\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"11\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price1N");
      out.print(i);
      out.write("\" name=\"price1N");
      out.print(i);
      out.write("\" value=\"\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price2N");
      out.print(i);
      out.write("\" name=\"price2N");
      out.print(i);
      out.write("\" value=\"\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price3N");
      out.print(i);
      out.write("\" name=\"price3N");
      out.print(i);
      out.write("\" value=\"\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price1S");
      out.print(i);
      out.write("\" name=\"price1S");
      out.print(i);
      out.write("\" value=\"\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price2S");
      out.print(i);
      out.write("\" name=\"price2S");
      out.print(i);
      out.write("\" value=\"\">\r\n");
      out.write("          </td>\r\n");
      out.write("          <td height=\"22\" align=\"center\" bgcolor=\"white\">\r\n");
      out.write("          \t<input class=\"input_box\" size=\"10\" id=\"price3S");
      out.print(i);
      out.write("\" name=\"price3S");
      out.print(i);
      out.write("\" value=\"\">\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("\t");

			}
		} 
	
      out.write("\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td>&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><table border=\"0\" width=\"899\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>콘도안내</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\" width=\"710\"><textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content1\" name=\"content1\" title=\"higheditor_simple\">");
      out.print( vcDto.getCondo_info());
      out.write("</textarea></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>상세정보</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content2\" name=\"content2\" title=\"higheditor_simple\">");
      out.print( vcDto.getDetail_info());
      out.write("</textarea></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>사진갤러리</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("\t\t\t<table border=\"0\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t<!-- \r\n");
      out.write("\t\t\t<td valign=\"top\">\r\n");
      out.write("\t          \t<img align=\"absmiddle\" src=\"../images/inc/btn_plus.gif\" width=\"32\" height=\"16\" border=\"0\" onclick=\"addgallery();\">\r\n");
      out.write("\t        </td>\r\n");
      out.write("\t         -->\r\n");
      out.write("\t        <td>\r\n");
      out.write("\t        \t<table  border=\"0\" id=\"tbGallery\">\r\n");
      out.write("\t        \t<tr id=\"trgallery1\">\r\n");
      out.write("\t        \t<td>\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimgseq1\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(0).getCondoimg_seq());} 
      out.write("\">\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimg1\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(1).getCondo_img());} 
      out.write("\">\r\n");
      out.write("\t\t            <input class=\"upload\" name=\"imggallery1\" type=\"file\" size=\"55\">\r\n");
      out.write("\t\t            <!-- <img align=\"absmiddle\" src=\"../images/inc/btn_del.gif\" width=\"13\" height=\"14\" border=\"0\" onclick=\"delgallery('1');\"> -->\r\n");
      out.write("\t        \t</td>\r\n");
      out.write("\t        \t</tr>\r\n");
      out.write("\t        \t<tr id=\"trgallery2\">\r\n");
      out.write("\t        \t<td>\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimgseq2\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(1).getCondoimg_seq());} 
      out.write("\">\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimg2\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(1).getCondo_img());} 
      out.write("\">\r\n");
      out.write("\t\t            <input class=\"upload\" name=\"imggallery2\" type=\"file\" size=\"55\">\r\n");
      out.write("\t\t            <!-- <img align=\"absmiddle\" src=\"../images/inc/btn_del.gif\" width=\"13\" height=\"14\" border=\"0\" onclick=\"delgallery('2');\"> -->\r\n");
      out.write("\t        \t</td>\r\n");
      out.write("\t        \t</tr>\r\n");
      out.write("\t        \t<tr id=\"trgallery3\">\r\n");
      out.write("\t        \t<td>\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimgseq3\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(2).getCondoimg_seq());} 
      out.write("\">\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimg3\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(2).getCondo_img());} 
      out.write("\">\r\n");
      out.write("\t\t            <input class=\"upload\" name=\"imggallery3\" type=\"file\" size=\"55\">\r\n");
      out.write("\t\t            <!-- <img align=\"absmiddle\" src=\"../images/inc/btn_del.gif\" width=\"13\" height=\"14\" border=\"0\" onclick=\"delgallery('3');\"> -->\r\n");
      out.write("\t        \t</td>\r\n");
      out.write("\t        \t</tr>\r\n");
      out.write("\t        \t<tr id=\"trgallery4\">\r\n");
      out.write("\t        \t<td>\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimgseq4\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(3).getCondoimg_seq());} 
      out.write("\">\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimg4\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(3).getCondo_img());} 
      out.write("\">\r\n");
      out.write("\t\t            <input class=\"upload\" name=\"imggallery4\" type=\"file\" size=\"55\">\r\n");
      out.write("\t\t            <!-- <img align=\"absmiddle\" src=\"../images/inc/btn_del.gif\" width=\"13\" height=\"14\" border=\"0\" onclick=\"delgallery('4');\"> -->\r\n");
      out.write("\t        \t</td>\r\n");
      out.write("\t        \t</tr>\r\n");
      out.write("\t        \t<tr id=\"trgallery5\">\r\n");
      out.write("\t        \t<td>\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimgseq5\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(4).getCondoimg_seq());} 
      out.write("\">\r\n");
      out.write("\t\t        \t<input type=\"hidden\" name=\"condoimg5\" value=\"");
 if(arrlist2!=null && arrlist2.size()>0){out.print(arrlist2.get(4).getCondo_img());} 
      out.write("\">\r\n");
      out.write("\t\t            <input class=\"upload\" name=\"imggallery5\" type=\"file\" size=\"55\">\r\n");
      out.write("\t\t            <!-- <img align=\"absmiddle\" src=\"../images/inc/btn_del.gif\" width=\"13\" height=\"14\" border=\"0\" onclick=\"delgallery('5');\"> -->\r\n");
      out.write("\t        \t</td>\r\n");
      out.write("\t        \t</tr>\r\n");
      out.write("\t        \t</table>\r\n");
      out.write("\t        </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이용약관</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          \t<textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content3\" name=\"content3\" title=\"higheditor_simple\">");
      out.print( vcDto.getUse_rule() );
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>오시는길</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content4\" name=\"content4\" title=\"higheditor_simple\">");
      out.print( vcDto.getWay_map());
      out.write("</textarea></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\" style=\"padding-top:20px;padding-bottom:20px;\"><img align=\"absmiddle\" src=\"../images/inc/btn_regist2.gif\" width=\"74\" height=\"26\" border=\"0\" onclick=\"condoReg();\"></td>\r\n");
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
