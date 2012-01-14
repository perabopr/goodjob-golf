<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.conf.Config"%>
<%@page import="com.goodjob.product.PackageDao"%>
<%@page import="com.goodjob.product.dto.PackagePriceDto"%>
<%@page import="com.goodjob.product.dto.PackageDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String up_dir = Config.get("reserve_dir");
	
	FileUpload fileUpload = new FileUpload(request, up_dir, 1024*1024*5);

	//Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();
	
	String upfile0 = fileUpload.getParameter("txtimg0");
	String upfile1 = fileUpload.getParameter("txtimg1");
	String upfile2 = fileUpload.getParameter("txtimg2");
	String upfile3 = fileUpload.getParameter("txtimg3");
	String upfile4 = fileUpload.getParameter("txtimg4");
	
	if(fileMap.get("img0") != null){
		upfile0 = (String)fileMap.get("img0");
	}
	if(fileMap.get("img1") != null){
		upfile1 = (String)fileMap.get("img1");
	}
	if(fileMap.get("img2") != null){
		upfile2 = (String)fileMap.get("img2");
	}
	if(fileMap.get("img3") != null){
		upfile3 = (String)fileMap.get("img3");
	}
	if(fileMap.get("img4") != null){
		upfile4 = (String)fileMap.get("img4");
	}
	
	PackageDto pkDto = new PackageDto();
	if(!fileUpload.getParameter("pkSeq").equals("0")){
		pkDto.setPackage_seq(Integer.parseInt(fileUpload.getParameter("pkSeq")));
	}
	pkDto.setMenu_seq(Integer.parseInt(fileUpload.getParameter("menuSeq")));
	pkDto.setPackage_name1(fileUpload.getParameter("package_name1"));
	pkDto.setPackage_type(fileUpload.getParameter("package_type"));	
	pkDto.setRegion_seq(Integer.parseInt(fileUpload.getParameter("regionseq")));
	pkDto.setSaledate_start(fileUpload.getParameter("saleDateStart"));
	pkDto.setSaledate_end(fileUpload.getParameter("saleDateEnd"));
	pkDto.setImg_sub(upfile0);
	pkDto.setImg_sub1(upfile1);
	pkDto.setImg_sub2(upfile2);
	pkDto.setImg_sub3(upfile3);
	pkDto.setImg_sub4(upfile4);
	pkDto.setPoint_x(fileUpload.getParameter("pointx"));
	pkDto.setPoint_y(fileUpload.getParameter("pointy"));
	pkDto.setView_yn(fileUpload.getParameter("rdbView"));
	pkDto.setPackage_guide(fileUpload.getParameter("content1"));
	pkDto.setUse_guide(fileUpload.getParameter("content2"));
	pkDto.setGolflink_guide(fileUpload.getParameter("content3"));
	pkDto.setUse_rule(fileUpload.getParameter("content4"));
	pkDto.setUserinfo_terms(fileUpload.getParameter("content5"));
	pkDto.setWay_map(fileUpload.getParameter("content6"));
	
	PackagePriceDto pkpDto = new PackagePriceDto();
	if(!fileUpload.getParameter("pkSeq").equals("0")){
		pkpDto.setPackage_seq(Integer.parseInt(fileUpload.getParameter("pkSeq")));
	}
	pkpDto.setPeak_n_mon(0);
	pkpDto.setPeak_s_mon(0);
	pkpDto.setOff_n_mon(Integer.parseInt(fileUpload.getParameter("price_on_mon")));
	pkpDto.setOff_s_mon(0);
	pkpDto.setPeak_n_tue(0);
	pkpDto.setPeak_s_tue(0);
	pkpDto.setOff_n_tue(Integer.parseInt(fileUpload.getParameter("price_on_tue")));
	pkpDto.setOff_s_tue(0);
	pkpDto.setPeak_n_wed(0);
	pkpDto.setPeak_s_wed(0);
	pkpDto.setOff_n_wed(Integer.parseInt(fileUpload.getParameter("price_on_wed")));
	pkpDto.setOff_s_wed(0);
	pkpDto.setPeak_n_thu(0);
	pkpDto.setPeak_s_thu(0);
	pkpDto.setOff_n_thu(Integer.parseInt(fileUpload.getParameter("price_on_thu")));
	pkpDto.setOff_s_thu(0);
	pkpDto.setPeak_n_fri(0);
	pkpDto.setPeak_s_fri(0);
	pkpDto.setOff_n_fri(Integer.parseInt(fileUpload.getParameter("price_on_fri")));
	pkpDto.setOff_s_fri(0);
	pkpDto.setPeak_n_sat(0);
	pkpDto.setPeak_s_sat(0);
	pkpDto.setOff_n_sat(Integer.parseInt(fileUpload.getParameter("price_on_sat")));
	pkpDto.setOff_s_sat(0);
	pkpDto.setPeak_n_sun(0);
	pkpDto.setPeak_s_sun(0);
	pkpDto.setOff_n_sun(Integer.parseInt(fileUpload.getParameter("price_on_sun")));
	pkpDto.setOff_s_sun(0);
	
	PackageDao pkDao = new PackageDao();
	if(!fileUpload.getParameter("pkSeq").equals("0")){//수정
		pkDao.setPackageUpdate(pkDto);
		pkDao.setPackagePriceDelete(pkpDto);
		pkpDto.setPackage_seq(Integer.parseInt(fileUpload.getParameter("pkSeq")));
		pkDao.setPackagePriceInsert(pkpDto);
	}else{//추가
		pkDao.setPackageInsert(pkDto, pkpDto);
	}
	
	try{
		response.sendRedirect("./package_foreign_list.jsp?pkSeq=" + fileUpload.getParameter("pkSeq"));
	}catch(Exception e){}
%>