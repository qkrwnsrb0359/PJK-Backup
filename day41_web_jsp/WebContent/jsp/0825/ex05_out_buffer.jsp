<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="20kb" autoFlush="false" %>
    
<!DOCTYPE html>
<html>
<head>
	<title>Out과 Buffer</title>
</head>
<body>
	<%
		boolean b = true;
		if(9 > 10) {
	%>
	값은 : <font color="blue"><%=b %></font>
	<%
		} else {
			b = false;
	%>
	값은 : <font color="red"><%=b %></font>
	<%
		}
	%>
<hr>
<h3>Buffer 관련 메소드 (out 객체를 통해서...)</h3>
버퍼 : <%= out.getBufferSize() %>Byte<br>
남은크기 : <%= out.getRemaining() %>Byte<br>
버퍼 설정 정보 : <%= out.isAutoFlush() %>

</body>
</html>