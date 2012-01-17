<%@page import="com.goodjob.product.dto.PackagePriceDto"%>
<%@page import="com.goodjob.product.PackageDao"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menu = request.getParameter("menu");
String pkSeq = request.getParameter("pkSeq");
if(pkSeq.length() > 0){
	String[] arrPackageSeq = pkSeq.split(",");
	for(int i = 0; i < arrPackageSeq.length;i++){
		int pk_seq = NumberUtils.toInt(arrPackageSeq[i]);
		PackagePriceDto pkpDto = new PackagePriceDto();
		pkpDto.setPackage_seq(pk_seq);
		PackageDao pkDao = new PackageDao();
		pkDao.setPackagePromiseDelete(pk_seq);
		pkDao.setPackagePriceDelete(pkpDto);
		pkDao.setPackageDelete(pk_seq);
	}
}
%>
<script type="text/javascript">
location.href='package_list.jsp?menu=<%=menu%>';
</script>