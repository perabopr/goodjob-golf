<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.reserve.dto.RegionDto"%>
<%@ page import="com.goodjob.reserve.*" %>
<%@ page import="com.goodjob.reserve.dto.*" %>
<%@ page import="com.goodjob.db.*" %>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.conf.Config"%>
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
	
	String upfile0 = "";//(String)fileMap.get("img0");
	String upfile1 = fileUpload.getParameter("txtimg1");
	String upfile2 = fileUpload.getParameter("txtimg2");
	String upfile3 = fileUpload.getParameter("txtimg3");
	String upfile4 = fileUpload.getParameter("txtimg4");
	
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
	
	GolfLinkDto glDto = new GolfLinkDto();
	glDto.setMenu_seq(Integer.parseInt(fileUpload.getParameter("menuSeq")));
	if(fileUpload.getParameter("glSeq").length() > 0){
		glDto.setGolflink_seq(Integer.parseInt(fileUpload.getParameter("glSeq")));
	}
	glDto.setGolflink_name((String)fileUpload.getParameter("golflinkName"));
	glDto.setRegion_seq(Integer.parseInt(fileUpload.getParameter("regionSeq")));
	glDto.setHoll_type((String)fileUpload.getParameter("hollType"));
	glDto.setCourse_guide((String)fileUpload.getParameter("courseGuide"));
	glDto.setGolflink_address1((String)fileUpload.getParameter("address1"));
	glDto.setGolflink_address2((String)fileUpload.getParameter("address2"));
	glDto.setPoint_x(fileUpload.getParameter("pointx"));
	glDto.setPoint_y(fileUpload.getParameter("pointy"));
	glDto.setImg_main(upfile0);
	glDto.setImg_sub1(upfile1);
	glDto.setImg_sub2(upfile2);
	glDto.setImg_sub3(upfile3);
	glDto.setImg_sub4(upfile4);
	glDto.setCancel_term(fileUpload.getParameter("cancelterm"));
	
	glDto.setView_yn(fileUpload.getParameter("rdbView"));
	glDto.setCancel_rule(fileUpload.getParameter("content1"));
	glDto.setPromise_rule(fileUpload.getParameter("content2"));
	glDto.setUse_guide(fileUpload.getParameter("content3"));
	glDto.setGolflink_guide(fileUpload.getParameter("content4"));
	
	GolfLinkDao glDao = new GolfLinkDao();	
	int idSeq = 0;
	
	if(fileUpload.getParameter("glSeq").length() > 0){
		idSeq = glDto.getGolflink_seq();
		glDao.setGolfLinkUpdate(glDto);
		glDao.setGolfLinkPriceDelete(idSeq);
	}else{
		idSeq = glDao.setGolfLinkInsert(glDto);
	}
		
	for(int i = 1; i <= 2;i++){
		if(fileUpload.getParameter("priceN" + Integer.toString(i)).length() > 0){
			GolfLinkPriceDto glpDto1 = new GolfLinkPriceDto();
			glpDto1.setGolflink_seq(idSeq);
			glpDto1.setPrice_type(Integer.toString(i*2-1));
			glpDto1.setGolflink_price(Integer.parseInt(fileUpload.getParameter("priceN" + Integer.toString(i))));
			glDao.setGolfLinkPriceInsert(glpDto1);
		}
		if(fileUpload.getParameter("priceS" + Integer.toString(i)).length() > 0){
			GolfLinkPriceDto glpDto2 = new GolfLinkPriceDto();
			glpDto2.setGolflink_seq(idSeq);
			glpDto2.setPrice_type(Integer.toString(i*2));
			glpDto2.setGolflink_price(Integer.parseInt(fileUpload.getParameter("priceS" + Integer.toString(i))));
			glDao.setGolfLinkPriceInsert(glpDto2);
		}
	}
	
	try{
		response.sendRedirect("./real_list.jsp?menu=" + fileUpload.getParameter("menuSeq"));
	}catch(Exception e){}
%>
</body>
</html>