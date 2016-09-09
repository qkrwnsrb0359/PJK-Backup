<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>web.xml 초기 parameter 다루기(application 객체 통해서)</title>
</head>
<body>
<%
	Enumeration e = application.getInitParameterNames();
	while(e.hasMoreElements()) {
		String elemet = (String)e.nextElement();
		out.print(elemet + "<br>");
	}
	String emailValue = application.getInitParameter("email");
	out.print("init param email value : " + emailValue + "<br>");
	
	String infoValue = application.getInitParameter("info");
	out.print("init param info value : " + infoValue + "<br>");
%>
</body>
</html>