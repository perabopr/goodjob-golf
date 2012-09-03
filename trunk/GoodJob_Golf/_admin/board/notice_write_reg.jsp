<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@page import="com.goodjob.board.*"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="org.apache.commons.lang.StringUtils"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String up_dir = Config.get("bbs_dir");
	
	FileUpload upload = new FileUpload(request, up_dir, 1024*1024*5);

	//Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = upload.getParamAfterUpload();
	
	String seq = upload.getParameter("seq");
	String email = upload.getParameter("email");
	String subject = upload.getParameter("subject");
	
	String name = upload.getParameter("name");
	String content = upload.getParameter("content");
	String password = upload.getParameter("password");
	String upfile = StringUtils.trimToEmpty((String)fileMap.get("upfile"));
	String mode = upload.getParameter("mode");
	String site_seq = upload.getParameter("site_seq");
	
	
	BoardDto dto = new BoardDto();
	dto.setSeq(NumberUtils.toInt(seq));
	dto.setEmail("savekorea@goodjobgolf.com");
	dto.setName("관리자");
	dto.setMem_id(StringUtils.trim((String)session.getAttribute("admin_id")));
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPassword("1111");
	dto.setFilename(upfile);
	dto.setWriteip(request.getRemoteAddr());
	dto.setIshtml("N");
	dto.setSite_seq(NumberUtils.toInt(site_seq));
	
	BoardDao dao = new BoardDao();
	
	if("modify".equals(mode)){
		
		dao.setUpdate("tb_notice_bbs" , dto);
		response.sendRedirect("./notice_view.jsp?seq="+seq+"&site_seq="+site_seq);
	}
	else{
		
		dao.setInsert("tb_notice_bbs" , dto);
		
		response.sendRedirect("./notice_list.jsp?site_seq="+site_seq);
	}
%>
