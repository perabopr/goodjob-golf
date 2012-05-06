<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@page import="com.goodjob.product.dto.ProductSubSiteDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.product.dto.ProductSubDto"%>
<%@ page import="com.goodjob.product.productDao"%>
<%
String menuSeq = request.getParameter("menuseq");
String prdtSeq = request.getParameter("prdtseq");
String glSeq = request.getParameter("glseq");
String backYear = request.getParameter("cpYear");
String backMonth = request.getParameter("cpMonth");
String siteSeqs = request.getParameter("siteSeqs");
String[] arrSiteSeqs =siteSeqs.split(",");

if(request.getParameterValues("pdsubseq") != null && request.getParameterValues("course_list") != null
		&& request.getParameterValues("course_hour") != null && request.getParameterValues("course_minute") != null
		&& request.getParameterValues("courseN") != null && request.getParameterValues("courseS") != null
		&& request.getParameterValues("prdtStatus") != null){
	String arrPrdtSubSeq[] = request.getParameterValues("pdsubseq");
	String arrCourse[] = request.getParameterValues("course_list");
	String arrHour[] = request.getParameterValues("course_hour");
	String arrMin[] = request.getParameterValues("course_minute");	
	String arrNorPrice[] = request.getParameterValues("courseN");
	String arrSalePrice[] = request.getParameterValues("courseS");
	String arrPrdtStatus[] = request.getParameterValues("ddl_prdtStatus");
	String arrCouponUse[] = request.getParameterValues("ddl_couponUse");
	String arrNHPrice[] = request.getParameterValues("courseNH");
	String arrCalcNHPrice[] = request.getParameterValues("courseNH_calc");
	
	
	productDao pd = new productDao();
	String pdsubseqs = "'";
	for(int i = 0; i < arrPrdtSubSeq.length;i++){
		if(arrPrdtSubSeq[i].length() > 0){
			pdsubseqs += arrPrdtSubSeq[i] +"','";	
		}
	}
	if(pdsubseqs.length() > 3){
		pdsubseqs = pdsubseqs.substring(0, pdsubseqs.length()-3);
	}
	pdsubseqs += "'";
	
	ProductSubDto pdsd = new ProductSubDto();
	pdsd.setProduct_seq(Integer.parseInt(prdtSeq));
	pdsd.setProductsub_seqs(pdsubseqs);
	pd.setProductSubDelete(pdsd);

	for(int i = 0; i < arrPrdtSubSeq.length;i++){
		if(arrNorPrice[i].trim().length() == 0){
			continue;
		}
		ProductSubDto pdsd2 = new ProductSubDto();
		pdsd2.setProduct_seq(Integer.parseInt(prdtSeq));
		pdsd2.setGolflink_course_seq(Integer.parseInt(arrCourse[i]));
		pdsd2.setTime_start(arrHour[i]+arrMin[i]);
		pdsd2.setTime_end("");
		pdsd2.setGoodjob_price(Integer.parseInt(arrNorPrice[i]));
		pdsd2.setNH_price(Integer.parseInt(arrSalePrice[i]));
		pdsd2.setReal_nh_price(Integer.parseInt(arrNHPrice[i]));
		pdsd2.setProduct_status(arrPrdtStatus[i]);
		pdsd2.setCoupon_use_yn(arrCouponUse[i]);
		
		int prdtsubseqprice = 0;
		if(arrPrdtSubSeq[i].length() > 0 && arrNorPrice[i].trim().length() > 0){//수정
			prdtsubseqprice = Integer.parseInt(arrPrdtSubSeq[i]);
			pdsd2.setProductsub_seq(Integer.parseInt(arrPrdtSubSeq[i]));
			pd.setProductSubUpdate(pdsd2);					
		}else if(arrPrdtSubSeq[i].length() == 0 ){//추가
			prdtsubseqprice = pd.setProductSubInsert(pdsd2);
		}
		
		for(int k = 0; k < arrSiteSeqs.length;k++){
			String[] arrPrice1 = request.getParameterValues("sitePriceN"+arrSiteSeqs[k]);
			String[] arrPrice2 = request.getParameterValues("sitePriceS"+arrSiteSeqs[k]);
			String[] arrPrice3 = request.getParameterValues("sitePriceP"+arrSiteSeqs[k]);
			
			int a = NumberUtils.toInt(arrPrice1[i], 0);
			int b = NumberUtils.toInt(arrPrice2[i], 0);
			int c = NumberUtils.toInt(arrPrice3 != null ? arrPrice3[i] : "0", 0);
			
			ProductSubSiteDto pssDto = new ProductSubSiteDto();
			pssDto.setProductsub_seq(prdtsubseqprice);
			pssDto.setSite_seq(Integer.parseInt(arrSiteSeqs[k]));
			pssDto.setPrice1(a);
			pssDto.setPrice2(b);
			pssDto.setPrice3(c);
			
			pd.setProductSubSiteDelete(pssDto);
			pd.setProductSubSiteInsert(pssDto);
		}
		
		//out.println(pdsd2.getProductsub_seq());
		//out.println(pdsd2.getProduct_seq());
		//out.println(pdsd2.getGolflink_course_seq());
		//out.println(pdsd2.getTime_start());
		//out.println(pdsd2.getTime_end());
		//out.println(pdsd2.getGoodjob_price());
		//out.println(pdsd2.getNH_price());
		//out.println(pdsd2.getProduct_status());
		//out.print("<br>");
		
	}
	pd.setProductUpdate(Integer.parseInt(prdtSeq), "Y");
}else{
	
}

out.print("<script type='text/javascript'>");
out.print("alert('등록했습니다.');");
out.print("location.href='pop_real_time_reg.jsp?menuseq=" + menuSeq + "&glseq=" + glSeq + "&month=" + backMonth + "&year=" + backYear + "&action=0'");
out.print("</script>");

%>