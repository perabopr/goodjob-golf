<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodjob.common.*"%>
<%@page import="com.goodjob.board.*"%>
<%@page import="com.goodjob.conf.Config"%>
<%@page import="org.apache.commons.lang.math.NumberUtils"%>
<%request.setCharacterEncoding("EUC-KR");%>
<html>
<head>
<title>
Highgarden Editor Image Uploader
</title>
</head>
<body bgcolor="#ffffff">
<div>
<img alt="loading" src="/editor_images/loading.gif" />
</div>
<%

request.setCharacterEncoding("UTF-8");

String strEditorUploadDir = "/home/hosting_users/savekorea2400/www/editor_upload";
String strIfrmObjId = request.getParameter("ifrmObjId");

String strRealUploadDir = application.getRealPath(strEditorUploadDir);

FileUpload upload = new FileUpload(request, strEditorUploadDir, 1024*1024*20);

//Map<String,String> paramMap = fileUpload.getParamMap();
Map<String,String> fileMap = upload.getParamAfterUpload();
String strNewImgFileName = (String)fileMap.get("high_attachImage");
%>
<script type="text/javascript" language="javascript">
parent.editorExec('insertimage', false, '/editor_upload/<%=strNewImgFileName%>', '<%=strIfrmObjId%>');
</script>
</body>
</html>
