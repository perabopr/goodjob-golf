<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="com.goodjob.member.*"%>
<%@ page import="com.goodjob.mail.*"%>
<%@ page import="com.goodjob.util.Utils"%>
<%@page import="java.text.MessageFormat"%>
<%
	
	request.setCharacterEncoding("utf-8");

	
	
	String content = MessageFormat.format(MailContent.join(),"유태수",Utils.getDate("yyyy년MM월dd일"));
	
	Mail mail = new Mail();
	mail.setTo("gundallove@gmail.com");
	mail.setFrom("savekorea@goodjobgolf.com" , "굳잡골프");
	mail.setSubject("[굳잡골프] 가입해 주셔서 감사합니다. ");
	mail.setHtmlContent(content);
	mail.send();
	

%>