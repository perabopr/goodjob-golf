<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.goodjob.zipcode.ZipCodeDto"%>
<%@ page import="com.goodjob.zipcode.ZipCodeDao"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	
	ZipCodeDao zipcode = new ZipCodeDao();

	List<ZipCodeDto> list = zipcode.getAddress("서초");
	
	ZipCodeDto dto;
	for(int i = 0 ; i < list.size(); i++){
		
		dto = list.get(i);
		out.println("SIDO : " + dto.getSido());
		out.println("DONG : " + dto.getDong());
		out.println("=================================<br/>");
		
	}
%>
