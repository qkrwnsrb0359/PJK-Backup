<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>간단한 컨트롤러 뷰 페이지</title>
</head>
<fmt:requestEncoding value="utf-8"/>
<body>
전달 결과 : 
<c:set value="${result }" var="result"/>
<c:out value="${result }"/>
</body>
</html>