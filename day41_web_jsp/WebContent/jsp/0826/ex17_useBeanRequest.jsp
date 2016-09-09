<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Forward Page</title>
	<jsp:useBean id="bean" class="edu.kosta.ex0825.Emp" scope="request"/>
</head>
<body>

	Forward Page : 
	<%
		out.print(bean.getEmpno() + "<br>");
		out.print(bean.getName() + "<br>");
		out.print("ex17_useBeanRequest.jsp로 이동된 페이지");
		
	%>
</body>
</html>