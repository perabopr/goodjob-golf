package org.apache.jsp._005fadmin.product.popup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class cal_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);

        try
        {
                c.set(y,m,d);
                Date dt = c.getTime();
        }
          catch (IllegalArgumentException e)
        {
                return false;

        }
                return true;
    }


   public String getDateName (int monthNumber) // This method is used to quickly return the proper name of a month
   {
		String strReturn = "";
		switch (monthNumber)
		{ 
	case 0:
		strReturn = "January";
		break;
	case 1:
		strReturn = "February";
		break;
	case 2:
		strReturn = "March";
		break;
	case 3:
		strReturn = "April";
		break;
	case 4:
		strReturn = "May";
		break;
	case 5:
		strReturn = "June";
		break;
	case 6:
		strReturn = "July";
		break;
	case 7:
		strReturn = "August";
		break;
	case 8:
		strReturn = "September";
		break;
	case 9:
		strReturn = "October";
		break;
	case 10:
		strReturn = "November";
		break;
	case 11:
		strReturn = "December";
		break;
	}
	return strReturn;
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
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");

// JSP Calendar:--
// Created by Jason Benassi
// jbenassi@lime-light.com
// http://www.wakeboardutah.com
// 7-2002

      out.write('\r');
      out.write('\n');

// Global Vars
int action = 0;  // incoming request for moving calendar up(1) down(0) for month
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth = 0; // same as year
String boxSize = "70";  // how big to make the box for the calendar

//build 2 calendars

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

      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("</body bgcolor='white'>\r\n");
      out.write("<table border='1' width='519' celpadding='0' cellspacing='0'>\r\n");
      out.write("  <tr>\r\n");
      out.write("\t<td width='150' align='right' valign='middle'><a href=\"cal.jsp?month=");
      out.print(currMonth);
      out.write("&year=");
      out.print(currYear);
      out.write("&action=0\"><font size=\"1\">Previous Month</font></a></td>\r\n");
      out.write("\t<td width='260' align='center' valign='middle'><b>");
      out.print(getDateName (cal.get(cal.MONTH)) + " " + cal.get(cal.YEAR));
      out.write("</b></td>\r\n");
      out.write("\t<td width='173' align='left' valign='middle'><a href=\"cal.jsp?month=");
      out.print(currMonth);
      out.write("&year=");
      out.print(currYear);
      out.write("&action=1\"><font size=\"1\">Next Month</font></a></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("<table border=\"0\" width=\"520\" bordercolorlight=\"#C0C0C0\" bordercolordark=\"#808080\" style=\"border-collapse: collapse\" bordercolor=\"#111111\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("  <td width=\"100%\">\r\n");
      out.write("    <table border=\"2\" width=\"519\" bordercolorlight=\"#C0C0C0\" bordercolordark=\"#000000\" style=\"border-collapse: collapse\" bordercolor=\"#000000\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#DFDCD8\">\r\n");
      out.write("  \t<tr>\r\n");
      out.write("    \t\t<td width=\"");
      out.print(boxSize);
      out.write("\" align=\"center\" nowrap bordercolor=\"#666666\" bgcolor=\"#666666\">\r\n");
      out.write("    \t\t<font color=\"#FFFFFF\"><b>Sun</b></font></td>\r\n");
      out.write("    \t\t<td width=\"");
      out.print(boxSize);
      out.write("\" align=\"center\" nowrap bordercolor=\"#666666\" bgcolor=\"#666666\">\r\n");
      out.write("    \t\t<font color=\"#FFFFFF\"><b>Mon</b></font></td>\r\n");
      out.write("    \t\t<td width=\"");
      out.print(boxSize);
      out.write("\" align=\"center\" nowrap bordercolor=\"#666666\" bgcolor=\"#666666\">\r\n");
      out.write("    \t\t<font color=\"#FFFFFF\"><b>Tues</b></font></td>\r\n");
      out.write("    \t\t<td width=\"");
      out.print(boxSize);
      out.write("\" align=\"center\" nowrap bordercolor=\"#666666\" bgcolor=\"#666666\">\r\n");
      out.write("   \t\t<font color=\"#FFFFFF\"><b>Wed</b></font></td>\r\n");
      out.write("    \t\t<td width=\"");
      out.print(boxSize);
      out.write("\" align=\"center\" nowrap bordercolor=\"#666666\" bgcolor=\"#666666\">\r\n");
      out.write("    \t\t<font color=\"#FFFFFF\"><b>Thurs</b></font></td>\r\n");
      out.write("    \t\t<td width=\"");
      out.print(boxSize);
      out.write("\" align=\"center\" nowrap bordercolor=\"#666666\" bgcolor=\"#666666\">\r\n");
      out.write("    \t\t<font color=\"#FFFFFF\"><b>Fri</b></font></td>\r\n");
      out.write("    \t\t<td width=\"");
      out.print(boxSize);
      out.write("\" align=\"center\" nowrap bordercolor=\"#666666\" bgcolor=\"#666666\">\r\n");
      out.write("    \t\t<font color=\"#FFFFFF\"><b>Sat</b></font></td>\r\n");
      out.write("  \t</tr>\r\n");


//'Calendar loop


	int currDay;
	String todayColor;
	int count = 1;
	int dispDay = 1;


	for (int w = 1; w < 7; w++)
	{

      out.write("\r\n");
      out.write("  \t<tr>\r\n");
 
  		for (int d = 1; d < 8; d++)
		{
			if (! (count >= cal.get(c.DAY_OF_WEEK)))
			{ 


      out.write("\r\n");
      out.write("\t\t<td width=\"");
      out.print(boxSize);
      out.write("\" height=\"");
      out.print(boxSize);
      out.write("\" valign=\"top\" align=\"left\">&nbsp;</td>\r\n");

				count += 1;
			} 
			else
			{

				if (isDate ( currMonth + 1, dispDay, currYear) ) // use the isDate method
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
      out.write("\t\t<td bgcolor =\"");
      out.print(todayColor);
      out.write("\" width=\"");
      out.print(boxSize);
      out.write("\" align=\"left\" height=\"");
      out.print(boxSize);
      out.write("\" valign=\"top\">");
      out.print(dispDay);
      out.write("<br>\r\n");
      out.write("\t\t</td>\r\n");

					count += 1;
					dispDay += 1;
				}
				else
				{

      out.write("\r\n");
      out.write("\t\t<td width=\"");
      out.print(boxSize);
      out.write("\" align=\"left\" height=\"");
      out.print(boxSize);
      out.write("\" valign=\"top\">&nbsp;</td>\r\n");

				} 
			}

       } 

      out.write("\r\n");
      out.write("  \t</tr> \r\n");
 
}

      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("</td>\r\n");
      out.write("<tr><td>\r\n");
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
