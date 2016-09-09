<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Sub Page</title>
</head>
<body>
<%
	String subID = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String type = request.getParameter("Type");

%> <br>

SubParam Page<br>
subID request value : <%= subID %><br>
pwd request value : <%= pwd %><br>
type request value : <%= type %><br>
<hr>
name 파라미터 List<br>

<ul>
<%
	String[] names = request.getParameterValues("userid");
	for(String n : names) {
%>
<li><%=n %></li>
<%
	}
%>
</ul>
<hr>
<%
	if(type.equals("A")) {
		out.print("당신이 요청한 데이터는 제품 : " + type);
	} else if (type.equals("B")) {
		out.print("당신이 요청한 데이터는 제품 : " + type);
	}
%>
</body>
</html>