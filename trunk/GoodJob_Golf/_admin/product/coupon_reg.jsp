<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@ page import="com.goodjob.util.*"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.goodjob.coupon.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String up_dir = Config.get("coupon_dir");
	
	FileUpload upload = new FileUpload(request, up_dir, 1024*1024*5);

	//Map<String,String> paramMap = fileUpload.getParamMap();
	Map<String,String> fileMap = upload.getParamAfterUpload();
	
	String type = upload.getParameter("type");
	String upfile = StringUtils.trimToEmpty((String)fileMap.get("upfile"));
	
	File file = new File(up_dir+"/"+upfile);
	
	List<String[]> coupon = Utils.getCouponRead(file);
	
	CouponDao cDao = new CouponDao();
	
	//0:온라인
	//1:오픈
	if("0".equals(type)){
		cDao.setCoupon("온라인 프리미엄 상품권" , type ,coupon);	
	}
	else{
		cDao.setCoupon("오프라인 프리미엄 상품권" , type ,coupon);
	}
%>
<script language="javascript" type="text/javascript">
alert("쿠폰이 정상적으로 등록 되었습니다.");
opener.document.location.reload();
self.close();
</script>