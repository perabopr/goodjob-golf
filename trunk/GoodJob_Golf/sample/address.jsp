
<%@page import="com.goodjob.zipcode.ZipCodeDto"%>
<%@page import="com.goodjob.zipcode.ZipCodeDao"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.apache.commons.dbutils.handlers.*" %>
<%@ page import="com.goodjob.board.*" %>
<%@ page import="com.goodjob.db.*" %>
<%
	
	ZipCodeDao zipcode = new ZipCodeDao();

	List<ZipCodeDto> list = zipcode.getAddress("서초");
	
	out.println("size : " + list.size());
%>
