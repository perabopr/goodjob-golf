<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<table cellpadding="0" cellspacing="0" width="749" bgcolor="#052B48">
  <tr>
    <td width="120"><img src="/images/common/img_search_title.gif" width="120" height="40" alt="골프장 빠른검색"></td>
    <td align="center" width="180"><select name="number"  onchange="f_select(this.selectedIndex);">
        <option value="">지역선택------------</option>
        <option value="1">전체보기</option>
        <option value="2">수도권</option>
        <option value="3">강원권</option>
        <option value="4">충청권</option>
        <option value="5">전라권</option>
        <option value="6">제주권</option>
      </select></td>
    <td width="175"><select name="number"  onchange="f_select(this.selectedIndex);">
        <option value="">항목선택-------------</option>
        <option value="1">전체보기</option>
        <option value="2">실시간부킹 골프장</option>
        <option value="3">사전신청 골프장</option>
        <option value="4">국내패키지</option>
        <option value="5">해외패키지</option>
      </select></td>
    <td width="198"><input class="input_01" type="text" size="28" name="day">
    <td width="76"><input type="image" name="formimage1" src="/images/common/btn_top_search.gif" width="52" height="22"></td>
  </tr>
</table>
