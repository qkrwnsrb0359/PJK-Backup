<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.*" %>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="edu.kosta.thumb.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
<%
	String realFolder = "";
	String saveFolder = "upload";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		int zoom = 5;
		
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			String fileName = multi.getFilesystemName(name);
			String orgFileName = realFolder + "\\" + fileName;
			String thumbFileName1 = "Thumb_"+fileName;
	        String thumbFileName2 = realFolder + "\\" + thumbFileName1;
			Thumbnail.createImage(orgFileName, thumbFileName2, zoom);
%>
	원본 파일 저장 경로 및 파일명 : <%= orgFileName %> <br>
	<img src="../upload/<%=fileName %>" border="0"><br><br><br>
	썸네일 이미지 저장 경로 및 파일명 : <br><%= thumbFileName2 %><br>
	<img src="../upload/<%=thumbFileName1%>" border="0"><br>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>