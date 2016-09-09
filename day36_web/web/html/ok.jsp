<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% response.setContentType("euc-kr"); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("keyword");
    String pwd = request.getParameter("pwd");
	 out.print("이름 : " + name + "<br>"); 
	 out.print("비번 : " + pwd);
%>
</body>
</html>








