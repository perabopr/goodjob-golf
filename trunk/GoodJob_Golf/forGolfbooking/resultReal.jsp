<%@page import="com.goodjob.reserve.GolfLinkDao"%>
<%@page import="com.goodjob.reserve.dto.GolfLinkReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menu = request.getParameter("menu");
String gcId = request.getParameter("gcId");
String golf = request.getParameter("golf");
String date = request.getParameter("date");
String cdate = request.getParameter("cdate");

String resName = request.getParameter("reserveName");
String uPhone = "";
uPhone += request.getParameter("phone1") + "-";
uPhone += request.getParameter("phone2") + "-";
uPhone += request.getParameter("phone3");
int perNum = 4;

GolfLinkReserveDto glrDto = new GolfLinkReserveDto();
glrDto.setReserve_name(resName);
glrDto.setReserve_uid("test@test.com");
glrDto.setPer_num(Integer.toString(perNum));
glrDto.setReserve_phone(uPhone);
glrDto.setProduct_price(100);
glrDto.setCoupon_price(0);
glrDto.setProcess_status("0");
glrDto.setCard_bill_num("");
glrDto.setProductsub_seq(Integer.parseInt(gcId));

GolfLinkDao glDao = new GolfLinkDao();
glDao.setGolfReserve(glrDto);
%>

결제하세요~~~