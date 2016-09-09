<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="date" class="java.util.Date"/> 
<% response.setContentType("text/html"); %>
<%
	java.util.Date date2 = new java.util.Date();
	out.print(date2);
%>
<fmt:setLocale value="en_US"/> <!-- en-us, ko-kr -->
<fmt:bundle basename="bundle.testBundle">
	<fmt:message key="name"/><br>
	<fmt:message key="say"/><br>
	<fmt:message key="say2">
		<fmt:param>김연아</fmt:param>
	</fmt:message>
</fmt:bundle>
<hr>
<fmt:formatNumber value="50000" type="currency"/><br>
<fmt:formatNumber value="0.15" type="percent"/><br>
<fmt:formatNumber value="105872345" pattern="###,###,###"/><br>
<hr>

<fmt:formatDate value="${date }" type="date"/><br>
<fmt:formatDate value="${date }" type="time"/><br>
<fmt:formatDate value="${date }" type="both"/><br>
<hr>

<fmt:formatDate value="${date }" type="both" timeStyle="short" dateStyle="short"/><br>
<fmt:formatDate value="${date }" type="both" timeStyle="short" dateStyle="long"/><br>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
</body>
</html>