package org.apache.jsp._005fadmin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.goodjob.conf.Config;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.dto.RegionDto;
import com.goodjob.product.dto.GolfLinkDto;
import com.goodjob.product.dto.GolfLinkPriceDto;
import com.goodjob.product.*;
import com.goodjob.db.*;

public final class real_005freg_jsp extends org.apache.jasper.runtime.HttpJspBase
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
String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));

	RegionDao regionDao = new RegionDao();
	List<RegionDto> arrRegions = regionDao.getRegionList("1");
	
	GolfLinkDao dld = new GolfLinkDao();
	List<GolfLinkDto> arrgldto = null;
	List<GolfLinkPriceDto> dlpricedto = null;
	GolfLinkDto gldto = new GolfLinkDto();
	String vPrice1 = "";
	String vPrice2 = "";
	String vPrice3 = "";
	String vPrice4 = "";
	if(glSeq.length() > 0){
		arrgldto = dld.getGolfLink(Integer.parseInt(glSeq));
		if(arrgldto.size() == 1){
			gldto = arrgldto.get(0);
		}
		
		dlpricedto = dld.getGolfLinkPriceSelect(Integer.parseInt(glSeq));		
		if(dlpricedto != null){
			for(int i = 0; i< dlpricedto.size();i++){
				if(dlpricedto.get(i).getPrice_type().startsWith("1")){
					vPrice1 = Integer.toString(dlpricedto.get(i).getGolflink_price());
				}else if(dlpricedto.get(i).getPrice_type().startsWith("2")){
					vPrice2 = Integer.toString(dlpricedto.get(i).getGolflink_price());
				}else if(dlpricedto.get(i).getPrice_type().startsWith("3")){
					vPrice3 = Integer.toString(dlpricedto.get(i).getGolflink_price());
				}else if(dlpricedto.get(i).getPrice_type().startsWith("4")){
					vPrice4 = Integer.toString(dlpricedto.get(i).getGolflink_price());
				}
			}
		}
	}

String pageTitle = "";
if(menuSeq.startsWith("1")){
	pageTitle += "★  실시간 ";
}else{
	pageTitle += "★  사전 ";
}
if(glSeq.length() > 0){
	pageTitle += "골프장 수정 ★";
}else{
	pageTitle += "골프장 등록 ★";
}

String up_dir = Config.get("reserve_dir");

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../style.css\">\r\n");
      out.write("<title></title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/jquery-1.6.2.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/highgardenEditor.js\"></script>\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("<!-- \r\n");
      out.write("function NewWindow(mypage, myname, w, h, scroll) { \r\n");
      out.write("var winl = (screen.width - w) / 2; \r\n");
      out.write("var wint = (screen.height - h) / 2; \r\n");
      out.write("winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable';\r\n");
      out.write("\r\n");
      out.write("win = window.open(mypage, myname, winprops); \r\n");
      out.write("if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); } \r\n");
      out.write("}\r\n");
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
      out.write("function real_submit() {\r\n");
      out.write("\t\r\n");
      out.write("\tif(!$('#golflinkName').val()) {\r\n");
      out.write("\t\talert('제목을 입력하시기 바랍니다.');\r\n");
      out.write("\t\t$('#golflinkName').focus();\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t} \t\r\n");
      out.write("\r\n");
      out.write("\tif($('#img1').val()) {\r\n");
      out.write("\t\tvar src = getFileExtension($('#img1').val());\r\n");
      out.write("\t\tif ( !((src.toLowerCase() == \"png\") || (src.toLowerCase() == \"gif\") || (src.toLowerCase() == \"jpg\") || (src.toLowerCase() == \"jpeg\")) ) {\r\n");
      out.write("\t\t\talert('gif , jpg , png 파일만 지원합니다.');\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif($('#img2').val()) {\r\n");
      out.write("\t\tvar src = getFileExtension($('#img2').val());\r\n");
      out.write("\t\tif ( !((src.toLowerCase() == \"png\") || (src.toLowerCase() == \"gif\") || (src.toLowerCase() == \"jpg\") || (src.toLowerCase() == \"jpeg\")) ) {\r\n");
      out.write("\t\t\talert('gif , jpg , png 파일만 지원합니다.');\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif($('#img3').val()) {\r\n");
      out.write("\t\tvar src = getFileExtension($('#img3').val());\r\n");
      out.write("\t\tif ( !((src.toLowerCase() == \"png\") || (src.toLowerCase() == \"gif\") || (src.toLowerCase() == \"jpg\") || (src.toLowerCase() == \"jpeg\")) ) {\r\n");
      out.write("\t\t\talert('gif , jpg , png 파일만 지원합니다.');\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif($('#img4').val()) {\r\n");
      out.write("\t\tvar src = getFileExtension($('#img4').val());\r\n");
      out.write("\t\tif ( !((src.toLowerCase() == \"png\") || (src.toLowerCase() == \"gif\") || (src.toLowerCase() == \"jpg\") || (src.toLowerCase() == \"jpeg\")) ) {\r\n");
      out.write("\t\t\talert('gif , jpg , png 파일만 지원합니다.');\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function getFileExtension(filePath)\r\n");
      out.write("{\r\n");
      out.write("  var lastIndex = -1;\r\n");
      out.write("  lastIndex = filePath.lastIndexOf('.');\r\n");
      out.write("  var extension = \"\";\r\n");
      out.write("  if ( lastIndex != -1 ) {\r\n");
      out.write("    extension = filePath.substring( lastIndex+1, filePath.len );\r\n");
      out.write("  }\r\n");
      out.write("  else {\r\n");
      out.write("    extension = \"\";\r\n");
      out.write("  }\r\n");
      out.write("  return extension;\r\n");
      out.write("}\r\n");
      out.write("//--> \r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body topmargin=\"10\" marginheight=\"10\">\r\n");
      out.write("<FORM NAME=\"frm\" METHOD=\"post\" ACTION=\"real_reg_ok.jsp\"  enctype=\"multipart/form-data\">\r\n");
      out.write("<input type=\"hidden\" id=\"menuSeq\" name=\"menuSeq\" value=\"");
      out.print( menuSeq);
      out.write("\" />\r\n");
      out.write("<input type=\"hidden\" id=\"glSeq\" name=\"glSeq\" value=\"");
      out.print( glSeq);
      out.write("\" />\r\n");
      out.write("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"50%\" class=title>");
      out.print( pageTitle);
      out.write("</td>\r\n");
      out.write("    <td width=\"50%\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\" colspan=\"2\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\" colspan=\"2\"><table border=\"0\" width=\"900\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td bgcolor=\"#E6E7E8\" align=\"right\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>골프장명</span></td>\r\n");
      out.write("          <td width=\"712\" bgcolor=\"white\" style=\"padding-left:10px;\"><input id=\"golflinkName\" class=\"input_box\" size=\"40\" name=\"golflinkName\" value=\"");
      out.print( gldto.getGolflink_name());
      out.write("\"></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>지역선택</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><select id=\"regionSeq\" name=\"regionSeq\" size=\"1\">\r\n");
      out.write("              <option>선택하세요</option>\r\n");
 
	if (arrRegions != null && !arrRegions.isEmpty()){
		for(int i = 0; i < arrRegions.size();i++){
			if(gldto.getRegion_seq() == arrRegions.get(i).getRegion_seq()){

      out.write("\r\n");
      out.write("        <option value=\"");
      out.print(arrRegions.get(i).getRegion_seq() );
      out.write("\" selected>");
      out.print(arrRegions.get(i).getRegion_name() );
      out.write("</option>\r\n");

			}else{

      out.write("\r\n");
      out.write("        <option value=\"");
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
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>홀구분</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><input id=\"hollType\" name=\"hollType\" class=\"input_box\" size=\"40\" value=\"");
      out.print( gldto.getHoll_type());
      out.write("\"></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>코스안내</span></td>\r\n");
      out.write("                    <td bgcolor=\"white\" style=\"padding-left:10px;\"><input id=\"courseGuide\" name=\"courseGuide\" class=\"input_box\" size=\"110\" value=\"");
      out.print( gldto.getCourse_guide());
      out.write("\">\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이미지업로드1</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">          \r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg1\" name=\"txtimg1\" value=\"");
      out.print( gldto.getImg_sub1() );
      out.write("\">\r\n");
      out.write("          <input id=\"img1\" name=\"img1\" class=\"upload\" type=\"file\" size=\"55\">(270x202) </br>\r\n");
      out.write("          ");
      out.print( gldto.getImg_sub1().length() > 0 ? up_dir + "/" + gldto.getImg_sub1() : "" );
      out.write("\r\n");
      out.write("\t\t  </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이미지업로드2</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg2\" name=\"txtimg2\" value=\"");
      out.print( gldto.getImg_sub2() );
      out.write("\">\r\n");
      out.write("          <input id=\"img2\" name=\"img2\" class=\"upload\" type=\"file\" size=\"55\">(270x202) </br>\r\n");
      out.write("          ");
      out.print( gldto.getImg_sub2().length() > 0 ? up_dir + "/" + gldto.getImg_sub2() : "" );
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이미지업로드3</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg3\" name=\"txtimg3\" value=\"");
      out.print( gldto.getImg_sub3() );
      out.write("\">\r\n");
      out.write("          <input id=\"img3\" name=\"img3\" class=\"upload\" type=\"file\" size=\"55\">(270x202) </br>\r\n");
      out.write("          ");
      out.print( gldto.getImg_sub3().length() > 0 ? up_dir + "/" + gldto.getImg_sub3() : "" );
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이미지업로드4</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <input type=\"hidden\" id=\"txtimg4\" name=\"txtimg4\" value=\"");
      out.print( gldto.getImg_sub4() );
      out.write("\">\r\n");
      out.write("          <input id=\"img4\" name=\"img4\" class=\"upload\" type=\"file\" size=\"55\">(270x202) </br>\r\n");
      out.write("          ");
      out.print( gldto.getImg_sub4().length() > 0 ? up_dir + "/" + gldto.getImg_sub4() : "" );
      out.write("\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>주소</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><table border=\"0\" width=\"80%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" width=\"572\"><input id=\"address1\" name=\"address1\" class=\"input_box\" size=\"80\" value=\"");
      out.print( gldto.getGolflink_address1());
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" height=\"2\" width=\"572\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td width=\"495\"><input id=\"address2\" name=\"address2\" class=\"input_box\" size=\"80\" value=\"");
      out.print( gldto.getGolflink_address2());
      out.write("\"></td>\r\n");
      out.write("                <td width=\"77\"><a href=\"zip_code.jsp\" onClick=\"NewWindow(this.href,'name','420','400','yes');return false;\"><img align=\"absmiddle\" src=\"../images/inc/btn_search.gif\" width=\"45\" height=\"22\" border=\"0\"></a></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" height=\"2\" width=\"572\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td colspan=\"2\" width=\"572\"><a href=\"javascript:;\" onClick=\"newWindowPop(this.href,'name','450','500','yes');return false;\"><img align=\"absmiddle\" src=\"../images/inc/btn_search_xy.gif\" width=\"65\" height=\"22\" border=\"0\"></a> &nbsp;&nbsp;X&nbsp;\r\n");
      out.write("                  <input id=\"pointx\" name=\"pointx\" class=\"input_box\" size=\"20\" value=\"");
      out.print( gldto.getPoint_x());
      out.write("\">\r\n");
      out.write("                  &nbsp;&nbsp;Y&nbsp;\r\n");
      out.write("                  <input id=\"pointy\" name=\"pointy\" class=\"input_box\" size=\"20\" value=\"");
      out.print( gldto.getPoint_y());
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>취소불가기간설정</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\"><select id=\"cancelterm\" name=\"cancelterm\" size=\"1\">\r\n");
      out.write("              <option value=\"\">선택하세요</option>\r\n");
      out.write("              ");
 
              	for (int i = 3; i < 11;i++){
              		if(gldto.getCancel_term().length() > 0 && Integer.parseInt(gldto.getCancel_term()) == i){
              
      out.write("\r\n");
      out.write("            \t\t\t<option value=\"");
      out.print( i);
      out.write("\" selected>");
      out.print( i);
      out.write("일</option>\r\n");
      out.write("              ");

              		}else{
              
      out.write("\r\n");
      out.write("            \t\t\t<option value=\"");
      out.print( i);
      out.write('"');
      out.write('>');
      out.print( i);
      out.write("일</option>\r\n");
      out.write("              ");
              			
              		}      
              	}
              
      out.write("\r\n");
      out.write("            </select></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" width=\"0\" height=\"25\"><span class=list_title>노출여부</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          ");

          	if(gldto.getView_yn().startsWith("Y")){
          
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
      out.write("    <td colspan=\"2\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td colspan=\"2\" align=\"center\"><table border=\"0\" width=\"900\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>가격입력</span></td>\r\n");
      out.write("          <td height=\"18\" bgcolor=\"white\" style=\"padding-left:10px;\" width=\"711\"><table width=\"100%\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"silver\">\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td bgcolor=\"#FCF9EB\" align=middle colspan=\"2\" width=\"353\"><b>그린피 정상요금</b></td>\r\n");
      out.write("                <td bgcolor=#fcf9eb colspan=\"2\" align=middle  할인요금 width=\"356\"><b>그린피 할인요금</b></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#FCF9EB\">주중</td>\r\n");
      out.write("                <td bgcolor=#fcf9eb align=middle 주중>&nbsp;주말</td>\r\n");
      out.write("                <td bgcolor=#fcf9eb align=middle 주중>&nbsp;주중</td>\r\n");
      out.write("                <td align=\"center\" bgcolor=\"#FCF9EB\">주말</td>\r\n");
      out.write("              </tr>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td height=\"11\" align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"15\" id=\"priceN1\" name=\"priceN1\" value=\"");
      out.print( vPrice1);
      out.write("\"></td>\r\n");
      out.write("                <td height=\"22\" align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"15\" id=\"priceN2\" name=\"priceN2\" value=\"");
      out.print( vPrice2);
      out.write("\"></td>\r\n");
      out.write("                <td height=\"22\" align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"15\" id=\"priceS1\" name=\"priceS1\" value=\"");
      out.print( vPrice3);
      out.write("\"></td>\r\n");
      out.write("                <td height=\"22\" align=\"center\" bgcolor=\"white\"><input class=\"input_box\" size=\"15\" id=\"priceS2\" name=\"priceS2\" value=\"");
      out.print( vPrice4);
      out.write("\"></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td colspan=\"2\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td colspan=\"2\" align=\"center\"><table border=\"0\" width=\"899\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#CCCCCC\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\" width=\"162\"><span class=list_title>취소규정</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\" width=\"710\">\r\n");
      out.write("          <textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content1\" name=\"content1\" title=\"higheditor_simple\">");
      out.print( gldto.getCancel_rule());
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>위약처리규정</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content2\" name=\"content2\" title=\"higheditor_simple\">");
      out.print( gldto.getPromise_rule());
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이용안내</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content3\" name=\"content3\" title=\"higheditor_simple\">");
      out.print( gldto.getUse_guide());
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>골프장안내</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content4\" name=\"content4\" title=\"higheditor_simple\">");
      out.print( gldto.getGolflink_guide());
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td align=\"right\" bgcolor=\"#E6E7E8\" style=\"padding-right:10px;\"><span class=list_title>이용약관</span></td>\r\n");
      out.write("          <td bgcolor=\"white\" style=\"padding-left:10px;\">\r\n");
      out.write("          <textarea class=\"box03\" rows=\"10\" cols=\"113\" id=\"content5\" name=\"content5\" title=\"higheditor_simple\">");
      out.print( gldto.getUse_rule());
      out.write("</textarea>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td colspan=\"2\" align=\"center\" style=\"padding-top:20px;padding-bottom:20px;\"><img align=\"absmiddle\" src=\"../images/inc/btn_regist2.gif\" width=\"74\" height=\"26\" border=\"0\" onclick=\"real_submit();\"></td>\r\n");
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
