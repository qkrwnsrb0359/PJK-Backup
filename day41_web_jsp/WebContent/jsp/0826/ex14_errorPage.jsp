<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../../Error/CommonError.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
	name 값 : <%= request.getParameter("name").toUpperCase() %>
	
</body>
</html>