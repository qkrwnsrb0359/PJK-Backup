<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ��� Ȯ�� ������</title>
</head>
<body>
	<div id="idcss">
	<%
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		out.print(name + "�� ����� " + pwd + "�Դϴ�.");		
	%>
	</div>
</body>
</html>