<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html><head>
<title>이름 전번 문제여</title>
</head>
<body>
	이름 :
			<c:set  value="${ name }" var="nameVar" />   
			<c:out value="${ nameVar }" /><br>
	번호 :
			<c:set  value="${ num }" var="numVar" />   
			<c:out value="${ numVar }" />
</body>
</html>