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

	Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = fileUpload.getParamAfterUpload();
	
	String upfile0 = "";//(String)fileMap.get("img0");
	String upfile1 = fileMap.get("txtimg1");
	String upfile2 = fileMap.get("txtimg2");
	String upfile3 = fileMap.get("txtimg3");
	String upfile4 = fileMap.get("txtimg4");
	
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
	glDto.setMenu_seq(Integer.parseInt(paramMap.get("menuSeq")));
	if(paramMap.get("glSeq").length() > 0){
		glDto.setGolflink_seq(Integer.parseInt(paramMap.get("glSeq")));
	}
	glDto.setGolflink_name((String)paramMap.get("golflinkName"));
	glDto.setRegion_seq(Integer.parseInt(paramMap.get("regionSeq")));
	glDto.setHoll_type((String)paramMap.get("hollType"));
	glDto.setCourse_guide((String)paramMap.get("courseGuide"));
	glDto.setGolflink_address1((String)paramMap.get("address1"));
	glDto.setGolflink_address2((String)paramMap.get("address2"));
	glDto.setPoint_x(Integer.parseInt(paramMap.get("pointx")));
	glDto.setPoint_y(Integer.parseInt(paramMap.get("pointy")));
	glDto.setImg_main(upfile0);
	glDto.setImg_sub1(upfile1);
	glDto.setImg_sub2(upfile2);
	glDto.setImg_sub3(upfile3);
	glDto.setImg_sub4(upfile4);
	glDto.setCancel_term(paramMap.get("cancelterm"));
	
	glDto.setView_yn(paramMap.get("rdbView"));
	glDto.setCancel_rule(paramMap.get("content1"));
	glDto.setPromise_rule(paramMap.get("content2"));
	glDto.setUse_guide(paramMap.get("content3"));
	glDto.setGolflink_guide(paramMap.get("content4"));
	
	GolfLinkDao glDao = new GolfLinkDao();	
	int idSeq = 0;
	
	if(paramMap.get("glSeq").length() > 0){
		idSeq = glDto.getGolflink_seq();
		glDao.setGolfLinkUpdate(glDto);
		glDao.setGolfLinkPriceDelete(idSeq);
	}else{
		idSeq = glDao.setGolfLinkInsert(glDto);
	}
		
	for(int i = 1; i <= 2;i++){
		if(paramMap.get("priceN" + Integer.toString(i)).length() > 0){
			GolfLinkPriceDto glpDto1 = new GolfLinkPriceDto();
			glpDto1.setGolflink_seq(idSeq);
			glpDto1.setPrice_type(Integer.toString(i*2-1));
			glpDto1.setGolflink_price(Integer.parseInt(paramMap.get("priceN" + Integer.toString(i))));
			glDao.setGolfLinkPriceInsert(glpDto1);
		}
		if(paramMap.get("priceS" + Integer.toString(i)).length() > 0){
			GolfLinkPriceDto glpDto2 = new GolfLinkPriceDto();
			glpDto2.setGolflink_seq(idSeq);
			glpDto2.setPrice_type(Integer.toString(i*2));
			glpDto2.setGolflink_price(Integer.parseInt(paramMap.get("priceS" + Integer.toString(i))));
			glDao.setGolfLinkPriceInsert(glpDto2);
		}
	}
	
	try{
		response.sendRedirect("./real_list.jsp?menu=" + paramMap.get("menuSeq"));
	}catch(Exception e){}
%>
</body>
</html>