package org.apache.jsp._005fadmin.product.popup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.dbutils.*;
import org.apache.commons.lang.StringUtils;
import java.sql.*;
import java.util.*;
import org.apache.commons.dbutils.handlers.*;
import com.goodjob.product.dto.GolfLinkCourseDto;
import com.goodjob.product.dto.ProductDto;
import com.goodjob.product.productDao;
import com.goodjob.product.GolfLinkDao;

public final class pop_005freal_005ftime_005freg_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


	public ProductDto chkDayFind(List<ProductDto> arrPrdtparam, int day){
		for(int i = 0; i < arrPrdtparam.size();i++){
			ProductDto prdtdto = null;
			prdtdto = arrPrdtparam.get(i);
			if(Integer.parseInt(prdtdto.getProduct_day()) == day){
				return prdtdto;
			}
		}
		return null;
	}


    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = null;
        c = Calendar.getInstance();
        c.setLenient(false);

        try{
                c.set(y,m,d);
                java.util.Date dt = c.getTime();
        }catch (IllegalArgumentException e) {
                return false;

        }
                return true;
    }

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

	String menuSeq = StringUtils.trimToEmpty(request.getParameter("menuseq"));
	String glSeq = StringUtils.trimToEmpty(request.getParameter("glseq"));
	
	GolfLinkDao gfdao = new GolfLinkDao(); 
	List<GolfLinkCourseDto> glcDto = gfdao.getGolfLinkCourseSelect(Integer.parseInt(glSeq));
	
	String ddlCourseHTML = "<select name='course_list'><option value='0' selected>선택하세요</option>";
	for(int i = 0; i < glcDto.size();i++){
		ddlCourseHTML += "<option value='" + glcDto.get(i).getGolflink_course_seq() +"'>" + glcDto.get(i).getCourse_name() + "</option>";
	}
	ddlCourseHTML += "</select>";

String nowDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
int action = 0;  // incoming request for moving calendar up(1) down(0) for month
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth = 0; // same as year

Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();

if (request.getParameter("action") == null) // Check to see if we should set the year and month to the current
{
	currMonth = c.get(c.MONTH);
	currYear = c.get(c.YEAR);
	cal.set(currYear, currMonth,1);
}
else
{
	if (!(request.getParameter("action") == null)) // Hove the calendar up or down in this if block
	{
		currMonth = Integer.parseInt(request.getParameter("month"));
		currYear = Integer.parseInt(request.getParameter("year"));

			if (Integer.parseInt( request.getParameter("action")) == 1 )
			{
				cal.set(currYear, currMonth, 1);
				cal.add(cal.MONTH, 1);
				currMonth = cal.get(cal.MONTH);
				currYear = cal.get(cal.YEAR);
			}
			else
			{
				cal.set(currYear, currMonth ,1);
				cal.add(cal.MONTH, -1);
				currMonth = cal.get(cal.MONTH);
				currYear = cal.get(cal.YEAR);
			}
	}
} 

/**
 * 선택달의 상품정보.
*/
ProductDto prdtDto = new ProductDto();
prdtDto.setMenu_seq(Integer.parseInt(menuSeq));
prdtDto.setGolflink_seq(Integer.parseInt(glSeq));
prdtDto.setProduct_year(Integer.toString(currYear));
String selectMonth = "0" + Integer.toString(currMonth+1);
prdtDto.setProduct_month(selectMonth.substring(selectMonth.length()-2));
productDao prdtDao = new productDao();
List<ProductDto> arrPrdt = prdtDao.getProductSelect(prdtDto);

      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>실시간 골프장 시간 및 가격입력</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../../style.css\" type=\"text/css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/jquery-1.5.2.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var selDate = \"");
      out.print( nowDate);
      out.write("\";\r\n");
      out.write("function StatusModify(sDate, status){\r\n");
      out.write("\tvar splitDate = sDate.split('/');\r\n");
      out.write("\tselDate = splitDate[0] + \"/\" + LenChk(splitDate[1], 2) + \"/\" + LenChk(splitDate[2], 2);\r\n");
      out.write("\t\r\n");
      out.write("\tvar prdtseq = $(\"#date\"+sDate.replace('/','').replace('/','')).val();\r\n");
      out.write("\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t  url: \"/_admin/product/ajax/ajax_product_update.jsp?prdtseq=\"+prdtseq+\"&mnseq=");
      out.print(menuSeq);
      out.write("&glseq=");
      out.print(glSeq);
      out.write("&date=\"+selDate+\"&status=\"+status,\r\n");
      out.write("\t  cache: false,\r\n");
      out.write("\t  async: false,\r\n");
      out.write("\t  success: function(html){\r\n");
      out.write("\t\tvar evalData = eval(\"(\"+html+\")\");\r\n");
      out.write("\t\tif(evalData.Product.length == 1){\r\n");
      out.write("\t\t\tvar msgStr = \"\";\r\n");
      out.write("\t\t\tif(evalData.Product[0].c == \"1\"){\r\n");
      out.write("\t\t\t\talert(\"마감 되었습니다.\");\r\n");
      out.write("\t\t\t\t$(\"#date\"+evalData.Product[0].b).prev().html(\"예약마감\");\r\n");
      out.write("\t\t\t}else if(evalData.Product[0].c == \"2\"){\r\n");
      out.write("\t\t\t\talert(\"휴장 되었습니다.\");\r\n");
      out.write("\t\t\t\t$(\"#date\"+evalData.Product[0].b).prev().html(\"휴장\");\r\n");
      out.write("\t\t\t}\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t  }\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function selSetting(sDate){\t\r\n");
      out.write("\tvar splitDate = sDate.split('/');\r\n");
      out.write("\tselDate = splitDate[0] + \"/\" + LenChk(splitDate[1], 2) + \"/\" + LenChk(splitDate[2], 2);\r\n");
      out.write("\tvar prdtseq = $(\"#date\"+sDate.replace('/','').replace('/','')).val();\r\n");
      out.write("\t//상품일련번호.\r\n");
      out.write("\tif(prdtseq == \"\"){\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t  url: \"/_admin/product/ajax/ajax_product_insert.jsp?mnseq=");
      out.print(menuSeq);
      out.write("&glseq=");
      out.print(glSeq);
      out.write("&date=\"+selDate,\r\n");
      out.write("\t\t  cache: false,\r\n");
      out.write("\t\t  async: false,\r\n");
      out.write("\t\t  success: function(html){\r\n");
      out.write("\t\t\tvar evalData = eval(\"(\"+html+\")\");\r\n");
      out.write("\t\t\tif(evalData.Product.length == 1){\r\n");
      out.write("\t\t\t\t$(\"#prdtseq\").val(evalData.Product[0].a);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t  }\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\t$(\"#prdtseq\").val(prdtseq);\r\n");
      out.write("\t}\r\n");
      out.write("\tprdtseq = $(\"#prdtseq\").val();\r\n");
      out.write("\t$(\"#date\"+sDate.replace('/','').replace('/','')).val(prdtseq);\r\n");
      out.write("\r\n");
      out.write("\t//초기화\r\n");
      out.write("\tvar arrChkItems = $(\"input[name='timeItems']\");\r\n");
      out.write("\tif(arrChkItems.length > 0){\r\n");
      out.write("\t\tfor(var i = arrChkItems.length; i >= 0;i--){\r\n");
      out.write("\t\t\t$(\"#tbTimeCost tr:eq(\"+(i+1)+\")\").remove();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t//ajax호출 - 입력값 확인.\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t  url: \"/_admin/product/ajax/ajax_datetimecost_list.jsp?mnseq=");
      out.print(menuSeq);
      out.write("&glseq=");
      out.print(glSeq);
      out.write("&date=\"+selDate,\r\n");
      out.write("\t  cache: false,\r\n");
      out.write("\t  async: false,\r\n");
      out.write("\t  success: function(html){\r\n");
      out.write("\t\tvar evalData = eval(\"(\"+html+\")\");\r\n");
      out.write("\t\tfor(var i=0;i<evalData.ProductSub.length;i++){\r\n");
      out.write("\t\t\taddTime(evalData.ProductSub[i].a,evalData.ProductSub[i].c,evalData.ProductSub[i].d.substring(0,2),evalData.ProductSub[i].d.substring(2,4),evalData.ProductSub[i].f,evalData.ProductSub[i].g,evalData.ProductSub[i].h);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//기본행\r\n");
      out.write("\t\taddTime('','0','0','0','','','0');\r\n");
      out.write("\t  }\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("function addTime(pdsubseq, vCourse, vTimeH, vTimeM, nPrice, sPrice, sStatus){\r\n");
      out.write("\tvar currMD = selDate.split('/');\r\n");
      out.write("\tvar timecostHTML = \"\";\r\n");
      out.write("\ttimecostHTML += \"<tr><td bgcolor='white' align='center' width='40'><input type='hidden' name='pdsubseq' value='\" + pdsubseq + \"'>\"+currMD[1]+\"/\"+currMD[2]+\"</td>\"\r\n");
      out.write("\t\t+\"<td bgcolor='white' align='center'>");
      out.print( ddlCourseHTML);
      out.write("\"\r\n");
      out.write("\t\t+\"</td><td bgcolor='white' align='center'><select name='course_hour'>\"\r\n");
      out.write("\tfor(var i=0;i<24;i++){\r\n");
      out.write("\t\tvar ih = LenChk(i, 2);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(ih == vTimeH){\r\n");
      out.write("\t\t\ttimecostHTML += \"<option value='\" + ih + \"' selected>\" + ih + \"</option>\";\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\ttimecostHTML += \"<option value='\" + ih + \"'>\" + ih + \"</option>\";\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\ttimecostHTML += \"</select>시\";\r\n");
      out.write("\ttimecostHTML += \"<select name='course_minute'>\";\r\n");
      out.write("\tfor(var i=0;i<60;i++){\r\n");
      out.write("\t\tvar im = LenChk(i, 2);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(im == vTimeM){\r\n");
      out.write("\t\t\ttimecostHTML += \"<option value='\" + im + \"' selected>\" + im + \"</option>\";\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\ttimecostHTML += \"<option value='\" + im + \"'>\" + im + \"</option>\";\r\n");
      out.write("\t\t}\t\r\n");
      out.write("\t}  \r\n");
      out.write("\ttimecostHTML += \"</select>분 </td>\";\r\n");
      out.write("\ttimecostHTML += \"<td align='center' bgcolor='white'><input class='input_box' size='10' name='courseN' value='\" + nPrice + \"' ></td>\";\r\n");
      out.write("\ttimecostHTML += \"<td align='center' bgcolor='white'><input class='input_box' size='10' name='courseS' value='\" + sPrice + \"' ></td>\";\r\n");
      out.write("\ttimecostHTML += \"<td align='center' bgcolor='white'><input type='hidden' name='prdtStatus' value='\" + sStatus + \"' /><input type='checkbox' name='timeItems' /></td>\";\r\n");
      out.write("\ttimecostHTML += \"</tr>\";\r\n");
      out.write("\t$(\"#tbTimeCost\").append(timecostHTML);\r\n");
      out.write("\r\n");
      out.write("\t$(\"#tbTimeCost tr:last-child select[name='course_list']\").val(vCourse);\r\n");
      out.write("}\r\n");
      out.write("function removeTime(){\r\n");
      out.write("\tvar arrChkItems = $(\"input[name='timeItems']\");\r\n");
      out.write("\tvar arrtmPrdtStatus = $(\"input[name='prdtStatus']\");\r\n");
      out.write("\tfor(var i = arrChkItems.length - 1; i >= 0;i--){\r\n");
      out.write("\t\tif(arrChkItems[i].checked){\r\n");
      out.write("\t\t\tif(arrtmPrdtStatus[i].value == \"1\"){\r\n");
      out.write("\t\t\t\talert(\"예약중 고객이 있습니다.\");\r\n");
      out.write("\t\t\t}else if(arrtmPrdtStatus[i].value == \"2\"){\r\n");
      out.write("\t\t\t\talert(\"예약마감된 고객이 있습니다.\");\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\t$(\"#tbTimeCost tr:eq(\"+(i+1)+\")\").remove();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function saveTime(){\r\n");
      out.write("\tvar blVali = false;\r\n");
      out.write("\tvar arrCourseN = $(\"input[name='courseN']\");\r\n");
      out.write("\r\n");
      out.write("\tvar delchkStr = \"\";\r\n");
      out.write("\tfor(var i = 0; i < arrCourseN.length;i++){\r\n");
      out.write("\t\tif(arrCourseN[i].value.length > 0){\r\n");
      out.write("\t\t\tblVali = true;\r\n");
      out.write("\t\t} \r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif(blVali){\r\n");
      out.write("\t\tfrm2.submit();\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\talert(\"등록한 최신 정보를 입력하지 않으셨습니다.\");\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function prdtViewChange(cDate, cValue){\r\n");
      out.write("\t$(\"#changeDate\").val(cDate);\r\n");
      out.write("\t$(\"#changeView\").val(cValue);\r\n");
      out.write("\tfrm1.submit();\r\n");
      out.write("}\r\n");
      out.write("function LenChk(inval, n){\r\n");
      out.write("\tvar tmp = \"00000\" + inval;\r\n");
      out.write("\tvar len = tmp.length;\r\n");
      out.write("\treturn (tmp.substring(len - n, len));\r\n");
      out.write("}\r\n");
      out.write("String.prototype.trim = function(){\r\n");
      out.write("\treturn this.replace(/^\\s*/,\"\").replace(/\\s*$/,\"\");\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form NAME=\"frm1\" METHOD=\"post\" ACTION=\"pop_real_time_reg_view_ok.jsp\">\r\n");
      out.write("<input type=\"hidden\" name=\"changeDate\" value=\"\" />\r\n");
      out.write("<input type=\"hidden\" name=\"changeView\" value=\"\" />\r\n");
      out.write("</form>\r\n");
      out.write("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"760\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\" width=\"760\" class=title>★ 실시간 골프장 시간 및 가격입력 ★</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"right\" style=\"padding-right:20px;\" height=\"35\"><img src=\"../../images/inc/month_prev.gif\"  style=\"cursor:pointer;\" width=\"41\" height=\"16\" border=\"0\" align=\"absmiddle\" onclick=\"location.href='pop_real_time_reg.jsp?menuseq=");
      out.print(menuSeq );
      out.write("&glseq=");
      out.print( glSeq);
      out.write("&month=");
      out.print(currMonth);
      out.write("&year=");
      out.print(currYear);
      out.write("&action=0'\"> &nbsp;<span class=month>");
      out.print( (currYear) );
      out.write('년');
      out.write(' ');
      out.print( (currMonth+1) );
      out.write("월</span> &nbsp;<img align=\"absmiddle\" src=\"../../images/inc/month_next.gif\" width=\"41\" height=\"16\" style=\"cursor:pointer;\" border=\"0\" onclick=\"location.href='pop_real_time_reg.jsp?menuseq=");
      out.print(menuSeq );
      out.write("&glseq=");
      out.print( glSeq);
      out.write("&month=");
      out.print(currMonth);
      out.write("&year=");
      out.print(currYear);
      out.write("&action=1'\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><table border=\"0\" width=\"740\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#D1D3D4\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"87\" bgcolor=\"#F1F1F1\" align=\"center\"><span class=sunday>일요일</span></td>\r\n");
      out.write("          <td width=\"87\" bgcolor=\"#F1F1F1\" align=\"center\"><span class=day>월요일</span></td>\r\n");
      out.write("          <td width=\"87\" bgcolor=\"#F1F1F1\" align=\"center\"><span class=day>화요일</span></td>\r\n");
      out.write("          <td width=\"87\" bgcolor=\"#F1F1F1\" align=\"center\"><span class=day>수요일</span></td>\r\n");
      out.write("          <td width=\"87\" bgcolor=\"#F1F1F1\" align=\"center\"><span class=day>목요일</span></td>\r\n");
      out.write("          <td width=\"87\" bgcolor=\"#F1F1F1\" align=\"center\"><span class=day>금요일</span></td>\r\n");
      out.write("          <td width=\"87\" bgcolor=\"#F1F1F1\" align=\"center\"><span class=saturday>토요일</span></td>\r\n");
      out.write("        </tr>\r\n");

//'Calendar loop

	int currDay;
	String todayColor;
	int count = 1;
	int dispDay = 1;

	for (int w = 1; w < 7; w++)
	{
		if(w == 6 && !isDate( currMonth + 1, dispDay, currYear)){
			break;
		}

      out.write("\r\n");
      out.write("<tr>\r\n");
 
  		for (int d = 1; d < 8; d++)
		{
			if (! (count >= cal.get(c.DAY_OF_WEEK)))
			{ 

      out.write("\r\n");
      out.write("\t\t<td bgcolor=\"white\" align=\"center\">\r\n");

				count += 1;
			} 
			else
			{
				if (isDate( currMonth + 1, dispDay, currYear)) // use the isDate method
				{ 

					if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)) // Here we check to see if the current day is today
       				{
						todayColor = "#6C7EAA";
					}
					else
					{
						todayColor = "#ffffff";
					}

      out.write(" \r\n");
      out.write("\t\t<td bgcolor=\"white\" align=\"center\">\r\n");
      out.write("\t\t\t<table border=\"0\" width=\"97%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("           \t<tr>\r\n");
      out.write("            <td height=\"20\" width=\"35\">\r\n");
      out.write("            ");
 if (d == 1){ 
      out.write("\r\n");
      out.write("            \t<span class=sunday>");
      out.print( (currMonth+1) + "/" + dispDay);
      out.write("</span>\r\n");
      out.write("            ");
 }else if(d == 7){ 
      out.write("\r\n");
      out.write("            \t<span class=saturday>");
      out.print( (currMonth+1) + "/" + dispDay);
      out.write("</span>\r\n");
      out.write("            ");
 }else{ 
      out.write("\r\n");
      out.write("            \t<span class=day>");
      out.print( (currMonth+1) + "/" + dispDay);
      out.write("</span>\r\n");
      out.write("            ");
 } 
      out.write("\r\n");
      out.write("            </td>\r\n");
      out.write("            ");

            	ProductDto prdtdto_day = new ProductDto();
            	prdtdto_day = chkDayFind(arrPrdt, dispDay);
            
      out.write("\r\n");
      out.write("            <td height=\"20\" align=\"center\" width=\"65\">\r\n");
      out.write("            ");

	            //N : 예약불가
	            //Y : 예약가능
	            //1 : 마감
	            //2 : 휴장
	            String prdtSeq_day = "";
            	if (prdtdto_day == null){
            
      out.write("\r\n");
      out.write("            \t<span class=regist_no>예약불가</span>\r\n");
      out.write("            ");

            	}else{
            		prdtSeq_day = Integer.toString(prdtdto_day.getProduct_seq());
            		if (prdtdto_day.getView_yn().equals("N")){
            
      out.write("\r\n");
      out.write("                       \t<span class=regist_no>예약불가</span>\r\n");
      out.write("            ");

                    }else if (prdtdto_day.getView_yn().equals("Y")){
            
      out.write("\r\n");
      out.write("                       \t<span class=regist_yes>예약가능</span>\r\n");
      out.write("           \t");

                    }else if (prdtdto_day.getView_yn().equals("1")){
            
      out.write("\r\n");
      out.write("                       \t<span class=regist_yes>예약마감</span>\r\n");
      out.write("           \t");

                    }else if (prdtdto_day.getView_yn().equals("2")){
            
      out.write("\r\n");
      out.write("                       \t<span class=regist_yes>휴장</span>\r\n");
      out.write("            ");
            
                    }
            	}
            
      out.write("\r\n");
      out.write("            ");

            	String ttYear = Integer.toString(currYear);
				String ttMonth = "0" + Integer.toString(currMonth+1);
				ttMonth = ttMonth.substring(ttMonth.length()-2);
				String ttDay = "0" + Integer.toString(dispDay);
				ttDay = ttDay.substring(ttDay.length()-2);
				String ttDate = ttYear + ttMonth + ttDay;
            
      out.write("\r\n");
      out.write("            \t<input type=\"hidden\" id=\"date");
      out.print(ttDate);
      out.write("\" value=\"");
      out.print(prdtSeq_day);
      out.write("\" />\r\n");
      out.write("            </td>\r\n");
      out.write("           \t</tr>\r\n");
      out.write("           \t<tr>\r\n");
      out.write("            <td align=\"center\" colspan=\"2\">\r\n");
      out.write("            \t<table border=\"0\" width=\"97%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t            <tr>\r\n");
      out.write("\t            <td align=\"center\" height=\"20\"><img align=\"absmiddle\" src=\"../../images/inc/btn_day_close.gif\" width=\"28\" height=\"16\" border=\"0\" style=\"cursor:pointer;\" onclick=\"StatusModify('");
      out.print(ttYear + "/" + ttMonth + "/" + ttDay);
      out.write("', '1')\"></td>\r\n");
      out.write("\t            <td align=\"center\"><img align=\"absmiddle\" src=\"../../images/inc/btn_day_rest.gif\" width=\"28\" height=\"16\" border=\"0\" style=\"cursor:pointer;\" onclick=\"StatusModify('");
      out.print(ttYear + "/" + ttMonth + "/" + ttDay);
      out.write("', '2')\"></td>\r\n");
      out.write("\t            <td align=\"center\"><img src=\"../../images/inc/btn_edit3.gif\" width=\"28\" height=\"16\" border=\"0\" align=\"absmiddle\" onclick=\"selSetting('");
      out.print(ttYear + "/" + ttMonth + "/" + ttDay);
      out.write("');\" style=\"cursor:pointer;\"></td>\r\n");
      out.write("\t            </tr>\r\n");
      out.write("\t            </table>\r\n");
      out.write("\t        </td>\r\n");
      out.write("           \t</tr>\r\n");
      out.write("         \t</table>\r\n");
      out.write("\t\t</td>\r\n");

					count += 1;
					dispDay += 1;
				}
				else
				{

      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t<td bgcolor=\"white\" align=\"center\">\r\n");
      out.write("\t\t\t<table border=\"0\" width=\"97%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("           \t<tr>\r\n");
      out.write("            <td height=\"20\" width=\"35\"><span class=day></span></td>\r\n");
      out.write("            <td height=\"20\" align=\"center\" width=\"65\"></span></td>\r\n");
      out.write("           \t</tr>\r\n");
      out.write("           \t<tr>\r\n");
      out.write("            <td align=\"center\" colspan=\"2\">\r\n");
      out.write("            \t<table border=\"0\" width=\"97%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t            <tr>\r\n");
      out.write("\t            <td align=\"center\" height=\"20\"></td>\r\n");
      out.write("\t            <td align=\"center\"></td>\r\n");
      out.write("\t            <td align=\"center\"></td>\r\n");
      out.write("\t            </tr>\r\n");
      out.write("\t            </table>\r\n");
      out.write("\t        </td>\r\n");
      out.write("           \t</tr>\r\n");
      out.write("         \t</table>\r\n");
      out.write("\t\t</td>\r\n");

				} 
			}
       } 

      out.write("\r\n");
      out.write("</tr>\r\n");
 
}

      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\">\r\n");
      out.write("    <form NAME=\"frm2\" METHOD=\"post\" ACTION=\"pop_real_time_reg_ok.jsp\">\r\n");
      out.write("    \t<table id=\"tbTimeCost\" name=\"tbTimeCost\" border=\"0\" width=\"745\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#D1D3D4\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td bgcolor=\"#F1F1F1\" align=\"center\" height=\"19\" width=\"40\">날짜</td>\r\n");
      out.write("          <td bgcolor=\"#F1F1F1\" align=\"center\" height=\"19\" width=\"161\">코스선택 </td>\r\n");
      out.write("          <td bgcolor=\"#F1F1F1\" align=\"center\" height=\"19\" width=\"134\">시간선택</td>\r\n");
      out.write("          <td align=\"center\" bgcolor=\"#F1F1F1\" height=\"19\" width=\"112\">정상가</td>\r\n");
      out.write("          <td align=\"center\" bgcolor=\"#F1F1F1\" height=\"19\" width=\"95\">할인가</td>\r\n");
      out.write("          <td width=\"95\" height=\"19\" align=\"center\" bgcolor=\"#F1F1F1\">\r\n");
      out.write("          \t<img align=\"absmiddle\" src=\"../../images/inc/btn_plus.gif\" style=\"cursor:pointer;\" width=\"32\" height=\"16\" border=\"0\" onclick=\"addTime('','0','0','0','','','0');\">\r\n");
      out.write("          \t<img src=\"../../images/inc/btn_del2.gif\" style=\"cursor:pointer;\" width=\"32\" height=\"16\" border=\"0\" align=\"absmiddle\" onclick=\"removeTime();\">\r\n");
      out.write("          \t<!-- <img align=\"absmiddle\" src=\"../../images/inc/btn_save.gif\" width=\"32\" height=\"16\" border=\"0\"> -->\r\n");
      out.write("          \t<input type=\"hidden\" id=\"menuseq\" name=\"menuseq\" value=\"");
      out.print(menuSeq );
      out.write("\" />\r\n");
      out.write("          \t<input type=\"hidden\" id=\"prdtseq\" name=\"prdtseq\" value=\"\" />\r\n");
      out.write("          \t<input type=\"hidden\" name=\"glseq\" value=\"");
      out.print( glSeq);
      out.write("\" />\r\n");
      out.write("          \t<input type=\"hidden\" name=\"cpYear\" value=\"");
      out.print( currYear);
      out.write("\" />\r\n");
      out.write("          \t<input type=\"hidden\" name=\"cpMonth\" value=\"");
      out.print( currMonth+1);
      out.write("\" />\r\n");
      out.write("\t\t  </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      \t</table>\r\n");
      out.write("    </form>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"center\"><img align=\"absmiddle\" src=\"../../images/inc/btn_regist2.gif\" style=\"cursor:pointer;\" width=\"74\" height=\"26\" border=\"0\" onclick=\"saveTime();\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"25\" align=\"right\" valign=\"bottom\"><a href=\"javascript:self.close();\"><img align=\"absmiddle\" src=\"../../images/inc/btn_del.gif\" width=\"13\" height=\"14\" border=\"0\"></a></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<script>selSetting(selDate);</script>");
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
