<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Main Page</title>
</head>
<body>
Site main Page 상단
<%-- include page 활용은 공통 페이지를 만들고 필요에 따라서 include 작업을 한다.
<%@
	include file = "/module/Sub.jsp"	
%> --%>
<jsp:include page="/module/Sub.jsp"/>
Site main Page 하단
<hr>
요청의 흐름이 메인으로 다시 넘어온다
</body>
</html>