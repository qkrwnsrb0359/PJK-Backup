<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	//location.href="http://www.naver.com";
</script>
	<title>Response</title>
</head>
<body>
<a href="ex01_emp.jsp">ex01_emp.jsp</a>
일반 Response : <%= 100+200+300 %><br>
Redirect : <%
	//클라이언트 브라우저에게 ex02_result.jsp를 재요청하도록 명령
	out.print("PJK response");
	response.sendRedirect("ex02_result.jsp");
%>
</body>
</html>