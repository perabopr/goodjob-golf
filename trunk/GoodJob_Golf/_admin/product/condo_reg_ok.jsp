<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.conf.Config"%>
<%@page import="com.goodjob.reserve.CondoDao"%>
<%@page import="com.goodjob.reserve.dto.CondoDto"%>
<%@page import="com.goodjob.reserve.dto.CondoGalleryDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

	String up_dir = Config.get("reserve_dir");
	
	FileUpload fileUpload = new FileUpload(request, up_dir, 1024*1024*5);

	Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();
	
	String upfilemain = fileMap.get("txtimgmain");
	if(fileMap.get("imgmain") != null){
		upfilemain = (String)fileMap.get("imgmain");
	}
	
	int idSeq = 0;
	CondoDto cDto = new CondoDto();
	if(paramMap.get("condoSeq").length() > 0){
		idSeq = Integer.parseInt(paramMap.get("condoSeq"));
		cDto.setCondo_seq(idSeq);
	}
	cDto.setCondo_name(paramMap.get("condoname"));
	cDto.setRegion_seq(Integer.parseInt(paramMap.get("ddl_region")));
	cDto.setSaledate_start(paramMap.get("saleDateStart"));
	cDto.setSaledate_end(paramMap.get("saleDateEnd"));
	cDto.setImg_main(paramMap.get("upfilemain"));
	cDto.setAddress1(paramMap.get("address1"));
	cDto.setAddress2(paramMap.get("address2"));
	cDto.setPoint_x(paramMap.get("pointx"));
	cDto.setPoint_y(paramMap.get("pointy"));
	cDto.setView_yn(paramMap.get("rdbView"));
	cDto.setReserve_start(paramMap.get("ReserveDateStart"));
	cDto.setReserve_end(paramMap.get("ReserveDateEnd"));
	cDto.setCondo_info(paramMap.get("content1"));
	cDto.setWay_map(paramMap.get("content2"));
	cDto.setEdit_rule(paramMap.get("content3"));
	
	CondoDao cDao = new CondoDao();
	if(idSeq > 0){//수정
		cDao.setCondoUpdate(cDto);
	}else{//추가
		idSeq = cDao.setCondoInsert(cDto);
	}
	

	String imgseq1 = paramMap.get("condoimgseq1");
	String upfilegallery1 = paramMap.get("condoimg1");
	if(fileMap.get("imggallery1") != null){
		upfilegallery1 = (String)fileMap.get("imggallery1");
	}
	
	CondoGalleryDto cgDto1 = new CondoGalleryDto();
	cgDto1.setCondo_seq(idSeq);
	cgDto1.setCondo_img(upfilegallery1);

	if(imgseq1.length() > 0){	//수정
		cgDto1.setCondoimg_seq(Integer.parseInt(imgseq1));
		cDao.setCondoGalleryUpdate(cgDto1);
	}else{//추가
		cDao.setCondoGalleryInsert(cgDto1);
	}
	
%>