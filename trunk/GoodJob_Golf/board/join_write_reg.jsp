<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.board.*"%>
<%@ page import="com.goodjob.conf.Config"%><%

	request.setCharacterEncoding("utf-8");
	
	String join_seq = StringUtils.defaultIfEmpty(request.getParameter("join_seq"),"0");
	String join_name = StringUtils.trimToEmpty(request.getParameter("join_name"));
	String tel1 = StringUtils.trimToEmpty(request.getParameter("tel1"));
	String tel2 = StringUtils.trimToEmpty(request.getParameter("tel2"));
	String tel3 = StringUtils.trimToEmpty(request.getParameter("tel3"));
	
	String region = StringUtils.trimToEmpty(request.getParameter("region"));
	String golflink_name = StringUtils.trimToEmpty(request.getParameter("golflink_name"));
	String sex = StringUtils.trimToEmpty(request.getParameter("sex"));
	String age = StringUtils.trimToEmpty(request.getParameter("age"));
	String join_person = StringUtils.trimToEmpty(request.getParameter("join_person"));
	String rounding_dt1 = StringUtils.trimToEmpty(request.getParameter("rounding_dt1"));
	String rounding_dt2 = StringUtils.trimToEmpty(request.getParameter("rounding_dt2"));
	String rounding_dt3 = StringUtils.trimToEmpty(request.getParameter("rounding_dt3"));
	String rounding_dt4 = StringUtils.trimToEmpty(request.getParameter("rounding_dt4"));
	
	String price_info1 = StringUtils.trimToEmpty(request.getParameter("price_info1"));
	String price_info2 = StringUtils.trimToEmpty(request.getParameter("price_info2"));
	String price_info3 = StringUtils.trimToEmpty(request.getParameter("price_info3"));
	String content = StringUtils.trimToEmpty(request.getParameter("content"));
	
	String mode = StringUtils.trimToEmpty(request.getParameter("mode"));
	
	
	JoinBoardDto jDto = new JoinBoardDto();
	
	jDto.setJoin_seq(NumberUtils.toInt(join_seq));
	jDto.setJoin_name(join_name);
	jDto.setMem_id(StringUtils.trim((String)session.getAttribute("admin_id")));
	jDto.setTel1(tel1);
	jDto.setTel2(tel2);
	jDto.setTel3(tel3);
	jDto.setRegion(region);
	jDto.setGolflink_name(golflink_name);
	jDto.setSex(sex);
	jDto.setAge(age);
	jDto.setJoin_person(NumberUtils.toInt(join_person));
	jDto.setRounding_dt(Utils.getDate("yy")+"/"+rounding_dt1+"/"+rounding_dt2+"/"+rounding_dt3+"/"+rounding_dt4);
	jDto.setPrice_info1(price_info1);
	jDto.setPrice_info2(price_info2);
	jDto.setPrice_info3(price_info3);
	jDto.setContent(content);
	
	BoardDao dao = new BoardDao();
	
	if("modify".equals(mode)){
		
		dao.setJoinUpdate(jDto);
		
		response.sendRedirect("./join_view.jsp?join_seq="+join_seq);
	}
	else{
		
		dao.setJoinInsert(jDto);
		
		response.sendRedirect("./join_List.jsp");
	}
%>
