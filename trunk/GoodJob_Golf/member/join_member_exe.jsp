<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="com.goodjob.member.*"%>
<%@ page import="com.goodjob.mail.*"%>
<%@ page import="com.goodjob.util.Utils"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="com.goodjob.conf.Config"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String ses_mem_id = StringUtils.trimToEmpty((String)session.getAttribute("mem_id"));

	String mem_name 	= StringUtils.trimToEmpty(request.getParameter("mem_name"));
	String mem_id 		= StringUtils.trimToEmpty(request.getParameter("mem_id"));
	String mem_domain 	= StringUtils.trimToEmpty(request.getParameter("mem_domain"));
	String mem_pwd 		= StringUtils.trimToEmpty(request.getParameter("mem_pwd"));
	String org_pwd 		= StringUtils.trimToEmpty(request.getParameter("org_pwd"));
	
	String mobile1 	= StringUtils.trimToEmpty(request.getParameter("mobile1"));
	String mobile2 	= StringUtils.trimToEmpty(request.getParameter("mobile2"));
	String mobile3 	= StringUtils.trimToEmpty(request.getParameter("mobile3"));
	
	String mem_jumin1 	= StringUtils.trimToEmpty(request.getParameter("mem_jumin1"));
	String mem_jumin2 	= StringUtils.trimToEmpty(request.getParameter("mem_jumin2"));
	
	String sms_yn 	= StringUtils.trimToEmpty(request.getParameter("sms_yn"));
	String email_yn 	= StringUtils.trimToEmpty(request.getParameter("email_yn"));

	MemberDao mDao = new MemberDao();
	
	if(ses_mem_id.length() == 0){
		
		boolean isDup = mDao.isDuplicate(mem_id+"@"+mem_domain);
		
		boolean isJumin = false;
		//boolean isJumin = mDao.isJumin(mem_jumin1+"-"+mem_jumin2);
		
		if(isDup){
%>
<script language="javascript" type="text/javascript">
alert("가입하려는 아이디가 존재 합니다.\n다른 아이디로 가입해 주세요!");
</script>
<%
			return;
		}
		else if(isJumin){
%>
<script language="javascript" type="text/javascript">
alert("가입하려는 주민번호가  존재 합니다.\n다른 주민번호로 가입해 주세요!");
</script>
<%
			return;
		}
		else{
			
			MemberDto mDto = new MemberDto();
			mDto.setMem_id(mem_id+"@"+mem_domain);
			mDto.setMem_jumin(mem_jumin1+"-"+mem_jumin2);
			mDto.setMem_name(mem_name);
			mDto.setMem_pwd(mem_pwd);
			mDto.setMem_mtel(mobile1+"-"+mobile2+"-"+mobile3);
			mDto.setSms_yn(sms_yn);
			mDto.setEmail_yn(email_yn);
			
			mDao.memberRegist(mDto);
			
			
			String content = MessageFormat.format(MailContent.join(),mDto.getMem_name(),Utils.getDate("yyyy년MM월dd일"));
			
			String host = Config.get("mail_host");
			String m_id = Config.get("mail_id");
			String m_pw = Config.get("mail_pw");
			String from = Config.get("mail_fm");
			
			Mail mail = new Mail(host,m_id,m_pw);
			mail.setTo(mDto.getMem_id());
			mail.setFrom(from , "굿잡골프");
			mail.setSubject("[Goodjobgolf] 가입해 주셔서 감사합니다. ");
			mail.setHtmlContent(content);
			mail.send();
			
			session.setAttribute("joinAuth","");
%>
<script language="javascript" type="text/javascript">
//alert("회원 가입이 정상적으로 이루어 졌습니다. 감사합니다.");
top.document.location.href="/member/join_finished.jsp";
</script>
<%
		}
	}
	else{
		
		MemberDto tmpDto = mDao.getMember(ses_mem_id);
		
		if(org_pwd.length() > 0){
			
			if(!org_pwd.equals(tmpDto.getMem_pwd())){
%>
			<script language="javascript" type="text/javascript">
			alert("기존 비밀빈호가 일치하지 않아 비밀번호 변경을 할 수 없습니다.");
			</script>
<%
				return;
			}
		}
		else{
			mem_pwd = tmpDto.getMem_pwd();
		}
		MemberDto mDto = new MemberDto();
		mDto.setMem_id(ses_mem_id);
		//mDto.setMem_jumin(mem_jumin1+"-"+mem_jumin2);
		mDto.setMem_name(mem_name);
		mDto.setMem_pwd(mem_pwd);
		mDto.setMem_mtel(mobile1+"-"+mobile2+"-"+mobile3);
		mDto.setSms_yn(sms_yn);
		mDto.setEmail_yn(email_yn);
		
		mDao.memberUpdate(mDto);
%>
<script language="javascript" type="text/javascript">
//alert("회원 가입이 정상적으로 이루어 졌습니다. 감사합니다.");
top.document.location.href="/member/join_edit_finished.jsp";
</script>
<%
	}
%>