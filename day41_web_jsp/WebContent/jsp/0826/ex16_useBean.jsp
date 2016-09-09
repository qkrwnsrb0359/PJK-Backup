<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<jsp:useBean id="bean" class="edu.kosta.ex0825.Emp" scope="request"/>
</head>
<body>
	<%
		bean.setEmpno(1004);
		bean.setName("PJK");
		out.print(bean.getEmpno() + "<br>");
		out.print(bean.getName() + "<br>");
		out.print("ex16_useBean.jsp 입니다.");
	%>
	
	<jsp:forward page="ex17_useBeanRequest.jsp"></jsp:forward>
	
	<%
		out.print("123입니다.");
		out.print("456입니다.");
		out.print("789입니다.");	
	%>
</body>
</html>