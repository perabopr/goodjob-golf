<%@page import="com.goodjob.util.Utils"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.mail.*"%>
<%@ page import="com.goodjob.member.*"%>
<%@ page import="com.goodjob.util.Utils"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="com.goodjob.conf.Config"%>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	String type 		= StringUtils.trimToEmpty(request.getParameter("type"));
	String email 		= StringUtils.trimToEmpty(request.getParameter("email"));
	String auth_no 		= StringUtils.trimToEmpty(request.getParameter("auth_no"));
	String content = "";
	
	String host = Config.get("mail_host");
	String m_id = Config.get("mail_id");
	String m_pw = Config.get("mail_pw");
	String from = Config.get("mail_fm");
	
	MemberDao mDao = new MemberDao();
	
	if("send".equals(type)){
		
		auth_no = Utils.authNumber(8);
		
		params.put("email",email);
		params.put("auth_no",auth_no);
		mDao.auth(params);
		
		boolean isSend = false;
		
		content = String.format(MailContent.auth(),auth_no);
		
		try{
			Mail mail = new Mail(host,m_id,m_pw);
			mail.setTo(email);
			mail.setFrom(from , "굿잡골프");
			mail.setSubject("[Goodjobgolf] 인증 번호 입니다.");
			mail.setHtmlContent(content);
			mail.send();
			isSend = true;
			
		}catch(Exception e){}
		if(isSend) out.println("0");
		else  out.println("1");
	}
	else if("auth".equals(type)){
		
		params.put("email",email);
		params.put("auth_no",auth_no);
		int check = mDao.authCheck(params); //0 : 인증 성공  , 1 : 일치하는 인증값 없음 , 2 : 인증번호 시간 초과 
		out.println(check);
	}
	else if("check".equals(type)){
		
		boolean isDup = mDao.isDuplicate(email);
		
		if(isDup) out.println("1");
		else out.println("0");
	}
%>