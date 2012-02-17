<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.member.*"%>
<%@ page import="com.goodjob.sms.*" %>
<%@ page import="com.goodjob.mail.*"%>
<%@ page import="com.goodjob.util.Utils"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="com.goodjob.conf.Config"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String mem_name = StringUtils.trimToEmpty(request.getParameter("mem_name"));
	String mem_id 	= StringUtils.trimToEmpty(request.getParameter("mem_id"));
	String mobile 	= StringUtils.trimToEmpty(request.getParameter("mobile"));
	String type 	= StringUtils.trimToEmpty(request.getParameter("type"));
	
	Map<String,String> params = new HashMap<String,String>();
	
	MemberDao mDao = new MemberDao();
	
	if("id".equals(type)){
		
		String result = mDao.idFind(mem_name,mobile);
		
		if(result != null && result.length() > 0){
			
			int len = result.length() - 4;
			StringBuffer buff = new StringBuffer(result.substring(0,4));
			for(int i = 0 ; i < len ; i++){
				buff.append("*");
			}
			
			//<span class=blue>%s</span> 회원님의 아이디는 <span class=orange>%s</span> 입니다
			String msg = "<span class=blue>%s</span> 회원님의 아이디는 <span class=orange>%s</span> 입니다";
			out.println(String.format(msg ,mem_name, result));
			
		}
		else{
			out.println("<div style='padding:10px 30px 0px 10px;'>처음 가입하신 핸드폰 번호가 아닙니다.<br/>다시 한번 정확히 입력해 주시기 바랍니다.<br/>핸드폰번호를 모르실 경우 고객센터 02-6670-0202로 문의바랍니다.</div>");
		}
	}
	else if("pwd".equals(type)){
		
		String result = mDao.pwdFind(mem_name,mem_id);
		
		if(result != null && result.length() > 0){
			
			/*
			int len = result.length() - 4;
			StringBuffer buff = new StringBuffer(result.substring(0,4));
			for(int i = 0 ; i < len ; i++){
				buff.append("*");
			}
			String msg = "<span style='font-size:14px;padding:10px 30px 0px 50px;'>"+mem_name+"회원님의 비밀번호는[ <b> %s </b>]입니다.</span>";
			msg += "<a href='javascript:send_email();'><img align='absmiddle' src='/images/mem_join/btn_send_confirm.gif' border='0'></a>";
			out.println(String.format(msg , buff.toString()));
			*/
			String content = MessageFormat.format(MailContent.password(),result);
			
			String host = Config.get("mail_host");
			String m_id = Config.get("mail_id");
			String m_pw = Config.get("mail_pw");
			String from = Config.get("mail_fm");
			
			Mail mail = new Mail(host,m_id,m_pw);
			mail.setTo(mem_id);
			mail.setFrom(from , "굿잡골프");
			mail.setSubject("[GoodJobGOLF] 회원님의 비밀번호를 알려 드립니다. ");
			mail.setHtmlContent(content);
			mail.send();
			
			out.println("0");
		}
		else{
			//out.println("<div style='padding:10px 30px 0px 50px;'>고객님의이 요청하신 정보와 일치하는 회원정보가 없습니다.<br/>다시 한번 정확히 입력해 주시기 바랍니다.<br/>비밀번호를 모르실 경우 고객센터 02-6670-0202로 문의바랍니다.</div>");
			out.println("2");
		}
	}
	else if("send".equals(type)){
		
		String result = mDao.pwdFind(mem_name,mem_id);
		if(result != null && result.length() > 0){
			
			String content = MessageFormat.format(MailContent.password(),result);
			
			String host = Config.get("mail_host");
			String m_id = Config.get("mail_id");
			String m_pw = Config.get("mail_pw");
			String from = Config.get("mail_fm");
			
			Mail mail = new Mail(host,m_id,m_pw);
			mail.setTo(mem_id);
			mail.setFrom(from , "굿잡골프");
			mail.setSubject("[GoodJobGOLF] 회원님의 비밀번호를 알려 드립니다. ");
			mail.setHtmlContent(content);
			mail.send();
			
			out.println("0");
		}
		else if(result == null){
			out.println("1");
		}
	}
%>