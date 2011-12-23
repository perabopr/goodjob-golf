<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.conf.Config"%>
<%@page import="com.goodjob.product.CondoDao"%>
<%@page import="com.goodjob.product.dto.CondoDto"%>
<%@page import="com.goodjob.product.dto.CondoGalleryDto"%>
<%@page import="com.goodjob.product.dto.CondoRoomDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

	String up_dir = Config.get("reserve_dir");
	
	FileUpload fileUpload = new FileUpload(request, up_dir, 1024*1024*5);

	//Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();
	
	String upfilemain = fileUpload.getParameter("txtimgmain");
	if(fileMap.get("imgmain") != null){
		upfilemain = (String)fileUpload.getParameter("imgmain");
	}
	
	int idSeq = 0;
	CondoDto cDto = new CondoDto();
	if(fileUpload.getParameter("condoSeq").length() > 0){
		idSeq = Integer.parseInt(fileUpload.getParameter("condoSeq"));
		cDto.setCondo_seq(idSeq);
	}
	cDto.setCondo_name(fileUpload.getParameter("condoname"));
	cDto.setRegion_seq(Integer.parseInt(fileUpload.getParameter("ddl_region")));
	cDto.setSaledate_start(fileUpload.getParameter("saleDateStart"));
	cDto.setSaledate_end(fileUpload.getParameter("saleDateEnd"));
	cDto.setImg_main(fileUpload.getParameter("upfilemain"));
	cDto.setAddress1(fileUpload.getParameter("address1"));
	cDto.setAddress2(fileUpload.getParameter("address2"));
	cDto.setPoint_x(fileUpload.getParameter("pointx"));
	cDto.setPoint_y(fileUpload.getParameter("pointy"));
	cDto.setView_yn(fileUpload.getParameter("rdbView"));
	cDto.setReserve_start(fileUpload.getParameter("ReserveDateStart"));
	cDto.setReserve_end(fileUpload.getParameter("ReserveDateEnd"));
	cDto.setCondo_info(fileUpload.getParameter("content1"));
	cDto.setDetail_info(fileUpload.getParameter("content2"));
	cDto.setWay_map(fileUpload.getParameter("content3"));
	
	CondoDao cDao = new CondoDao();
	if(idSeq > 0){//수정
		cDao.setCondoUpdate(cDto);
	}else{//추가
		idSeq = cDao.setCondoInsert(cDto);
	}
	
	//** 객실
	for(int i = 1;i < 11;i++){
		String condoroomseq = StringUtils.trimToEmpty(fileUpload.getParameter("condoroomseq" +i));
		String roomtype = StringUtils.trimToEmpty(fileUpload.getParameter("roomtype" +i));
		String price1N = StringUtils.trimToEmpty(fileUpload.getParameter("price1N" +i));
		if(price1N.length()==0){price1N = "0";}
		String price2N = StringUtils.trimToEmpty(fileUpload.getParameter("price2N" +i));
		if(price2N.length()==0){price2N = "0";}
		String price3N = StringUtils.trimToEmpty(fileUpload.getParameter("price3N" +i));
		if(price3N.length()==0){price3N = "0";}
		String price1S = StringUtils.trimToEmpty(fileUpload.getParameter("price1S" +i));
		if(price1S.length()==0){price1S = "0";}
		String price2S = StringUtils.trimToEmpty(fileUpload.getParameter("price2S" +i));
		if(price2S.length()==0){price2S = "0";}
		String price3S = StringUtils.trimToEmpty(fileUpload.getParameter("price3S" +i));
		if(price3S.length()==0){price3S = "0";}

		CondoRoomDto crDto = new CondoRoomDto();
		crDto.setCondo_seq(idSeq);
		crDto.setRoomtype(roomtype);
		crDto.setPrice_n1(Integer.parseInt(price1N));
		crDto.setPrice_n2(Integer.parseInt(price2N));
		crDto.setPrice_n3(Integer.parseInt(price3N));
		crDto.setPrice_s1(Integer.parseInt(price1S));
		crDto.setPrice_s2(Integer.parseInt(price2S));
		crDto.setPrice_s3(Integer.parseInt(price3S));
		if(condoroomseq.length() > 0){	//수정
			crDto.setCondoroom_seq(Integer.parseInt(condoroomseq));
			cDao.setCondoRoomUpdate(crDto);
		}else{	//추가
			if(roomtype.length()>0){
				cDao.setCondoRoomInsert(crDto);
			}
		}
	}
	
	//** 이미지갤러리
	for(int i = 1; i < 6;i++){
		String imgseq = StringUtils.trimToEmpty(fileUpload.getParameter("condoimgseq"+i));		
		String upfilegallery = StringUtils.trimToEmpty(fileUpload.getParameter("condoimg"+i));
		if(fileMap.get("imggallery" + i) != null){
			upfilegallery = (String)fileMap.get("imggallery" + i);
		}
		
		CondoGalleryDto cgDto = new CondoGalleryDto();
		cgDto.setCondo_seq(idSeq);
		cgDto.setCondo_img(upfilegallery);
	
		if(imgseq.length() > 0){	//수정
			cgDto.setCondoimg_seq(Integer.parseInt(imgseq));
			cDao.setCondoGalleryUpdate(cgDto);
		}else{//추가
			cDao.setCondoGalleryInsert(cgDto);
		}
	}

	try{
		response.sendRedirect("./condo_list.jsp");
	}catch(Exception e){}
%>