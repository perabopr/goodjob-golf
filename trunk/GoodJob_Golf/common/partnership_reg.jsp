<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@page import="com.goodjob.board.*"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%
	Map<String,String> params = new HashMap<String,String>();

	request.setCharacterEncoding("UTF-8");
	
	String up_dir = Config.get("bbs_dir");
	
	FileUpload upload = new FileUpload(request, up_dir, 1024*1024*20);
	
	Map<String,String> fileMap = upload.getParamAfterUpload();
	
	String name = upload.getParameter("name");
	String email = upload.getParameter("email");
	String subject = upload.getParameter("subject");
	
	String mobile1 = upload.getParameter("mobile1");
	String mobile2 = upload.getParameter("mobile2");
	String mobile3 = upload.getParameter("mobile3");
	
	String content = upload.getParameter("content");
	
	String upfile = StringUtils.trimToEmpty((String)fileMap.get("upfile"));
	
	PartnershipDto dto = new PartnershipDto();
	
	dto.setName(name);
	dto.setEmail(email);
	dto.setSubject(subject);
	dto.setMobile(mobile1+"-"+mobile2+"-"+mobile3);
	dto.setContent(content);
	dto.setFilename(upfile);
	dto.setWriteip(request.getRemoteAddr());
	
	BoardDao dao = new BoardDao();
		
	dao.setInsertPartnership(dto);
%>
<script language="javascript" type="text/javascript">
alert("정상적으로 이루어 졌습니다. 감사합니다.");
top.document.location.href="/common/partnership.jsp";
</script>