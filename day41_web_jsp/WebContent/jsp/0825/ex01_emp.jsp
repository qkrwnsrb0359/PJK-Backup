<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="edu.kosta.ex0825.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Java 파일 사용하기</title>
</head>
<body>
<%!
	//선언문
	public String message() {
		return "으아아아 틔스픤!!!!!!!!!!!!!!!!!!!!!!";
	}
%>

<%
	Emp e = new Emp();
	e.setEmpno(7788);
	e.setName("박준규");
	e.setSal(3000);
	
	int su = 9999;
%>
	외부 package에 있는 클래스 객체 사용한다<br>
	<%= e.toString() %><br>
	su = <%= su %><br>
	1+2+3+100 = <%= 1 + 2 + 3 + 100 %><br>
	<%= message() %>
</body>
</html>