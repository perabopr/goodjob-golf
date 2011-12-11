<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.conf.Config"%>
<%@page import="com.goodjob.reserve.PackageDao"%>
<%@page import="com.goodjob.reserve.dto.PackagePriceDto"%>
<%@page import="com.goodjob.reserve.dto.PackageDto"%>
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

	Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();
	
	String upfile0 = fileMap.get("txtimg0");
	String upfile1 = fileMap.get("txtimg1");
	String upfile2 = fileMap.get("txtimg2");
	String upfile3 = fileMap.get("txtimg3");
	String upfile4 = fileMap.get("txtimg4");
	
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
	if(paramMap.get("pkSeq").length() > 0){
		pkDto.setPackage_seq(Integer.parseInt(paramMap.get("pkSeq")));
	}
	pkDto.setPackage_name1(paramMap.get("package_name1"));
	pkDto.setPackage_name2(paramMap.get("package_name2"));
	pkDto.setRegion_seq(Integer.parseInt(paramMap.get("regionseq")));
	pkDto.setImg_sub(upfile0);
	pkDto.setImg_sub1(upfile1);
	pkDto.setImg_sub2(upfile2);
	pkDto.setImg_sub3(upfile3);
	pkDto.setImg_sub4(upfile4);
	pkDto.setAddress1(paramMap.get("address1"));
	pkDto.setAddress2(paramMap.get("address2"));
	pkDto.setPoint_x(Integer.parseInt(paramMap.get("pointx")));
	pkDto.setPoint_y(Integer.parseInt(paramMap.get("pointy")));
	pkDto.setView_yn(paramMap.get("rdbView"));
	pkDto.setPackage_guide(paramMap.get("content1"));
	pkDto.setUse_guide(paramMap.get("content2"));
	pkDto.setGolflink_guide(paramMap.get("content3"));
	pkDto.setWay_map(paramMap.get("content4"));
	
	PackagePriceDto pkpDto = new PackagePriceDto();
	if(paramMap.get("pkSeq").length() > 0){
		pkpDto.setPackage_seq(Integer.parseInt(paramMap.get("pkSeq")));
	}
	pkpDto.setPeak_n_mon(Integer.parseInt(paramMap.get("price_pn_mon")));
	pkpDto.setPeak_s_mon(Integer.parseInt(paramMap.get("price_ps_mon")));
	pkpDto.setOff_n_mon(Integer.parseInt(paramMap.get("price_on_mon")));
	pkpDto.setOff_s_mon(Integer.parseInt(paramMap.get("price_os_mon")));
	pkpDto.setPeak_n_tue(Integer.parseInt(paramMap.get("price_pn_tue")));
	pkpDto.setPeak_s_tue(Integer.parseInt(paramMap.get("price_ps_tue")));
	pkpDto.setOff_n_tue(Integer.parseInt(paramMap.get("price_on_tue")));
	pkpDto.setOff_s_tue(Integer.parseInt(paramMap.get("price_os_tue")));
	pkpDto.setPeak_n_wed(Integer.parseInt(paramMap.get("price_pn_wed")));
	pkpDto.setPeak_s_wed(Integer.parseInt(paramMap.get("price_ps_wed")));
	pkpDto.setOff_n_wed(Integer.parseInt(paramMap.get("price_on_wed")));
	pkpDto.setOff_s_wed(Integer.parseInt(paramMap.get("price_os_wed")));
	pkpDto.setPeak_n_thu(Integer.parseInt(paramMap.get("price_pn_thu")));
	pkpDto.setPeak_s_thu(Integer.parseInt(paramMap.get("price_ps_thu")));
	pkpDto.setOff_n_thu(Integer.parseInt(paramMap.get("price_on_thu")));
	pkpDto.setOff_s_thu(Integer.parseInt(paramMap.get("price_os_thu")));
	pkpDto.setPeak_n_fri(Integer.parseInt(paramMap.get("price_pn_fri")));
	pkpDto.setPeak_s_fri(Integer.parseInt(paramMap.get("price_ps_fri")));
	pkpDto.setOff_n_fri(Integer.parseInt(paramMap.get("price_on_fri")));
	pkpDto.setOff_s_fri(Integer.parseInt(paramMap.get("price_os_fri")));
	pkpDto.setPeak_n_sat(Integer.parseInt(paramMap.get("price_pn_sat")));
	pkpDto.setPeak_s_sat(Integer.parseInt(paramMap.get("price_ps_sat")));
	pkpDto.setOff_n_sat(Integer.parseInt(paramMap.get("price_on_sat")));
	pkpDto.setOff_s_sat(Integer.parseInt(paramMap.get("price_os_sat")));
	pkpDto.setPeak_n_sun(Integer.parseInt(paramMap.get("price_pn_sun")));
	pkpDto.setPeak_s_sun(Integer.parseInt(paramMap.get("price_ps_sun")));
	pkpDto.setOff_n_sun(Integer.parseInt(paramMap.get("price_on_sun")));
	pkpDto.setOff_s_sun(Integer.parseInt(paramMap.get("price_os_sun")));
	
	PackageDao pkDao = new PackageDao();
	if(paramMap.get("pkSeq").length() > 0){//수정
		pkDao.setPackageUpdate(pkDto);
		pkDao.setPackagePriceDelete(pkpDto);
		pkpDto.setPackage_seq(Integer.parseInt(paramMap.get("pkSeq")));
		pkDao.setPackagePriceInsert(pkpDto);
	}else{//추가
		pkDao.setPackageInsert(pkDto, pkpDto);
	}
	
	try{
		response.sendRedirect("./package_list.jsp?pkSeq=" + paramMap.get("pkSeq"));
	}catch(Exception e){}
%>