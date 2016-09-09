<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page buffer="1kb" autoFlush="false" %> --%>
<%@ page buffer="3kb" autoFlush="true" %>

<!DOCTYPE html>
<html>
<head>
	<title>Buffer 사용</title>
</head>
<body>
	<%
		//defalut : buffer size : 8kb
		//defalut : autoFlush : true
		for(int i = 0; i < 1000; i++) {
	%>
	hello
	<%	
		}
	%>
</body>
</html>