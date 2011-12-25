<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%@page import="com.goodjob.member.MemberDao"%>
<%@ page import="com.goodjob.mail.*"%>
<%@ page import="com.goodjob.util.Utils"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="com.goodjob.conf.Config"%>
<%
	
	request.setCharacterEncoding("utf-8");

	Map<String,String> params = new HashMap<String,String>();
	
	String sphone 		= "02-6670-0200";
	String rphone 		= StringUtils.trimToEmpty(request.getParameter("mobile"));
	String type 		= StringUtils.trimToEmpty(request.getParameter("type"));
	String mem_name 	= StringUtils.trimToEmpty(request.getParameter("mem_name"));
	String mem_id 		= StringUtils.trimToEmpty(request.getParameter("mem_id"));
	String auth_no 		= StringUtils.trimToEmpty(request.getParameter("auth_no"));
	
	System.out.println("mem_name : "+mem_name);
	System.out.println("rphone : "+rphone);
	
	params.put("auth_no",auth_no);
	params.put("rphone",rphone);
	
	SMSDao sDao = new SMSDao();
	int check = sDao.authCheck(params);
	
	//check = 0;
	if(check != 0){
		out.println("3");
	}
	else{
		
		MemberDao mDao = new MemberDao();
		String result = "";
		if("id".equals(type)){
			result = StringUtils.trimToEmpty(mDao.idFind(mem_name , rphone));
			params.put("msg",String.format("[굳잡골프]고객님의 아이디는 %s 입니다." , result));
		}
		else{
			result = StringUtils.trimToEmpty(mDao.pwdFind(mem_id , rphone));
			params.put("msg",String.format("[굳잡골프]고객님의 비밀번호는 %s 입니다." , result));
		}
		
		if(result.length() > 0){
			
			params.put("rphone",rphone);
			params.put("sphone",sphone);
			
			boolean isSend = sDao.send(params);
			
			if(isSend){
				out.println("0");
				
				if("id".equals(type)){

					String content = MessageFormat.format(MailContent.memid(),result);
					
					String host = Config.get("mail_host");
					String m_id = Config.get("mail_id");
					String m_pw = Config.get("mail_pw");
					String from = Config.get("mail_fm");
					
					Mail mail = new Mail(host,m_id,m_pw);
					mail.setTo(result);
					mail.setFrom(from , "굳잡골프");
					mail.setSubject("[굳잡골프] 회원님의 아이디를 알려 드립니다. ");
					mail.setHtmlContent(content);
					mail.send();					
				}
				else{
					String content = MessageFormat.format(MailContent.password(),result);
					
					String host = Config.get("mail_host");
					String m_id = Config.get("mail_id");
					String m_pw = Config.get("mail_pw");
					String from = Config.get("mail_fm");
					
					Mail mail = new Mail(host,m_id,m_pw);
					mail.setTo(result);
					mail.setFrom(from , "굳잡골프");
					mail.setSubject("[굳잡골프] 회원님의 비밀번호를 알려 드립니다. ");
					mail.setHtmlContent(content);
					mail.send();
				}
				
			}
			else{
				out.println("2");
			}
		}
		else{
			out.println("2");
		}
	}
%>
