<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="2kb" autoFlush="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>web.xml 설정파일 이용한 에러 처리</title>
</head>
<body>
	<!-- 500 -->
	<%
		for(int i = 1; i < 5000; i++) {
			out.print(i + "\t");
		}
	%>
	<%-- <%= 1/0 %> --%>
	<!-- 400 -->
	
</body>
</html>