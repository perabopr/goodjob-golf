<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ 
page import="com.goodjob.product.dto.ProductSubSiteDto"%><%@ 
page import="com.goodjob.product.dto.MonthPriceDto"%><%@ 
page import="com.goodjob.product.MonthPriceDao"%><%@ 
page import="org.apache.commons.dbutils.*" %><%@ 
page import="org.apache.commons.lang.StringUtils"%><%@ 
page import="java.sql.*,java.util.*" %><%@ 
page import="org.apache.commons.dbutils.handlers.*" %><%@ 
page import="com.goodjob.product.dto.ProductDto"%><%@ 
page import="com.goodjob.product.dto.ProductSubDto"%><%@ 
page import="com.goodjob.product.productDao"%><%

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
String returnJson = "";

if(arrPrdtSub != null && arrPrdtSub.size() > 0){

	returnJson = "{\"ProductSub\":[";
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
		returnJson += "\"j\":\"" + arrPrdtSub.get(i).getReal_nh_price() + "\",";
	
		/**
		  * 싸이트 가격 가져오기.
		*/
		List<ProductSubSiteDto> lstpss = pDao.getProductSubSite( arrPrdtSub.get(i).getProductsub_seq());
		String strSitePrice = "";
		for(int k = 0; k < lstpss.size();k++){
			strSitePrice += "{\"aa\":\"" + lstpss.get(k).getSite_seq() + "\",";
			strSitePrice += "\"bb\":\"" + lstpss.get(k).getPrice1() + "\",";
			strSitePrice += "\"cc\":\"" + lstpss.get(k).getPrice2() + "\",";
			strSitePrice += "\"dd\":\"" + lstpss.get(k).getPrice3() + "\"},";		
		}
		if(strSitePrice.length() > 0){
			strSitePrice = strSitePrice.substring(0, strSitePrice.length()-1);
		}
		returnJson += "\"k\":[" + strSitePrice + "]";
		returnJson += "},";
	}
	if(arrPrdtSub.size() > 0){
		returnJson = returnJson.substring(0, returnJson.length()-1);
	}
	returnJson += "]}";
}
else{
	
	int index = 2;
	String[] startTime = null;
	String[] endTime = null;
	String[] arrStartSec = null;
	String[] arrEndSec = null;
	
	if(NumberUtils.toInt(menuseq) == 1){	//실시간 일경우
		
		String[] tmpArr = {"0600","0600","0600","0600","1200","1200","1200","1200"};
	
		int seq = NumberUtils.toInt(golflinkseq, 0);
	
		if(seq == 3){				//양평 TPC  8 EA
			index = 8;
		} else if(seq == 4){		//포레스트힐   6 EA
			index = 6;
		} else if(seq == 17){		//남양주 2 EA
			index = 2;
		} else if(seq == 18){		//레이크힐스안성 5 EA
			index = 5;
		} else if(seq == 54){		//필로스 4 EA
			index = 4;
		} else if(seq == 19){		//홍천 CC 4 EA
			index = 4;
		} else if(seq == 25){		//옥스필드 2 EA
			index = 2;
		} else if(seq == 1){		//대영베이스 CC 8 EA
			index = 8;
		} else if(seq == 2){		//대영힐스 CC 8 EA
			index = 8;
		} else if(seq == 49){		//파나시아 GC 2 EA
			index = 2;
		} else if(seq == 52){		//상떼힐 CC 4 EA
			index = 4;
		} else if(seq == 20){		//한맥 CC 4 EA
			index = 4;
		} else if(seq == 53){		//베네치아 CC 4 EA
			index = 4;
		} else {
			index = 0;
		}
		
		startTime = new String[index];
		endTime = new String[index];
		
		for(int i = 0 ; i < index ; i++){
			
			startTime[i] = tmpArr[i];
			endTime[i] = "0000";
		}
		
	}
	else{
		startTime = new String[2];
		endTime = new String[2];
		
		startTime[0] = "0600";
		startTime[1] = "1100";
		endTime[0] = "1000";
		endTime[1] = "1500";
	}
	
	/**
	 *메뉴골프장월별 - 가격가져오기.
	 */
	MonthPriceDao mPriceDao = new MonthPriceDao();
	MonthPriceDto mPriceDto = new MonthPriceDto();
	mPriceDto.setMenu_seq(Integer.parseInt(menuseq));
	mPriceDto.setService_seq(Integer.parseInt(golflinkseq));
	mPriceDto.setYearmonth(pYear+pMonth);
	List<MonthPriceDto> arrMPDto = mPriceDao.getMonthPrice(mPriceDto);
	
	int mIndex = 0;
	if(arrMPDto != null) mIndex = arrMPDto.size();
	int[] arrPrice = {0,0,0,0};
	
	if(arrMPDto != null && arrMPDto.size() > 1){
		arrPrice[0] = arrMPDto.get(0).getPrice1();
		arrPrice[1] = arrMPDto.get(0).getPrice2();
		
		//System.out.println(arrMPDto.get(1).getSite_seq());
		//System.out.println(arrMPDto.get(1).getPrice1());
		//System.out.println(arrMPDto.get(1).getPrice2());
		
		arrPrice[2] = arrMPDto.get(1).getPrice1();
		arrPrice[3] = arrMPDto.get(1).getPrice2();
	}
	else if(arrMPDto != null && arrMPDto.size() > 0){
		arrPrice[0] = arrMPDto.get(0).getPrice1();
		arrPrice[1] = arrMPDto.get(0).getPrice2();
	}
	
	String strSitePrice = "";
	
	//System.out.println("mIndex : "+mIndex);
	
	int[][] sitePrice = null;
	if(mIndex >= 3){
		sitePrice = new int[3][mIndex - 2];
		
		for(int ii = 2 ; ii < mIndex ; ii++){
			sitePrice[0][ii-2] = arrMPDto.get(ii).getPrice1();
			sitePrice[1][ii-2] = arrMPDto.get(ii).getPrice2();
			sitePrice[2][ii-2] = arrMPDto.get(ii).getPrice3();
		}
	}
	else{
		sitePrice = new int[3][1];
		sitePrice[0][0] = 0;
		sitePrice[1][0] = 0;
		sitePrice[2][0] = 0;
	}
	
	returnJson = "{\"ProductSub\":[";
	for(int i = 0; i < index ;i++){
		
		returnJson += "{";
		returnJson += "\"a\":\"\",";
		returnJson += "\"b\":\"\",";
		
		if("1".equals(menuseq))
			returnJson += "\"c\":\"\",";
		else
			returnJson += "\"c\":\"26\",";
		
		returnJson += "\"d\":\""+startTime[i]+"\",";
		returnJson += "\"e\":\""+endTime[i]+"\",";
		
		returnJson += "\"f\":\""+arrPrice[0]+"\",";
		returnJson += "\"g\":\""+arrPrice[1]+"\",";
		returnJson += "\"h\":\"0\",";
		returnJson += "\"i\":\"1\",";
		returnJson += "\"j\":\"0\",";
		
		strSitePrice = "";
		int aa = mIndex;
		for(int k = 0; k < mIndex - 2 ;k++){
			strSitePrice += "{\"aa\":\""+(aa-k)+"\",";
			strSitePrice += "\"bb\":\""+sitePrice[0][k]+"\",";
			strSitePrice += "\"cc\":\""+sitePrice[1][k]+"\",";
			strSitePrice += "\"dd\":\""+sitePrice[2][k]+"\"},";
		}
		
		if(strSitePrice.length() > 0){
			strSitePrice = strSitePrice.substring(0, strSitePrice.length()-1);
		}
		returnJson += "\"k\":[" + strSitePrice + "]";
		returnJson += "},";
	}
	returnJson = returnJson.substring(0, returnJson.length()-1);
	returnJson += "]}";
}
System.out.println(returnJson);
out.println(returnJson);%>