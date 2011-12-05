<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%
	String currMonth = StringUtils.trimToEmpty(request.getParameter("m"));
	if(currMonth.length() == 0 ){
		//currMonth = Now
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
    <td align="right" style="padding-right:20px;" height="35"><img src="../../images/inc/month_prev.gif" width="41" height="16" border="0" align="absmiddle"> &nbsp;<span class=month>7월</span> &nbsp;<img align="absmiddle" src="../../images/inc/month_next.gif" width="41" height="16" border="0"></td>
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
        <tr>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/1</span></td>
                <td height="20" align="center" width="65"><span class=regist_no>예약마감</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=saturday>7/2</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=sunday>7/3</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=saturday>7/2</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=sunday>7/3</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=saturday>7/2</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=sunday>7/3</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_no>예약마감</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=saturday>7/2</span></td>
                <td height="20" align="center" width="65"><span class=regist_no>예약마감</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=sunday>7/3</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=day>7/4</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=saturday>7/2</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td bgcolor="white" align="center"><table border="0" width="97%" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" width="35"><span class=sunday>7/3</span></td>
                <td height="20" align="center" width="65"><span class=regist_yes>예약가능</span></td>
              </tr>
              <tr>
                <td align="center" colspan="2"><table border="0" width="97%" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" height="20"><img align="absmiddle" src="../../images/inc/btn_day_close.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img align="absmiddle" src="../../images/inc/btn_day_rest.gif" width="28" height="16" border="0"></td>
                      <td align="center"><img src="../../images/inc/btn_edit3.gif" width="28" height="16" border="0" align="absmiddle"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
          <td bgcolor="white" align="center"></td>
        </tr>
      </table></td>
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
          <td width="95" height="19" align="center" bgcolor="#F1F1F1">&nbsp;</td>
          <td align="center" bgcolor="#F1F1F1" height="19" width="72"></td>
        </tr>
        <tr>
          <td bgcolor="white" align="center" width="40"> 7/3</td>
          <td bgcolor="white" align="center" width="617" colspan="5"><table width="100%" cellpadding="0" cellspacing="0" bgcolor="#D1D3D4">
              <tr>
                <td bgcolor="white" align="center" width="164"><select name="formselect1" size="1">
                    <option>선택하세요</option>
                  </select></td>
                <td bgcolor="white" align="center" width="137"><select id=course1_hour name=course1_hour>
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
                    <option 
value=12>12</option>
                    <option value=13>13</option>
                    <option value=14>14</option>
                    <option value=15>15</option>
                    <option value=16>16</option>
                    <option 
value=17>17</option>
                    <option value=18>18</option>
                    <option value=19>19</option>
                    <option value=20>20</option>
                    <option value=21>21</option>
                    <option 
value=22>22</option>
                    <option value=23>23</option>
                  </select>
                  시
                  <select 
id=course1_minute name=course1_minute>
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
                    <option 
value=12>12</option>
                    <option value=13>13</option>
                    <option value=14>14</option>
                    <option value=15>15</option>
                    <option value=16>16</option>
                    <option 
value=17>17</option>
                    <option value=18>18</option>
                    <option value=19>19</option>
                    <option value=20>20</option>
                    <option value=21>21</option>
                    <option 
value=22>22</option>
                    <option value=23>23</option>
                    <option value=24>24</option>
                    <option value=25>25</option>
                    <option value=26>26</option>
                    <option 
value=27>27</option>
                    <option value=28>28</option>
                    <option value=29>29</option>
                    <option value=30>30</option>
                    <option value=31>31</option>
                    <option 
value=32>32</option>
                    <option value=33>33</option>
                    <option value=34>34</option>
                    <option value=35>35</option>
                    <option value=36>36</option>
                    <option 
value=37>37</option>
                    <option value=38>38</option>
                    <option value=39>39</option>
                    <option value=40>40</option>
                    <option value=41>41</option>
                    <option 
value=42>42</option>
                    <option value=43>43</option>
                    <option value=44>44</option>
                    <option value=45>45</option>
                    <option value=46>46</option>
                    <option 
value=47>47</option>
                    <option value=48>48</option>
                    <option value=49>49</option>
                    <option value=50>50</option>
                    <option value=51>51</option>
                    <option 
value=52>52</option>
                    <option value=53>53</option>
                    <option value=54>54</option>
                    <option value=55>55</option>
                    <option value=56>56</option>
                    <option 
value=57>57</option>
                    <option value=58>58</option>
                    <option 
value=59>59</option>
                  </select>
                  분</td>
                <td align="center" bgcolor="white" width="118"><input class="input_box" size="10" name="course"></td>
                <td align="center" bgcolor="white" width="110"><input class="input_box" size="10" name="course"></td>
                <td align="center" bgcolor="white" width="42"><img align="absmiddle" src="../../images/inc/btn_plus.gif" width="32" height="16" border="0"></td>
                <td width="46" align="center" bgcolor="white"><img src="../../images/inc/btn_del2.gif" width="32" height="16" border="0" align="absmiddle"></td>
              </tr>
            </table></td>
          <td width="72" align="center" bgcolor="white"><p><img align="absmiddle" src="../../images/inc/btn_save.gif" width="32" height="16" border="0"></p></td>
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