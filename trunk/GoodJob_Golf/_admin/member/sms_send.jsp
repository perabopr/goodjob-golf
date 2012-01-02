
<%@page import="com.goodjob.util.Utils"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbutils.*" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="com.goodjob.sms.*" %>
<%@page import="com.goodjob.member.*"%>
<%

	Map<String,String> params = new HashMap<String,String>();
	
	
	String rphone 		= "02-6670-0202";
	String message 		= StringUtils.trimToEmpty(request.getParameter("message"));
	String sphone 		= StringUtils.trimToEmpty(request.getParameter("sphone"));
	String mem_seq 		= StringUtils.trimToEmpty(request.getParameter("mem_seq"));
	
	SMSDao sDao = new SMSDao();
	MemberDao mDao = new MemberDao();
	
	List<MemberDto> mList = mDao.getMemTelList(mem_seq);
	
	params.put("msg",message);
	params.put("sphone",sphone);
	
	MemberDto mDto;
	int send_cnt = 0;
	if(mList != null && !mList.isEmpty()){
		
		int size = mList.size();
		for(int i = 0 ; i < size ; i++){
			mDto = mList.get(i);
			
			if("Y".equals(mDto.getSms_yn())){
				
				params.put("mem_id",mDto.getMem_id());
				params.put("rphone",mDto.getMem_mtel());
				
				boolean isSend = sDao.auth(params);
				if(isSend) send_cnt++;
			}
		}
	
	}
%>
<script language="javascript" type="text/javascript">
alert("SMS <%=send_cnt%>건이 발송 되었습니다.");
//self.close();
</script>