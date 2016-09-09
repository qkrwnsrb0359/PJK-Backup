<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- .properties를 뺀 파일명만 기재
	 경로.파일명 -->
<fmt:bundle basename="bundle.testBundle">
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
	<title>JSTL fmt 예제 - bundle, message</title>
</head>
<body>

<fmt:message key="name"/>

<fmt:message key="message" var="msg"/>
<c:out value="${msg }"/>
</body>
</html>
</fmt:bundle>
