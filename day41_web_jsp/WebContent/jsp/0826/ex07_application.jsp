<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
<%
	/* 
	브라우저에서 받아들이는 경로
	http://localhost:8080/day41_web_jsp/jsp/0826/
	
	물리적 경로
	C:\pjk\web\workspace\day41_web_jsp\WebContent\download
		
	이클립스 통한 톰켓 구동시 물리적인 경로
	C:\pjk\web\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\day41_web_jsp\download
	 */
	 
	String resourcePath = "/download/memo.txt";
	out.print(resourcePath + "<br>");
	
	//가상 경로에서 --> 물리적 경로 얻어내기
	String ContextPath = application.getRealPath(request.getContextPath());
	String realPath = application.getRealPath(resourcePath);
	
	out.print("request.getContextPath() : " + request.getContextPath() + "<br>");
	out.print("realPath : " + realPath + "<br>");
	out.print("ContextPath : " + ContextPath + "<br>");
	
	application.log("kosta th125");
%>
</body>
</html>