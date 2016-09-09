<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="edu.kosta.ex0825.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Sub Param Main</title>
</head>
<body>
<%
	String t = request.getParameter("Type");
	String userID = request.getParameter("userid");
	out.print(t + "/" + userID);
	out.print("Main Page");
%>
<hr>
<h3>Include Page infomation</h3>
<jsp:include page="ex11_subpage.jsp">
	<jsp:param value="<%= t%>" name="Type"/>
	<jsp:param value="1004" name="userid"/>
	<jsp:param value="kosta125" name="pwd"/>
</jsp:include>

<%
	Emp emp = new Emp(); // 객체 생성
	emp.setEmpno(88888);
%>

<!-- tag를 이용해서 객체 생성하는 방법 jsp:useBean 이용한다 -->
<jsp:useBean id="e" class="edu.kosta.ex0825.Emp">
	<jsp:setProperty name="e" property="*"/>
</jsp:useBean>
</body>
</html>