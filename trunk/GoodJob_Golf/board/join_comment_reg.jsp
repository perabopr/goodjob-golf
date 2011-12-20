<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.board.*"%>
<%@ page import="com.goodjob.conf.Config"%><%

	request.setCharacterEncoding("utf-8");
	
	String join_seq = StringUtils.trimToEmpty(request.getParameter("join_seq"));
	String comment = StringUtils.trimToEmpty(request.getParameter("comment"));
	
	
	JoinBoardDto jDto = new JoinBoardDto();
	
	
	jDto.setJoin_seq(NumberUtils.toInt(join_seq));
	jDto.setCmt_name(StringUtils.defaultString((String)session.getAttribute("mem_name"),""));
	jDto.setMem_id(StringUtils.trim((String)session.getAttribute("mem_id")));
	jDto.setComment(comment);
	
	BoardDao dao = new BoardDao();
	
	dao.setCommentInsert(jDto);
	
%>
<script language="javascript" type="text/javascript">
alert("댓글이 등록 되었습니다.");
top.document.location.reload();
</script>