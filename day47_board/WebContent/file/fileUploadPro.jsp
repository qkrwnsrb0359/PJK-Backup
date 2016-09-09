<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.net.*, java.util.*, java.io.*"%>

<%
	String realPath = ""; //웹 어플리케이션 상의 절대 경로
	String savePath = "upload";
	String encType = "utf-8";
	int maxSize = 1024 * 1024 * 5; //최대 업로드 파일 크기 - 5M
	
	//현재 jsp 페이지의 웹 어플리케이션상의 절대경로를 구함
	ServletContext context = getServletContext();
	realPath = context.getRealPath(savePath + "\\");
	out.println("realPath is : " + realPath + "<br>");
	
	try {
		MultipartRequest multi = null;
		//전송 담당 컴포넌트 생성 및 파일 전송
		multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration params = multi.getParameterNames();
		
		while(params.hasMoreElements()) {
			String name = (String)params.nextElement(); //전송되는 파라미터 이름
			String value = multi.getParameter(name);
			out.println(name + " = " + value + "<br>");
		}
		out.println("<br><hr><br>");
		
		//전송할 파일 정보를 가져와서 출력함
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			String fileName = multi.getFilesystemName(name); //물리경로
			String original = multi.getOriginalFileName(name); //실제 파일명
			String type = multi.getContentType(name);
			
			File file = multi.getFile(name);
			
			out.println("파라미터 이름 : " + name + "<br>");
			out.println("실제파일 이름 : " + original + "<br>");
			out.println("저장파일 이름 : " + fileName + "<br>");
			out.println("파일타입 : " + type + "<br>");
			
			if(file != null) {
				out.println("크기 : " + file.length() + "<br>");
			}
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>

