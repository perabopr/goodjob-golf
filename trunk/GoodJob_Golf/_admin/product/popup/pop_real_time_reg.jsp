<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%
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
%>

<%!
    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);

        try
        {
                c.set(y,m,d);
                java.util.Date dt = c.getTime();
        }
          catch (IllegalArgumentException e)
        {
                return false;

        }
                return true;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>실시간 골프장 시간 및 가격입력</title>
<link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="760">
  <tr>
    <td align="center" width="760" class=title>★ 실시간 골프장 시간 및 가격입력 ★</td>
  </tr>
  <tr>
    <td align="right" style="padding-right:20px;" height="35"><img src="../../images/inc/month_prev.gif" width="41" height="16" border="0" align="absmiddle" onclick="location.href='pop_real_time_reg.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=0'"> &nbsp;<span class=month><%= (currYear) %>년 <%= (currMonth+1) %>월</span> &nbsp;<img align="absmiddle" src="../../images/inc/month_next.gif" width="41" height="16" border="0" onclick="location.href='pop_real_time_reg.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=1'"></td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="740" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4">
        <tr>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=sunday>일요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>월요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>화요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>수요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>목요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=day>금요일</span></td>
          <td width="87" bgcolor="#F1F1F1" align="center"><span class=saturday>토요일</span></td>
        </tr>
<%
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
%>
<tr>
<% 
  		for (int d = 1; d < 8; d++)
		{
			if (! (count >= cal.get(c.DAY_OF_WEEK)))
			{ 
%>
		<td bgcolor="white" align="center">
<%
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
%> 
		<td bgcolor="white" align="center">
			<table border="0" width="97%" cellpadding="0" cellspacing="0">
           	<tr>
            <td height="20" width="35">
            <% if (d == 1){ %>
            	<span class=sunday><%= (currMonth+1) + "/" + dispDay%></span>
            <% }else if(d == 7){ %>
            	<span class=saturday><%= (currMonth+1) + "/" + dispDay%></span>
            <% }else{ %>
            	<span class=day><%= (currMonth+1) + "/" + dispDay%></span>
            <% } %>
            </td>
            <td height="20" align="center" width="65">
            	<span class=regist_no>예약마감</span>
            	<!-- <span class=regist_yes>예약가능</span> -->
            </td>
           	</tr>
           	<tr>
            <td align="center" colspan="2">
            	<table border="0" width="97%" cellpadding="0" cellspacing="0">
	            <tr>
	            <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
	            <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
	            <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
	            </tr>
	            </table>
	        </td>
           	</tr>
         	</table>
		</td>
<%
					count += 1;
					dispDay += 1;
				}
				else
				{
%>					
		<td bgcolor="white" align="center">
			<table border="0" width="97%" cellpadding="0" cellspacing="0">
           	<tr>
            <td height="20" width="35"><span class=day></span></td>
            <td height="20" align="center" width="65"></span></td>
           	</tr>
           	<tr>
            <td align="center" colspan="2">
            	<table border="0" width="97%" cellpadding="0" cellspacing="0">
	            <tr>
	            <td align="center" height="20"></td>
	            <td align="center"></td>
	            <td align="center"></td>
	            </tr>
	            </table>
	        </td>
           	</tr>
         	</table>
		</td>
<%
				} 
			}
       } 
%>
</tr>
<% 
}
%>
</table>
</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" width="745" cellpadding="2" cellspacing="1" bgcolor="#D1D3D4" height="50">
        <tr>
          <td bgcolor="#F1F1F1" align="center" height="19" width="40">날짜</td>
          <td bgcolor="#F1F1F1" align="center" height="19" width="161">코스선택 </td>
          <td bgcolor="#F1F1F1" align="center" height="19" width="134">시간선택</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="112">정상가</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="95">할인가</td>
          <td width="95" height="19" align="center" bgcolor="#F1F1F1">
          	<img align="absmiddle" src="../../images/inc/btn_plus.gif" width="32" height="16" border="0">
          	<img src="../../images/inc/btn_del2.gif" width="32" height="16" border="0" align="absmiddle">
          	<img align="absmiddle" src="../../images/inc/btn_save.gif" width="32" height="16" border="0">
		  </td>
        </tr>
        <tr>
          <td bgcolor="white" align="center" width="40"> 7/3</td>
          <td bgcolor="white" align="center">
          	<select name="formselect1" size="1">
            	<option>선택하세요</option>
            </select>
          </td>
          <td bgcolor="white" align="center">
          	<select id=course1_hour name=course1_hour>
              <option selected value=0>0</option>
              <option value=1>1</option>
              <option value=2>2</option>
              <option value=3>3</option>
              <option value=4>4</option>
              <option value=5>5</option>
              <option value=6>6</option>
              <option value=7>7</option>
              <option value=8>8</option>
              <option value=9>9</option>
              <option value=10>10</option>
              <option value=11>11</option>
              <option value=12>12</option>
              <option value=13>13</option>
              <option value=14>14</option>
              <option value=15>15</option>
              <option value=16>16</option>
              <option value=17>17</option>
              <option value=18>18</option>
              <option value=19>19</option>
              <option value=20>20</option>
              <option value=21>21</option>
              <option value=22>22</option>
              <option value=23>23</option>
            </select>
                 	 시
            <select id=course1_minute name=course1_minute>
              <option selected value=0>0</option>
              <option value=1>1</option>
              <option value=2>2</option>
              <option value=3>3</option>
              <option value=4>4</option>
              <option value=5>5</option>
              <option value=6>6</option>
              <option value=7>7</option>
              <option value=8>8</option>
              <option value=9>9</option>
              <option value=10>10</option>
              <option value=11>11</option>
              <option value=12>12</option>
              <option value=13>13</option>
              <option value=14>14</option>
              <option value=15>15</option>
              <option value=16>16</option>
              <option value=17>17</option>
              <option value=18>18</option>
              <option value=19>19</option>
              <option value=20>20</option>
              <option value=21>21</option>
              <option value=22>22</option>
              <option value=23>23</option>
              <option value=24>24</option>
              <option value=25>25</option>
              <option value=26>26</option>
              <option value=27>27</option>
              <option value=28>28</option>
              <option value=29>29</option>
              <option value=30>30</option>
              <option value=31>31</option>
              <option value=32>32</option>
              <option value=33>33</option>
              <option value=34>34</option>
              <option value=35>35</option>
              <option value=36>36</option>
              <option value=37>37</option>
              <option value=38>38</option>
              <option value=39>39</option>
              <option value=40>40</option>
              <option value=41>41</option>
              <option value=42>42</option>
              <option value=43>43</option>
              <option value=44>44</option>
              <option value=45>45</option>
              <option value=46>46</option>
              <option value=47>47</option>
              <option value=48>48</option>
              <option value=49>49</option>
              <option value=50>50</option>
              <option value=51>51</option>
              <option value=52>52</option>
              <option value=53>53</option>
              <option value=54>54</option>
              <option value=55>55</option>
              <option value=56>56</option>
              <option value=57>57</option>
              <option value=58>58</option>
              <option value=59>59</option>
            </select>분
            </td>
            <td align="center" bgcolor="white"><input class="input_box" size="10" id="courseN" name="courseN"></td>
            <td align="center" bgcolor="white"><input class="input_box" size="10" id="courseS" name="courseS"></td>
            <td align="center" bgcolor="white"><input type="checkbox" id="timeItem" name="timeItems" /></td>            
            </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><img align="absmiddle" src="../../images/inc/btn_regist2.gif" width="74" height="26" border="0"></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="bottom"><a href="javascript:self.close();"><img align="absmiddle" src="../../images/inc/btn_del.gif" width="13" height="14" border="0"></a></td>
  </tr>
</table>
</body>
</html>