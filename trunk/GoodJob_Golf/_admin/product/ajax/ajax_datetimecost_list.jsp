<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="org.apache.commons.dbutils.*" %><%@ page import="org.apache.commons.lang.StringUtils"%><%@ page import="java.sql.*,java.util.*" %><%@ page import="org.apache.commons.dbutils.handlers.*" %><%@ page import="com.goodjob.product.dto.ProductDto"%><%@ page import="com.goodjob.product.dto.ProductSubDto"%><%@ page import="com.goodjob.product.productDao"%><% 
String menuseq = request.getParameter("mnseq");
String golflinkseq = request.getParameter("glseq");
String pDate = StringUtils.trimToEmpty(request.getParameter("date"));
String[] arrDate = pDate.split("/");
String pYear = arrDate[0];
String pMonth = arrDate[1];
String pDay = arrDate[2];

ProductDto pdDto = new ProductDto();
pdDto.setMenu_seq(Integer.parseInt(menuseq));
pdDto.setGolflink_seq(Integer.parseInt(golflinkseq));
pdDto.setProduct_year(pYear);
pdDto.setProduct_month(pMonth);
pdDto.setProduct_day(pDay);

productDao pDao = new productDao();
List<ProductSubDto> arrPrdtSub = pDao.getProductSubSelect(pdDto);

String returnJson = "{\"ProductSub\":[";

for(int i = 0; i < arrPrdtSub.size();i++){
	returnJson += "{";
	returnJson += "\"a\":\"" + arrPrdtSub.get(i).getProductsub_seq() + "\",";
	returnJson += "\"b\":\"" + arrPrdtSub.get(i).getProduct_seq() + "\",";
	returnJson += "\"c\":\"" + arrPrdtSub.get(i).getGolflink_course_seq() + "\",";
	returnJson += "\"d\":\"" + arrPrdtSub.get(i).getTime_start() + "\",";
	returnJson += "\"e\":\"" + arrPrdtSub.get(i).getTime_end() + "\",";
	returnJson += "\"f\":\"" + arrPrdtSub.get(i).getGoodjob_price() + "\",";
	returnJson += "\"g\":\"" + arrPrdtSub.get(i).getNH_price() + "\",";
	returnJson += "\"h\":\"" + arrPrdtSub.get(i).getProduct_status() + "\",";
	returnJson += "\"i\":\"" + arrPrdtSub.get(i).getCoupon_use_yn() + "\",";
	returnJson += "\"j\":\"" + arrPrdtSub.get(i).getReal_nh_price() + "\"";
	returnJson += "},";
}
if(arrPrdtSub.size() > 0){
	returnJson = returnJson.substring(0, returnJson.length()-1);
}
returnJson += "]}";
out.println(returnJson);%>