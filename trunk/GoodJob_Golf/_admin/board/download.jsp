<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="com.goodjob.util.Utils"%>
<%!
private void dumpFile(File realFile, OutputStream outputstream) {
	byte readByte[] = new byte[4096];
	try {
		BufferedInputStream bufferedinputstream = new BufferedInputStream(
				new FileInputStream(realFile));
		int i;
		while ((i = bufferedinputstream.read(readByte, 0, 4096)) != -1)
			outputstream.write(readByte, 0, i);
		bufferedinputstream.close();
	} catch (Exception _ex) {
	}
}
%>
<%
String fileName = Utils.getDecoder(request.getParameter("fileName"));

try {
	String rootPath = getServletConfig().getServletContext()
			.getRealPath("/");
	// String rootPath = request.getRealPath("/");
	String filePath = rootPath + File.separator + fileName;
	java.io.File tempFile = new java.io.File(filePath);
	
	
	
	fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
	//fileName = BoardUtils.kscToasc(fileName);

	System.out.println("rootPath : "+rootPath);
	System.out.println("filePath : "+filePath);
	System.out.println("fileName : "+fileName);
	
	int filesize = (int) tempFile.length();
	String filetype = "application/x-zip-compressed";
	// String fileExt = fileName.substring(fileName.lastIndexOf(".")+1);

	String agentType = request.getHeader("Accept-Encoding");

	try {
		if (!tempFile.exists() || !tempFile.canRead()) {
			out.println("<script>alert('File Not Found');history.back();</script>");
			return;
		}
	} catch (Exception e) {
		out.println("<script>alert('File Not Found');history.back();</script>");
		return;
	}

	boolean flag = false;
	//if (agentType != null && agentType.indexOf("gzip") >= 0)
	//	flag = true;

	if (flag) {
		response.setHeader("Content-Encoding", "gzip");
		response.setHeader("Content-disposition",
				"attachment;filename=" + fileName);
		javax.servlet.ServletOutputStream servletoutputstream = response
				.getOutputStream();
		java.util.zip.GZIPOutputStream gzipoutputstream = new java.util.zip.GZIPOutputStream(
				servletoutputstream);
		dumpFile(tempFile, gzipoutputstream);
		gzipoutputstream.close();
		servletoutputstream.close();
	} else {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition",
				"attachment;filename=" + fileName);
		javax.servlet.ServletOutputStream servletoutputstream1 = response
				.getOutputStream();
		dumpFile(tempFile, servletoutputstream1);
		servletoutputstream1.flush();
		servletoutputstream1.close();
	}

} catch (Exception e) {
	out.println("<script>alert('File Not Found');history.back();</script>");
	return;
}
%>
