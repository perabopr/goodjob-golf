<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.dto.ProductDto"%>
<%@ page import="com.goodjob.product.productDao"%>
<%
String menuseq = request.getParameter("mnseq");
String golflinkseq = request.getParameter("glseq");
String pDate = StringUtils.trimToEmpty(request.getParameter("date"));
String[] arrDate = pDate.split("/");
String pYear = arrDate[0];
String pMonth = arrDate[1];
String pDay = arrDate[2];


ProductDto prdtDto = new ProductDto();
prdtDto.setMenu_seq(Integer.parseInt(menuseq));
prdtDto.setGolflink_seq(Integer.parseInt(golflinkseq));
prdtDto.setProduct_year(pYear);
prdtDto.setProduct_month(pMonth);
prdtDto.setProduct_day(pDay);
prdtDto.setView_yn("Y");
productDao prdtDao = new productDao();

int idSeq = 0;
List<ProductDto> list = prdtDao.getProductSelectDate(prdtDto);
if(list.size() == 0){
	idSeq = prdtDao.setProductInsert(prdtDto);
}

String returnJson = "{\"Product\":[";
returnJson += "{";
returnJson += "\"a\":\"" + idSeq + "\",";
returnJson += "\"b\":\"" + pYear + pMonth + pDay + "\"";
returnJson += "}";
returnJson += "]}";
out.println(returnJson);%>