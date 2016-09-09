<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html><head>
<title>요청 파라미터로 명령어를 전달하는 방법</title>
</head>
<body>
	전달된 결과 :
			<c:set  value="${ message }"   var="msg" />   
			<font size="5"  color="blue" >	<c:out value="${ msg }" />  </font>
</body>
</html>