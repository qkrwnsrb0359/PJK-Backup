<%@ page import="java.text.SimpleDateFormat, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>날짜</title>
</head>
<body>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년-MM월-dd일");
	String strDate = sdf.format(new Date());
%>
일반적인 jsp페이지의 형태로 아래와 같이 현재날짜 제공<br>
<%=strDate %>
</body>
</html>