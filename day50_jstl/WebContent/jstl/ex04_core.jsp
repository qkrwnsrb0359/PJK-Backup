<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
<c:set var="country" value="${'Korea' }"/>
<c:if test="${country != NULL }">
	국가명 : <c:out value="${country }"/><br><br>
</c:if>
<c:choose>
	<c:when test="${country == 'Canada' }">
		<c:out value="${country }"/>
	</c:when>
	<c:when test="${country == 'Korea' }">
		<c:out value="${country }"/>
	</c:when>
	<c:otherwise>default</c:otherwise>
</c:choose>
<hr>
<h3>Header 정보 : </h3>
<c:forEach var="head" items="${headerValues }">
	param : <c:out value="${head.key }"/><br>
	values : <c:forEach var="val" items="${head.value }">
				<c:out value="${val }"/>
			 </c:forEach>
</c:forEach>
<hr>
<h3>구분한 글자들 출력 : </h3>
<c:forTokens items="소나타/그랜저/현대차/삼성차/기아차" delims="/" var="car">
<c:out value="${car }"/><br>
</c:forTokens>
</body>
</html>