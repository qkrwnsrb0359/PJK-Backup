<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="bean" class="edu.kosta.ex0825.Emp">
	<jsp:setProperty property="empno" name="bean" value="9999"/>
	<%-- <jsp:setProperty property="empno" name="bean">9999</jsp:setProperty> --%>
	<jsp:setProperty property="name" name="bean" value="박준규"/>
	<jsp:setProperty property="sal" name="bean" value="3000"/>
	
	이름 : <jsp:setProperty property="name" name="bean"/>
	사번 : <jsp:setProperty property="empno" name="bean"/>
	급여 : <jsp:setProperty property="sal" name="bean"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<title>useBean Login</title>
</head>
<body>
	<h3>useBean Property test</h3>
	사번 : <%= bean.getEmpno() %><br>
	이름 : <%= bean.getName() %><br>
	급여 : <%= bean.getSal() %><br>
	
	<%
		Date today = new Date();
		out.print(today);
	%><br>
	
	<jsp:useBean id="now" class="java.util.Date"/>
	<%=
		now
	%>
</body>
</html>