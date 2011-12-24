<%@page import="com.goodjob.util.Utils"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.mail.*"%>
<%@ page import="com.goodjob.util.Utils"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="com.goodjob.member.*"%>
<%
	
	String subject 		= StringUtils.trimToEmpty(request.getParameter("subject"));
	String content 		= StringUtils.trimToEmpty(request.getParameter("content"));
	String mem_seq 		= StringUtils.trimToEmpty(request.getParameter("mem_seq"));

	String host = Config.get("mail_host");
	String m_id = Config.get("mail_id");
	String m_pw = Config.get("mail_pw");
	String from = Config.get("mail_fm");
	
	Mail mail = new Mail(host,m_id,m_pw);
	
	MemberDao mDao = new MemberDao();
	
	List<MemberDto> mList = mDao.getMemTelList(mem_seq);
	
	MemberDto mDto;
	int send_cnt = 0;
	if(mList != null && !mList.isEmpty()){
		
		int size = mList.size();
		for(int i = 0 ; i < size ; i++){
			
			mDto = mList.get(i);
			
			if("Y".equals(mDto.getEmail_yn())){
				
				try{
					mail.setTo(mDto.getMem_id());
					mail.setFrom(from , "굳잡골프");
					mail.setSubject(subject);
					mail.setHtmlContent(content);
					mail.send();
					send_cnt++;

				}catch(Exception e){}
			}
		}
	}
%>
<script language="javascript" type="text/javascript">
alert("이메일 <%=send_cnt%>건이 발송 되었습니다.");
//self.close();
</script>
