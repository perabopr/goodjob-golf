<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%@page import="com.goodjob.util.Utils"%>
<%@page import="com.goodjob.member.MemberDao"%>
<%
	
	request.setCharacterEncoding("utf-8");

	Map<String,String> params = new HashMap<String,String>();
	
	String sphone 		= "02-6670-0200";
	String rphone 		= StringUtils.trimToEmpty(request.getParameter("mobile"));
	String type 		= StringUtils.trimToEmpty(request.getParameter("type"));
	String mem_name 	= StringUtils.trimToEmpty(request.getParameter("mem_name"));
	String mem_id 		= StringUtils.trimToEmpty(request.getParameter("mem_id"));
	String auth_no 		= StringUtils.trimToEmpty(request.getParameter("auth_no"));
	
	params.put("auth_no",auth_no);
	params.put("rphone",rphone);
	
	SMSDao sDao = new SMSDao();
	int check = sDao.authCheck(params);
	
	if(check != 0){
		%>
		<script language="javascript" type="text/javascript">
		alert("인증중 오류가 발생 했습니다. 인증번호를 다시 발송해 주세요!");
		</script>
		<%
	}
	else{
	MemberDao mDao = new MemberDao();
	String result = "";
	if("id".equals(type)){
		result = StringUtils.trimToEmpty(mDao.idFind(mem_name , rphone));
		params.put("msg",String.format("[굳잡골프]고객님의 아이디는 %s 입니다." , result));
		
	}
	else{
		result = StringUtils.trimToEmpty(mDao.idFind(mem_name , rphone));
		params.put("msg",String.format("[굳잡골프]고객님의 비밀번호는 %s 입니다." , result));
	}
	
	if(result.length() > 0){
		
		params.put("rphone",rphone);
		params.put("sphone",sphone);
		
		boolean isSend = sDao.send(params);
		
		if(isSend){
			%>
			<script language="javascript" type="text/javascript">
			alert("아이디가   핸드폰으로  발송 되었습니다.");
			</script>
			<%
		}
		else{
			%>
			<script language="javascript" type="text/javascript">
			alert("SMS 발송 오류 입니다. 잠시후 다시 시도해 주세요!");
			</script>
			<%
		}
	}
	else{
		%>
		<script language="javascript" type="text/javascript">
		alert("일치하는  정보가 없습니다.");
		</script>
		<%
	}
	}
%>
